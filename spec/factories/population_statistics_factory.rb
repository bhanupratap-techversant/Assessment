FactoryBot.define do
  factory :population_statistic do
    dimension { Faker::Lorem.word }
    ha1_interior { 10 }
    ha2_fraser { 20 }
    ha3_vancouver_caustal { 20 }
    ha4_vancouver_island { 30 }
    ha5_northern { 40 }
  end
end
