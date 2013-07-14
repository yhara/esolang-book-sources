# coding: utf-8

class Bolic

  class Parser                                         # (1)

    class ParseError < StandardError; end              # (2)

    NUMBERS = %w( ⓪ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩)     # (3)

    def self.parse(src)                                # (4)
      new(src).parse
    end

    def initialize(src)                                # (5)
      @tokens = src.chars.to_a                         
      @cur = 0
    end

    def parse                                          # (6)
      parse_number
    end

    private

    def parse_number                                   # (7)
      c = @tokens[@cur]
      @cur += 1
      n = NUMBERS.index(c)                         
      raise ParseError, "数字でないものが来ました(#{c})" unless n
      n
    end

  end

end

p Bolic::Parser.parse(ARGF.read)
