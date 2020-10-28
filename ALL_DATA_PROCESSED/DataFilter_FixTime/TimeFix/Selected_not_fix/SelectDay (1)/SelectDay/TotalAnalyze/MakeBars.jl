using DataFrames;
using CSV;
using RDatasets
using Statistics 
using StatsPlots

df_heating11 = CSV.read("11 Only_D.csv")
df_heating12 = CSV.read("12 Only_D.csv")
df_heating13 = CSV.read("13 Only_D.csv")
df_heating14 = CSV.read("14 Only_D.csv")
df_heating15 = CSV.read("15 Only_D.csv")

df_otc16 = CSV.read("16 Only_D.csv")
df_otc17 = CSV.read("17 Only_D.csv")
df_otc18 = CSV.read("18 Only_D.csv")
df_otc19 = CSV.read("19 Only_D.csv")
df_otc20 = CSV.read("20 Only_D.csv")

df_open21 = CSV.read("21 Only_D.csv")
df_open22 = CSV.read("22 Only_D.csv")
df_open23 = CSV.read("23 Only_D.csv")
df_open25 = CSV.read("25 Only_D.csv")



global heating_above_15 = 0;
global heating_above_10 = 0;
global heating_below_5 = 0;
global heating_below_0 = 0;

global otc_above_15 = 0;
global otc_above_10 = 0;
global otc_below_5 = 0;
global otc_below_0 = 0;

global open_above_15 = 0;
global open_above_10 = 0;
global open_below_5= 0;
global open_below_0 = 0;

global ambient_above_15 = 0;
global ambient_above_10 = 0;
global ambient_below_5 = 0;
global ambient_below_0 = 0;

for x=1:size(df_heating13)[1]

	 if ismissing(df_heating13.Air_temp_loc[x]) == false

		if df_heating13.Air_temp_loc[x] > 15 
			global heating_above_15+=1;				
		end

		if df_heating13.Air_temp_loc[x] > 10 
			global heating_above_10+=1;				
		end

		if df_heating13.Air_temp_loc[x] < 5
			global heating_below_5+=1;				
		end

		if df_heating13.Air_temp_loc[x] < 0  
			global heating_below_0+=1;				
		end
	end
end

print("Air Temp Heating\n")
print("Measures Above 15[°C]: ")
print(heating_above_15)
print("\n")

print("Measures Above 10[°C]: ")
print(heating_above_10)
print("\n")
 
print("Measures below 5[°C]: ")
print(heating_below_0)
print("\n")

print("Measures Below 0[°C]: ")
print(heating_below_0)
print("\n")

for x=1:size(df_otc17)[1]

 if ismissing(df_otc17.Air_temp_loc[x]) == false

		if df_otc17.Air_temp_loc[x] > 15 
			global otc_above_15+=1;				
		end

		if df_otc17.Air_temp_loc[x] > 10 
			global otc_above_10+=1;				
		end

		if df_otc17.Air_temp_loc[x] < 5 
			global otc_below_5+=1;				
		end

		if df_otc17.Air_temp_loc[x] < 0 
			global otc_below_0+=1;				
		end
	end
end





print("Air Temp OTC\n")
print("Measures Above 15[°C]: ")
print(otc_above_15)
print("\n")

print("Measures Above 10[°C]: ")
print(otc_above_10)
print("\n")
 
print("Measures below 5[°C]: ")
print(otc_below_0)
print("\n")

print("Measures Below 0[°C]: ")
print(otc_below_0)
print("\n")



for x=1:size(df_open22)[1]

	if ismissing(df_open22.Air_temp_loc[x]) == false
		if df_open22.Air_temp_loc[x] > 15
			global open_above_15+=1;				
		end

		if df_open22.Air_temp_loc[x] > 10 
			global open_above_10+=1;				
		end

		if df_open22.Air_temp_loc[x] < 5  
			global open_below_5+=1;				
		end

		if df_open22.Air_temp_loc[x] < 0  
			global open_below_0+=1;				
		end
	end
end
print("Air Temp Open Space\n")
print("Measures Above 15[°C]: ")
print(open_above_15)
print("\n")

print("Measures Above 10[°C]: ")
print(open_above_10)
print("\n")
 
print("Measures Above 0[°C]: ")
print(open_above_0)
print("\n")

print("Measures Below 0[°C]: ")
print(open_below_0)
print("\n")


for x=1:size(df_otc17)[1]

 if ismissing(df_otc17.Ambient_1[x]) == false

		if df_otc17.Ambient_1[x] > 15 
			global ambient_above_15+=1;				
		end

		if df_otc17.Ambient_1[x] > 10 
			global ambient_above_10+=1;				
		end

		if df_otc17.Ambient_1[x] < 5 
			global ambient_below_5+=1;				
		end

		if df_otc17.Ambient_1[x] < 0 
			global ambient_below_0+=1;				
		end
	end
end

print("Air Temp Ambient\n")
print("Measures Above 15[°C]: ")
print(ambient_above_15)
print("\n")

print("Measures Above 10[°C]: ")
print(ambient_above_10)
print("\n")
 
print("Measures below 5[°C]: ")
print(ambient_below_5)
print("\n")

print("Measures Below 0[°C]: ")
print(ambient_below_0)
print("\n")


a = [heating_below_0*100/size(df_heating13)[1] heating_below_5*100/size(df_heating13)[1] heating_above_10*100/size(df_heating13)[1] heating_above_15*100/size(df_heating13)[1] ]

b = [otc_below_0*100/size(df_otc17)[1] otc_below_5*100/size(df_otc17)[1] otc_above_10*100/size(df_otc17)[1] otc_above_15*100/size(df_otc17)[1]]

c = [open_below_0*100/size(df_open22)[1] open_below_5*100/size(df_open22)[1] open_above_10*100/size(df_open22)[1] open_above_15*100/size(df_open22)[1]]

d = [ambient_below_0*100/size(df_otc17)[1] ambient_below_5*100/size(df_otc17)[1] ambient_above_10*100/size(df_otc17)[1] ambient_above_15*100/size(df_otc17)[1]]


a = plot(["<0°C" "<5°C" ">10°C" ">15°C"],a,seriestype = :bar, legend = false, title = "Heating");

b = plot(["<0°C" "<5°C" ">10°C" ">15°C"],b,seriestype = :bar, legend = false, title = "OTC");

c = plot(["<0°C" "<5°C" ">10°C" ">15°C"],c,seriestype = :bar, legend = false, title = "Open Space");

d = plot(["<0°C" "<5°C" ">10°C" ">15°C"],d,seriestype = :bar, legend = false, title = "Ambient Sensor");

plot(a,b,c,d,ylabel="% Measurements",ylims = (0,60));

savefig("Hist_Air_Temp.pdf")





