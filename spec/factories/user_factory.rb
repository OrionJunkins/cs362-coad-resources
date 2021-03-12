FactoryBot.define do 
  factory :user do 
    sequence(:email) { |i| "user#{i}@example.com" }
    password {'password'}
    password_confirmation {'password'}
    reset_password_token {'token'}
    confirmation_token {'token'}
    unconfirmed_email {'unconfirmed@example.com'}
    role {1}
  end

  trait :organization do
    role {'organizations'}
    organization
  end
  
  trait :admin do
    role {'admin'}
  end
end