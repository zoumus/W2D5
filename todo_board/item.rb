class Item

    attr_accessor :title, :description
    attr_reader :deadline

    def self.valid_date?(date_string)
        date = date_string.split('-')
        year = date[0].to_i
        month = date[1].to_i
        day = date[2].to_i
        (1..12).include?(month) && (1..31).include?(day)
    end

    def initialize(title, deadline, description)
        if !Item.valid_date?(deadline)
            raise 'date is invalid' 
        end
        @title = title
        @deadline = deadline
        @description = description
    end

    def deadline=(new_deadline)
        raise "new_deadline in invalid" if !Item.valid_date?(new_deadline)
        @deadline = new_deadline
    end

end