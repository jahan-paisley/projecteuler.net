class MyDate
  attr_accessor :y, :m, :d, :day_of_week
  
  def initialize y, m, d
    @y, @m, @d= y, m ,d
  end
  
  def months
    [nil,
  	31, 28, #29 on leap years
    31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  end
  
  def is_leap_year
    case
    when @y % 400 == 0 then
      true
    when @y % 100 == 0 then
      false
    when @y % 4 == 0 then
      true
    else
      false
    end
  end
  
  def self.start
    date= MyDate.new 1900, 1, 1
    date.day_of_week= 1
    date
  end
  
  def add_day
    if not is_leap_year
      case 
      when @d<months[@m] then
        @d+=1 
      when (@d == months[@m] and @m< 12) then
        @d, @m = 1, @m+1 
      when (@d == months[@m] and @m == 12) then
        @d, @m = 1, 1
        @y+=1
      end
      @day_of_week= (@day_of_week+1) % 7
    else
      case 
      when @d<months[@m] then
        @d+=1 
      when (@d >= months[@m] and @m< 12 and @m != 2) then
        @d, @m = 1, @m+1 
      when (@d >= months[@m] and @m == 2) then
        if @d == 28
          @d+=1
        else
          @d= 1
          @m= 3
        end
      when (@d >= months[@m] and @m == 12) then
        @d, @m = 1, 1
        @y+=1

      end
      @day_of_week= ((@day_of_week+1)%7)
    end
  end  
    
end

date= MyDate.start
count= 0
while date.y< 2001 do
  count+=1 if date.day_of_week == 0 and date.d == 1 and date.y>=1901
  date.add_day
end

puts count