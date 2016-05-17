defmodule ConvertorTest do
  use ExUnit.Case


  test "Convert 1 to I" do
    expected = "I"
    assert Convertor.convert(1) == expected
  end

  test "convert 3 to III" do
    expected = "III"
    assert Convertor.convert(3) == expected
  end

  test "convert 4 to IV" do
    expected = "IV"
    assert Convertor.convert(4) == expected
  end

  test "Convert 5 to V" do
    expected = "V"
    assert Convertor.convert(5) == expected
  end

  test "convert 9 to IX" do
    expected = "IX"
    assert Convertor.convert(9) == expected
  end

  test "Convert 10 to X" do
    expected = "X"
    assert Convertor.convert(10) == expected
  end

  test "Convert 11 to XI" do
    expected = "XI"
    assert Convertor.convert(11) == expected
  end

  test "Convert 13 to XIII" do
    expected = "XIII"
    assert Convertor.convert(13) == expected
  end

  test "Convert 84 to LXXXIV" do
    expected = "LXXXIV"
    assert Convertor.convert(84) == expected
  end

  test "Convert 89 to LXXXIX" do
    expected = "LXXXIX"
    assert Convertor.convert(89) == expected
  end

  test "Convert 90 to XC" do
    expected = "XC"
    assert Convertor.convert(90) == expected
  end

  test "Convert 99 to XCIX" do
    expected = "XCIX"
    assert Convertor.convert(99) == expected
  end

  test "convert 900 to CM" do
    expected = "CM"
    assert Convertor.convert(900) == expected
  end

  test "convert 999 to CMXCIX" do
    expected = "CMXCIX"
    assert Convertor.convert(999) == expected
  end

  test "convert 899 to DCCCXCIX" do
    expected = "DCCCXCIX"
    assert Convertor.convert(899) == expected
  end

  test "Convert 40 to XL" do
    expected = "XL"
    assert Convertor.convert(40) == expected
  end

end
