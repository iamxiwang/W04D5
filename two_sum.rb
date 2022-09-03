def bad_two_sum?(arr, target_sum)
    (0...arr.length).each do |i|
        (0...arr.length).each do |j|
            if j > i && arr[i] + arr[j] == target_sum
                return true 
            end 
        end 
    end 
    false 
end 
#O(n^2)

def okay_two_sum?(arr, target_sum)
    arr = arr.sort
    arr.each_with_index do |num,i|
        arr2 = arr.dup
        arr2.delete_at(i)
        return true if bsearch(arr2, target_sum - num)
    end
    return false    
end 
# O(n log n)
def bsearch(arr, ele)
    return false if arr.empty?
    mid = arr.length / 2
    return true if arr[mid] == ele
    left = arr[0...mid]
    right = arr[mid+1..-1]
    if ele > arr[mid]
        bsearch(left, ele)
    elsif bsearch(right,ele) != false
        mid + 1 + bsearch(right, ele)
    end
end

def good_two_sum?(arr, target_sum) 
    h = Hash.new {|h,k| h[k] = true}
    arr.each do |ele|
        h[ele]
    end 
    arr.each do |ele|
        h[ele] = false 
        return true if h.has_key?(target_sum - ele) && h[target_sum - ele] == true
    end 
    false         
end
#if there if duplicate elements in the array, hash map?
#O(n)

arr = [0, 1, 5, 5, 7]
p good_two_sum?(arr, 6) # => should be true
p good_two_sum?(arr, 10) # => should be false
