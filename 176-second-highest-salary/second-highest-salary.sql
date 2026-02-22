Select(
    Select salary
    From Employee
    Group By salary
    Order By salary Desc
    offset 1 Row Fetch Next 1 Row Only
) As SecondHighestSalary