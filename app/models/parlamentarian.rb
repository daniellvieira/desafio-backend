class Parlamentarian < ApplicationRecord
  # Relationships
  has_many :expenses, dependent: :destroy
  # Validations
  validates :id_register, presence: true, uniqueness: true
  validates :uf, presence: true
  validates :num_legislature, presence: true
  validates :name, presence: true
  validates :cod_legislature, presence: true
end