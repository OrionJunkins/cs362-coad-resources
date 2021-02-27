FactoryBot.define do 
  factory :ticket do 
    name {'Fake Ticket'}
    sequence(:description) { |i| "Fake Description #{i}" }
    phone {'+1541-555-5555'}
    closed { false }
    closed_at { nil }
    region
    resource_category

    trait :captured do
      organization
    end

    trait :closed do
      closed {true}
    end

    trait :open do
      closed {false}
    end

  end

end
