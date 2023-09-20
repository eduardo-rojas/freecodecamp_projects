def add_time(start, duration, day_of_the_week=False):
  # Data extraction - start:
  hour = start.split(":")[0]
  minutes = start.split(":")[1][ 0 : 2]
  pm_or_am = start.split()[1]
  pm_or_am = pm_or_am.strip()
  if_am_true = True if pm_or_am == 'AM' else False
  pm_am_counter = 0
  
  # Data extraction - duration:
  hours_duration = duration.split(":")[0]
  minutes_duration = duration.split(":")[1][ 0 : 2]

  # Data Preparation - Days of the week dictionary
  if day_of_the_week:
    day_of_the_week = day_of_the_week.capitalize()

    days_of_the_week = [ 
        "Monday",
        "Tuesday", 
        "Wednesday", 
        "Thursday", 
        "Friday", 
        "Saturday", 
        "Sunday"
    ]
    try:
        day_of_the_week_idx = days_of_the_week.index(day_of_the_week)
    except:
        return "Invalid day of the week provided."

  # Add hours and minutes
  hours_result = int(hour) + int(hours_duration)
  minutes_result = int(minutes) + int(minutes_duration)
  
  # Calculate minutes considering 60 minutes format
  if minutes_result >= 60:
    hours_result += int(minutes_result / 60)
    minutes_result = minutes_result % 60

  # Calculate AM or PM result data
  if (hours_result / 12) >= 1:
    i = int(hours_result / 12)

    for k in range(i):
        if if_am_true:
           if_am_true = not if_am_true
        else: 
           if_am_true = not if_am_true
           pm_am_counter += 1
           if day_of_the_week:
             day_of_the_week_idx +=1
             if day_of_the_week_idx > 6:
               day_of_the_week_idx = 0

    am_or_pm_result = "AM" if if_am_true else "PM"
  else:
    am_or_pm_result = pm_or_am
    
  # Calculate hours considering 12 hours format
  if hours_result >= 13:
    #Proceed to calculate hours using modulo operator
    hours_result = hours_result % 12
  if hours_result == 0:
    hours_result = 12
 
  if pm_am_counter == 1:
    next_day_str = " (next day)"
  elif pm_am_counter > 1:
    next_day_str = f" ({pm_am_counter} days later)"
  else: 
    next_day_str = ""

  #Prepare results for data presentation format
  hours_result = str(hours_result) 
  minutes_result = str(minutes_result)
  hours_result = hours_result if len(hours_result) > 1 else  hours_result
  minutes_result = minutes_result if len(minutes_result) > 1 else "0" + minutes_result
  if day_of_the_week:
    day_of_the_week_result = days_of_the_week[day_of_the_week_idx] 
    result_string_format = f"{hours_result}:{minutes_result} {am_or_pm_result}, {day_of_the_week_result}{next_day_str}"
  else:
    result_string_format = f"{hours_result}:{minutes_result} {am_or_pm_result}{next_day_str}"
    
  return result_string_format