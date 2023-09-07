reset;

# Declare decision variables
var x1 >= 0;  # Amount of CS-01 produced in 1000 litres
var x2 >= 0, <= 120;  # Amount of CS-02 produced in 1000 litres

# Objective function to maximize profit
maximize total_profit: 0.3 * x1 * 1000 + 0.5 * x2 * 1000;

# Constraints
subject to blending_time: 2 * x1 + 1 * x2 <= 5 * 40 + 2 * 15;
subject to refining_time: 1 * x1 + 2 * x2 <= 6 * 40 + 1 * 10;

# Determine solver
option solver cplex;

# Solve the model
solve;

# Display the results
display total_profit;
display x1;
display x2;

# Write the results to report.txt
printf "Result of problem 3\n" >> "report.txt";
printf "Optimal Objective Value: %f\n", total_profit > "report.txt";
printf "Optimal value of x1: %f\n", x1 >> "report.txt";
printf "Optimal value of x2: %f\n", x2 >> "report.txt";
printf "-------------------------------\n" >> "report.txt";