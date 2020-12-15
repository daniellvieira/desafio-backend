# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @file_history = FileHistory.new
    @q = Parlamentarian.select_totals.ransack(params[:q])
    @parlamentarians = @q.result(distinct: true).page(params[:page])
  end

  def filter_parlamentarians_params
    params.slice(:cidade_id)
  end
end
