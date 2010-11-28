#!ruby
require 'yaml'

### Constants
debug = false
tableName = "anthy2gji.yml"

### Import HINSHI table
begin
  yaml = YAML::load_file( tableName )
rescue
  STDERR .print "!! Cannot load #{tableName}!!"
  exit -1
end

#STDERR .print yaml
#p yaml['hinsi']
#exit

### Convert dictionary
while line = gets
  line.chomp

  if line =~ /^#/ then
    # skip comment lines.
    result = nil
  elsif line =~ /^([^ ]*) +#([^*]+)\*([0-9]+) +(.*)$/
    # $1    $2    $3    $4
    # Yomi #Hinsi*Hindo Tango
    hinsi = yaml['hinsi'][$2]
    if hinsi .nil? then
      # Use DEFAULT if hinsi don't defined in YAML.
      STDERR .puts "Waning: #{$2} was falled back to DEFAULT."
      hinsi = yaml['default'] 
    end
    STDERR .puts "#{$2} | #{yaml['hinsi'][$2]} #{hinsi}" if debug

    result = $1 + "\t"
    # No needs to escape spaces in word (Google IME).
    #	result = result + $4.gsub(/ /, "\\ ") + "\t"
    result = result + $4 + "\t"
    result = result + "#{hinsi}" + "\t"
  else
    # Invalid entry
    STDERR .puts "!! #{line}"
    result = nil
  end

  # No needs to convert.  Google IME can recognize EUC/SJIS/UTF-8.
  puts "#{result}" if result
end
