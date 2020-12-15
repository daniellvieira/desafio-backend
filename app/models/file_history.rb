# frozen_string_literal: true

class FileHistory < ApplicationRecord
  # Enums
  enum status: {
    pending: 0,
    success: 1,
    failure: 2
  }
  # ActiveStorage
  has_one_attached :file
  validates :file, attached: true, content_type: { in: 'text/csv', message: 'não é um .CSV' }
  # Validations
  validates :status, presence: true
  validates :description, presence: true
  validates :message, presence: true, if: :failure?
end
