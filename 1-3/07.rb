class Brainf_ck

  class ProgramError < StandardError; end

  # (略)

  def run
    # (略)

    while pc < @tokens.size
      case @tokens[pc]
        #
        # (略)
        #
      when "."
        n = (tape[cur] || 0)
        print n.chr
      when ","
        tape[cur] = $stdin.getc.ord
      end

      pc += 1
    end
  end

end
# (略)
