class CurrentParlamentarian

  def initialize(params)
    @params = params
  end

  def call
    parlamentarian = Parlamentarian.find_by(id_register: params[:ideCadastro])
    return parlamentarian if parlamentarian

    create_parlamentarian
  rescue StandardError => e
    raise "Error ao criar parlamentar. Detalhe: #{e}"
  end

  private

  attr_reader :params

  def create_parlamentarian
    Parlamentarian.create!(
      name: params[:txNomeParlamentar],
      id_register: params[:ideCadastro],
      num_portfolio: params[:nuCarteiraParlamentar],
      num_legislature: params[:nuLegislatura],
      uf: params[:sgUF],
      political_party: params[:sgPartido],
      cod_legislature: params[:codLegislatura]
    )
  end
end