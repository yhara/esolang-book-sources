  insns = [
    [:jump, " \t\t"],
    [:push, 1],
    [:num_out],
    [:label " \t\t"],
    [:exit],
  ]
  p find_labels(insns)    #=> {" \t\t" => 3}
