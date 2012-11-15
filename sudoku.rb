require 'pp'

class Sudoku

    attr_accessor :sudoku_arr

    def initialize
        @sudoku_str = <<EOS
005300000
800000020
070010500
400005300
010070006
003200080
060500009
004000030
000009700
EOS
        @sudoku_arr_tmp = @sudoku_str.split("\n")
        @sudoku_arr = []
        @sudoku_arr_tmp.each do |str|
            @sudoku_arr << str.split("")
        end
    end

    def solve2
        solve(@sudoku_arr)
    end

    def solve(sudoku)
        f = first_zero(sudoku)
#         pp "solve"
#         pp sudoku
        if f == true
            pp sudoku
            exit
        end
        1.step(9, 1) do |i|
            sudoku[f[0]][f[1]] = i.to_s
            if is_correct(sudoku)
                new_sudoku = Marshal.load(Marshal.dump(sudoku))
                solve(new_sudoku)
            end
        end
    end

    #左上から右に走査して最初の0の位置
    def first_zero(sudoku)
        sudoku.each_with_index do |yoko, y|
            yoko.each_with_index do |moji, x|
                return [y, x] if moji == "0"
            end
        end
        true
    end

    #数独的に間違っていたらfalse そうでないならtrue
    def is_correct(sudoku)
        0.step(9 - 1, 1) do |y|
            return false if !is_correct_yoko(sudoku, y)
        end
        0.step(9 - 1, 1) do |x|
            return false if !is_correct_tate(sudoku, x)
        end
        0.step(3 - 1, 1) do |y|
            0.step(3 - 1, 1) do |x|
                return false if !is_correct_box(sudoku, y, x)
            end
        end
        true
    end

    def is_correct_yoko(sudoku, y)
        su2 = sudoku[y].reject {|s| s == "0"}
        su2.length == su2.uniq.length
    end

    def is_correct_tate(sudoku, x)
        tate_arr = []
        sudoku.each {|yoko| tate_arr << yoko[x] if yoko[x] != "0"}
        tate_arr.length == tate_arr.uniq.length
    end

    def is_correct_box(sudoku, y, x)
        tate_area = box_arr(y)
        yoko_area = box_arr(x)
        tmp_arr = []
        tate_area.each do |yy|
            yoko_area.each do |xx|
                tmp_arr << sudoku[yy][xx] if sudoku[yy][xx] != "0"
            end
        end
        tmp_arr.length == tmp_arr.uniq.length
    end

    #0~2
    def box_arr(number)
        ((number) * 3 )..(number*3 + 2)
    end

    def get_sudoku_arr
        @sudoku_arr
    end
end

# Sudoku.new.solve2

def aaa
    p "n"
end
