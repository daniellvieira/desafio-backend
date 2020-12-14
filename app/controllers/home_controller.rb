# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @file_history = FileHistory.new
    @parlamentarians = Parlamentarian.filter(filter_parlamentarians_params)
                                     .page(params[:page])
  end

  def filter_parlamentarians_params
    params.slice(:cidade_id)
  end
end
