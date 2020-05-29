class TaskService < ApplicationRecord
  belongs_to :task
  belongs_to :service
  validates :task, uniqueness: { scope: :service }
end
