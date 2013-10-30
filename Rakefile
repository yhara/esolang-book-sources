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

task :test_practices do
  cd "_practices/" do
    assert_equal "Hello, world!\n", `ruby 1-1-1a.rb`
    assert_equal "Hello, world!", `ruby 1-1-1b.rb`
    assert_equal File.read("../hq9plus/99bottles.txt"), `ruby 1-1-2.rb`
    assert_equal File.read("1-1-3a.rb"), `ruby 1-1-3a.rb`
    assert_equal File.read("1-1-3b.rb"), `ruby 1-1-3b.rb`
    # it is hard to test hsq9plus.rb ...
    
    assert_equal "A", `ruby uncontrollable.rb a.unc`
    #assert_equal "AAAA", `ruby ../whitespace/bin/whitespace forever_a.ws | head -c 4`
    
    assert_equal "Hello, world!", `ruby ../starry/starry.rb hello.sta`
    #assert_equal "1\n2\n3\n5\n", `ruby ../starry/starry.rb fibs.sta | head -n 4`
    assert_equal "1\n2\n3\n5\n", `echo 4 | ruby ../starry/starry.rb fibn.sta`
  end
end

desc "run test"
task :test => [
  :test_hq9plus,
  :test_brainf_ck,
  :test_whitespace,
  :test_starry,
  :test_bolic,
  :test_practices,
]

task :default => :test
