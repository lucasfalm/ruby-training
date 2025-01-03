def func_any(hash)
  hash.keys.any? { |k| k.class == Integer }
end

def func_all(hash)
  hash.values.all? { |k| k.class == Integer && k < 10 }
end

def func_none(hash)
  hash.values.none?(&:nil?)
end

def func_find(hash)
  hash.each do |key, value|
    if key.class == Integer && value.class == Integer && value < 20
        return { key => value }
    elsif key.class == String && value.class == String && value.split("").first == "a"
        return { key => value }
    end
  end
end
