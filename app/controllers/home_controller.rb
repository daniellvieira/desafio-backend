# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @file_history = FileHistory.new

    @search = Parlamentarian.select_totals.search(params[:q])
    @parlamentarians = @search.result.page(params[:page])
  end

  def filter_parlamentarians_params
    params.slice(:cidade_id)
  end
end
