class CurrentExpense

  def initialize(parlamentarian, params)
    @parlamentarian = parlamentarian
    @params = params
  end

  def call
    expense = Expense.find_by(
      id_document: params[:ideDocumento],
      value: params[:vlrLiquido],
      date_issue: params[:datEmissao]
    )
    return expense if expense

    create_expense
  rescue StandardError => e
    raise "Error ao criar parlamentar. Detalhe: #{e}"
  end

  private

  attr_reader :parlamentarian, :params

  def create_expense
    parlamentarian.expenses.create!(
      date_issue: params[:datEmissao],
      provider: params[:txtFornecedor],
      value: params[:vlrLiquido],
      url_document: params[:urlDocumento],
      id_document: params[:ideDocumento],
      num_sub_quota: params[:numSubCota],
      desc_sub_quota: params[:txtDescricao],
      num_spec_sub_quota: params[:numEspecificacaoSubCota],
      desc_spec_sub_quota: params[:txtDescricaoEspecificacao],
      cpf_cnpj: params[:txtCNPJCPF],
      num_document: params[:txtNumero],
      type_document: params[:indTipoDocumento],
      value_document: params[:vlrDocumento],
      value_gloss: params[:vlrGlosa],
      month: params[:numMes],
      year: params[:numAno],
      num_portion: params[:numParcela],
      passenger: params[:txtPassageiro],
      stretch: params[:txtTrecho],
      num_lot: params[:numLote],
      num_reimbursement: params[:numRessarcimento],
      value_refund: params[:vlrRestituicao],
      num_parlamentarian: params[:nuDeputadoId]
     )
  end
end
