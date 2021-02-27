class Comment < ApplicationRecord
  belongs_to :prototype
  belongs_to :user
  #validationを追加する
  validates :text, presence: true
end
