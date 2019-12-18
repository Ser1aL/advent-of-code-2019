# ABCDE
#
# DE - two-digit opcode,      02 == opcode 2
#  C - mode of 1st parameter,  0 == position mode
#  B - mode of 2nd parameter,  1 == immediate mode
#  A - mode of 3rd parameter,  0 == position mode, omitted due to being a leading zero

class Intcode
  attr_reader :iset

  SINGLEPARAM_OPERATIONS = [3, 4]
  MULTIPARAM_OPERATIONS = [1, 2, 5, 6, 7, 8]
  HALT_OPERATION = 99

  def initialize(**params)
    @iset = params[:iset].split(',').map(&:to_i)
    @input = params[:input]
    @output_buffer = []
    @pointer = 0
  end

  def compute
    loop do
      opcode, param_a, param_b = next_instruction_block
      case opcode
      when 1  # addition
        @iset[@iset[@pointer + 3]] = param_a + param_b
        @pointer += 4
      when 2  # multiplication
        @iset[@iset[@pointer + 3]] = param_a * param_b
        @pointer += 4
      when 3  # input
        @iset[@iset[@pointer + 1]] = @input
        @pointer += 2
      when 4  # output
        @output_buffer << param_a
        @pointer += 2
      when 5 # jump-if-true
        @pointer = param_a != 0 ? param_b : @pointer + 3
      when 6 # jump-if-false
        @pointer = param_a == 0 ? param_b : @pointer + 3
      when 7 # less than
        @iset[@iset[@pointer + 3]] = param_a < param_b ? 1 : 0
        @pointer += 4
      when 8 # equals
        @iset[@iset[@pointer + 3]] = param_a == param_b ? 1 : 0
        @pointer += 4
      when HALT_OPERATION # halt
        break
      else # EOF
        break
      end
    end

    @output_buffer
  end

  private

  def next_instruction_block
    op_block = @iset[@pointer].to_s.rjust(5, '0').split('')
    opcode = op_block[-2..-1].join.to_i

    if opcode == HALT_OPERATION
      [opcode, nil, nil]
    else
      param_a = op_block[-3].to_i == 0 ? @iset[@iset[@pointer + 1]] : @iset[@pointer + 1]

      if MULTIPARAM_OPERATIONS.include?(opcode)
        param_b = op_block[-4].to_i == 0 ? @iset[@iset[@pointer + 2]] : @iset[@pointer + 2]
      else
        param_b = nil
      end
      [opcode, param_a, param_b]
    end
  end
end