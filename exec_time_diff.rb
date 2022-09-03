def my_min_1(arr)
    arr.each do |ele|
        if arr.all? do |ele2|
            ele2 >= ele
            end
            return ele
        end
    end
end
# O(n^2)   

    
# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min_1(list)  # =>  -5

def my_min_2(arr)
    min = 0
    i = 0
    while i < arr.length
        min = arr[i] if arr[i] < min
        i += 1
    end
    return min
end
# O(n)

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min_2(list)


def largest_contiguous_subsum1(list)
    output = []
    (0...list.length).each do |i|
        (0...list.length).each do |j|
            if j > i 
                output << list[i..j]
            end 
        end 
    end
    output.sort{|a,b| a.sum - b.sum}[-1].sum 
end 

# list = [5, 3, -7]
# p largest_contiguous_subsum1(list) # => 8

# As we can see that we are keeping a running sum of integers and when it becomes less than 0, we reset it to 0 (Greedy Part). This is because continuing with a negative sum is way worse than restarting with a new range.

def largest_contiguous_subsum2(list)
    current_subarr_sum = list[0]
    max = list[0]
    (1...list.length).each do |i|
        if current_subarr_sum < 0  # chechk if the current sum  < 0
            current_subarr_sum = 0
        end
        current_subarr_sum += list[i]

        if max < current_subarr_sum
            max = current_subarr_sum
        end
    end
    max
end 



list = [5, 3, -7]
p largest_contiguous_subsum2(list) # => 8

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum2(list) # => 8 (from [7, -6, 7])

list = [-5, -1, -3]
p largest_contiguous_subsum2(list) # => -1 (from [-1])