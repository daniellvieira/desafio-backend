# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @file_history = FileHistory.new

    @ransack = Parlamentarian.ransack(params[:q])
    @ransack.sorts = 'total DESC' if @ransack.sorts.empty?
    @parlamentarians = @ransack.result.page(params[:page])
  end
end