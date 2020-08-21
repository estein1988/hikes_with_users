require 'pry'
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
        puts "Welcome to Hiking Trails USA! What is your name?\n\n".red.italic
        # play_music

        @user = gets.strip
        state_selection
    end

    def list_trails(trail_answer)
        trail_instance = Trail.find_by name: trail_answer
            
        puts "#{trail_instance.name} is rated #{trail_instance.difficulty} in difficulty. It is #{trail_instance.length} miles in length and has elevation gain of #{trail_instance.elevation} feet. #{trail_instance.name} is a #{trail_instance.route}.".red.underline
   
        reviews = Review.where(trail: trail_instance)
        average_rating = reviews.map do |review|
            review.rating   
        end.reduce(0) {|sum, rating| sum + rating}/reviews.count
        puts "This hike's average rating is #{average_rating}.\n\n".red.underline

        prompt = TTY::Prompt.new
        answer_1 = prompt.select("Do you want to view reviews for this trail?\n\n".red.italic) do |menu|
            menu.choice 'Yes'
            menu.choice 'No'
            menu.choice 'Exit'
        end

        if answer_1 == 'Yes'
            puts trail_review(trail_instance)
            prompt = TTY::Prompt.new
            answer_2 = prompt.select("Would you like to add your review?\n\n".red.italic) do |menu|
            menu.choice 'Yes'
            menu.choice 'No'
            end 
            if answer_2 == "Yes"
                @new_review = []
                @new_rating = []
                puts "Please type your name!".red.italic
                @user_name = gets.strip
                puts "Please type your age!".red.italic
                @user_age = gets.strip
            
                prompt = TTY::Prompt.new
                prompt.select("Please select your experience level!".red.italic) do |menu|
                    menu.choice 'Novice'
                    menu.choice 'Medium'
                    menu.choice 'Expert'
                end 
                puts "Your account has been created. Please write your review!".red.italic
                @user_review = gets.strip
                puts "Please rate the trail!".red.italic
                @new_review << @user_review
                @user_rating = gets.strip
                @new_rating << @user_rating

                puts "Thank you for creating your account with us #{@user_name}. Here is a your summary of review for #{trail_answer}.\n\n".red.italic
                puts "Review : #{@user_review} \n\n"
                puts "Rating : #{@user_rating} \n\n"
                
                prompt = TTY::Prompt.new
                option = prompt.select("Please select the option!".red.italic) do |menu|
                    menu.choice 'Delete review'
                    menu.choice 'See other trails!'
                    menu.choice 'Exit'
                end 
                if option == 'Delete review'
                    @new_review.pop 
                    @new_rating.pop
                    puts "Your review is deleted!".red.italic

                    prompt = TTY::Prompt.new
                    option_1 = prompt.select("Please select the option!".red.italic) do |menu|
                        menu.choice 'Go back to state selection!'
                        menu.choice 'See more options!'
                        menu.choice 'Exit'
                    end
                    if option_1 == 'Go back to state selection!'
                        state_selection
                    elsif option_1 == 'See more options!'
                        options
                    elsif option_1 == 'Exit'
                
                        puts "Have a good day!".red.italic   
                        exit!
                    end 

                elsif option == 'See other trails!'
                    state_selection

                elsif option == 'Exit'
                    puts "Okay, happy trails!".red.italic
            
                end 


            elsif answer_2 == 'No'
                options
            end 



        elsif answer_1 == 'No'
            prompt = TTY::Prompt.new
            option = prompt.select("Please select the option!") do |menu|
                menu.choice 'Go back to state selection!'
                menu.choice 'See more options!'
                menu.choice 'Exit'
            end
            if option == 'Go back to state selection!'
                state_selection
            elsif option == 'See more options!'
                options
            elsif option == 'Exit'
        
                puts "Have a good day!".red.italic  
            end 

        elsif answer_1 == 'Exit'
    
            puts "Have a good day!".red.italic
            exit!
        end
    end


    def trail_review(trail)
        reviews = Review.all.select do |review_instance|
            review_instance.trail == trail
        end
        reviews.map do |review|
           puts review.review
        end    
    end

    def options 
        prompt = TTY::Prompt.new 
        trails_in_state = Trail.by_state(@answer)
        trail_answer = prompt.select("Okay, here are some more selections:\n\n ".red.italic, trails_in_state)
        list_trails(trail_answer)
    end
    
    def state_selection 
        prompt = TTY::Prompt.new
        @answer = prompt.select("What state are you hiking in?\n\n ".red.italic) do |menu|
            menu.choice 'Arizona'
            menu.choice 'Colorado'
            menu.choice 'New Mexico'
            menu.choice 'Utah'
            menu.choice 'Exit'
        end 
        if @answer == 'Exit'
    
            puts "Okay, happy trails!"

        else
            options
        end
    end

    # def play_music 
    #     pid = fork{ exec 'afplay', "./music/.Hike.mp3.icloud" }
    # end

    #  
    # #     pid = fork{ system 'killall', "./music/.Hike.mp3.icloud" }
    # # end 
   
end
