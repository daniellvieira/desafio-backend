class ProcessFileService
  def initialize(params={})
    @file_history = FileHistory.find(params[:file_history_id])
    @attachment = @file_history.file
  end

  def call
    return true unless @file_history.pending?

    @path = set_path_file
    process
    @file_history.success!
  rescue StandardError => e
    @file_history.update(status: :failure, message: e)
  end

  private

  def set_path_file
    ActiveStorage::Blob.service.send(:path_for, @attachment.key)
  end

  def process
    options = { encoding: 'bom|utf-8', headers: :first_row, col_sep: ';' }
    CSV.foreach(@path, **options) do |row|
      ceap_infos = row.to_h.try(:deep_symbolize_keys)
      next unless ceap_infos[:sgUF].eql?(Rails.configuration.state.uf)
      next if ceap_infos[:ideCadastro].blank?

      puts ceap_infos

      parlamentarian = CurrentParlamentarian.new(ceap_infos).call
      next unless parlamentarian.is_a?(Parlamentarian)

      CurrentExpense.new(parlamentarian, ceap_infos).call
    end
  end
end
