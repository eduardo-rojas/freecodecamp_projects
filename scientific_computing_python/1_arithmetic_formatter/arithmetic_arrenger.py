import itertools

def arithmetic_arranger(problems, show_results=False):
    if len(problems) > 5:
        return "Error: Too many problems."
    
    i = 0
    while i <= (len(problems) - 1 ):
        if problems[i].find("+"):
            problem_split = problems[i].split("+")
            left_operand = problem_split[0]
            right_operand = problem_split[1]
            left_operand = left_operand.strip()
            right_operand = right_operand.strip()
            
            if (len(left_operand) > 4) or (len(right_operand) > 4):
                return "Error: Numbers cannot be more than four digits."
            
            try:
                left_operand = int(left_operand)
                right_operand = int(right_operand)
            except:
                return "Error: Numbers must only contain digits."

            # if not left_operand[0].isdigit():
            #     return "Error: Numbers must only contain digits."
            # if not right_operand[0].isdigit():
            #     return "Error: Numbers must only contain digits."
        elif problems[i].find("-"):
            problem_split = problems[i].split("-")
            left_operand = problem_split[0]
            right_operand = problem_split[1]
            left_operand = left_operand.strip()
            right_operand = right_operand.strip()
            if (len(left_operand) > 4) or (len(right_operand) > 4):
                return "Error: Numbers cannot be more than four digits."

            try:
                left_operand = int(left_operand)
                right_operand = int(right_operand)
            except:
                return "Error: Numbers must only contain digits."
            
            # if not left_operand[0].isdigit():
            #     return "Error: Numbers must only contain digits."
            # if not right_operand[0].isdigit():
            #     return "Error: Numbers must only contain digits."
        else: 
            return "Error: Operator must be '+' or '-'."
    i += 1

    return "Test - End of Function"