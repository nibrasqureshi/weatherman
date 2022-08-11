require 'csv'
$max_temp = []
$min_temp = []
$avg_humid= []


class Weatherlarge
    def address(city, year, month)
        @city= city
        @year= year
        @month= month
      $filename= "/home/nibras/Downloads/weatherinfo/#{@city}_weather/#{@city}_weather_#{@year}_#{@month}.txt"
      end 

    def maxavgtemp
        CSV.foreach($filename) {|row| $max_temp << row[1].to_i }
        #the total number of elements 
        array_size=$max_temp.max
        print "Heighest Temperature: #{array_size} C \n"
    end
    def minavgtemp
    
        CSV.foreach($filename) {|row| $min_temp << row[3].to_i }
        #the total number of elements 
        array_size=$min_temp.min
        print "Lowest Temperature: #{array_size} C \n"
    end
    def avghumid
    
        CSV.foreach($filename) {|row| $avg_humid << row[9].to_i }
        #the total number of elements 
        array_size=$avg_humid.max
        print "Most Humidity: #{array_size} % \n"
    end
end
