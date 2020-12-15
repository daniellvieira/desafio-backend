class CurrentExpense

  def initialize(parlamentarian, params={})
    @parlamentarian = parlamentarian
    @params = params
  end

  def call
    expense = Expense.find_by(
      id_document: @params[:ideDocumento],
      value: @params[:vlrLiquido]
    )
    return expense if expense

    create_expense
  rescue StandardError => e
    raise "Error ao criar parlamentar. Detalhe: #{e}"
  end

  private

  def create_expense
    @parlamentarian.expenses.create!(
      date_issue: @params[:datEmissao],
      provider: @params[:txtFornecedor],
      value: @params[:vlrLiquido],
      url_document: @params[:urlDocumento],
      id_document: @params[:ideDocumento]
     )
  end
end
