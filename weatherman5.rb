require 'colorize'
require 'csv'
$max_temp = []
$min_temp = []

class Bargraph
  def address(city, year, month)
    @city= city
    @year= year
    @month= month
  $filename= "/home/nibras/Downloads/weatherinfo/#{@city}_weather/#{@city}_weather_#{@year}_#{@month}.txt"
  end 

  def bar
    CSV.foreach($filename) {|row| $max_temp << row[1].to_i }
    CSV.foreach($filename) {|row| $min_temp << row[3].to_i }
    sweet= $max_temp.zip($min_temp)
    loop do 
      i=0
    sweet.each do |max, min|
     
      print "#{i}: " 
      print '+'.blue * min
        print '+'.red * max
        print " #{min} - ".blue
        print " #{max} \n".red
       
       
       i+=1
      end
      
     break
    end
  end
end
