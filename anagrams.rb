def first_anagram?(str1, str2)
    arr1 = str1.split("").permutation.to_a
    arr2 = str2.split("")
    arr1.include?(arr2)
end
#O(n!)

p first_anagram?("gizmo", "sally")    #=> false
p first_anagram?("elvis", "lives")

def second_anagram?(str1, str2)
 
    str1.each_char do |char|
        if !str2.include?(char)
            return false
        end
        str2.slice!(str2.index(char))
    end

    str2.empty?
end
#O(n^2)

p second_anagram?("gizmo", "sally")    #=> false
p second_anagram?("elvis", "lives")


def third_anagram?(str1, str2)
    str1.split("").sort == str2.split("").sort
end
#O (log n)

p third_anagram?("gizmo", "sally")    #=> false
p third_anagram?("elvis", "lives")

def fourth_anagram?(str1, str2)
    h1 = Hash.new(0)
    h2 = Hash.new(0)

    str1.each_char {|char| h1[char] += 1}
    str2.each_char {|char| h2[char] += 1}

    h1 == h2
end
#O(n)

p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")