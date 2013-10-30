#!/usr/bin/env ruby
class Uncontrollable

  def initialize(src)
    @tokens = src.split
    @jumps = analyze_jumps(@tokens)
  end

  def run
    tape = []
    pc = 0
    cur = 0
    jump_to = nil

    while pc < @tokens.size
      case @tokens[pc]
      when "if"
        tape[cur] ||= 0
        tape[cur] += 1
      when "do"
        tape[cur] ||= 0
        tape[cur] -= 1
      when "else"
        cur += 1
      when "while"
        cur -= 1
        raise "Error" if cur < 0
      when "then"
        if tape[cur] == 0
          pc = @jumps[pc]
        end
      when "end"
        if tape[cur] != 0
          pc = @jumps[pc]
        end
      when "until"
        n = (tape[cur] || 0)
        print n.chr
      when "for"
        tape[cur] = $stdin.getc
      end
      pc += 1
    end
  end

  private

  def analyze_jumps(tokens)
    jumps = {}
    froms = []

    tokens.each_with_index do |c, i|
      if c == "then"
        froms.push(i)
      elsif c == "end"
        from = froms.pop
        to   = i
        raise "too many ']'" if from.nil?

        jumps[from] = to
        jumps[to]   = from
      end
    end
    raise "missing ']'" unless froms.empty?

    jumps
  end
end

if $0==__FILE__
  Uncontrollable.new(ARGF.read).run
end
