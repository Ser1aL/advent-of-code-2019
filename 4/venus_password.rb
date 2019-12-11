#!/usr/bin/env ruby

from, to = File.read('input').split('-').map(&:to_i)

matched = 0

from.upto(to) do |current|
  double_found = false

  chunked = current.to_s.split('').chunk_while do |i, j|
    double_found = true if i == j
    i <= j
  end.to_a

  matched += 1 if chunked.count == 1 && double_found
end

puts "Part 1: #{matched}"

matched = 0

from.upto(to).each do |current|
  double_flag = false
  group = []
  iteration = 1 # chunk_while does 1 less iteration

  chunked = current.to_s.split('').chunk_while do |i, j|
    iteration += 1

    group << i if group.empty?
    group << j if i == j

    if i != j || iteration == current.to_s.size
      if group.size == 2
        double_flag = true
      end
      group = []
    end

    i <= j
  end.to_a

  matched += 1 if (chunked.count == 1 && double_flag)
end

puts "Part 2: #{matched}"