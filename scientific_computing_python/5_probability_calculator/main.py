# This entrypoint file to be used in development. Start by reading README.md
import prob_calculator
from unittest import main


# myhat = prob_calculator.Hat(green=5, red=6, black = 4)
# print(myhat.green)
# print(myhat.red)
# print("My hat initial contents: ", myhat.contents)
# print("Draw results: ", myhat.draw(7))
# print("My hat final contents: ", myhat.contents)
# print("------EXPERIMENT-----")
# prob_calculator.random.seed(95)
# hat = prob_calculator.Hat(blue=3,red=2,green=6)
# probability = prob_calculator.experiment(hat=hat, expected_balls={"blue":1,"green":1}, num_balls_drawn=4, num_experiments=1)
# print("PROBABILITY: ", probability)
# myprob = prob_calculator.experiment(myhat, {'black': 3, 'red':1}, 5, 2000)
# print("EXPERIMENT probability: ", myprob)
# print(vars(myhat))

# Initial tests
prob_calculator.random.seed(95)
hat = prob_calculator.Hat(blue=4, red=2, green=6)
probability = prob_calculator.experiment(
    hat=hat,
    expected_balls={"blue": 2,
                    "red": 1},
    num_balls_drawn=4,
    num_experiments=25)
print("Probability:", probability)

# Run unit tests automatically
main(module='test_module', exit=False)
