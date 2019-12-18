#!/usr/bin/env ruby

require_relative './intcode'

# equality/position
puts "Test 1: expected: 1; actual: #{Intcode.new(iset: '3,9,8,9,10,9,4,9,99,-1,8', input: 8).compute}"
puts "Test 2: expected: 0; actual: #{Intcode.new(iset: '3,9,8,9,10,9,4,9,99,-1,8', input: 1).compute}"

## less than/position
puts "Test 3: expected: 1; actual: #{Intcode.new(iset: '3,9,7,9,10,9,4,9,99,-1,8', input: 5).compute}"
puts "Test 4: expected: 0; actual: #{Intcode.new(iset: '3,9,7,9,10,9,4,9,99,-1,8', input: 9).compute}"

## equality/immediate
puts "Test 5: expected: 1; actual: #{Intcode.new(iset: '3,3,1108,-1,8,3,4,3,99', input: 8).compute}"
puts "Test 6: expected: 0; actual: #{Intcode.new(iset: '3,3,1108,-1,8,3,4,3,99', input: 5).compute}"

## less than/immediate
puts "Test 7: expected: 1; actual: #{Intcode.new(iset: '3,3,1107,-1,8,3,4,3,99', input: 5).compute}"
puts "Test 8: expected: 0; actual: #{Intcode.new(iset: '3,3,1107,-1,8,3,4,3,99', input: 12).compute}"

# jump/position
puts "Test 9: expected: 1; actual: #{Intcode.new(iset: '3,12,6,12,15,1,13,14,13,4,13,99,-1,0,1,9', input: 5).compute}"
puts "Test 10: expected: 0; actual: #{Intcode.new(iset: '3,12,6,12,15,1,13,14,13,4,13,99,-1,0,1,9', input: 0).compute}"

## jump/immediate
puts "Test 11: expected: 1; actual: #{Intcode.new(iset: '3,3,1105,-1,9,1101,0,0,12,4,12,99,1', input: 5).compute}"
puts "Test 12: expected: 0; actual: #{Intcode.new(iset: '3,3,1105,-1,9,1101,0,0,12,4,12,99,1', input: 0).compute}"

