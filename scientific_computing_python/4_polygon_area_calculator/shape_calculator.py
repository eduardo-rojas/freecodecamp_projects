class Rectangle:

    def __init__(self, width, height):
        self.width  = width
        self.height = height
    
    def set_width(self, new_width):
        self.width  = new_width

    def set_height(self, new_height):
        self.height  = new_height
    
    def get_area(self):
        return self.width * self.height
    
    def get_perimeter(self):
        return (self.width ** 2 + self.height ** 2) ** .5
    
    def get_picture(self):
        rect_picture = ""
        width_dynamic = self.width - 1

        #fill the top of the rectangle: first loop
        for i in range(self.width):
            rect_picture += "*"
        
        rect_picture += "\n"
        
        #Fill the inside of the rectangle: second loop
        for i in range(self.height - 2 ):
            for j in range(self.width):
                rect_picture += "*"
           
        
        rect_picture += "\n"
        
        #fill the bottom of the rectangle: third loop
        for i in range(self.width):
            rect_picture += "*"

        return rect_picture 
    
    def get_amount_inside(self, shape):
        return None
    
    def __str__(self):
        return f"Rectangle(width={self.width}, height={self.height})"
    





class Square:
    def __init__(self, length):
        Rectangle.__init__(self, length, length)
        self.length = length
