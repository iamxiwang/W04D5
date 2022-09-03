def windowed_max_range1(arr, window_size)
    current_max_range = 0
    min_val = 0
    max_val = 0
    arr.each_with_index do |num, i|
        break if i + window_size > arr.length
        max_val = arr[i...i+window_size].max
        min_val = arr[i...i+window_size].min
        current_max_range = (max_val - min_val).abs  if (max_val - min_val).abs > current_max_range 
    end
    current_max_range
end 

p windowed_max_range1([1, 0, 2, 5, 4, 8], 2) # 4
p windowed_max_range1([1, 0, 2, 5, 4, 8], 3) # 5
p windowed_max_range1([1, 0, 2, 5, 4, 8], 4) # 6
p windowed_max_range1([1, 3, 2, 5, 4, 8], 5) # 6

class MyQueue
    def initialize 
        @store = []
    end 

    def peek 
        @store[0]
    end 

    def size 
        @store.length 
    end 

    def empty?
        @store.empty?
    end 

    def enqueue
        @store.push
    end 

    def dequeue
        @store.shift
    end 
end 

class MyStack
    def initialize
        @store = []
    end 

    def peek 
        @store[-1]
    end
    
    def size 
        @store.length 
    end 
    
    def empty?
        @store.empty?
    end

    def pop
        @store.pop
    end 

    def push 
        @store.push 
    end 
end

class StackQueue 

    def initialize
        @store = MyStack.new
    end 

    def size
        @store.length
    end

    def empty?
        @store.all? {&:empty?} && @store.empty?
    end 

    def enqueue 
        @store.push
    end 

    def dequeue 
        @store.shift #stopped here don't know if stackQueue is right
    end 
end 