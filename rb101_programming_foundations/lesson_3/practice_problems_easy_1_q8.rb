=begin
Question 8
Given the hash below

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
Turn this into an array containing only two elements: Barney's name and Barney's number
=end

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

flintstones.select! { |k, v| k == "Barney" }.to_a.flatten!
flintstones.assoc("Barney")