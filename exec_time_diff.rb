require "byebug"

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


# def largest_contiguous_subsum2(list)
#     current_max = 0
#     max_end = 0
#     (0...list.length).each do |i|
#         max_end = max_end + list[i]
#         if max_end > current_max
#             current_max = max_end
#         else
#             max_end = 0
#         end
#     end
#     current_max
# end 

def largest_contiguous_subsum2(list)
    cs = list[0]
    ms = list[0]

    (1...list.length).each do |j|
        cs += list[j]
        if cs > ms 
            ms = cs 
        elsif cs < 0
            cs = 0 
        end 
    end 
    return list.max if ms < 0 
    ms
end


list = [5, 3, -7]
p largest_contiguous_subsum2(list) # => 8

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum2(list) # => 8 (from [7, -6, 7])

list = [-5, -1, -3]
p largest_contiguous_subsum2(list) # => -1 (from [-1])