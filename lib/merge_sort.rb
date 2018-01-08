def merge_sort(arr)
  return arr if arr.length < 2
  mid = arr.length / 2
  merge(merge_sort(arr[0..mid - 1]), merge_sort(arr[mid..-1]))
end

def merge(l, r)
  return l if r.empty?
  return r if l.empty?
  if l.first < r.first
    return [l.first] + merge(l[1..-1], r)
  else
    return [r.first] + merge(l, r[1..-1])
  end
end

aa = Array.new(100) { rand(1000) }
puts "unsorted: #{aa}"
puts "sorted: #{merge_sort(aa)}"
