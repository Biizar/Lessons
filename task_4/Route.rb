class Route
  attr_reader :stations
  
  def initialize(first, last)
    @stations [first, last]
  end
  
  #используется вне метода
  def add(station)
    @stations.insert(-2, station)
  end
  
  #используется вне метода
  def remove(station)
    @stations.delete(station)
  end
  
  #используется вне метода
  def show
    @stations.each { |station| puts station.name }
  end
end