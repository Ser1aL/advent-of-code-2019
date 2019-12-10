#!/usr/bin/env ruby

wires = File.read('input').split.map { |wire| wire.split(',') }

def build_wire(directions)
  coordinates = [[0, 0]]

  directions.each do |direction|
    case direction[0]
    when 'R'
      direction[1..-1].to_i.times do
        coordinates << [coordinates.last.first + 1, coordinates.last.last]
      end
    when 'L'
      direction[1..-1].to_i.times do
        coordinates << [coordinates.last.first - 1, coordinates.last.last]
      end
    when 'U'
      direction[1..-1].to_i.times do
        coordinates << [coordinates.last.first, coordinates.last.last + 1]
      end
    when 'D'
      direction[1..-1].to_i.times do
        coordinates << [coordinates.last.first, coordinates.last.last - 1]
      end
    else
    end
  end

  coordinates
end

wire_a = build_wire(wires[0])
wire_b = build_wire(wires[1])

intersections = wire_a & wire_b - [[0,0]]

puts "Part 1: #{intersections.map { |c| c.map(&:abs) }.map(&:sum).min}"

dist = intersections.map { |x, y| wire_a.index([x, y]) + wire_b.index([x, y]) }.min
puts "Part 2: #{dist}"