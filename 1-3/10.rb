src = ARGF.read

puts "tape = []; cur = 0"
src.each_char do |c|
  case c
  when "+"
    puts "tape[cur] ||= 0; tape[cur] += 1"
  when "-"
    puts "tape[cur] ||= 0; tape[cur] -= 1"
  when ">"
    puts "cur += 1"
  when "<"
    puts "cur -= 1"
  when "["
    puts "while tape[cur] != 0"
  when "]"
    puts "end"
  when "."
    puts "puts (tape[cur] || 0).chr"
  when ","
    puts "tape[cur] = $stdin.getc"
  end
end
