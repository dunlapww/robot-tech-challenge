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
  position == [0,0] ? true : false
end

commands = 'GRGRGRG'

print robot(commands)