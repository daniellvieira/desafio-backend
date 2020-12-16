module FakeRowsHelper
  extend self
  extend ActionDispatch::TestProcess

  def default(options = {})
    row = { :txNomeParlamentar => "Deuzinho Filho",
            :cpf => "50243950349",
            :ideCadastro => "213856",
            :nuCarteiraParlamentar => "559",
            :nuLegislatura => "2019",
            :sgUF => "CE",
            :sgPartido => "REPUBLICANOS",
            :codLegislatura => "56",
            :numSubCota => "9",
            :txtDescricao => "PASSAGEM AÉREA - REEMBOLSO",
            :numEspecificacaoSubCota => "0",
            :txtDescricaoEspecificacao => nil,
            :txtFornecedor => "LATAM",
            :txtCNPJCPF => "020.128.620/0016-0",
            :txtNumero => "957213291817",
            :indTipoDocumento => "0",
            :datEmissao => "2020-08-31T00:00:00",
            :vlrDocumento => "2461.47",
            :vlrGlosa => "0",
            :vlrLiquido => "2461.47",
            :numMes => "8",
            :numAno => "2020",
            :numParcela => "0",
            :txtPassageiro => nil,
            :txtTrecho => nil,
            :numLote => "1714520",
            :numRessarcimento => nil,
            :vlrRestituicao => nil,
            :nuDeputadoId => "3469",
            :ideDocumento => "7089224",
            :urlDocumento => nil }
    row.merge!(options)
    row
  end
end