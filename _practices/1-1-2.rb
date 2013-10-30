b=proc{|n,w|"#{n==0?'no more':n} bottle#{'s'unless n==1} of beer#{' on the wall'if w}"}
puts ["#{b[99,1]}, #{b[99,p]}.",(0..98).map{|n|["Take one down and pass it around, #{b[n,1]}.","","#{b[n,1].capitalize}, #{b[n,p]}."]}.reverse, "Go to the store and buy some more, #{b[99,1]}."]

