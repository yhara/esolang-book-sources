if RUBY_VERSION =~ /1.8.\d/
  ENV["RUBYOPT"] = "-Ku -r../compat.rb"
end

def assert_equal(expected, given)
  if expected != given
    $stderr.puts "NG: #{expected.inspect} expected but got #{given.inspect}"
  end
end

task :test_hq9plus do
  cd "hq9plus/" do
    assert_equal "Hello, world!\n", `ruby hq9plus.rb hello.hq9`
    assert_equal File.read("99bottles.txt"), `ruby hq9plus.rb 99bottles.hq9`
    assert_equal "", `ruby hq9plus.rb increment.hq9`
  end
end

task :test_brainf_ck do
  cd "brainf_ck/" do
    assert_equal "Hello, world!", `ruby brainf_ck.rb hello.bf`
  end
end

task :test_whitespace do
  cd "whitespace/" do
    assert_equal "Hi", `ruby bin/whitespace hi.ws`
    assert_equal "Hello, world!", `ruby bin/whitespace hello.ws`
  end
end

task :test_starry do
  cd "starry/" do
    assert_equal "Hi", `ruby starry.rb hi.sta`
  end
end

task :test_bolic do
  cd "bolic/" do
    assert_equal "1\n2\n3\n5\n8\n13\n21\n34\n55\n89\n", `ruby bolic.rb fib.bol`
    assert_equal "Hello, world!", `ruby bolic.rb hello.bol`
  end
end

desc "run test"
task :test => [
  :test_hq9plus,
  :test_brainf_ck,
  :test_whitespace,
  :test_starry,
  :test_bolic,
]

task :default => :test
