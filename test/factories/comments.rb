FactoryBot.define do
  factory :comment do
    body
    author { create :admin }

    task
  end
end
