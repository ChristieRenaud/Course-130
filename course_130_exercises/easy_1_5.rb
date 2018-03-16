#input: a string
#output: a string that has been modified by applyng an algorithym which converts each letter into a number, adds
# 13 to that number and then converts the number back to a letter. Spaces stay the same.
# requirements: A hash that has a letter for the key, and a corresponding number (1-26) for the value

# approach:
# iterate through each letter in the name, convert to a number using lookup hash.
# add 13 to each number, and return the number modulo 26.
# covert back to a letter using the lookup hash.
# save new letter to an array or transform by splitting and selecting
# join letters to form name
# split on white space, capitalize and join with a space

LETTER_TO_NUMBER = {"A"=>1, "B"=>2, "C"=>3, "D"=>4, "E"=>5, "F"=>6, "G"=>7, "H"=> 8,
                    "I"=>9, "J"=>10, "K"=>11, "L"=>12, "M"=>13, "N"=>14, "O"=>15, "P"=> 16,
                    "Q"=>17, "R"=>18, "S"=>19, "T"=>20, "U"=>21, "V"=>22, "W"=>23, "X"=> 24,
                    "Y"=>25, "Z"=>26, " "=>" ", "-"=>"-",
                    "a"=>-1, "b"=>-2, "c"=>-3, "d"=>-4, "e"=>-5, "f"=>-6, "g"=>-7, "h"=> -8,
                    "i"=>-9, "j"=>-10, "k"=>-11, "l"=>-12, "m"=>-13, "n"=>-14, "o"=>-15, "p"=>-16,
                    "q"=>-17, "r"=>-18, "s"=>-19, "t"=>-20, "u"=>-21, "v"=>-22, "w"=>-23, "x"=>-24,
                    "y"=>-25, "z"=>-26,}

def decode(name)
  name_array = name.chars.map { |letter| LETTER_TO_NUMBER[letter] }
  name_array.map! do |num| 
    if [" ", "-"].include?(num)
      num
    elsif num > 0
      (num + 13) % 26
    else
      (num - 13).remainder(26)
    end
  end

  name_array.map! { |num| LETTER_TO_NUMBER.key(num) }

  name_array.join
end

#examples:

p decode("Nqn Ybirynpr")
p decode("Tenpr Ubccre")
p decode("Gvz Orearef-Yrr")
p decode("Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv")

names = "Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unvog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu"
p names_array = names.split(/\n/)
# puts names_array.map!{ |name| "#{decode(name)}\n" }.join
p decode(*names_array)