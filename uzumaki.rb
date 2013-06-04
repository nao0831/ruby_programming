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
def below_number t
  o = 99.step(0,-2){|s|break 1 if t==1;break s if ((s-2)**2+1..s**2)===t;s<2&&break}
  t+(t==1? 3:
#     99.step(0,-2){|s|
#       break 1 if(s**2+1..s**2+s)===t
#       break o**2+3-(o-2)**2 if(s**2+s+1..s**2+s+s+2)===t
#       break -1 if(s**2-s+3-s..s**2-s+1)===t
#       break -o**2+(o-2)**2+1 if s<2
#     })
    (99.step(0,-2).map{|s|
      next (s**2+1..s**2+s)===t ?1:
        (s**2+s+1..s**2+s+s+2)===t ?o**2+3-(o-2)**2:
        (s**2-s+3-s..s**2-s+1)===t ?-1:
        s<2 ?-o**2+(o-2)**2+1:0
    }-[0]).first)
end

n=gets.to_i
r=[(n**2-n+1..n**2).to_a]
n.times{|i|
  i!=0&&r<<r[i-1].map{|t|below_number t}
  puts r[i].map{|w|sprintf "%##{(n**2).to_s.size}d",w}*" "
}


