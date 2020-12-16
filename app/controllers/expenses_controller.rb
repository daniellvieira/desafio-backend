class ExpensesController < ApplicationController
  before_action :set_parlamentarian
  before_action :set_expense, only: %i[show]

  def index
    @top7_expenses = @parlamentarian.expenses.top(7)
    @month_chart = @parlamentarian.expenses.chart_by_month
    @provider_chart = @parlamentarian.expenses.chart_top_providers(5)

    @ransack = @parlamentarian.expenses.ransack(params[:q])
    @ransack.sorts = 'date_issue ASC' if @ransack.sorts.empty?
    @expenses = @ransack.result.page(params[:page])
  end

  def show; end

  private

  def set_parlamentarian
    @parlamentarian = Parlamentarian.find(params[:parlamentarian_id])
  end

  def set_expense
    @expense = @parlamentarian.expenses.find(params[:id])
  end
end
