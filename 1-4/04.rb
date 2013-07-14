scanner = StringScanner.new("1234567890")

p scanner.scan(/\d\d\d/)   #=> "123"
p scanner.scan(/\d\d\d/)   #=> "456"
p scanner.scan(/\d\d\d/)   #=> "789"
p scanner.scan(/\d\d\d/)   #=> nil
