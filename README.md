The goal of this assigment is to create a function that will return the shortest path that a knight will take from one point to another on a chess board.


I solved this by using a breadth first search and dynamically adding possible moves to a queue if they have not been visited yet. I used a hash to store positions and their previous position as a key-value pair so the path can be retraced when the target position is found.
