require_relative "item.rb"

class List

    attr_accessor :labl

    def initialize(labl)
        @labl = labl
        @items = []
    end

    def add_item(title, deadline, description=nil)
        if Item.valid_date?(deadline)
            @items << Item.new(title, deadline, description)
            return true
        else
            return false
        end
    end

    def size
        @items.length
    end

    def valid_index?(index)
        # (0...self.size).include?(index)
        0 <= index && index < self.size
    end

    def swap(index_1, index_2)
        if self.valid_index?(index_1) && self.valid_index?(index_2)
            @items[index_1], @items[index_2] = @items[index_2] = @items[index_1]
            return true
        end
        false
    end

    def [](index)
        return nil if !valid_index?(index)
        @items[index]
    end

    def []=(index, val)
        @items[index] = val
    end

    def priority
        @items.first
    end

    def print
        puts "-----------------"
        puts "#{labl}"
        puts "-----------------"
        @items.each_with_index do |item, i|
            puts "#{i.to_s} - #{item.title} - #{item.deadline}"
        end
        puts "--------------------"
    end

    def print_full_item(index)
        if self.valid_index?(index)
            puts "#{self[index].title}           #{self[index].deadline}"
            puts "#{self[index].description}"
        end 
        nil
    end

    def print_priority
        print_full_item(0)
    end

    def up(index, amount=1)
        if self.valid_index?(index)
            if (index - amount) <= 0
                self[index], self[0] = self[0], self[index]
            else
                self[index], self[index - amount] = self[index - amount], @items[index]
            end
            return true
        end
        false
    end

    def down(index, amount=1)
        if self.valid_index?(index)
            if (index + amount) >= @items.length-1
                self[index], self[-1] = self[-1], self[index]
            else
                self[index], self[index + amount] = self[index + amount], self[index]
            end
            return true
        end
        false
    end
end