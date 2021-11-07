def find_median_sorted_arrays(nums1, nums2)
    sum1 = 0
    sum2 = 0 
    
    nums1.each do |v|
        sum1 += v 
    end
    
    nums2.each do |v|
        sum2 += v 
    end
    
    med1 = (sum1 / (nums1.count)).round
    med2 = (sum2 / (nums2.count)).round
    med = ((med1 + med2) / 2).to_f
    med
end