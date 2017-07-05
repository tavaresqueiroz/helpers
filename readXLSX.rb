require 'rubyXL'

fileName = ARGV[0]
prefix = ARGV[1]
colum = ARGV[2]
country = ARGV[3]
sheet = ARGV[4]

workbook = RubyXL::Parser.parse(fileName)
worksheet = workbook.worksheets[sheet.to_i]

goon = true
index = 1

my_file = File.new("capaddresse_"+ country +".properties", "a")

while goon
    if worksheet[index] && worksheet[index][colum.to_i]
        errornumber = worksheet[index][0]
        cell = worksheet[index][colum.to_i]
        my_file.write(prefix + "." + errornumber.value.to_s + "=" + cell.value + "\n")
    else
        goon = false
    end
    index += 1
end