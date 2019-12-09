#!/usr/bin/env ruby

input = File.read('input').split.map(&:to_i)

def fuel_counter(input)
  input.sum { |value| value / 3 - 2 }
end

puts "Part 1: #{fuel_counter(input)}"

def recursive_fuel_counter(current_value)
  fuel_counter = current_value / 3 - 2
  fuel_counter = 0 if fuel_counter < 0

  if fuel_counter > 2
    fuel_counter += recursive_fuel_counter(fuel_counter)
  end

  fuel_counter
end

def deep_fuel_counter(input)
  input.sum { |value| recursive_fuel_counter(value) }
end

puts "Part 2: #{deep_fuel_counter(input)}"