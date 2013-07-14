# coding: utf-8

class Bolic

  class Parser                                         

    class ParseError < StandardError; end             

    NUMBERS = %w( ⓪ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩)   

    def self.parse(src)                             
      new(src).parse
    end

    def initialize(src)                            
      @tokens = trim_spaces(src).chars.to_a                         
      @cur = 0
    end

    def parse                                     
      parse_additive
    end

    private

    def trim_spaces(str)
      str.gsub(/\s/, "")
    end

    def match?(c)
      if @tokens[@cur] == c
        @cur += 1
        true
      else
        false
      end
    end

    def parse_additive
      left = parse_multiple
      if match?("＋")
        [:+, left, parse_additive]
      elsif match?("−")
        [:-, left, parse_additive]
      else
        left
      end
    end

    def parse_multiple
      left = parse_number
      if match?("×")
        [:*, left, parse_multiple]
      elsif match?("÷")
        [:/, left, parse_multiple]
      else
        left
      end
    end

    def parse_number    
      c = @tokens[@cur]
      @cur += 1
      n = NUMBERS.index(c)                         
      raise ParseError, "数字でないものが来ました(#{c})" unless n
      n
    end

  end

end

p Bolic::Parser.parse(ARGF.read)
