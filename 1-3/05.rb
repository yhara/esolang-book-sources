class Brainf_ck
  # (略)

  def run
    tape = []
    pc = 0
    cur = 0

    while pc < @tokens.size
      case @tokens[pc]
      when "+"
        tape[cur] ||= 0
        tape[cur] += 1
      when "-"
        tape[cur] ||= 0
        tape[cur] -= 1
      end

      pc += 1
    end
  end

end
# (略)
