FactoryBot.define do 
  factory :user do 
    email {"user@example.com"}
    encrypted_password {'password'}
    reset_password_token {'reset_token'}
    confirmation_token {'confirm_token'}
    unconfirmed_email {'unconfirmed@example.com'}
    role {1}
    organization
  end
end