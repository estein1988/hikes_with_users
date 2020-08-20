class Cli
    attr_accessor :user

    def initialize user=nil
        @user = nil
    end

    def banner
        system("clear")
        box = TTY::Box.frame(width:150, height: 11, border: :thick, align: :left) do |font|
        "
                                                                                                                                                   
           _|    _|  _|  _|        _|                          _|_|_|_|_|                      _|  _|                _|    _|    _|_|_|    _|_|    
           _|    _|      _|  _|        _|_|_|      _|_|_|          _|      _|  _|_|    _|_|_|      _|    _|_|_|      _|    _|  _|        _|    _|  
           _|_|_|_|  _|  _|_|      _|  _|    _|  _|    _|          _|      _|_|      _|    _|  _|  _|  _|_|          _|    _|    _|_|    _|_|_|_|  
           _|    _|  _|  _|  _|    _|  _|    _|  _|    _|          _|      _|        _|    _|  _|  _|      _|_|      _|    _|        _|  _|    _|  
           _|    _|  _|  _|    _|  _|  _|    _|    _|_|_|          _|      _|          _|_|_|  _|  _|  _|_|_|          _|_|    _|_|_|    _|    _|  
                                                       _|                                                                                          
                                                   _|_|                                                                                            
        "
        end 
        print box
    end  

    def welcome
        puts "Welcome to Hiking Trails USA! What is your name?"
        @user = gets.strip
        prompt = TTY::Prompt.new
        answer = prompt.select("Hello #{@user}, what state are you hiking in? ") do |menu|
            menu.choice 'Arizona'
            menu.choice 'Colorado'
            menu.choice 'New Mexico'
            menu.choice 'Utah'
            menu.choice 'Exit'
        end 

        if answer == 'Exit'
            puts "Okay, happy trails!"
        else
            prompt = TTY::Prompt.new 
            trails = Trail.by_state(answer)
            trail_answer = prompt.select("These are the hikes in your state: ", trails)
            list_trails(trail_answer)
        end 
    end

    def list_trails(trail_answer)
        trail_name = Trail.find_by name: trail_answer
            
        puts "#{trail_name.name} is rated a #{trail_name.difficulty} in difficulty.\n\n"
        puts "#{trail_name.name} is #{trail_name.length} miles in length.\n\n"
        puts "#{trail_name.name} has #{trail_name.elevation} in elevation gain.\n\n"
        puts "#{trail_name.name} is a #{trail_name.route}.\n\n"
            
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
            puts "Okay, Happy Trails!"
        else answer == 'No'
            prompt = TTY::Prompt.new 
            trails = Trail.list_trails
            prompt.select("Okay, here are some more selections: ", trails)
            list_trails(trail_answer)
        end
    end

end


