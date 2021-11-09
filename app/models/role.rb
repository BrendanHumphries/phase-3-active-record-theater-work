class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        actors_array = []
        self.auditions.each {|audition| actors_array << audition.actor}
        actors_array
    end

    def locations
        locations_array = []
        self.auditions.each {|audition| locations_array << audition.location}
        locations_array
    end

    def lead
        if self.auditions.find_by hired: true
            self.auditions.find_by hired: true
        else
            'No actor has been hired for this role'
        end
    end

    def understudy
        if self.auditions.where(hired: true).second
            self.auditions.where(hired: true).second
        else
            'No actor has been hired for understudy for this role'
        end
    end
end