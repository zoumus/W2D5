class ToDoBoard

    def initialize(label)
        @list = List.new(label)
    end

    def get_command
        print 'enter a commande:'
        command, *arg = gets.chomp.split

        case cmd
        when 'mktodo'
            @list.add_item(*args)
        when up
            @list.up(*arg.map(&:to_i))
        when down
            @list.down(*arg.map(&:to_i)
        when swap
            @list.swap(*arg.map(&:to_i)
        when sort
            @list.sort_by!
        when priority
            @list.print_priority
        when print
            if arg.empty?
                @list.print
            else
                @list.print_full_item(*arg[0].to_i)
            end
        when 'quit'
            return false
        else
            print "Sorry, that command is not recognized."
        end
        true
    end

    def run 
        while true
            self.get_command
    end
end