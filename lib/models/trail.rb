class Trail < ActiveRecord::Base
    has_many :reviews
    has_many :hikers, through: :reviews

    def self.list_trails
        list_trails = all.map do |trail|
            trail.name 
        end
    end 

    def self.by_state(answer)
        by_state = all.select do |trail|
            trail.location == answer
        end 
        by_state.map do |trail|
            trail.name 
        end 
    end

end