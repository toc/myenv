#!perl -w

### Usage: anthy-dic-tool --dump | perl readdict.pl > <dictfile>

use strict;

### 辞書の入力は EUC-JP であることを仮定.
### 変換後の出力も EUC-JP でなければならないので、
### 本 script 中では文字コード変換を実施しない.
### ※ 内部処理用(特に文字列処理 - 正規表現)のために
###    一旦 UTF-8 に変換する必要あり？

#use Text::Iconv;
#my($converter) = Text::Iconv->new("euc-jp", "utf-8");
#$converted = $converter->convert("Text to convert");


my($key, $num) = ('', 0);
my(%yomi, %hindo, %desc);

while (<>) {
  chomp;
  next if /^#/;

  if (/^$/) {
    # reset $key entry.
    $key = '';
    next;
  }

  #;; Maybe new entry

  if ( $key ) {
    # Add description to entry $key.
    $desc{$key} .= "$_\n";
    next;
  }

  # Must be new entry.
  #;;; format error
#  next unless /^([^[:space:]]+)[:space:]+([:digit:]+)[:space:]+(.+)$/;
#  next unless $_ =~ /^([^[:space:]]+)[:space:]+([:digit:]+)[:space:]+(.+)$/;
  next unless /^(.+)\s+(\d+)\s+(.+)$/;

  $key = $3;
  $num += 1;
  $yomi{$key} = []
    if !defined($yomi{$key});
#  my($yomi) = tr($1,/a-z/A-Z/);  # 半角英字は大文字に正規化
  push(@{$yomi{$key}},$1);
  $hindo{$key} = $2;
  $desc{$key} = "";
}

print "#---result---.\n";
print "# Total: $num entries ->" . keys(%desc) . " enntries\n";


my(@keys) = sort(keys(%hindo));
#print @keys;
while (@keys){
  my($i) = shift @keys;

#   my(@yomis) = @{$yomi{$i}};
#   while (@yomis) {
#     my($j) = shift @yomis;
#     if ( $j =~ /a-z/i ) {
#       $j =~ tr/a-zA-Z/A-Za-z/;
#       push( @{$yomi{$i}}, $j);
#     }
#   }

  print "$hindo{$i} $i\n";
  print "# " . ( $#{$yomi{$i}} + 1 ) . " entries. \n";
  print join(' ', sort(@{$yomi{$i}})) . "\n";
  print "$desc{$i}";
  print "\n";
}


