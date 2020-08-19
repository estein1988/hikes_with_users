class Hiker < ActiveRecord::Base
    has_many :reviews
    has_many :trails, through: :reviews
end