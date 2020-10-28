using DataFrames;
using CSV;
using Plots;
using Dates

Dataset = CSV.read("2020-01-21 Only_C.csv")

dates = Dates.DateTime.(Dataset.Date, "y-m-d H-M-S")

#=
year = Dates.year(dates[1])
month = Dates.month(dates[1])
day = Dates.day(dates[1])
minute = Dates.minute(dates[1])
second = Dates.second(dates[1])
=#





(DateTime(2014,1,29,1,1,1)+Dates.Minute(6))

limit = 3 


names_columns = names(Dataset)

string(Symbol(names_columns[2]))

