class Trail < ActiveRecord::Base
    has_many :reviews
    has_many :hikers, through: :reviews

    def self.list_trails
        all.map do |trail|
            trail.name 
        end
    end
end