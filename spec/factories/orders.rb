FactoryBot.define do
  factory :order do
    date         { 2021-02-04 }
    amount       { 1980 }
    category_id  { '2' }
    memo         { 'memo' }
    association :user
  end
end
