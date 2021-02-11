# restatement of problem
- A robot can move left (l) right(r) and forward(g)
- we will pass robot a string of commands like 'lrggglr'
- how can we know if the string passed will result in the robot returning to its original position?


# assumptions/questions
- what is the starting direction of the robot (let's assume North)
- what do you want function to return? T/F or final position? (assume T/F)

# definitions
- let the starting position be called [0,0]

# thoughts on problem:
- does the net number of Ls and Rs = 0 and 
- so maybe you have a start position of [0,0].
- the Ls and Rs will  dictate the impact of G will on either the x or y coordinate.
- the number of Gs will then impact how much the x or y will be impacted

# approach
- if the string is only ls and rs, then it will not change position
- look at how many ls and rs precede each g to determine whether g will impact x or y position
- look at how many successive g's before next l,r to determine how much impact it will have on the position
- as we iterate through the string, we can adjust the coordinate.  if the final coordinate is [0,0] then the robot has returned to its position. and function should return true.  otherwise false.

# pseudocode

commands = "GRGRGRG"

def robot(commands)
  position = [0,0]
  current_direction = N
  directions = [N,E,S,W]
  commands.chars.each do |command|
  if L
    directions = directions.rotate(1)
    current_direction = directions[0]
  if R
    directions = directions.rotate(1)
    current_direction = directions[0]
  if G
    case directions[0]:
    E
      position[0] += 1
    W
      position[0] -= 1
    N
      position[1] += 1
    S
      position[1] -= 1
    end
  end
  position == [0,0] ? true : false
end

# solution
def robot(commands)
  position = [0,0]
  directions = ['N','E','S','W']

  commands.chars.each do |command|
    case command
    when 'L'
      directions = directions.rotate(-1) 
    when 'R'
      directions = directions.rotate(1) 
    when 'G'
      case directions[0]
      when 'E'
        position[0] += 1
      when 'W'
        position[0] -= 1
      when 'N'
        position[1] += 1
      when 'S'
        position[1] -= 1
      end
    end
  end
  position == [0,0] ? true : position
end

commands = 'GRGRGRG'

print robot(commands)