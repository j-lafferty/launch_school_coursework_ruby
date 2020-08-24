# As seen in the previous exercise, the time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

# Write two methods that each take a time of day in 24 hour format, and return the number of minutes before and after midnight, respectively. Both methods should return a value in the range 0..1439.

# You may not use ruby's Date and Time methods.

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def get_hours(time)
  time.split(//).take(2).join.to_i
end

def get_minutes(time)
  time.split(//).drop(3).join.to_i
end

def after_midnight(time)
  hr = get_hours(time)
  min = get_minutes(time)

  minutes = (hr * MINUTES_PER_HOUR) + min
  minutes %= MINUTES_PER_DAY
end

def before_midnight(time)
  minutes = MINUTES_PER_DAY - after_midnight(time)
  minutes = 0 if minutes == MINUTES_PER_DAY
  minutes
end

# Examples:
puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0