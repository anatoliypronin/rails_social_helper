class Task < ApplicationRecord
  belongs_to :user
  belongs_to :company, optional: true

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
end