def add_time(start, duration):
  # Data extraction - start:
  hour = start.split(":")[0]
  minutes = start.split(":")[1][ 0 : 2]
  pm_or_am = start.split()[1]
  if_am_true = True if pm_or_am == 'AM' else False
  # Data extraction - duration:
  hours_duration = duration.split(":")[0]
  minutes_duration = duration.split(":")[1][ 0 : 2]
  # Add hours and minutes
  hours_result = int(hour) + int(hours_duration)
  minutes_result = int(minutes) + int(minutes_duration)
  # Calculate minutes considering 60 minutes format
  if minutes_result >= 60:
    hours_result += int(minutes_result / 60)
    minutes_result = minutes_result % 60
  # Calculate hours considering 12 hours format
  if hours_result >= 13:
    # Calculate AM or PM result data
    i = int(hours_result / 12)
    for k in range(i):
      if_am_true = not if_am_true
    am_or_pm_result = "AM" if if_am_true else "PM"
    #Proceed to calculate hours using modulo operator
    hours_result = hours_result % 12
    
  


    





  print(hours_result, minutes_result, am_or_pm_result )
  return "TEST"