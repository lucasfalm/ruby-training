
def solution(a)
 unless a.count == 0 
   a.sort!
   last = a.first
   ok = 1
   notOk = 0
   
   return 0 if a.count == 1 && a.first == 1
   return 1 if a.count == 2 && a.first > 1 && a.last - a.first >= 2
   return 0 if a.count == 2 && a.first >= 1 && a.last - a.first < 2
   
   a.each do |actual|
      before = last
      last = actual
      
      math =  actual - before
      return notOk if math >= 2 || math <= -2
   end
   return ok
 else
   return 0
 end
end