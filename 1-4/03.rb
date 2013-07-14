# coding: utf-8     # (1)

module Whitespace   # (2)

  class Compiler    # (3)

    class ProgramError < StandardError; end   # (4)

    def self.compile(src)     # (5)
      new(src).compile        # (6)
    end

    def initialize(src)       # (7)
      @src = src
    end

    def compile               # (8)
      # ここにコンパイル処理を書く
    end

  end

end
