#!/usr/bin/env ruby

require 'pry'

orbit_map = File.read('input')

orbit_map = <<EOF
E)J
J)K
K)L
E)F
EOF

orbit_map = orbit_map.split

# class Orbits < Hash

#   def bump_node(left)
#     # binding.pry if left == 'E'
#     each do |orbit, connections|
#       if connections.include?(left)
#         return orbit
#       end
#     end

#     return nil
#   end
# end


# E - J - K - L

# K - L
# J - K - L
# E - J - K - L

# J - K
# E - J - K

# E - J

# stores weights in the format
# {
#   orbit_name => {
#     weight: weight,
#     branches: [
#       array_of_connection_a,
#       array_of_connection_b,
#       ..
#     ]
# }
orbits = {}

orbit_map.each do |combination|
  left, right = combination.split(')')

  if !orbits.has_key?(left) # if a new combination
    orbits[left] = { weight: 1, branches: [[right]] }
  else
    # if a left connector exists in right connections on any of the nodes
    connector, branch_idx = nil, 0
    orbits.each do |orbit, data|
      data.each_with_index do |branch, idx|
        if branch.include?(left)
          connector = orbit
          branch_idx = idx
          break
        end
      end
    end

    if connector # subsequential connection
      orbits[left][:branches][branch_idx] << right
      orbits[left][:weight] = orbits[left][:branches].map { |branch| 2 ** branch.size -1 }.sum
    else # found parent node
    end
  end

  # if orbit_weights.connectable?(left)

  # end

  # if orbit_weights.connectable?(left)
  #   # binding.pry
  #   orbit_weights[left].last << right
  #   orbit_weights[left][0] = 2 ** orbit_weights[left].last.size - 1
  # else
  #   orbit_weights[left] = [1, [right]]
  # end
  # p orbit_weights
end

# binding.pry