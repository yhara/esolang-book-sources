class Brainf_ck

  class ProgramError < StandardError; end

  # (略)

  def run
    # (略)

    while pc < @tokens.size
      case @tokens[pc]
      when "+"
        # (略)
      when "-"
        # (略)
      when ">"
        cur += 1
      when "<"
        cur -= 1
        raise ProgramError, "開始地点より左には移動できません" if cur < 0
      end

      pc += 1
    end
  end

end
# (略)
