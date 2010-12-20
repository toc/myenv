#!perl -w

# Usage: perl registdict.pl <dictfile> | anthy-dic-tool --append

### ��������Ϥ� EUC-JP �Ǥ��뤳�Ȥ���.
### �Ѵ���ν��Ϥ� EUC-JP �Ǥʤ���Фʤ�ʤ��Τǡ�
### �� script ��Ǥ�ʸ���������Ѵ���»ܤ��ʤ�.

### NOTE: �ʤ����� script ��ʸ�������ɤ� EUC-JP �Ǥʤ���Фʤ�ʤ�!!!

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
      # ��ߤ�ʬ��
      $yomi{$tango} = []
	if !defined($yomi{$tango});

      # ��Ͽ����Ƥ����ɤߤ��ղ����롣WinAnthy�б��Ȥ����ɤߤο�����
      # ���ѡ�Ⱦ�Ѥ�Ʊ��ߤʤ��Ȥ��롣
      @wk = split;
      %seen= ();
      for my $i (@wk) {			  # Ⱦ�ѿ���<->��������Ѵ��ޤ�
	$seen{$i}++;				  # ���ꥸ�ʥ�
### Google���ܸ����ϤǤ��ɤߤ����ѿ���������ʤ�
# 	$i =~ s/1/��/g; $i =~ s/2/��/g; $i =~ s/3/��/g; $i =~ s/4/��/g;
# 	$i =~ s/5/��/g; $i =~ s/6/��/g; $i =~ s/7/��/g; $i =~ s/8/��/g;
# 	$i =~ s/9/��/g; $i =~ s/0/��/g;
# 	$seen{$i}++;				  # ��������
	$i =~ s/��/1/g; $i =~ s/��/2/g; $i =~ s/��/3/g; $i =~ s/��/4/g;
	$i =~ s/��/5/g; $i =~ s/��/6/g; $i =~ s/��/7/g; $i =~ s/��/8/g;
	$i =~ s/��/9/g; $i =~ s/��/0/g;
	$seen{$i}++;				  # ����Ⱦ��
      }
      @wk = keys %seen;
# print STDERR join(',',@wk) , "\n";

      $yomi = 'NEW';
      $yomi = 'REGISTERD'			  # ʣ������ȥ��Ƚ��
	if defined($desc{$tango});

      # �ɤߤ���Ͽ
      push( @{$yomi{$tango}}, shift(@wk) ) while (@wk);
    }
    else {
      # Description
      ## TODO: Ʊ��ñ���ʣ������ȥꤢ�ä���硢ʣ������ˡ���Ҥ�
      ## Ϣ�뤵��Ƥ��ޤ��Զ�礢�ꡣ���Ȥ��ơ֤�ߡ���Ͽ������
      ## ��ˡ������Ͽ�Ѥߤʤ��ɲä��ʤ�(���� state �˰ܹԤ��ʤ�)
      ## �褦�ˤ��Ƥ��뤬�����ܲ��ȸ�����(�ȸĿ�Ū�ˤϹͤ��Ƥ���).
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

    # ���԰ʳ��ι�ȯ�� - ñ�쥨��ȥ����Ƭ�Υϥ�
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
    next if $yomi =~ /[������������������]/;

    print "$yomi $hindo{$tango} $tango\n";
    print "$desc{$tango}";
    print "\n";
  }

#  print "\n";
}
