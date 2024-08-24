class CleanMessagesJob < ApplicationJob
  def perform(*args)
    Message.where('created_at < ?', 1.week.ago).delete_all
  end
end
