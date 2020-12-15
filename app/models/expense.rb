class Expense < ApplicationRecord
  # Relationships
  belongs_to :parlamentarian, required: true
  # Validations
  validates :id_document, presence: true

  def self.top(limit = 5)
    order(value: :desc).limit(limit)
  end
end
