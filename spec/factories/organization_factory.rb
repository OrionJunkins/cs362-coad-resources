FactoryBot.define do 
  factory :organization do 
    name {'Fake Organization'}
    status { :approved }
    phone { '541-797-3122'}
    email { 'fake@example.com' }
    description { 'Fake Description' } 
    rejection_reason { 'Fake Reason' }
    liability_insurance { true }
    primary_name { 'Fake Primary Name' }
    secondary_name { 'Fake Secondary Name' }
    secondary_phone { '541-555-5555' }
    title { 'Fake Title' }
    transportation { :yes }
  end
end
