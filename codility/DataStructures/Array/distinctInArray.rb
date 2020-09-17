# Big O(n log n) or O(n)
def solution(a)
    unless a.count == 0
        return 1 if a.count == 1
        a.uniq! if a.count != a.uniq! 
        return a.count
    end
   return 0
end


a = [1,2,2,3,4,5,6,6,5,4,3,2,1,2]
solution(a)