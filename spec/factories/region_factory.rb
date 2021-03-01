FactoryBot.define do 
  factory :region do
    sequence(:name) { |i| "Fake Region #{i}" }
  end
end
