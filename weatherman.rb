require_relative './weatherman3'
require_relative './weatherman2'
require_relative './weatherman4'
require_relative './weatherman5'

input=ARGV[0]
city=ARGV[1]
year=ARGV[2]
month=ARGV[3]


case input
when '-c'
    obj=Bargraph.new
    obj.address(city, year, month)
    obj.bar

when '-a'
    obj=Weather.new
    obj.address(city, year, month)
    obj.maxavgtemp
    obj.minavgtemp
    obj.avghumid

when '-e'
    obj=Weatherlarge.new
    obj.address(city, year, month)
    obj.maxavgtemp
    obj.minavgtemp
    obj.avghumid

when '-d'
    obj=Bargraph.new
    obj.address(city, year, month)
    obj.bar
end

