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

end


arr = [1, 2, 3]
p arr.my_reject { |num| num > 1 }
p arr.my_reject { |num| num == 4 }