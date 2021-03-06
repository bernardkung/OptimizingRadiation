
param num_matrices >= 1, integer;				# required for data
param num_rows >= 1, integer;
param num_cols >= 1, integer;
set BEAMS    := 1 .. num_matrices;				# required for indexing
set ROWS    := 1 .. num_rows;
set COLS := 1 .. num_cols;
param beam {BEAMS, ROWS, COLS} >= 0;			# required for data and indexing
param crit {ROWS, COLS} >= 0;
param tumr {ROWS, COLS} >= 0;
param bord {ROWS, COLS} >= 0;

var Int {BEAMS} >= 0; 							# variable for intensity of each beam

param m_beam	:= 20;							# max individual beam intensity

param lower		:= 10;							# min required over tumr area
param upper		:= 2;							# max allowed over crit area


#costs 			# >0 for penalty
				# >0 for penalty
param c_tumr	:=  1;							# cost of each rad to tumr area
param c_crit	:= -0.1;						# cost of each rad to crit area
param c_lpen 	:=  0.5;						# cost of each rad over lower limit to crit area
param c_upen	:= -0.5;						# cost of each rad under upper limit to tumr area
param c_bord	:= -1;							# cost of each rad to border area
				# =-0.7 for small
				# =  -1 for actual


# Difference of all radiation over tumr areas and all radiation over crit areas
maximize Max_Int

# over all cells
  : sum {i in ROWS, j in COLS, b in BEAMS} (
 (c_tumr*tumr[i,j] + c_crit*crit[i,j])*Int[b]*beam[b,i,j]

   + c_lpen * (lower*tumr[i,j] - tumr[i,j]*Int[b]*beam[b,i,j] )			# relaxation of LowerLimit
  				# this term is negative if we overload crit area
  				# cost must be positive to penalize
#  + c_upen * (upper*tumr[i,j]-tumr[i,j]*Int[b]*beam[b,i,j])			# relaxation of UpperLimit
				# this term is negative if we overload tumor area
				# cost must be negative to reward
				
  + c_bord * (bord[i,j]*Int[b]*beam[b,i,j])
	);



# Deliver under maximum allowed to crit areas
s.t. UpperLimit {i in ROWS, j in COLS}: 
	sum {b in BEAMS} (crit[i,j]*Int[b]*beam[b,i,j]) <= upper*crit[i,j];

# Deliver over minimum required for tumr areas
#s.t. LowerLimit	{i in ROWS, j in COLS}:
#	sum {b in BEAMS} (tumr[i,j]*Int[b]*beam[b,i,j]) >= lower*tumr[i,j]; 

# Limits beam intensity, allows dual
s.t. BeamLimit {b in BEAMS}:
	Int[b] <= m_beam;