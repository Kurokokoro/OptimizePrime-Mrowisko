

class Ant
    def initialize(x, y, all_roles = [])
        @position = [x, y]
        @role = all_roles[rand(all_roles.length)]
        @encounters = Hash.new
        @encounters.default = 0
        for i in 0..(all_roles.length - 1)
            @encounters[all_roles[i]] = 0
        end
    end

    def get_position()
        return @position
    end

    def get_role()
        return @role
    end

    def make_encounter(ant)
        @encounters[ant.get_role()] += 1
        self.change_role_if_needed()
    end

    def change_role_if_needed()
        average = 0
        @encounters.each do |key, value|
            average += value
        end
        average = average / @encounters.length
        average = average.floor
        @encounters.each do |key, value|
            if (value < average)
                @role = key
            end
        end
    end
    
    def move_to_position(new_x, new_y)
        @position = [new_x, new_y]
    end

    def move_randomly()
        random = rand(0..1)
        position = rand(0..1)
        if (random > 0)
            @position[position] = @position[position] + 1
        else
            @position[position] = @position[position] - 1
        end
    end
end
