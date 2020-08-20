class Cli
    attr_accessor :user

    def initialize user=nil
        @user = nil
    end

    def welcome
        system("clear")
        puts "Welcome to hiking trails app! What is your name?"
        @user = gets.strip
        
        prompt = TTY::Prompt.new
        answer = prompt.select("Hello #{@user} Would you like to get a list of hikes?") do |menu|
            menu.choice 'Yes'
            menu.choice 'No'
        end 

        if answer == 'Yes'
            prompt = TTY::Prompt.new 
            trails = Trail.list_trails
            prompt.select("These are the hikes: ", trails)
            list_trails
        else answer == 'No'
            puts "Okay, happy trails!"
        end
    end

    def list_trails
        puts "Great choice. Enter the name in: "
        answer = gets.strip
        trail_name = Trail.find_by name: answer
        
        if !trail_name
            prompt = TTY::Prompt.new 
            trails = Trail.list_trails
            prompt.select("Please select a valid option: ", trails)
            list_trails 
        else 
            
            puts "This trail is rated a #{trail_name.difficulty} in difficulty."
            puts "This trail is #{trail_name.length} miles in length."
            puts "It has #{trail_name.elevation} in elevation gain."
            puts "It a #{trail_name.route}."
            
            reviews = Review.where(trail: trail_name)
            reviews.map do |review|
                puts "This hike was last rated a #{review.rating}."
            end
            prompt = TTY::Prompt.new
            answer = prompt.select("Are you sure? ") do |menu|
                menu.choice 'Yes'
                menu.choice 'No'
            end

            if answer == 'Yes'
                puts "Okay, happy trails!"
            else answer == 'No'
                prompt = TTY::Prompt.new 
                trails = Trail.list_trails
                prompt.select("Okay, enter a different selection: ", trails)
                list_trails 
            end

        end 
    end

end


