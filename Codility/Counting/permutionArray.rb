def solution(a)
  ok = 1
  notOk = 0
  original = a.clone
  
  unless a.count == 0    
      return notOk if a.first <= 0 && a.last <= 0
      a.sort!.uniq!
      return notOk if a.count != original.count 

      if a.count == 1 
          return ok if a.first == 1 && original.count == 1
          return notOk if a.first == 1 && original >= 2
      
          return notOk if a.first != 1  
      elsif a.count == 2 
          math = a.first - a.last
          
          return notOk if math >= 2 || math <= -2
          return notOk if math == 1 && a.first > 1 || a.first < 0
          return ok if math == 1 || math == -1 && a.first == 1
          return notOk if math == 1 || math == -1 && a.first != 1
      else
          return notOk unless a.include?(1)
          last = a.first
          
          a.each do |actual|
              before = last
              last = actual

              next if last == -1 && actual == 1

              math =  actual - before

              return notOk if math >= 2 || math <= -2
          end
          return ok
      end
  else
      return notOk
  end
end