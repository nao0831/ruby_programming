require 'pp'

def search(yy, xx, is_checked, puyo_arr)
    number = 0
    is_checked[yy][xx] = true
    self_color = puyo_arr[yy][xx]
    if yy != 0 and is_checked[yy - 1][xx] == false
        if self_color == puyo_arr[yy - 1][xx]
            number = number + search(yy - 1, xx, is_checked, puyo_arr)
        end
    end
    if xx != 0 and is_checked[yy][xx - 1] == false
        if self_color == puyo_arr[yy][xx - 1]
            number = number + search(yy, xx - 1, is_checked, puyo_arr)
        end
    end
    if yy != puyo_arr.length - 1 and is_checked[yy + 1][xx] == false
        if self_color == puyo_arr[yy + 1][xx]
            number = number + search(yy + 1, xx, is_checked, puyo_arr)
        end
    end
    if xx != puyo_arr[0].length - 1 and is_checked[yy][xx + 1] == false
        if self_color == puyo_arr[yy][xx + 1]
            number = number + search(yy, xx + 1, is_checked, puyo_arr )
        end
    end
    puyo_arr[yy][xx] = "k"
    number + 1
end



def puyopuyo(puyo_arr)
    puyo_old = Marshal.load(Marshal.dump(puyo_arr))
    pp puyo_arr

    is_checked = Array.new(puyo_arr.length).map!{Array.new(puyo_arr[0].length, false)}

    0.step(is_checked.length - 1, 1) do |yy|
        0.step(is_checked[yy].length - 1, 1) do |xx|
            if puyo_arr[yy][xx] == " " || puyo_arr[yy][xx] == "h"
                is_checked[yy][xx] = true
            else
                number = search yy, xx, is_checked, puyo_arr
                puyo_arr.each_with_index do |yoko, i|
                    yoko.each_with_index do |moji, j|
                        if number > 3
                            puyo_arr[i][j] = "h" if puyo_arr[i][j] == "k"
                        else
                            puyo_arr[i][j] = puyo_old[i][j] if puyo_arr[i][j] == "k"
                        end
                    end
                end
            end
        end
    end


    end_flag = true
    puyo_arr.each_with_index do |yoko, i|
        yoko.each_with_index do |moji, j|
            if moji == "h"
                i.step(0, -1) do |k|
                    puyo_arr[k][j] = puyo_arr[k - 1][j] if k != 0
                    puyo_arr[k][j] = " " if k == 0
                end
                end_flag = false
            end
        end
    end
    puyopuyo puyo_arr if !end_flag

end

puyo_str = <<EOS
7745564556755676
5574456445677677
5574566456675566
4456745674567457
7557755775577556
4466446644664466
7456745674567457
7567456745674576
7466446644664477
4557755775577556
4567456745674576
7756745674567456
4557755775577557
7766446644664477
4756745674567456
4567456745674567
4766446644664466
7557755775577557
7567456745674567
4456745674567457
7557755775577556
4466446644664466
7456745674567457
7567456745674567
7466446644664466
4557755775577557
4567456745674567
EOS

puyo_arr_tmp = puyo_str.split("\n")
puyo_arr = []
puyo_arr_tmp.each do |str|
    puyo_arr << str.split("")
end

puyopuyo(puyo_arr)

#   GYRR
# RkkGYG
# GkGYRR
# RkGYRG
# YGYRYG
# GYRYRG
# YGYRYR
# YGYRYR
# YRRGRG
# RYGYGG
# GRYGYR
# GRYGYR
# GRYGYR
