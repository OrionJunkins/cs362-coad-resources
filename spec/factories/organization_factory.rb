FactoryBot.define do 
  factory :organization do 
    sequence(:name) { |i| "Fake Organization #{i}"}
    status { :approved }
    phone { '+1541-797-3122'}
    sequence(:email) { |i| "organization#{i}@example.com" }
    description { 'Fake Description' } 
    rejection_reason { 'Fake Reason' }
    liability_insurance { true }
    primary_name { 'Fake Primary Name' }
    secondary_name { 'Fake Secondary Name' }
    secondary_phone { '+1541-555-5555' }
    title { 'Fake Title' }
    transportation { :yes }
  end
end
