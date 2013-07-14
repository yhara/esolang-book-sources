  def analyze_jumps(tokens)
    jumps = {}   # (1)
    starts = []

    tokens.each_with_index do |c, i|   # (2)
      if c == "["                      # (3)
        starts.push(i)
      elsif c == "]"                   # (4)
        raise ProgramError, "「]」が多すぎます" if starts.empty?
        from = starts.pop
        to   = i

        jumps[from] = to
        jumps[to]   = from
      end
    end
    raise ProgramError, "「[」が多すぎます" unless starts.empty?   # (5)

    jumps                              # (6)
  end
