require_relative "./flight.rb"

class Flight

    attr_reader :passengers

    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    def full?
        passengers.length == @capacity
    end

    def board_passenger(passenger)
        passengers << passenger if passenger.has_flight?(@flight_number) && !self.full?
    end

    def list_passengers
        # names = []
        # passengers.each do |passenger|
        #     names << passenger.name
        # end
        # names
        passengers.map {|passenger| passenger.name}
    end

    def [](number)
        passengers[number]
    end

    def <<(passenger)
        board_passenger(passenger)
    end
end