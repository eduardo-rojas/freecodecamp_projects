# This entrypoint file to be used in development. Start by reading README.md
from shape_calculator import Rectangle, Square
from unittest import main

first_rectangle = Rectangle(10, 3)

print("First rectangle Width: ", first_rectangle.width)
print("First rectangle Height: ", first_rectangle.height)
print("First rectangle Area: ", first_rectangle.get_area())
print("First rectangle Perimeter: ", first_rectangle.get_perimeter())
print(first_rectangle)
print(first_rectangle.get_picture())
#initial tests
# rect = shape_calculator.Rectangle(5, 10)
# print(rect.get_area())
# rect.set_width(3)
# print(rect.get_perimeter())
# print(rect)

# sq = shape_calculator.Square(9)
# print(sq.get_area())
# sq.set_side(4)
# print(sq.get_diagonal())
# print(sq)


# Run unit tests automatically
#main(module='test_module', exit=False)