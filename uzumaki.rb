N=99
def is1(target, s = N)
  s<0 ? false : ((s**2)+1..(s**2)+s).include?(target) ? true : is1(target, s-2)
end

def is2(target, s = N)
  s<0 ? false : ((s**2)+s+1..s**2+s+s+2).include?(target) ? true : is2(target, s-2)
end

def is3(target, s = N)
  s<0 ? false : (s**2-s+3-s..s**2-s+1).include?(target) ? true : is3(target, s-2)
end

def is4(target, s = N)
  !is1(target, s) and !is2(target, s) and !is3(target, s)
end

def of(target, s = N)
  target == 1 ? 1 : ((s-2)**2+1..s**2).include?(target) ? s : of(target, s - 2)
end

def below_number t
  o=of t
  t+(t==1? 3:
    (is1 t)? 1:
    (is2 t)? o**2+3-(o-2)**2:
    (is3 t)? -1:
    -o**2+(o-2)**2+1)
end

n=gets.to_i
r=[(n**2 - n + 1..n**2).to_a]
(n-1).times{|i|r<<r[i].map{|v|below_number v}}
r.each{|v| puts v.map{|w|sprintf "%##{(n**2).to_s.size}d",w}*" "}
