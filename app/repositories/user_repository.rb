# frozen_string_literal: true

module UserRepository
  extend ActiveSupport::Concern

  included do
    scope :active, -> { where(state: :active) }
  end
end
