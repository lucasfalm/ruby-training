def validTime(time)
    aT = time.split('')
    h = (aT[0] + aT[1]).to_i
    m = (aT[3] + aT[4]).to_i
    
    return false if h > 23 || h < 0
    return false if m > 59 || m < 0
    
    return true
end