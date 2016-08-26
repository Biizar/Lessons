class Train

  attr_accessor :speed, :current_station
  attr_reader   :number, :wagons
  attr_writer   :route
  
  def initialize(number, wagons)
    @number = number
    @wagons = add_wagons(wagons)
    @speed = 0
  end

  #используеться из вне
  def add_wagons
    @wagons << wagon if acceptable?(wagons)
  end

  #используеться из вне
  def remove_wagons(wagons_number)
    @wagons.pop(wagons_number)    
  end

  #используеться вне метода
  def stop
    @speed = 0
  end

  #используется вне метода
  def next_station
    if @route && @current_station != @route.stations.last
      if @route.stations.include?(@current_station)
        @next_station = @route.stations[current_station_index + 1]
      else
        @next_station = @route.stations.first
      end
    end
  end

  #используется вне метода
  def previous_station
    if current_station_index && current_station_index > 0
      @previous_station = @route.stations[current_station_index - 1]
    end
  end

  
  def move
    @current_station.send(self, @next_station) if next_station
  end

  #используется вне метода
  def show_near_station
    puts "Previous station: #{@previous_station.name if previous_station}"
    puts "Current station: #{@current_station.name if current_station}"
    puts "Next station: #{@next_station.name if next_station}"
  end

  #для подклассов
  protected

 #вспомогательный
  def add_wagons(wagons)
    wagons.all? { |wagon| acceptable?(wagon) } ? wagons : []
  end

  #вспомогательный
  def acceptable?(wagon)
    wagon.class.ancestors.include? Wagon
  end

  #вспомогательный
  def current_station_index
    if @route && @route.stations.include?(@current_station)
        @route.stations.find_index(@current_station)
    end
  end

end