class Expense < ApplicationRecord
  # Relationships
  belongs_to :parlamentarian, required: true
  # Validations
  validates :id_document, presence: true
end
