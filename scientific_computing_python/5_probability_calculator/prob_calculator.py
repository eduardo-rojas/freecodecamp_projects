import copy
import random


class Hat():
  
  def __init__(self, **kwargs):
    self.acceptable_keys_list = ['yellow', 'blue', 'green', 'red', 'orange', 'black', 'blue', 'pink', 'striped']
    self.contents = list()
    [self.__setattr__(key, kwargs.get(key)) for key in self.acceptable_keys_list]
    for key, value in list(kwargs.items()):
       for i in range(value):
          self.contents.append(key)

  def draw(self, draw_number):
    #copy the elements of the contents list to a temporary variable
    contents_tmp = self.contents.copy()
    #list of all random indexes
    list_of_random_ints = list()
    #if the the draw_number is higher than the contents list
    #return the full contents list
    if draw_number > len(self.contents):
       return self.contents
    #list to store all the balls in the contents list that are removed
    balls_removed = list()
    #size of contents list
    hat_length = len(self.contents)
    #for loop to generate random integers,
    #use each integer as an index
    # and remove a ball from self.contents
    for ball in range(draw_number):
       random_value = random.randrange(0, hat_length )
       list_of_random_ints.append(random_value)
       try:
         value_to_be_removed = self.contents[random_value]
         idx_to_be_removed = contents_tmp.index(value_to_be_removed)
         #Remove the ball from contents_tmp only
         #only if the random index is valid
         #and append the ball to the balls_removed list
         if contents_tmp[idx_to_be_removed] != None:
            contents_tmp[idx_to_be_removed] = None
            balls_removed.append(value_to_be_removed) 
       except:
         continue
       
    for ball in balls_removed:
       self.contents.remove(ball)       


          
    return balls_removed
    
     
     
 
  

def experiment(hat, expected_balls, num_balls_drawn, num_experiments):
   
   probability = 0
   m = 0
   n = num_experiments
   draw_result_dictionary = dict.fromkeys(expected_balls)
   #Conditional dictionary
   experiment_conditional_dictionary = dict.fromkeys(expected_balls)
   
   for iterations in range(num_experiments):
      # -- TESTING ----
      # Create temporary at object for each experiment
      tmp_hat = copy.deepcopy(hat)
      print(f"{iterations}. Experiment hat contents", tmp_hat.contents)
      #print("----- Tmp hat initial contents: ", tmp_hat.contents)
      #Perform draw
      draw_result = tmp_hat.draw(num_balls_drawn)
      print(f"{iterations}.DRAW RESULTS: ", draw_result)
      #Count each key in draw result and include each count
      #to it's corresponding key in draw_result_dictionary
      for key in list(expected_balls.keys()):
         draw_result_dictionary[key] = draw_result.count(key)
      print(f"{iterations}. Draw result dictionary: ", draw_result_dictionary)
      #If ball number in draw result dictionary equals or is greater    
      #than expected then set key value to True in 
      #experiment_conditional_dictionary
      for expected_key in list(expected_balls.keys()):
         if draw_result_dictionary[expected_key] >= expected_balls[expected_key]:
            experiment_conditional_dictionary[expected_key] = True
         else: 
            experiment_conditional_dictionary[expected_key] = False
      #experiment conditional result list
      experiment_result_list = list(experiment_conditional_dictionary.values())
      #print("Experiment boolean list: ", experiment_result_list)
      #add m + 1 if the condition of the experiment is met:
      print(f"{iterations}. Boolean experiment list:  ", experiment_result_list)
      if all(experiment_result_list):
         m += 1




   probability = m / n 
   return probability