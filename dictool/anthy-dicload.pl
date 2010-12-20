#!perl -w

# Usage: perl registdict.pl <dictfile> | anthy-dic-tool --append

### 辞書の入力は EUC-JP であることを仮定.
### 変換後の出力も EUC-JP でなければならないので、
### 本 script 中では文字コード変換を実施しない.

### NOTE: なお、本 script の文字コードは EUC-JP でなければならない!!!

use strict;
#use Encode;
use Encode::JP::H2Z;

my(%yomi,%hindo,%desc,%seen);
my(@wk);
my($tango, $yomi);



while (<>) {
  chomp;

  next if /^#/;

  if ( $tango ) {
    if ( /^$/ ) {
      # reset
      $tango = '';
      $yomi = '';
      next;
    }
    elsif ( !$yomi ) {
      # よみの分解
      $yomi{$tango} = []
	if !defined($yomi{$tango});

      # 登録されている読みを一意化する。WinAnthy対応として読みの数字は
      # 全角・半角を同一みなしとする。
      @wk = split;
      %seen= ();
      for my $i (@wk) {			  # 半角数字<->全角相互変換含む
	$seen{$i}++;				  # オリジナル
### Google日本語入力では読みに全角数字を許さない
# 	$i =~ s/1/１/g; $i =~ s/2/２/g; $i =~ s/3/３/g; $i =~ s/4/４/g;
# 	$i =~ s/5/５/g; $i =~ s/6/６/g; $i =~ s/7/７/g; $i =~ s/8/８/g;
# 	$i =~ s/9/９/g; $i =~ s/0/０/g;
# 	$seen{$i}++;				  # 全て全角
	$i =~ s/１/1/g; $i =~ s/２/2/g; $i =~ s/３/3/g; $i =~ s/４/4/g;
	$i =~ s/５/5/g; $i =~ s/６/6/g; $i =~ s/７/7/g; $i =~ s/８/8/g;
	$i =~ s/９/9/g; $i =~ s/０/0/g;
	$seen{$i}++;				  # 全て半角
      }
      @wk = keys %seen;
# print STDERR join(',',@wk) , "\n";

      $yomi = 'NEW';
      $yomi = 'REGISTERD'			  # 複数エントリの判定
	if defined($desc{$tango});

      # 読みを登録
      push( @{$yomi{$tango}}, shift(@wk) ) while (@wk);
    }
    else {
      # Description
      ## TODO: 同一単語で複数エントリあった場合、複数の用法記述が
      ## 連結されてしまう不具合あり。解決として「よみ」登録時点で
      ## 用法記述登録済みなら追加しない(この state に移行しない)
      ## ようにしているが、根本解決と言い難い(と個人的には考えている).
      if ( $yomi eq 'NEW' ) {
	$desc{$tango} = ''
	  if !defined($desc{$tango});
	$desc{$tango} .= "$_\n";
      }
    }
  }
  else {					  # $tango = '';
    # skip empty line.
    next if /^$/;

    # 空行以外の行発見 - 単語エントリの先頭のハズ
    next unless /^([0-9][0-9]*)\s+(.+)$/;	  # Format error

    $tango = $2;
    $hindo{$tango} = $1
      if !defined($hindo{$tango}) || $hindo{$tango} < $1;
  }

}



@wk = keys %yomi;
while (@wk) {
  $tango = shift @wk;
  while ( @{$yomi{$tango}} ) {
    $yomi = shift @{$yomi{$tango}};
    next if $yomi =~ /[１２３４５６７８９]/;

    print "$yomi $hindo{$tango} $tango\n";
    print "$desc{$tango}";
    print "\n";
  }

#  print "\n";
}
