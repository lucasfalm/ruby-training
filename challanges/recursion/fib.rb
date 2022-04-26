# frozen_string_literal: true

def fib(n)
  if n >= 3
    return fib(n - 1) + fib(n - 2)
  else
    return 1
  end

  result
end
