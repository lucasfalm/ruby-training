def arrayMaxConsecutiveSum2(inputArray)
    max_so_far_evaluated = 0
    max_for_each_iteration = 0
        inputArray.each do |element|
            max_for_each_iteration = max_for_each_iteration + element
            if(max_for_each_iteration < 0)
                max_for_each_iteration = 0
            end
            if(max_so_far_evaluated < max_for_each_iteration)
                max_so_far_evaluated = max_for_each_iteration
            end
        end

    return -1 if max_so_far_evaluated == 0
    max_so_far_evaluated
end