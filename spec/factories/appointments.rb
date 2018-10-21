FactoryBot.define do
  factory :appointment do
    time { "2018-10-09 22:14:09" }
    notes { "MyString" }
    user { nil }
  end
end
