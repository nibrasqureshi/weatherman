require 'csv'

$max_temp = []
$min_temp = []
$avg_humid= []


class Weather
    def address(city, year, month)
        @city= city
        @year= year
        @month= month
      $filename= "/home/nibras/Downloads/weatherinfo/#{@city}_weather/#{@city}_weather_#{@year}_#{@month}.txt"
    end 

    def maxavgtemp
        CSV.foreach($filename) {|row| $max_temp << row[1].to_i }
        #the total number of elements 
        array_size=$max_temp.size-1
        #the total sum of Max temperature
        total_num= $max_temp.inject(0) { |sum, num| sum += num }
        #the average max temp
        avg_max_temp= total_num/array_size
        print "Average Max Temperature : #{avg_max_temp} C \n"
    end

    def minavgtemp
    
        CSV.foreach($filename) {|row| $min_temp << row[3].to_i }
        #the total number of elements 
        array_size=$min_temp.size-1
        #the total sum of Min temperature
        total_num= $min_temp.inject(0) { |sum, num| sum += num }
        #the average Min temp
        avg_min_temp= total_num/array_size
        print "Average Min Temperature : #{avg_min_temp} C \n"
    end


    def avghumid
    
        CSV.foreach($filename) {|row| $avg_humid << row[8].to_i }
        #the total number of elements 
        array_size=$avg_humid.size-1
        #the total sum of Humidity
        total_num= $avg_humid.inject(0) { |sum, num| sum += num }
        #the average humidity
        avg_max_humid= total_num/array_size
        print "Average humidity : #{avg_max_humid} % \n"
    end
end
