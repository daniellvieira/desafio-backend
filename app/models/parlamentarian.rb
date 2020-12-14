class Parlamentarian < ApplicationRecord
  # Validations
  validates :id_register, presence: true, uniqueness: true
  validates :uf, presence: true
  validates :num_legislature, presence: true
  validates :name, presence: true
  validates :cod_legislature, presence: true
end
