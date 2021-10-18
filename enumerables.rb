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
       
        # if self.class != Array
        #     return [self]
        # end
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

end

# def flatten(data)
#     if !data.is_a?(Array) # self
#         return [data] # self
#     end
#     next_arr = []
    
#     data.each do |ele|
#         next_arr += flatten(ele)
#     end

#     next_arr
# end

# arr = [1, 2, 3]
# p arr.my_all? { |num| num > 1 }
# p arr.my_all? { |num| num < 4 }
p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

