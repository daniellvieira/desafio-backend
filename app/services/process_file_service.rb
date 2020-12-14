class ProcessFileService
  def initialize(params={})
    @file_history = FileHistory.find(params[:file_history_id])
    @attachment = @file_history.file
  end

  def call
    @path = set_path_file
    process
  end

  private

  def set_path_file
    ActiveStorage::Blob.service.send(:path_for, @attachment.key)
  end

  def process
    options = { encoding: 'bom|utf-8', headers: :first_row, col_sep: ';' }
    total_rows = CSV.foreach(@path, **options).count
    count = 0
    CSV.foreach(@path, **options) do |row|
      count += 1
      puts "#{count} / #{total_rows}"
      @ceap_infos = row.to_h.try(:deep_symbolize_keys)
      next unless @ceap_infos[:sgUF].eql?(Rails.configuration.state.uf)
      next if @ceap_infos[:ideCadastro].blank?

      @parlamentarian = set_parlamentarian
      next unless @parlamentarian.is_a?(Parlamentarian)

      create_expense
    end
  end

  def set_parlamentarian
    parlamentarian = Parlamentarian.find_by(id_register: @ceap_infos[:ideCadastro])
    return parlamentarian if parlamentarian

    create_parlamentarian
  end

  def create_parlamentarian
    Parlamentarian.create!(
      name: @ceap_infos[:txNomeParlamentar],
      id_register: @ceap_infos[:ideCadastro],
      num_portfolio: @ceap_infos[:nuCarteiraParlamentar],
      num_legislature: @ceap_infos[:nuLegislatura],
      uf: @ceap_infos[:sgUF],
      political_party: @ceap_infos[:sgPartido],
      cod_legislature: @ceap_infos[:codLegislatura]
    )
  rescue StandardError => e
    raise "Error ao criar parlamentar. Detalhe: #{e}"
  end

  def create_expense

  end
end
