FactoryBot.define do
  factory :health_service do
    ha { Faker::Lorem.word }
    service { "Medical" }
    service_type { "Expenditures" }
    m_20092010 { 20 }
    f_20092010 { 30 }
  end
end
