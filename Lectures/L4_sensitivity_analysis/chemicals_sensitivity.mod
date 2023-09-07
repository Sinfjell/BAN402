reset;
var x1 >=0;
var x2 >=0;
maximize total_profit: 300*x1 + 500*x2;
subject to
blending: 2*x1 + x2 <= 230;
refining: x1 + 2*x2 <= 250;
demandlimit: x2 <= 120;
option solver cplex; #If this doesn't work in Mac or Linux try: option solver './cplex';
option presolve 0; #turning off presolve procedures to perform sensitivity analysis
option cplex_options 'sensitivity'; #to allow using sensitivity analysis commands
solve;
display total_profit, x1, x2 > report_chemsensitivity.txt;
#below commands for SENSITIVITY ANALYSIS 
# Slack variables
display blending.body,blending.ub,blending.slack  > report_chemsensitivity.txt;
display refining.body,refining.ub,refining.slack  > report_chemsensitivity.txt;
display demandlimit.body,demandlimit.ub,demandlimit.slack  > report_chemsensitivity.txt;
#Shadow prices
display blending,blending.down,blending.current,blending.up  > report_chemsensitivity.txt;
display refining,refining.down,refining.current,refining.up  > report_chemsensitivity.txt;
display demandlimit,demandlimit.down,demandlimit.current,demandlimit.up  > report_chemsensitivity.txt;
#Allowable range
display x1.down,x1.current,x1.up  > report_chemsensitivity.txt;
display x2.down,x2.current,x2.up  > report_chemsensitivity.txt;
#Reduced costs
display x1.rc,x2.rc  > report_chemsensitivity.txt;
