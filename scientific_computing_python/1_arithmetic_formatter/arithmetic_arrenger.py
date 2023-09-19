import itertools


def arithmetic_arranger(problems, show_results=False):
  # Variables that store parts of each problem in 'problems'
  top_operator = ""
  bottom_operator = ""
  separator = ""
  result_string = ""
  # Handle rule: Five problems limit
  if len(problems) > 5:
    return "Error: Too many problems."

  # For loop to process each given operation
  for i in range(len(problems)):
    # Handle Addition - Exceptions
    if problems[i].find("+") != -1:
      
      # Split string into a list with two elements
      problem_split = problems[i].split("+")
      # Obtain left and right operands and remove white space
      left_operand = problem_split[0]
      right_operand = problem_split[1]
      left_operand = left_operand.strip()
      right_operand = right_operand.strip()
      
      # Rule: integer with no more than 4 digits
      if (len(left_operand) > 4) or (len(right_operand) > 4):
        return "Error: Numbers cannot be more than four digits."
      
      try:
        left_operand = int(left_operand)
        right_operand = int(right_operand)
        current_result = left_operand + right_operand
      except:
        return "Error: Numbers must only contain digits."
      
      # Assign the 'separator' length to determine the number of dashes
      # and create right-aligned dinamic spacing
      largest_digit = 0
      dinamic_space_top = 0
      dinamic_space_bottom = 0
      dinamic_space_result = 0

      
      if left_operand > right_operand:
        largest_digit = len(str(left_operand))
        dinamic_space_top = len(str(left_operand)) + 2
        dinamic_space_bottom = len(str(left_operand)) + 1
        dinamic_space_result = len(str(left_operand)) + 2
      if right_operand > left_operand:
        largest_digit = len(str(right_operand))
        dinamic_space_top = len(str(right_operand)) + 2
        dinamic_space_bottom = len(str(right_operand)) + 1
        dinamic_space_result = len(str(right_operand)) + 2
      if len(str(right_operand)) == len(str(left_operand)):
        largest_digit = len(str(right_operand))
        dinamic_space_top = len(str(right_operand)) + 2
        dinamic_space_bottom = len(str(right_operand)) + 1
        dinamic_space_result = len(str(right_operand)) + 2

      current_separator = "-" * (largest_digit + 2)

      # Handle Addition - String Format Result
      space_between = "    " 
      if i == len(problems) - 1:
        space_between = ""
      else:
        space_between = "    " 

      top_operator += "{left_operand:>{dinamic_space}}".format(
          left_operand=left_operand,
          dinamic_space=dinamic_space_top) + space_between
      bottom_operator += "+{right_operand:>{dinamic_space}}".format(
          right_operand=right_operand,
          dinamic_space=dinamic_space_bottom) + space_between
      separator += current_separator + space_between
      result_string += "{current_result:>{dinamic_space}}".format(
          current_result=current_result,
          dinamic_space=dinamic_space_result) + space_between
    # Handle Subtraction
    elif problems[i].find("-") != -1:
      # Split string into a list with two elements
      problem_split = problems[i].split("-")
      # Obtain left and right operands and remove white space
      left_operand = problem_split[0]
      right_operand = problem_split[1]
      left_operand = left_operand.strip()
      right_operand = right_operand.strip()
      # Rule: integer with no more than 4 digits
      if (len(left_operand) > 4) or (len(right_operand) > 4):
        return "Error: Numbers cannot be more than four digits."
      
      try:
        left_operand = int(left_operand)
        right_operand = int(right_operand)
        current_result = left_operand - right_operand
      except:
        return "Error: Numbers must only contain digits."
      
    
      # Assign the 'separator' length to determine the number of dashes
      # and create right-aligned dinamic spacing
      largest_digit = 0
      dinamic_space_top = 0
      dinamic_space_bottom = 0
      dinamic_space_result = 0

      if left_operand > right_operand:
        largest_digit = len(str(left_operand))
        dinamic_space_top = len(str(left_operand)) + 2
        dinamic_space_bottom = len(str(left_operand)) + 1
        dinamic_space_result = len(str(left_operand)) + 2
      if right_operand > left_operand:
        largest_digit = len(str(right_operand))
        dinamic_space_top = len(str(right_operand)) + 2
        dinamic_space_bottom = len(str(right_operand)) + 1
        dinamic_space_result = len(str(right_operand)) + 2
      if len(str(right_operand)) == len(str(left_operand)):
        largest_digit = len(str(right_operand))
        dinamic_space_top = len(str(right_operand)) + 2
        dinamic_space_bottom = len(str(right_operand)) + 1
        dinamic_space_result = len(str(right_operand)) + 2

      current_separator = "-" * (largest_digit + 2)

      
      # Handle Subtraction - String Format Result
      space_between = "    " 
      if i == len(problems) - 1:
        space_between = ""
      else:
        space_between = "    " 

      top_operator += "{left_operand:>{dinamic_space}}".format(
          left_operand=left_operand,
          dinamic_space=dinamic_space_top) + space_between
      bottom_operator += "-{right_operand:>{dinamic_space}}".format(
          right_operand=right_operand,
          dinamic_space=dinamic_space_bottom) + space_between
      separator += current_separator + space_between
      result_string += "{current_result:>{dinamic_space}}".format(
          current_result=current_result,
          dinamic_space=dinamic_space_result) + space_between
    else:
      # Rule: If operators '+' or '-' are not found
      return "Error: Operator must be '+' or '-'."
  top_operator += "\n"
  bottom_operator += "\n"
  
  if show_results:
    separator += "\n"
    arithmetic_arranged_string = "{top_operator}{bottom_operator}{separator}{result_string}".format(
        top_operator=top_operator,
        bottom_operator=bottom_operator,
        separator=separator,
        result_string=result_string)
  else:
    arithmetic_arranged_string = "{top_operator}{bottom_operator}{separator}".format(
        top_operator=top_operator,
        bottom_operator=bottom_operator,
        separator=separator)

  # End of function - Return final string
  return arithmetic_arranged_string
