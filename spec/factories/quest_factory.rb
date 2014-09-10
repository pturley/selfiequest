FactoryGirl.define do
  factory :quest do
    name "NA Away Day"
    start_datetime DateTime.now
    end_datetime DateTime.now + 1.year
  end
end
