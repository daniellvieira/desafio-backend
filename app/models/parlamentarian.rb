class Parlamentarian < ApplicationRecord
  # Relationships
  has_many :expenses
  # Validations
  validates :id_register, presence: true, uniqueness: true
  validates :uf, presence: true
  validates :num_legislature, presence: true
  validates :name, presence: true
  validates :cod_legislature, presence: true

  def self.select_totals
    left_joins(:expenses)
      .select('parlamentarians.*, sum(value) as total')
      .group('parlamentarians.id')
      .order('total DESC')
  end
end