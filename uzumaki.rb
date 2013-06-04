# 1

# 7 8 9
# 6 1 2
# 5 4 3

# 21 22 23 24 25
# 20  7  8  9 10
# 19  6  1  2 11
# 18  5  4  3 12
# 17 16 15 14 13

# 43 44 45 46 47 48 49
# 42 21 22 23 24 25 26
# 41 20  7  8  9 10 27
# 40 19  6  1  2 11 28
# 39 18  5  4  3 12 29
# 38 17 16 15 14 13 30
# 37 36 35 34 33 32 31
#
# 43 44 45 46 47 48 49
# 42 21 22 23 24 25 26
# 41 20          10 27
# 40 19          11 28
# 39 18          12 29
# 38 17 16 15 14 13 30
# 37 36 35 34 33 32 31
# 1. 下には+1の数字があるゾーン
#     2,   10, 11, 12,   26, 27, 28, 29, 30
# 2. 下には一週回った数字があるゾーン
#     3, 4, 5,   13, 14, 15, 16, 17
#     14 15 16   32  33  34  35  36
#     3 -> 11      5 -> 19
#     9 - 3 + 3 + 2     25 - 13 + 5 + 2
# 3. 下には-1の数字があるゾーン
#     6, 7,   18, 19, 20, 21,    38, 39, 40, 41, 42, 43
# 4. 下には一周戻った数字があるゾーン
#     8, 9,   22, 23, 24, 25,    44, 45, 46, 47, 48, 49
#     1  2     7   8   9  10     21  22  23  24  25  26
#     3 -> 7      5 -> 15            7 -> 23
#              22 - 9 + 3 - 1        44 - 25 + 5 - 1


def is1(target, s = n)
  s<0 ? false : ((s**2)+1..(s**2)+s).include?(target) ? true : is1(target, s-2)
end

def is2(target, s = n)
  s<0 ? false : ((s**2)+s+1..s**2+s+s+2).include?(target) ? true : is2(target, s-2)
end

def is3(target, s = n)
  s<0 ? false : (s**2-s+3-s..s**2-s+1).include?(target) ? true : is3(target, s-2)
end

def is4(target, s = n)
  !is1(target, s) and !is2(target, s) and !is3(target, s)
end

def of(target, s = n)
  target == 1 ? 1 : ((s-2)**2+1..s**2).include?(target) ? s : of(target, s - 2)
end

def below_number(target, n)
  if target == 1
    4
  elsif is1 target, n
    target+1
  elsif is2 target, n
    o = of(target, n)
    target + o**2 + o + 2 - ((o-2)**2+o-2+1)
  elsif is3 target, n
    target-1
  else
    o = of(target, n)
    target - ((o)**2-o+2 -(o-2)**2 +o-2 - 1)
  end
end

n= gets.to_i
r=(n**2 - n + 1..n**2).to_a
(n-1).times{|i|r<<r[i].map{|v|below_number v,n}}
r.each{|v| puts v.map{|w|sprintf "%##{(n**2).to_s.size}d",w}*" "}
