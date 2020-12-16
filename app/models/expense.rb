class Expense < ApplicationRecord
  # Relationships
  belongs_to :parlamentarian, required: true
  # Validations
  validates :id_document, presence: true
  validates :date_issue, presence: true
  validates :value, presence: true

  def self.top(limit = 5)
    order(value: :desc).limit(limit)
  end

  def self.chart_top_providers(limit = 5)
    group(:provider)
      .sum(:value)
      .sort_by { |k, v| -v }.first(limit).to_h
  end

  def self.chart_by_month
    group_by_month_of_year(:date_issue, time_zone: false)
      .sum(:value)
      .map{ |k, v| [I18n.t('date.month_names')[k], v] }
  end
end
