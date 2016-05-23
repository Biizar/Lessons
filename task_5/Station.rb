
class Station

  attr_reader :name, :trains

  def self.all
    ObjectSpace.each_object(self) { |station| puts station.name }
  end

  #используется вне метода
  def initialize(name)
    @name = name
    @trains = []
  end
  
  #используется вне метода
  def add(train)
    @trains << train
    train.current_station = self
  end
  
  #используется вне метода
  def show(type = 'nil')
    if type == 'nil'
      trains = @trains.select { |train| train.class.to_s == type }
    else 
      trains = @trains
    end
    
    trains.each do |train|
      puts train.number
    end
  end
  
  #используется вне метода
  def send(train, station)
    @trains.delete(train)
    station.add(train)
  end
end