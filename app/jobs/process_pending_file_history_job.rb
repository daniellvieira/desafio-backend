class ProcessPendingFileHistoryJob < ApplicationJob
  queue_as :agendaedu

  # bundle exec sidekiq -q reports -c 8
  def perform(file_history)
    return true unless file_history.pending?

    ProcessFileService.new(file_history_id: file_history.id).call
    file_history.success!
  rescue StandardError => e
    file_history.update(status: :failure, message: e)
  end
end
