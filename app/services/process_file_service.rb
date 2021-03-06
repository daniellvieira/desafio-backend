class ProcessFileService
  def initialize(file_history_id)
    @file_history = FileHistory.find(file_history_id)
  end

  def call
    return true unless file_history.pending?

    process_csv
    file_history.success!
  rescue StandardError => e
    file_history.update(status: :failure, message: e)
  end

  private

  attr_reader :file_history

  def process_csv
    options = { encoding: 'bom|utf-8', headers: :first_row, col_sep: ';' }
    file_history.file.open do |file|
      CSV.foreach(file, **options) do |row|
        expense = row.to_h.try(:deep_symbolize_keys)
        next unless valid_infos(expense)
  
        parlamentarian = CurrentParlamentarian.new(expense).call
        next unless parlamentarian.is_a?(Parlamentarian)
  
        CurrentExpense.new(parlamentarian, expense).call
      end
    end
  end

  def valid_infos(expense)
    return false unless expense[:sgUF].eql?(Rails.configuration.state.uf)
    return false if expense[:ideCadastro].blank?
    return false if expense[:datEmissao].blank?
    return false if expense[:vlrLiquido].blank?

    true
  end
end
