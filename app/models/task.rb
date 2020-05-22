class Task < ApplicationRecord
  belongs_to :user
  belongs_to :city
  belongs_to :district
  belongs_to :service
  mount_uploader :image, ImageUploader

  validates :description, presence: true, length: { minimum: 10 }
  validates :title, presence: true, length: { minimum: 10 }
  validates :address, presence: true, length: { minimum: 10 }

  state_machine initial: :active do
    state :active
    state :deleted

    event :del do
      transition active: :deleted
    end

    event :restore do
      transition deleted: :active
    end
  end

  state_machine :state_user, initial: :new do
    state :in_process
    state :new
    state :completed

    event :process do
      transition new: :in_process
    end

    event :complete do
      transition in_process: :completed
    end
  end

  state_machine :state_company, initial: :in_worked do
    state :in_worked
    state :refused
    state :performed

    event :reject do
      transition in_worked: :refused
    end

    event :done do
      transition in_worked: :performed
    end

    event :work do
      transition refused: :in_worked
    end
  end
end
