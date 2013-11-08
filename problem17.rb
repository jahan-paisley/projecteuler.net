require 'pry'

class Problem17

  def initialize
    @words = {1 =>"one",
      2 =>"two", 3 =>"three", 4 =>"four", 5 =>"five", 6 =>"six", 7 =>"seven", 8 =>"eight", 9 =>"nine",
      10 =>"ten", 11 =>"eleven", 12 =>"twelve", 13 =>"thirteen", 14 =>"fourteen", 15 =>"fifteen", 16 =>"sixteen", 17 =>"seventeen", 18 =>"eighteen", 19 =>"nineteen",
      20 =>"twenty", 30 =>"thirty", 40 =>"forty", 50 =>"fifty", 60 =>"sixty", 70 =>"seventy", 80 =>"eighty", 90 =>"ninety", 100 =>"hundred",  
      1000 =>"thousand",
      0 => ""
    }
  end
  
  def run
    (1..1000).map{|e| to_words e}
  end

  def to_words e  
    # binding.pry
    if e<= 20 
      return @words[e]
    elsif 21<= e and e<= 99
      binding.pry if @words[e-e%10].nil? or @words[e%10].nil?
      return @words[e-e%10] + @words[e%10]
    elsif 100<= e and e<= 999
      return @words[(e/100)]+'hundred' + (to_words(e-((e/100)*100))=="" ? "" : "and" + to_words(e-((e/100)*100)))
    elsif e==1000
      return 'onethousand'
    else
      return nil
    end
  end
  
end
nums= Problem17.new.run
puts nums.map(&:length).inject(&:+)