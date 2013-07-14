require 'whitespace/compiler'   # (1)
require 'whitespace/vm'

module Whitespace

  def self.run(src)             # (2)
    insns = Whitespace::Compiler.compile(src)
    Whitespace::VM.run(insns)
  end

end 
