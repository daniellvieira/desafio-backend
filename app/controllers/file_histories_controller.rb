# frozen_string_literal: true

# Controller to store the history of files sent from csv
class FileHistoriesController < ApplicationController

  def create
    @file_history = FileHistory.new(file_history_params)

    if @file_history.save
      ProcessPendingFileHistoryJob.perform_later(@file_history)
      redirect_to root_path, notice: t('.success_return')
    else
      redirect_back fallback_location: root_path,
                    flash: { error: @file_history.errors.full_messages.join('<br/>') }
    end
  end

  private

  def file_history_params
    params.require(:file_history).permit(:file, :description)
  end
end