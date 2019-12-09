#!/usr/bin/env ruby

input = File.read('input').split(',').map(&:to_i)

def compute(memory, noun, verb)
  pointer = 0
  memory[1..2] = noun, verb

  loop do
    op = memory[pointer]
    break unless [1, 2].include?(op)

    value_left = memory[memory[pointer + 1]]
    value_right = memory[memory[pointer + 2]]
    result_pos = memory[pointer + 3]

    case op
    when 1
      memory[result_pos] = value_left + value_right
      pointer += 4
    when 2
      memory[result_pos] = value_left * value_right
      pointer += 4
    when 99
      break
    else
      break
    end
  end

  memory[0]
end

puts "Part 1: #{compute(input.dup, 12, 2)}"

100.times do |i|
  100.times do |j|
    result = compute(input.dup, i, j)

    if result == 19_690_720
      puts "Part 2: #{100 * i + j}"
      exit
    end
  end
end