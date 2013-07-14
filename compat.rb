
require 'enumerator'

class String
  def chars
    Enumerator.new(self.scan(/./))
  end

  def each_char(&block)
    chars.each(&block)
  end

  def ord
    raise TypeError if self.size == 0
    self[/./].unpack("C").first
  end
end

class IO
  alias original_getc getc
  def getc
    original_getc.chr
  end
end
