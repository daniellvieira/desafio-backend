require 'rails_helper'

RSpec.describe Parlamentarian, type: :model do
  describe 'Relationships' do
    it { is_expected.to have_many(:expenses).dependent(:destroy) }
  end

  describe 'Validations' do
    it { is_expected.to validate_uniqueness_of(:id_register).case_insensitive }
    it { is_expected.to validate_presence_of(:id_register) }
    it { is_expected.to validate_presence_of(:uf) }
    it { is_expected.to validate_presence_of(:num_legislature) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:cod_legislature) }
  end
end
