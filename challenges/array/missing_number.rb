# frozen_string_literal: true

# NOTE: https://www.hackerrank.com/challenges/missing-numbers/problem?isFullScreen=true
# 
def missing_numbers(arr, brr)
  arr_store = {}
  brr_store = {}

  arr.each do |number|
    arr_store[number] ||= 0
    arr_store[number]  += 1
  end

  brr.each do |number|
    brr_store[number] ||= 0
    brr_store[number]  += 1
  end
  
  diffs = []

  brr_store.each do |number, appears|
    if !arr_store.key?(number) || arr_store[number] != appears
      diffs << number
    end        
  end

  diffs.sort
end

arr = [203, 204, 205, 206, 207, 208, 203, 204, 205, 206]
brr = [203, 204, 204, 205, 206, 207, 205, 208, 203, 206, 205, 206, 204]

missing_numbers(arr, brr)
