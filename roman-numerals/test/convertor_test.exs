defmodule ConvertorTest do
  use ExUnit.Case

  @test_cases [
    %{input: 1, expected: "I"},
    %{input: 3, expected: "III"},
    %{input: 4, expected: "IV"},
    %{input: 5, expected: "V"},
    %{input: 9, expected: "IX"},
    %{input: 10, expected: "X"},
    %{input: 11, expected: "XI"},
    %{input: 13, expected: "XIII"},
    %{input: 14, expected: "XIV"},
    %{input: 19, expected: "XIX"},
    %{input: 20, expected: "XX"},
    %{input: 39, expected: "XXXIX"},
    %{input: 40, expected: "XL"},
    %{input: 84, expected: "LXXXIV"},
    %{input: 89, expected: "LXXXIX"},
    %{input: 90, expected: "XC"},
    %{input: 99, expected: "XCIX"},
    %{input: 899, expected: "DCCCXCIX"},
    %{input: 900, expected: "CM"},
    %{input: 999, expected: "CMXCIX"},
    %{input: 1000, expected: "M"},
    %{input: 1499, expected: "MCDXCIX"},
    %{input: 2899, expected: "MMDCCCXCIX"},
    %{input: 2999, expected: "MMCMXCIX"},
    %{input: 3001, expected: "MMMI"},
    %{input: 3999, expected: "MMMCMXCIX"},
    %{input: 4000, expected: "MMMM"},
  ]

  test "Converts Arabic numbers from 1 to 4000 to Roman Numerals" do
    Enum.each(@test_cases, fn(t) ->
      IO.inspect("Convert #{t.input} to #{t.expected}")
      assert Convertor.convert(t.input) == t.expected
    end)
  end

end
