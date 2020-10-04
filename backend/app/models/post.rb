class Post < ApplicationRecord
    has_many :likes
    has_many :users, through: :like
end
