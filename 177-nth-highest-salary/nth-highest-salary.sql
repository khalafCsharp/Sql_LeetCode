CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
   
   Declare @NthHighestSalary Int;

   With RankedSalaries_cte As 
   (
    Select Distinct salary,
            Dense_rank() Over(Order By salary Desc)As salaryRank
    From Employee
   )

   Select 
   @NthHighestSalary = salary
   From RankedSalaries_cte
   Where salaryRank = @N;

   return @NthHighestSalary;
END