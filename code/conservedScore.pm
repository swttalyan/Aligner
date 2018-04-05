package main;
use warnings;
use strict;

sub conservedScore
{

	###################Scoring Matrix#############
	our %score_matrix=(
	'AA'=>1.33,'AR'=>-4,'AN'=>-4,'AD'=>0.03,'AC'=>-4,'AQ'=>-4,'AE'=>0.03,'AG'=>0.06,'AH'=>-4,'AI'=>-4,'AL'=>-4,'AK'=>-4,'AM'=>-4,'AF'=>-4,'AP'=>0.06,'AS'=>0.06,'AT'=>0.22,'AW'=>-4,'AY'=>-4,
	'AV'=>0.22,'A*'=>-4,'RA'=>-4,'RR'=>1.33,'RN'=>-4,'RD'=>-4,'RC'=>0.07,'RQ'=>0.07,'RE'=>-4,'RG'=>0.11,'RH'=>0.07,'RI'=>0.01,'RL'=>0.04,'RK'=>0.07,'RM'=>0.01,'RF'=>-4,'RP'=>0.04,'RS'=>0.06,'RT'=>0.02,
	'RW'=>0.05,'RY'=>-4,'RV'=>-4,'R*'=>0.05,'NA'=>-4,'NR'=>-4,'NN'=>1.22,'ND'=>0.22,'NC'=>-4,'NQ'=>-4,'NE'=>-4,'NG'=>-4,'NH'=>0.06,'NI'=>0.06,'NL'=>-4,'NK'=>0.11,'NM'=>-4,'NF'=>-4,'NP'=>-4,'NS'=>0.22,
	'NT'=>0.06,'NW'=>-4,'NY'=>0.06,'NV'=>-4,'N*'=>-4,'DA'=>0.06,'DR'=>-4,'DN'=>0.22,'DD'=>1.22,'DC'=>-4,'DQ'=>-4,'DE'=>0.11,'DG'=>0.22,'DH'=>0.06,'DI'=>-4,'DL'=>-4,'DK'=>-4,'DM'=>-4,'DF'=>-4,'DP'=>-4,
	'DS'=>-4,'DT'=>-4,'DW'=>-4,'DY'=>0.06,'DV'=>0.06,'D*'=>-4,'CA'=>-4,'CR'=>0.22,'CN'=>-4,'CD'=>-4,'CC'=>1.22,'CQ'=>-4,'CE'=>-4,'CG'=>0.06,'CH'=>-4,'CI'=>-4,'CL'=>-4,'CK'=>-4,'CM'=>-4,'CF'=>0.06,
	'CP'=>-4,'CS'=>0.11,'CT'=>-4,'CW'=>0.06,'CY'=>0.22,'CV'=>-4,'C*'=>0.06,'QA'=>-4,'QR'=>0.22,'QN'=>-4,'QD'=>-4,'QC'=>-4,'QQ'=>1.22,'QE'=>0.06,'QG'=>-4,'QH'=>0.11,'QI'=>-4,'QL'=>0.06,'QK'=>0.06,'QM'=>-4,
	'QF'=>-4,'QP'=>0.06,'QS'=>-4,'QT'=>-4,'QW'=>-4,'QY'=>-4,'QV'=>-4,'Q*'=>0.22,'EA'=>0.06,'ER'=>-4,'EN'=>-4,'ED'=>0.11,'EC'=>-4,'EQ'=>0.06,'EE'=>1.22,'EG'=>0.22,'EH'=>-4,'EI'=>-4,'EL'=>-4,'EK'=>0.22,
	'EM'=>-4,'EF'=>-4,'EP'=>-4,'ES'=>-4,'ET'=>-4,'EW'=>-4,'EY'=>-4,'EV'=>0.06,'E*'=>0.06,'GA'=>0.06,'GR'=>0.17,'GN'=>-4,'GD'=>0.11,'GC'=>0.03,'GQ'=>-4,'GE'=>0.11,'GG'=>1.33,'GH'=>-4,'GI'=>-4,'GL'=>-4,
	'GK'=>-4,'GM'=>-4,'GF'=>-4,'GP'=>-4,'GS'=>0.11,'GT'=>-4,'GW'=>0.01,'GY'=>-4,'GV'=>0.06,'G*'=>0.01,'HA'=>-4,'HR'=>0.22,'HN'=>0.06,'HD'=>0.06,'HC'=>-4,'HQ'=>0.11,'HE'=>-4,'HG'=>-4,'HH'=>1.22,'HI'=>-4,
	'HL'=>0.06,'HK'=>-4,'HM'=>-4,'HF'=>-4,'HP'=>0.06,'HS'=>-4,'HT'=>-4,'HW'=>-4,'HY'=>0.22,'HV'=>-4,'H*'=>-4,'IA'=>-4,'IR'=>0.02,'IN'=>0.04,'ID'=>-4,'IC'=>-4,'IQ'=>-4,'IE'=>-4,'IG'=>-4,'IH'=>-4,'II'=>1.22,
	'IL'=>0.07,'IK'=>0.02,'IM'=>0.11,'IF'=>0.04,'IP'=>-4,'IS'=>0.04,'IT'=>0.22,'IW'=>-4,'IY'=>-4,'IV'=>0.22,'I*'=>-4,'LA'=>-4,'LR'=>0.04,'LN'=>-4,'LD'=>-4,'LC'=>-4,'LQ'=>0.02,'LE'=>-4,'LG'=>-4,'LH'=>0.02,
	'LI'=>0.04,'LL'=>1.44,'LK'=>-4,'LM'=>0.02,'LF'=>0.11,'LP'=>0.15,'LS'=>0.07,'LT'=>-4,'LW'=>0.01,'LY'=>-4,'LV'=>0.06,'L*'=>0.03,'KA'=>-4,'KR'=>0.22,'KN'=>0.11,'KD'=>-4,'KC'=>-4,'KQ'=>0.06,'KE'=>0.22,
	'KG'=>-4,'KH'=>-4,'KI'=>0.03,'KL'=>-4,'KK'=>1.22,'KM'=>0.03,'KF'=>-4,'KP'=>-4,'KS'=>-4,'KT'=>0.06,'KW'=>-4,'KY'=>-4,'KV'=>-4,'K*'=>0.06,'MA'=>-4,'MR'=>0.06,'MN'=>-4,'MD'=>-4,'MC'=>-4,'MQ'=>-4,'ME'=>-4,
	'MG'=>-4,'MH'=>-4,'MI'=>0.33,'ML'=>0.11,'MK'=>0.06,'MM'=>1,'MF'=>-4,'MP'=>-4,'MS'=>-4,'MT'=>0.22,'MW'=>-4,'MY'=>-4,'MV'=>0.22,'M*'=>-4,'FA'=>-4,'FR'=>-4,'FN'=>-4,'FD'=>-4,'FC'=>0.06,'FQ'=>-4,'FE'=>-4,
	'FG'=>-4,'FH'=>-4,'FI'=>0.06,'FL'=>0.33,'FK'=>-4,'FM'=>-4,'FF'=>1.22,'FP'=>-4,'FS'=>0.22,'FT'=>-4,'FW'=>-4,'FY'=>0.06,'FV'=>0.06,'F*'=>-4,'PA'=>0.06,'PR'=>0.06,'PN'=>-4,'PD'=>-4,'PC'=>-4,'PQ'=>0.03,
	'PE'=>-4,'PG'=>-4,'PH'=>0.03,'PI'=>-4,'PL'=>0.22,'PK'=>-4,'PM'=>-4,'PF'=>-4,'PP'=>1.33,'PS'=>0.22,'PT'=>0.06,'PW'=>-4,'PY'=>-4,'PV'=>-4,'P*'=>-4,'SA'=>0.04,'SR'=>0.06,'SN'=>0.07,'SD'=>-4,'SC'=>0.04,
	'SQ'=>-4,'SE'=>-4,'SG'=>0.07,'SH'=>-4,'SI'=>0.02,'SL'=>0.07,'SK'=>-4,'SM'=>-4,'SF'=>0.07,'SP'=>0.15,'SS'=>1.3,'ST'=>0.06,'SW'=>0.01,'SY'=>0.02,'SV'=>-4,'S*'=>0.03,'TA'=>0.22,'TR'=>0.03,'TN'=>0.03,
	'TD'=>-4,'TC'=>-4,'TQ'=>-4,'TE'=>-4,'TG'=>-4,'TH'=>-4,'TI'=>0.17,'TL'=>-4,'TK'=>0.03,'TM'=>0.06,'TF'=>-4,'TP'=>0.06,'TS'=>0.08,'TT'=>1.33,'TW'=>-4,'TY'=>-4,'TV'=>-4,'T*'=>-4,'WA'=>-4,'WR'=>0.28,
	'WN'=>-4,'WD'=>-4,'WC'=>0.11,'WQ'=>-4,'WE'=>-4,'WG'=>0.06,'WH'=>-4,'WI'=>-4,'WL'=>0.06,'WK'=>-4,'WM'=>-4,'WF'=>-4,'WP'=>-4,'WS'=>0.06,'WT'=>-4,'WW'=>1,'WY'=>-4,'WV'=>-4,'W*'=>0.44,'YA'=>-4,'YR'=>-4,
	'YN'=>0.06,'YD'=>0.06,'YC'=>0.22,'YQ'=>-4,'YE'=>-4,'YG'=>-4,'YH'=>0.22,'YI'=>-4,'YL'=>-4,'YK'=>-4,'YM'=>-4,'YF'=>0.06,'YP'=>-4,'YS'=>0.06,'YT'=>-4,'YW'=>-4,'YY'=>1.22,'YV'=>-4,'Y*'=>0.11,'VA'=>0.22,
	'VR'=>-4,'VN'=>-4,'VD'=>0.03,'VC'=>-4,'VQ'=>-4,'VE'=>0.03,'VG'=>0.06,'VH'=>-4,'VI'=>0.17,'VL'=>0.08,'VK'=>-4,'VM'=>0.06,'VF'=>0.03,'VP'=>-4,'VS'=>-4,'VT'=>-4,'VW'=>-4,'VY'=>-4,'VV'=>1.33,'V*'=>-4,
	'*A'=>-4,'*R'=>-4,'*N'=>-4,'*D'=>-4,'*C'=>-4,'*Q'=>-4,'*E'=>-4,'*G'=>-4,'*H'=>-4,'*I'=>-4,'*L'=>-4,'*K'=>-4,'*M'=>-4,'*F'=>-4,'*P'=>-4,'*S'=>-4,'*T'=>-4,'*W'=>-4,'*Y'=>-4,'*V'=>-4,'**'=>-4
	);
	my $SWP1=$_[0];my $FrameSeq=$_[1];my $startSWP=$_[2]; my $endSWP=$_[3]; my $startCC=$_[4];my $endCC=$_[5]; my $frame=$_[6];
	my @SWP=split("",$SWP1); my @FRAME1=split("",$FrameSeq);
	
	##############################################
	my $score=0;		
	my $count = $startCC-2;
	####### upstream extension#########
	for (my $k=$startSWP-2; $k>=0; $k--)
	{
		my $SWP_aa = $SWP[$k];
		my $Frame_aa= $FRAME1[$count];
		my $char=$SWP_aa.$Frame_aa;
		#print $char."\t".$count."\t".$k."\n";
		if((length ($char)==2)&&($k>=0)&&($count>=0))
		{
			if ($score_matrix{$char}>=0)
			{	
				$score=$score+$score_matrix{$char};
				$startSWP=$startSWP-1;
				$startCC=$startCC-1;
			}
			else
			{
			last;
			}
		}
		else
		{
		last;
		}
		$count--;
	}

	#######downstream extension#########
	my $count2=$endCC;
	for (my $k=$endSWP; $k<=$#SWP; $k++)
	{
				
		my $SWP_aa = $SWP[$k];
		my $Frame_aa= $FRAME1[$count2];
		my $char=$SWP_aa.$Frame_aa;
		if(length($char)==2)
		{
			if ($score_matrix{$char}>=0)
			{
			$score=$score+$score_matrix{$char};
			$endCC=$endCC+1;
			$endSWP=$endSWP+1;
			}
			else
			{
			last;
			}
		}
		else
		{
		last;
		}
		$count2++;
	}
	my $length=$endSWP-$startSWP+1;
	#print "Score\t".$length."\t".$score,"\t".$startSWP."\t".$endSWP."\t".$startCC."\t".$endCC."\n";
	return ($length,$score,$startSWP,$endSWP,$startCC,$endCC,$frame);
	
}

1;
