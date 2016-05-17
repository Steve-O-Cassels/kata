defmodule ConvertorOld do
# http://blogs.transparent.com/latin/one-to-a-million-in-latin-and-roman-numerals/
  @numerals_map [
    M: 1000,
    D: 500,
    C: 100,
    L: 50,
    X: 10,
    V: 5,
    I: 1
  ]

  @arabic_to_roman_map %{
    "1000" => :M,
    "500" => :D,
    "100" => :C,
    "50" => :L,
    "10" => :X,
    "5" => :V,
    "1" => :I
  }

  # @spec
  def convert(number) when number == 1, do: "I"
  def convert(number) do
    acc = ""
    arabic_numbers = Keyword.values(@numerals_map)
    build_roman_numerals(arabic_numbers, @arabic_to_roman_map, number, acc)
  end
  def build_roman_numerals(_, _, number, acc) when number == 40, do: acc <> "XL"
  def build_roman_numerals(_, _, number, acc) when number == 9, do: acc <> "IX"
  def build_roman_numerals(_, _, number, acc) when number == 4, do: acc <> "IV"
  def build_roman_numerals(_, _, number, acc)  when number == 0, do: acc
  def build_roman_numerals([arabic | rest_arabic], arabic_to_roman_map, number, acc) do
      roman = Map.get(arabic_to_roman_map, to_string(arabic))
      bler = Enum.at(rest_arabic, 1)
      IO.inspect ~s|is99arabic(#{arabic}) and bler(#{bler}) and number(#{number})|
      cond do
        number < arabic  ->
          build_roman_numerals(rest_arabic, arabic_to_roman_map, number, acc)
        number >= arabic - Enum.at(rest_arabic, 1) ->
          IO.inspect ~s|is99arabic(#{arabic}) <= number(#{number})|
        arabic <= number ->
          IO.inspect ~s|arabic(#{arabic}) <= number(#{number})|
          repeat_count = div(number, arabic)
          accumulate = ""
          next = 0
          # if repeat_count == 4 do
          #     next_roman = Map.get(arabic_to_roman_map, )
          #     IO.inspect ~s|next_roman(#{next_roman})|
          #     accumulate = acc <> to_string(roman) <> to_string(next_roman)
          #     IO.inspect ~s|accumulate(#{accumulate})|
          # else
          IO.inspect ~s|repeat_count(#{repeat_count})|
          IO.inspect ~s|rem(#{rem(number, arabic)})|
          next = number - (arabic * repeat_count)
          IO.inspect ~s|next(#{next})|
          accumulate = acc <> String.duplicate(to_string(roman), repeat_count)
          IO.inspect accumulate
          # end
          build_roman_numerals(rest_arabic, arabic_to_roman_map, next, accumulate)
      true ->
        acc
      end
  end

  # def build_roman_numerals([arabic | rest_arabic], [roman | rest_roman], number, acc) do
  #     cond do
  #       arabic > number ->
  #         build_roman_numerals(rest_arabic, rest_roman, number, acc)
  #       arabic <= number ->
  #         IO.inspect ~s|arabic(#{arabic}) <= number(#{number})|
  #         repeat_count = div(number, arabic)
  #         accumulate = ""
  #         next = 0
  #         if repeat_count > 3 do
  #             next_roman = List.first(rest_roman)
  #             IO.inspect ~s|next_roman(#{next_roman})|
  #             accumulate = acc <> to_string(roman) <> to_string(next_roman)
  #             IO.inspect ~s|accumulate(#{accumulate})|
  #         else
  #         IO.inspect ~s|repeat_count(#{repeat_count})|
  #         IO.inspect ~s|rem(#{rem(number, arabic)})|
  #         next = number - (arabic * repeat_count)
  #         IO.inspect ~s|next(#{next})|
  #         accumulate = acc <> String.duplicate(to_string(roman), repeat_count)
  #         IO.inspect accumulate
  #         end
  #         build_roman_numerals(rest_arabic, rest_roman, next, accumulate)
  #     true ->
  #       acc
  #     end
  # end
  #   acc
  # end

    # if greater than map
      # recurse
    # if not greater
      # divide by current arabic into amount
      # subtract amount from number
      # append amount * current arabic into accumulator
      # recurse with remainder
end
