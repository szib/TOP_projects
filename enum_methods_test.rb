require_relative 'enum_methods'

arr = [4, 2, 3, 5, 6, 2, 1, 55]
hsh = { aaa: "1", bbb: "2das", ccc: "333", ddd: "test" }

arr.my_each { |y| p y**2 }
hsh.my_each { |y| p y*2 }
arr.my_each_with_index { |y, i| p "#{i} ==> #{y * 10}" }
hsh.my_each_with_index { |y, i| p "#{i} ==> #{y * 3}" }
puts arr.my_select { |x| x%2 == 0 }

puts hsh.my_select { |k,v| v == "333" }
puts arr.my_select

puts [1,3,5,7].my_all? { |x| x%2 == 1 }
puts [1,3,5,4,7].my_any? { |x| x%2 == 0 }
puts [1,3,5,7].my_none? { |x| x%2 == 0 }
puts [4,1,3,5,7].my_count { |x| x%2 == 0 }
puts [4,1,3,5,7].my_count

puts [4,1,3,5,7].my_map { |x| x**2 }.inspect
puts [4,1,3,5,7].my_inject { |acc,b| acc += b }

def multiply_els(arr)
  arr.my_inject { |memo, i| memo * i }
end

puts multiply_els([2,4,5])

proc = Proc.new { |a| a**3 }
puts [2,4,5].my_map(proc).inspect
