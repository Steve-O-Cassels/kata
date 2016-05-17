defmodule Convertor do


  @m %{ roman: "M", arabic: 1000 }
  @d %{ roman: "D", arabic: 500 }
  @c %{ roman: "C", arabic: 100 }
  @l %{ roman: "L", arabic: 50 }
  @x %{ roman: "X", arabic: 10 }
  @v %{ roman: "V", arabic: 5 }
  @i %{ roman: "I", arabic: 1 }
  @numerals [@m, @d, @c, @l, @x, @v, @i]

  def convert(number) do
    acc = ""
    numerals(@numerals, number, acc)
  end

  def numerals([], 0, acc) do acc end
  def numerals([numeral | rest_numerals], number, acc) do
    repeat_count = div(number, numeral.arabic)
    cond do
      number == 9 ->
        acc = acc <> "IX"
        number = number - 9
      true ->
        acc = acc <> numeral(numeral.roman, numeral.arabic, repeat_count)
        number = next_number(numeral, repeat_count, number)
    end
    numerals(rest_numerals, number, acc)
  end

  def numeral(roman, arabic, repeat_count) when repeat_count == 4 and arabic == 1 do "IV" end
  def numeral(_, _, repeat_count) when repeat_count == 0 do "" end
  def numeral(roman, arabic, repeat_count) when repeat_count > 0 and repeat_count <= 3 do
    String.duplicate(roman, repeat_count)
  end

  def next_number(_, repeat_count, number) when repeat_count == 0 do number end
  def next_number(numeral, repeat_count, number) when repeat_count == 4 do
     number - (numeral.arabic * repeat_count)
  end
  def next_number(numeral, repeat_count, number) when repeat_count > 0 and repeat_count <= 3 do
    number - (numeral.arabic * repeat_count)
  end

end