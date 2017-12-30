def bubble_sort(arr)
  l = arr.length
  while l != 0
    newl = 0
    1.upto(l-1) { |i| arr[i], arr[i-1], newl = arr[i-1], arr[i], i if arr[i-1] > arr[i] }
    l = newl
  end
  arr
end

def bubble_sort_by(arr,&block)
  l = arr.length
  while l != 0
    newl = 0
    1.upto(l-1) { |i| arr[i], arr[i-1], newl = arr[i-1], arr[i], i if yield(arr[i-1], arr[i]) > 0 }
    l = newl
  end
  arr
end

puts bubble_sort([4,5,6,2,23,4,5,23,24,1,-3,14,5,623,3]).inspect
puts bubble_sort([]).inspect
puts bubble_sort([1,-1]).inspect
puts bubble_sort([1]).inspect

puts bubble_sort_by(["gdfadg", "lksgf", "sf", "s"]) { |l,r| l.length - r.length }.inspect
puts bubble_sort_by([4,5,6,2,23,4,5,23,24,1,-3,14,5,623,3]) { |l,r| l.abs%10 - r.abs%10 }.inspect
