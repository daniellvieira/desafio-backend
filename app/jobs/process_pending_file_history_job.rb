class ProcessPendingFileHistoryJob < ApplicationJob
  queue_as :default

  # bundle exec sidekiq -q reports -c 8
  def perform(file_history_id)
    ProcessFileService.new(file_history_id: file_history_id).call
  end
end
