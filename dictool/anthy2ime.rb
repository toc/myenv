#!ruby
require 'yaml'
require 'nkf'

begin
  yaml = YAML::load_file('anthy2ime.yml')
rescue
  STDERR .print '!! Cannot load anthy2ime.yaml!!'
end

#STDERR .print yaml
#p yaml['hinsi']
#exit

while line = gets
  # assume input string was encoded as UTF-8.
  line.chomp

  if line =~ /^#/ then
    reuslt = "!#{line}"
  elsif line =~ /^([^ ]*) +#([^*]+)\*([0-9]+) +(.*)$/
    # $1    $2    $3    $4
    # Yomi #Hinsi*Hindo Tango
    #STDERR .puts "#{$2} | #{yaml['hinsi'][$2]}"
    #exit
    hinsi = yaml['hinsi'][$2]
    if hinsi .nil? then
      STDERR .puts "Waning: #{$2} was falled back to DEFAULT."
      hinsi = yaml['default'] 
    end
    #STDERR .puts "#{hinsi}"

    result = $1 + "\t"
    result = result + $4.gsub(/ /, "\\ ")
    result = result + "\t#{hinsi}"
  else
    # Invalid entry
    STDERR .puts NKF.nkf("-Ue","!! #{line}")
    relust = ''
  end
  puts NKF.nkf("-Us", "#{result}") if result
end
