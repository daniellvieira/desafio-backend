FactoryBot.define do
  factory :parlamentarian do
    sequence(:name) { |n| "Parlamentar #{n}" }
    sequence(:id_register) { |id| "Num #{id}" }
    uf { 'CE' }
    political_party { 'NOVO' }
    cod_legislature { '3030' }
    num_legislature { '30' }
  end
end
