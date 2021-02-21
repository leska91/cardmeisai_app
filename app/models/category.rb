class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '-選択してください-' },
    { id: 2, name: '固定費' },
    { id: 3, name: '自炊の食費' },
    { id: 4, name: 'コンビニ' },
    { id: 5, name: '外食費' },
    { id: 6, name: '日用品' },
    { id: 7, name: '医療費' },
    { id: 8, name: '交通費' },
    { id: 9, name: '服飾費' },
    { id: 10, name: '美容費' },
    { id: 11, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :orders
end
