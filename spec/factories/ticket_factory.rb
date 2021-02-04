FactoryBot.define do 
  factory :ticket do 
    name {'Fake Ticket'}
    description {'Fake Description'}
    phone {'+1541-555-5555'}
    closed { false }
    closed_at { nil }
    region
    resource_category
  end
end
