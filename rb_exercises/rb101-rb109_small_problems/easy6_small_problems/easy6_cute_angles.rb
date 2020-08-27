# Write a method that takes a floating point number that represents an angle between 0 and 360 degrees and returns a String that represents that angle in degrees, minutes and seconds. You should use a degree symbol (°) to represent degrees, a single quote (') to represent minutes, and a double quote (") to represent seconds. A degree has 60 minutes, while a minute has 60 seconds.

DEGREE = "\xC2\xB0"
MINUTES_PER_SECOND = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_SECOND * SECONDS_PER_MINUTE

def display(deg, min, sec)
  puts format(%(#{deg}#{DEGREE}%02d'%02d"), min, sec)
end

# some calculations are off by 1 second; e.g. dms(76.73)
# working with total seconds would be more accurate
# def dms(angle)
#   degrees, d_remainder = angle.divmod(1)
#   minutes, m_remainder = (d_remainder * 60).divmod(1)
#   seconds = (m_remainder * 60)

#   display(degrees, minutes, seconds)
# end

# more accurate solution; working with total seconds
def dms(angle)
  total_seconds = (angle * SECONDS_PER_DEGREE).round
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
  
  display(degrees, minutes, seconds)
end


# Examples:

dms(30) == %(30°00'00")
dms(76.73) == %(76°43'48")
dms(254.6) == %(254°36'00")
dms(93.034773) == %(93°02'05")
dms(0) == %(0°00'00")
dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
# Note: your results may differ slightly depending on how you round values, but should be within a second or two of the results shown.

# You should use two digit numbers with leading zeros when formatting the minutes and seconds, e.g., 321°03'07".

# You may use this constant to represent the degree symbol:

# DEGREE = "\xC2\xB0"