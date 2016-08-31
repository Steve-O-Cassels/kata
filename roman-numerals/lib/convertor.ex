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

  defp numerals([], 0, acc) do acc end
  defp numerals([numeral | rest_numerals], number, acc) do
    cond do
      number == 9 ->
        acc = acc <> "IX"
        number = number - 9
      number >= 90 and number < 100 ->
          acc = acc <> "XC"
          number = number - 90
      number >= 900 and number < 1000 ->
          acc = acc <> "CM"
          number = number - 900
      true ->
        repeat_count = div(number, numeral.arabic)
        acc = acc <> numeral(numeral.roman, numeral.arabic, repeat_count)
        number = next_number(numeral, repeat_count, number)
    end
    numerals(rest_numerals, number, acc)
  end

  defp numeral(_roman, arabic, repeat_count) when repeat_count == 4 and arabic == 1000, do: "MMMM"
  defp numeral(_roman, arabic, repeat_count) when repeat_count == 4 and arabic == 100, do: "CD"
  defp numeral(_roman, arabic, repeat_count) when repeat_count == 4 and arabic == 10, do: "XL"
  defp numeral(_roman, arabic, repeat_count) when repeat_count == 4 and arabic == 1, do: "IV"
  defp numeral(_, _, repeat_count) when repeat_count == 0, do: ""
  defp numeral(roman, _arabic, repeat_count) when repeat_count > 0 and repeat_count <= 3 do
  String.duplicate(roman, repeat_count)
  end

  defp next_number(_, repeat_count, number) when repeat_count == 0, do: number
  defp next_number(numeral, repeat_count, number) when repeat_count > 0 and repeat_count <= 4 do
    number - (numeral.arabic * repeat_count)
  end

end
