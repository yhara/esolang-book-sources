# (略)

    def parse
      parse_additive 
    end

    private

    def parse_additive
      left = parse_multiple
      if @tokens[@cur] == "＋"
        @cur += 1
        [:+, left, parse_additive]
      elsif @tokens[@cur] == "−"
        @cur += 1
        [:-, left, parse_additive]
      else
        left
      end
    end

    def parse_multiple
      left = parse_number
      if @tokens[@cur] == "×"
        @cur += 1
        [:*, left, parse_multiple]
      elsif @tokens[@cur] == "÷"
        @cur += 1
        [:/, left, parse_multiple]
      else
        left
      end
    end

# (略)
