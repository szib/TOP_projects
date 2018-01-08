class Array
  def self.quick_sort(arr)
    arr.quick_sort
  end

  def quick_sort(arr = self, lo = 0, hi = length - 1)
    if lo < hi
      p = partition(arr, lo, hi)
      quick_sort(arr, lo, p - 1)
      quick_sort(arr, p + 1, hi)
    end
    arr
  end

  private

  def partition(arr, lo, hi)
    pivot = arr[hi]
    i = lo - 1
    lo.upto(hi - 1) do |j|
      next unless arr[j] < pivot
      i += 1
      swap(arr, i, j)
    end
    swap(arr, i + 1, hi) if arr[hi] < arr[i + 1]
    i + 1
  end

  def swap(arr, i, j)
    t = arr[i]
    arr[i] = arr[j]
    arr[j] = t
    arr
  end
end
