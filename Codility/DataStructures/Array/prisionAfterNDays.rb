def prison_after_n_days(cells, n)
    daysLeft = 1
    
    while daysLeft <= n
        n = n % cells.count
        cells = calculate(cells, n)
        daysLeft += 1
    end
    
    return cells
end

def calculate(cells, n) 
    nextState = Array.new(0)
    p0 = 0
    pleft = p0 - 1
    pright = p0 + 1
    
    i = 0
    
    while i <= cells.count - 1
        if p0 == 0
            nextState[p0] = 0
        elsif pright >= cells.count
            nextState[p0] = 0
        elsif cells[pleft] != cells[pright]
            nextState[p0] = 0
        elsif cells[pleft] == cells[pright]
            nextState[p0] = 1
        end
        p0 += 1
        pleft = p0 - 1
        pright = p0 + 1
        
        i += 1 
    end
    cells = nextState  
    return cells
end