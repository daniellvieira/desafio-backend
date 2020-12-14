# frozen_string_literal: true

class FileHistory < ApplicationRecord
  # Enums
  enum status: {
    pending: 0,
    success: 1,
    failure: 2
  }
  # Relationships
  has_one_attached :file
  # Validations
  validates :status, presence: true
  validates :description, presence: true
end
