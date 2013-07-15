# coding: utf-8

class Starry

  class ProgramError < Exception; end

  OP_STACK = [:__dummy__, :dup, :swap, :rotate, :pop]
  OP_CALC = [:+, :-, :*, :/, :%]
  OP_OUTPUT = [:num_out, :char_out]
  OP_INPUT = [:num_in, :char_in]

  def self.run(src)
    new(src).run
  end

  def initialize(src)
    @insns = parse(src)
    @stack = []
    @labels = find_labels(@insns)
  end

  def run
    pc = 0
    while pc < @insns.size
      insn, arg = *@insns[pc]

      case insn
      when :push
        push(arg)
      when :dup
        push(@stack[-1])
      when :swap
        y, x = pop, pop
        push(y)
        push(x)
      when :rotate
        z, y, x = pop, pop, pop
        push(z)
        push(x)
        push(y)
      when :pop
        pop

      when :+
        y, x = pop, pop
        push(x + y)
      when :-
        y, x = pop, pop
        push(x - y)
      when :*
        y, x = pop, pop
        push(x * y)
      when :/
        y, x = pop, pop
        push(x / y)
      when :%
        y, x = pop, pop
        push(x % y)

      when :num_out
        print pop
      when :char_out
        print pop.chr
      when :char_in
        push($stdin.getc.ord)
      when :num_in
        push($stdin.gets.to_i)

      when :label
        # ラベルの位置は既に調べてあるので、何もしない
      when :jump
        if pop != 0
          pc = @labels[arg]
          raise ProgramError, "ジャンプ先(#{arg.inspect})が見つかりません" if pc.nil?
        end

      else
        raise "[BUG] 知らない命令です(#{insn})"
      end
      pc += 1
    end
  end

  private

  def parse(src)
    insns = []

    spaces = 0
    src.each_char do |c|
      case c
      when " "
        spaces += 1
      when "+"
        raise ProgramError, "0個の空白のあとに+が続きました" if spaces == 0
        if spaces < OP_STACK.size
          insns << select(OP_STACK, spaces)
        else
          insns << [:push, spaces - OP_STACK.size]
        end
        spaces = 0
      when "*"
        insns << select(OP_CALC, spaces)
        spaces = 0
      when "."
        insns << select(OP_OUTPUT, spaces)
        spaces = 0
      when ","
        insns << select(OP_INPUT, spaces)
        spaces = 0
      when "`"
        insns << [:label, spaces]
        spaces = 0
      when "'"
        insns << [:jump, spaces]
        spaces = 0
      end
    end

    insns
  end

  def select(ops, n)
    op = ops[n % ops.size]
    [op]
  end

  def find_labels(insns)
    labels = {}
    insns.each_with_index do |(insn, arg), i|
      if insn == :label
        raise ProgramError, "ラベル#{arg}が重複しています" if labels[arg]
        labels[arg] = i
      end
    end
    labels
  end

  def push(item)
    unless item.is_a?(Integer)
      raise ProgramError, "整数以外(#{item})をプッシュしようとしました" 
    end
    @stack.push(item)
  end

  def pop
    item = @stack.pop
    raise ProgramError, "空のスタックをポップしようとしました" if item.nil?
    item
  end

end

Starry.run(ARGF.read)
