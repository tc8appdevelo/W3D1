class Array

    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end
    end

    def my_select(&prc)
        array_new = []
        self.my_each do |ele|
            if prc.call(ele)
                array_new << ele
            end
        end
    array_new
    end

    def my_reject(&prc)
        array_new = []
        self.my_each do |ele|
            if !prc.call(ele)
                array_new << ele
            end
        end
    array_new
    end

    def my_any?(&prc)
        self.my_each do |ele|
            if prc.call(ele)
                return true
            end
        end
        return false
    end

    def my_all?(&prc)
        self.my_each do |ele|
            if !prc.call(ele)
                return false
            end
        end
    return true
    end

    def my_flatten
        result = []
        self.my_each do |ele|
            if ele.class != Array
                result += [ele]
            else
                result += ele.my_flatten
            end
            
        end
        return result
    end

    def my_zip(*arrays)
        new_array = [self]
        arrays.each do |arr|
            new_array << arr
        end
        max = new_array.max_by(&:length).length
        final_array = Array.new(new_array.length) {Array.new(max)}
        new_array.each_with_index do |array_1, idx_1|
            (0...new_array[0].length).each do |idx_2|
                final_array[idx_1][idx_2] = new_array[idx_2][idx_1]
            end
        end
    final_array
    end

    def my_rotate(num=1)
        new_array = []
        new_array.replace(self)
        #new_array 
        if num > 0
            num.times do 
                new_array.push(new_array.shift)
            end
            #return new_array
        else
            (num.abs).times do
                new_array.unshift(new_array.pop)
            end
            #return new_array
        end
       new_array
    end

    def my_join(separator="")
        new_string = ""
        self.each_with_index do |ele, i|
            if i != (self.length-1)
                new_string += ele.to_s + separator
            else
                new_string += ele.to_s
            end
        end
        new_string
    end

    def my_reverse
        new_array = []
        i = self.length-1
        while i >= 0
            new_array << self[i]
        i -= 1
        end
        new_array
    end

end


a = [1, 2, 3, 4, 5]
b = [4, 5]
c = [7, 8, 9]

arr = ["a", "b", "c"]

p arr.my_reverse
