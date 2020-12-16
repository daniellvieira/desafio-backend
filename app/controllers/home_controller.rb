# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @file_history = FileHistory.new

    @search = Parlamentarian.search(params[:q])
    @search.sorts = 'total DESC' if @search.sorts.empty?
    @parlamentarians = @search.result.page(params[:page])
  end
end