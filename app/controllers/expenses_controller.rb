class ExpensesController < ApplicationController
  before_action :set_parlamentarian
  before_action :set_expense, only: %i[show]

  def index
    @top5_expenses = @parlamentarian.expenses.top(5)
    @month_chart = @parlamentarian.expenses.chart_by_month
    @provider_chart = @parlamentarian.expenses.chart_top_providers(5)

    @search = @parlamentarian.expenses.search(params[:q])
    @search.sorts = 'data_issue ASC' if @search.sorts.empty?
    @expenses = @search.result.page(params[:page])
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
