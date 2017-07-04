require 'rubyXL'

fileName = ARGV[0]
sheet = ARGV[1]
prefix = ARGV[2]
colum = ARGV[3]
country = ARGV[4]

workbook = RubyXL::Parser.parse(fileName)
worksheet = workbook.worksheets[sheet.to_i]

goon = true
index = 1

my_file = File.new("properties_"+ country +".txt", "w+")

while goon
    if worksheet[index][colum.to_i]
        cell = worksheet[index][colum.to_i]
        my_file.write(prefix + "." + index.to_s + "=" + cell.value + "\n")
    else
        goon = false
    end
    index += 1
end