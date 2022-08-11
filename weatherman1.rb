require 'csv'
filenames_Dubai = Dir.chdir("/home/nibras/Downloads/weatherinfo/Dubai_weather") { Dir.entries(".") }
filenames_Murree = Dir.chdir("/home/nibras/Downloads/weatherinfo/Murree_weather") { Dir.entries(".") }
filenames_lahore = Dir.chdir("/home/nibras/Downloads/weatherinfo/lahore_weather") { Dir.entries(".") }


filenames_Dubai.sort!
filenames_Murree.sort!
filenames_lahore.sort!

puts "ENTER YEAR TO CHECK FROM LOG"
year = gets.chomp

cities = ["lahore","Dubai","Murree"]
month = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]



max_temp=-1000
max_temp_date=""
max_city=""

min_temp=1000
min_temp_date=""
min_city=""

min_hum=-1000
min_hum_date=""
max_cityh=""

file_path="" 
file_name=""

countLahore=0
countDubai=0
countMurree=0
cities.each do |city|
    month.each do |mon|
        
        file_path = "/home/nibras/Downloads/weatherinfo/#{city}_weather/" 
       
        if city == "Dubai"
            file_name = "#{city}_weather_#{year}_#{mon}.txt"
            if filenames_Dubai.include?(file_name) 
                file_path = file_path << file_name
                # puts file_path
                file = File.open(file_path,"r+")
                 file.inspect
                 file.read


                csv = CSV.read(file_path, :headers=>true)
                size = csv['Max TemperatureC'].size
                
                for i in 0...size
                    if max_temp.to_i < csv['Max TemperatureC'][i].to_i
                        max_temp = csv['Max TemperatureC'][i]
                        max_temp_date= csv['GST'][i]
                        max_city="Dubai"
                        # puts "max"
                    end
                end
                size = csv['Min TemperatureC'].size
                
                for i in 0...size
                 
                    if min_temp.to_i > csv['Min TemperatureC'][i].to_i
                        min_temp = csv['Min TemperatureC'][i]
                        min_temp_date= csv['GST'][i]
                        min_city= "Dubai"        
                        # puts "max"
                    end
                end
                size = csv['Max Humidity'].size
                
                for i in 0...size
                
                    if min_hum.to_i < csv['Max Humidity'][i].to_i
                        min_hum = csv['Max Humidity'][i]
                        min_hum_date= csv['GST'][i]
                        max_cityh= "Dubai"        
                        # puts "max"
                    end
                end

            elsif
                print "no such file exist in Dubai \n"  
            end
         
        elsif city == "lahore"
    
             file_name = "#{city}weather#{year}_#{mon}.txt"
             if filenames_lahore.include?(file_name) 
                 file_path = file_path << file_name
                 puts file_path
                 file = File.open(file_path,"r+")
                 puts file.inspect
                 puts file.read

                 csv = CSV.read(file_path, :headers=>true,:skip_blanks=>true)
                 size = csv['Max TemperatureC'].size
                 
                 for i in 0...size
                 
                     if max_temp.to_i < csv['Max TemperatureC'][i].to_i
                         max_temp = csv['Max TemperatureC'][i]
                         max_temp_date= csv['PKT'][i]
                         max_city= "Lahore" 
                     
                     end
                 end
                 size = csv['Min TemperatureC'].size
                
                for i in 0...size
                
                    if min_temp.to_i > csv['Min TemperatureC'][i].to_i
                        min_temp = csv['Min TemperatureC'][i]
                        min_temp_date= csv['PKT'][i]
                        min_city= "Lahore"        
                    
                    end
                end
                size = csv['Max Humidity'].size
                
                for i in 0...size
                
                    if min_hum.to_i < csv['Max Humidity'][i].to_i
                        min_hum = csv['Max Humidity'][i]
                        min_hum_date= csv['PKT'][i]
                        max_cityh= "Lahore"        
                        # puts "max"
                    end
                end

             elsif
                 print "no file exist in Lahore \n"  
             end

        elsif city == "Murree"
    
        file_open = "#{filenames_Murree}#{city}weather#{year}_#{mon}.txt"
        if filenames_Murree.include?(file_name) 
            file_path= file_path << file_name
            file_path
            file = File.open(file_open,"r+")
            file.inspect
            file.read


            csv = CSV.read(file_path, :headers=>true)
            size = csv['Max TemperatureC'].size
            
            for i in 0...size
                if max_temp.to_i < csv['Max TemperatureC'][i].to_i
                    max_temp = csv['Max TemperatureC'][i]
                    max_temp_date= csv['PKT'][i]
                    max_city= "Murree" 
                    # puts "max"
                end
            end
            size = csv['Min TemperatureC'].size
           
           for i in 0...size
               if min_temp.to_i > csv['Min TemperatureC'][i].to_i
                   min_temp = csv['Min TemperatureC'][i]
                   min_temp_date= csv['PKT'][i]
                   min_city= "Murree"        
                   # puts "max"
               end
           end
           size = csv['Max Humidity'].size
           
           for i in 0...size
           
               if min_hum.to_i < csv['Max Humidity'][i].to_i
                   min_hum = csv['Max Humidity'][i]
                   min_hum_date= csv['PKT'][i]
                   max_cityh= "Murree"        
                 
               end
           end

        elsif
            print "no file exist in Murree \n"  
        end
    end
    end
            # count+=1
        
    # file = File.open(file_open,"r+")
    # puts file.inspect
    # puts file.read
end

print " The maximum temperature is #{max_temp} C on #{max_temp_date} in #{max_city}\n" 
print " The minimum temperature is #{min_temp} C on #{min_temp_date} in #{min_city} \n" 
print " The maximum humidity is #{min_hum} % on #{min_hum_date} in #{max_cityh}\n" 
