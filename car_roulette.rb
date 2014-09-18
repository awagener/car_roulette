class Person
  def initialize(name, driver)
    @name = name
    @driver = driver
  end
  
  def driver?
    @driver
  end
  
  def to_s
    @name
  end
end

class Car
  attr_accessor :driver
  attr_reader :passengers

  def initialize
    @passengers = []
  end

  def add_passenger(passenger)
    @passengers << passenger
  end
  
  def to_s
    passenger_strings = @passengers.collect { |p| "#{p}\n" }
    "Driver: #{driver}\n" +
      passenger_strings.join
  end
end

class CarRoulette
  def initialize(people)
    @people = people
    @cars = [Car.new, Car.new]
  end

  def bang!
    determine_drivers
    pick_drivers
    pick_passengers
    @cars
  end
  
  def determine_drivers
    @drivers, @passengers = @people.partition { |p| p.driver? }
  end
  
  def pick_drivers
    @cars.each do |car|
      car.driver = @drivers.sample
      @drivers.delete car.driver
      @people.delete car.driver
    end
  end
  
  def pick_passengers
    @people.each do |passenger|
      @cars.sample.add_passenger(passenger)
    end
  end
end

class NorthlandTrip
  PEOPLE = [Person.new("Ann", true), 
            Person.new("Amanda", true), 
            Person.new("Graham", true),
            Person.new("Theo", false),
            Person.new("Jamie", false),
            Person.new("Scott", true)
      ]
  
  def cars
    CarRoulette.new(PEOPLE.dup).bang!
  end
end
