#!/usr/bin/env ruby

require_relative './intcode'

input = File.read('input')

p Intcode.new(iset: input, input: 1).compute
p Intcode.new(iset: input, input: 5).compute