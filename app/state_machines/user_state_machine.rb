module UserStateMachine
  extend ActiveSupport::Concern

  included do
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
end