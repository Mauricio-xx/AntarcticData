using DataFrames;
using CSV;
using Impute 
using RDatasets
using Statistics 
using StatsPlots
using DelimitedFiles



global original_dir = pwd();


##### HEATING GROUP #####
cd("Heating");

#dia
cd("2020-01-24_C_11");

dfdia = CSV.read("2020-01-24 Dia.csv");
dfnoche = CSV.read("2020-01-24 Noche.csv");

#interpolation 

##dia
dfdia_int = Impute.interp(dfdia[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfdia_int[:time] = dfdia.time; #column time
CSV.write("2020-01-24_Dia_Heating_11_C_Int.csv", dfdia_int); 
 

## noche
dfnoche_int = Impute.interp(dfnoche[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfnoche_int[:time] = dfnoche.time; #column time
##writedlm("2020-01-24_Noche_Heating_11_C_Int.csv", dfnoche_int); 

global dfdia_int_11_C = dfdia_int; 
global dfnoche_int_11_C = dfnoche_int; 

cd("..");

#dia
cd("2020-01-24_C_12");

dfdia = CSV.read("2020-01-24 Dia.csv");
dfnoche = CSV.read("2020-01-24 Noche.csv");

#interpolation 

##dia
dfdia_int = Impute.interp(dfdia[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfdia_int[:time] = dfdia.time; #column time
##writedlm("2020-01-24_Dia_Heating_12_C_Int.csv", dfdia_int); 

## noche
dfnoche_int = Impute.interp(dfnoche[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfnoche_int[:time] = dfnoche.time; #column time
##writedlm("2020-01-24_Noche_Heating_12_C_Int.csv", dfnoche_int); 

global dfdia_int_12_C = dfdia_int; 
global dfnoche_int_12_C = dfnoche_int; 


cd("..");

#dia
cd("2020-01-24_C_13");

dfdia = CSV.read("2020-01-24 Dia.csv");
dfnoche = CSV.read("2020-01-24 Noche.csv");

#interpolation 

##dia
dfdia_int = Impute.interp(dfdia[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfdia_int[:time] = dfdia.time; #column time
##writedlm("2020-01-24_Dia_Heating_13_C_Int.csv", dfdia_int); 

## noche
dfnoche_int = Impute.interp(dfnoche[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfnoche_int[:time] = dfnoche.time; #column time
##writedlm("2020-01-24_Noche_Heating_13_C_Int.csv", dfnoche_int); 

global dfdia_int_13_C = dfdia_int; 
global dfnoche_int_13_C = dfnoche_int; 

cd("..");

#dia
cd("2020-01-24_C_14");

dfdia = CSV.read("2020-01-24 Dia.csv");
dfnoche = CSV.read("2020-01-24 Noche.csv");

#interpolation 

##dia
dfdia_int = Impute.interp(dfdia[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfdia_int[:time] = dfdia.time; #column time
##writedlm("2020-01-24_Dia_Heating_14_C_Int.csv", dfdia_int); 

## noche
dfnoche_int = Impute.interp(dfnoche[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfnoche_int[:time] = dfnoche.time; #column time
##writedlm("2020-01-24_Noche_Heating_14_C_Int.csv", dfnoche_int); 

global dfdia_int_14_C = dfdia_int; 
global dfnoche_int_14_C = dfnoche_int; 

cd("..");

#dia
cd("2020-01-24_C_15");

dfdia = CSV.read("2020-01-24 Dia.csv");
dfnoche = CSV.read("2020-01-24 Noche.csv");

#interpolation 

##dia
dfdia_int = Impute.interp(dfdia[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfdia_int[:time] = dfdia.time; #column time
##writedlm("2020-01-24_Dia_Heating_15_C_Int.csv", dfdia_int); 

## noche
dfnoche_int = Impute.interp(dfnoche[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfnoche_int[:time] = dfnoche.time; #column time
##writedlm("2020-01-24_Noche_Heating_15_C_Int.csv", dfnoche_int); 

global dfdia_int_15_C = dfdia_int; 
global dfnoche_int_15_C = dfnoche_int; 


### D ###

cd("..");

#dia
cd("2020-01-24_D_11");

dfdia = CSV.read("2020-01-24 Dia.csv");
dfnoche = CSV.read("2020-01-24 Noche.csv");

#interpolation 

##dia
dfdia_int = Impute.interp(dfdia[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfdia_int[:time] = dfdia.time; #column time
##writedlm("2020-01-24_Dia_Heating_11_D_Int.csv", dfdia_int); 

## noche
dfnoche_int = Impute.interp(dfnoche[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfnoche_int[:time] = dfnoche.time; #column time
##writedlm("2020-01-24_Noche_Heating_11_D_Int.csv", dfnoche_int); 

global dfdia_int_11_D = dfdia_int; 
global dfnoche_int_11_D = dfnoche_int;

cd("..");

#dia
cd("2020-01-24_D_12");

dfdia = CSV.read("2020-01-24 Dia.csv");
dfnoche = CSV.read("2020-01-24 Noche.csv");

#interpolation 

##dia
dfdia_int = Impute.interp(dfdia[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfdia_int[:time] = dfdia.time; #column time
##writedlm("2020-01-24_Dia_Heating_12_D_Int.csv", dfdia_int); 

## noche
dfnoche_int = Impute.interp(dfnoche[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfnoche_int[:time] = dfnoche.time; #column time
##writedlm("2020-01-24_Noche_Heating_12_D_Int.csv", dfnoche_int); 

global dfdia_int_12_D = dfdia_int; 
global dfnoche_int_12_D = dfnoche_int;

cd("..");

#dia
cd("2020-01-24_D_13");

dfdia = CSV.read("2020-01-24 Dia.csv");
dfnoche = CSV.read("2020-01-24 Noche.csv");

#interpolation 

##dia
dfdia_int = Impute.interp(dfdia[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfdia_int[:time] = dfdia.time; #column time
##writedlm("2020-01-24_Dia_Heating_13_D_Int.csv", dfdia_int); 

## noche
dfnoche_int = Impute.interp(dfnoche[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfnoche_int[:time] = dfnoche.time; #column time
##writedlm("2020-01-24_Noche_Heating_13_D_Int.csv", dfnoche_int); 

global dfdia_int_13_D = dfdia_int; 
global dfnoche_int_13_D = dfnoche_int;

cd("..");

#dia
cd("2020-01-24_D_14");

dfdia = CSV.read("2020-01-24 Dia.csv");
dfnoche = CSV.read("2020-01-24 Noche.csv");

#interpolation 

##dia
dfdia_int = Impute.interp(dfdia[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfdia_int[:time] = dfdia.time; #column time
###writedlm("2020-01-24_Dia_Heating_14_D_Int.csv", dfdia_int); 

## noche
dfnoche_int = Impute.interp(dfnoche[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfnoche_int[:time] = dfnoche.time; #column time
##writedlm("2020-01-24_Noche_Heating_14_D_Int.csv", dfnoche_int); 

global dfdia_int_14_D = dfdia_int; 
global dfnoche_int_14_D = dfnoche_int;


cd("..");

#dia
cd("2020-01-24_D_15");

dfdia = CSV.read("2020-01-24 Dia.csv");
dfnoche = CSV.read("2020-01-24 Noche.csv");

#interpolation 

##dia
dfdia_int = Impute.interp(dfdia[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfdia_int[:time] = dfdia.time; #column time
##writedlm("2020-01-24_Dia_Heating_15_D_Int.csv", dfdia_int); 

## noche
dfnoche_int = Impute.interp(dfnoche[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfnoche_int[:time] = dfnoche.time; #column time
##writedlm("2020-01-24_Noche_Heating_15_D_Int.csv", dfnoche_int); 


global dfdia_int_15_D = dfdia_int; 
global dfnoche_int_15_D = dfnoche_int;


#### OTC ####

cd(original_dir); 
cd("OTC");

### C ###
#dia
cd("2020-01-24_C_16");

dfdia = CSV.read("2020-01-24 Dia.csv");
dfnoche = CSV.read("2020-01-24 Noche.csv");

#interpolation 

##dia
dfdia_int = Impute.interp(dfdia[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfdia_int[:time] = dfdia.time; #column time
##writedlm("2020-01-24_Dia_OTC_16_C_Int.csv", dfdia_int); 

## noche
dfnoche_int = Impute.interp(dfnoche[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfnoche_int[:time] = dfnoche.time; #column time
##writedlm("2020-01-24_Noche_OTC_16_C_Int.csv", dfnoche_int); 


global dfdia_int_16_C = dfdia_int; 
global dfnoche_int_16_C = dfnoche_int;


cd("..");

#dia
cd("2020-01-24_C_17");

dfdia = CSV.read("2020-01-24 Dia.csv");
dfnoche = CSV.read("2020-01-24 Noche.csv");

#interpolation 

##dia
dfdia_int = Impute.interp(dfdia[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfdia_int[:time] = dfdia.time; #column time
##writedlm("2020-01-24_Dia_OTC_17_C_Int.csv", dfdia_int); 

## noche
dfnoche_int = Impute.interp(dfnoche[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfnoche_int[:time] = dfnoche.time; #column time
##writedlm("2020-01-24_Noche_OTC_17_C_Int.csv", dfnoche_int); 

global dfdia_int_17_C = dfdia_int; 
global dfnoche_int_17_C = dfnoche_int;

cd("..");

#dia
cd("2020-01-24_C_18");

dfdia = CSV.read("2020-01-24 Dia.csv");
dfnoche = CSV.read("2020-01-24 Noche.csv");

#interpolation 

##dia
dfdia_int = Impute.interp(dfdia[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfdia_int[:time] = dfdia.time; #column time
##writedlm("2020-01-24_Dia_OTC_18_C_Int.csv", dfdia_int); 

## noche
dfnoche_int = Impute.interp(dfnoche[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfnoche_int[:time] = dfnoche.time; #column time
##writedlm("2020-01-24_Noche_OTC_18_C_Int.csv", dfnoche_int); 

global dfdia_int_18_C = dfdia_int; 
global dfnoche_int_18_C = dfnoche_int;

cd("..");

#dia
cd("2020-01-24_C_19");

dfdia = CSV.read("2020-01-24 Dia.csv");
dfnoche = CSV.read("2020-01-24 Noche.csv");

#interpolation 

##dia
dfdia_int = Impute.interp(dfdia[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfdia_int[:time] = dfdia.time; #column time
##writedlm("2020-01-24_Dia_OTC_19_C_Int.csv", dfdia_int); 

## noche
dfnoche_int = Impute.interp(dfnoche[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfnoche_int[:time] = dfnoche.time; #column time
##writedlm("2020-01-24_Noche_OTC_19_C_Int.csv", dfnoche_int); 

global dfdia_int_19_C = dfdia_int; 
global dfnoche_int_19_C = dfnoche_int;

cd("..");

#dia
cd("2020-01-24_C_20");

dfdia = CSV.read("2020-01-24 Dia.csv");
dfnoche = CSV.read("2020-01-24 Noche.csv");

#interpolation 

##dia
dfdia_int = Impute.interp(dfdia[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfdia_int[:time] = dfdia.time; #column time
##writedlm("2020-01-24_Dia_OTC_20_C_Int.csv", dfdia_int); 

## noche
dfnoche_int = Impute.interp(dfnoche[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfnoche_int[:time] = dfnoche.time; #column time
##writedlm("2020-01-24_Noche_OTC_20_C_Int.csv", dfnoche_int); 

global dfdia_int_20_C = dfdia_int; 
global dfnoche_int_20_C = dfnoche_int;

#### D ####

cd("..");

#dia
cd("2020-01-24_D_16");

dfdia = CSV.read("2020-01-24 Dia.csv");
dfnoche = CSV.read("2020-01-24 Noche.csv");

#interpolation 

##dia
dfdia_int = Impute.interp(dfdia[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfdia_int[:time] = dfdia.time; #column time
##writedlm("2020-01-24_Dia_OTC_16_D_Int.csv", dfdia_int); 

## noche
dfnoche_int = Impute.interp(dfnoche[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfnoche_int[:time] = dfnoche.time; #column time
###writedlm("2020-01-24_Noche_OTC_16_D_Int.csv", dfnoche_int); 

global dfdia_int_16_D = dfdia_int; 
global dfnoche_int_16_D = dfnoche_int;

cd("..");

#dia
cd("2020-01-24_D_17");

dfdia = CSV.read("2020-01-24 Dia.csv");
dfnoche = CSV.read("2020-01-24 Noche.csv");

#interpolation 

##dia
dfdia_int = Impute.interp(dfdia[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfdia_int[:time] = dfdia.time; #column time
##writedlm("2020-01-24_Dia_OTC_17_D_Int.csv", dfdia_int); 

## noche
dfnoche_int = Impute.interp(dfnoche[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfnoche_int[:time] = dfnoche.time; #column time
##writedlm("2020-01-24_Noche_OTC_17_D_Int.csv", dfnoche_int); 

global dfdia_int_17_D = dfdia_int; 
global dfnoche_int_17_D = dfnoche_int;

cd("..");

#dia
cd("2020-01-24_D_18");

dfdia = CSV.read("2020-01-24 Dia.csv");
dfnoche = CSV.read("2020-01-24 Noche.csv");

#interpolation 

##dia
dfdia_int = Impute.interp(dfdia[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfdia_int[:time] = dfdia.time; #column time
##writedlm("2020-01-24_Dia_OTC_18_D_Int.csv", dfdia_int); 

## noche
dfnoche_int = Impute.interp(dfnoche[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfnoche_int[:time] = dfnoche.time; #column time
##writedlm("2020-01-24_Noche_OTC_18_D_Int.csv", dfnoche_int); 

global dfdia_int_18_D = dfdia_int; 
global dfnoche_int_18_D = dfnoche_int;

cd("..");

#dia
cd("2020-01-24_D_19");

dfdia = CSV.read("2020-01-24 Dia.csv");
dfnoche = CSV.read("2020-01-24 Noche.csv");

#interpolation 

##dia
dfdia_int = Impute.interp(dfdia[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfdia_int[:time] = dfdia.time; #column time
##writedlm("2020-01-24_Dia_OTC_19_D_Int.csv", dfdia_int); 

## noche
dfnoche_int = Impute.interp(dfnoche[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfnoche_int[:time] = dfnoche.time; #column time
##writedlm("2020-01-24_Noche_OTC_19_D_Int.csv", dfnoche_int); 

global dfdia_int_19_D = dfdia_int; 
global dfnoche_int_19_D = dfnoche_int;

cd("..");

#dia
cd("2020-01-24_D_20");

dfdia = CSV.read("2020-01-24 Dia.csv");
dfnoche = CSV.read("2020-01-24 Noche.csv");

#interpolation 

##dia
dfdia_int = Impute.interp(dfdia[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfdia_int[:time] = dfdia.time; #column time
##writedlm("2020-01-24_Dia_OTC_20_D_Int.csv", dfdia_int); 

## noche
dfnoche_int = Impute.interp(dfnoche[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfnoche_int[:time] = dfnoche.time; #column time
##writedlm("2020-01-24_Noche_OTC_20_D_Int.csv", dfnoche_int); 

global dfdia_int_20_D = dfdia_int; 
global dfnoche_int_20_D = dfnoche_int;



#### OPEN SPACE ####

cd(original_dir); 
cd("OpenSpace");

### C ###
#dia
cd("2020-01-24_C_21");

dfdia = CSV.read("2020-01-24 Dia.csv");
dfnoche = CSV.read("2020-01-24 Noche.csv");

#interpolation 

##dia
dfdia_int = Impute.interp(dfdia[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfdia_int[:time] = dfdia.time; #column time
##writedlm("2020-01-24_Dia_OpenSpace_21_C_Int.csv", dfdia_int); 

## noche
dfnoche_int = Impute.interp(dfnoche[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfnoche_int[:time] = dfnoche.time; #column time
##writedlm("2020-01-24_Noche_OpenSpace_21_C_Int.csv", dfnoche_int); 

global dfdia_int_21_C = dfdia_int; 
global dfnoche_int_21_C = dfnoche_int;

cd("..");

#dia
cd("2020-01-24_C_22");

dfdia = CSV.read("2020-01-24 Dia.csv");
dfnoche = CSV.read("2020-01-24 Noche.csv");

#interpolation 

##dia
dfdia_int = Impute.interp(dfdia[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfdia_int[:time] = dfdia.time; #column time
##writedlm("2020-01-24_Dia_OpenSpace_22_C_Int.csv", dfdia_int); 

## noche
dfnoche_int = Impute.interp(dfnoche[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfnoche_int[:time] = dfnoche.time; #column time
##writedlm("2020-01-24_Noche_OpenSpace_22_C_Int.csv", dfnoche_int); 

global dfdia_int_22_C = dfdia_int; 
global dfnoche_int_22_C = dfnoche_int;

cd("..");

#dia
cd("2020-01-24_C_23");

dfdia = CSV.read("2020-01-24 Dia.csv");
dfnoche = CSV.read("2020-01-24 Noche.csv");

#interpolation 

##dia
dfdia_int = Impute.interp(dfdia[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfdia_int[:time] = dfdia.time; #column time
##writedlm("2020-01-24_Dia_OpenSpace_23_C_Int.csv", dfdia_int); 

## noche
dfnoche_int = Impute.interp(dfnoche[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfnoche_int[:time] = dfnoche.time; #column time
##writedlm("2020-01-24_Noche_OpenSpace_23_C_Int.csv", dfnoche_int); 

global dfdia_int_23_C = dfdia_int; 
global dfnoche_int_23_C = dfnoche_int;

cd("..");

#dia
cd("2020-01-24_C_25");

dfdia = CSV.read("2020-01-24 Dia.csv");
dfnoche = CSV.read("2020-01-24 Noche.csv");

#interpolation 

##dia
dfdia_int = Impute.interp(dfdia[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfdia_int[:time] = dfdia.time; #column time
##writedlm("2020-01-24_Dia_OpenSpace_25_C_Int.csv", dfdia_int); 

## noche
dfnoche_int = Impute.interp(dfnoche[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfnoche_int[:time] = dfnoche.time; #column time
##writedlm("2020-01-24_Noche_OpenSpace_25_C_Int.csv", dfnoche_int); 

global dfdia_int_25_C = dfdia_int; 
global dfnoche_int_25_C = dfnoche_int;



#### D ####

cd("..");

#dia
cd("2020-01-24_D_21");

dfdia = CSV.read("2020-01-24 Dia.csv");
dfnoche = CSV.read("2020-01-24 Noche.csv");

#interpolation 

##dia
dfdia_int = Impute.interp(dfdia[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfdia_int[:time] = dfdia.time; #column time
##writedlm("2020-01-24_Dia_OpenSpace_21_D_Int.csv", dfdia_int); 

## noche
dfnoche_int = Impute.interp(dfnoche[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfnoche_int[:time] = dfnoche.time; #column time
##writedlm("2020-01-24_Noche_OpenSpace_21_D_Int.csv", dfnoche_int); 

global dfdia_int_21_D = dfdia_int; 
global dfnoche_int_21_D = dfnoche_int;

cd("..");

#dia
cd("2020-01-24_D_22");

dfdia = CSV.read("2020-01-24 Dia.csv");
dfnoche = CSV.read("2020-01-24 Noche.csv");

#interpolation 

##dia
dfdia_int = Impute.interp(dfdia[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfdia_int[:time] = dfdia.time; #column time
##writedlm("2020-01-24_Dia_OpenSpace_22_D_Int.csv", dfdia_int); 

## noche
dfnoche_int = Impute.interp(dfnoche[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfnoche_int[:time] = dfnoche.time; #column time
##writedlm("2020-01-24_Noche_OpenSpace_22_D_Int.csv", dfnoche_int);

global dfdia_int_22_D = dfdia_int; 
global dfnoche_int_22_D = dfnoche_int; 

cd("..");

#dia
cd("2020-01-24_D_23");

dfdia = CSV.read("2020-01-24 Dia.csv");
dfnoche = CSV.read("2020-01-24 Noche.csv");

#interpolation 

##dia
dfdia_int = Impute.interp(dfdia[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfdia_int[:time] = dfdia.time; #column time
##writedlm("2020-01-24_Dia_OpenSpace_23_D_Int.csv", dfdia_int); 

## noche
dfnoche_int = Impute.interp(dfnoche[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfnoche_int[:time] = dfnoche.time; #column time
##writedlm("2020-01-24_Noche_OpenSpace_23_D_Int.csv", dfnoche_int); 

global dfdia_int_23_D = dfdia_int; 
global dfnoche_int_23_D = dfnoche_int;

cd("..");

#dia
cd("2020-01-24_D_25");

dfdia = CSV.read("2020-01-24 Dia.csv");
dfnoche = CSV.read("2020-01-24 Noche.csv");

#interpolation 

##dia
dfdia_int = Impute.interp(dfdia[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfdia_int[:time] = dfdia.time; #column time
##writedlm("2020-01-24_Dia_OpenSpace_25_D_Int.csv", dfdia_int); 

## noche
dfnoche_int = Impute.interp(dfnoche[:,2:end]) |> Impute.locf() |> Impute.nocb(); #without time column
dfnoche_int[:time] = dfnoche.time; #column time
##writedlm("2020-01-24_Noche_OpenSpace_25_D_Int.csv", dfnoche_int); 

global dfdia_int_25_D = dfdia_int; 
global dfnoche_int_25_D = dfnoche_int;

cd(original_dir); ##RETURN HOME!



#### BEGING OF MAGIC SHOW #####


## Heating

df_heating_dia_C = join(dfdia_int_11_C, dfdia_int_12_C, on=:time, kind = :outer, makeunique=true);
df_heating_dia_C = join(df_heating_dia_C, dfdia_int_13_C, on=:time, kind = :outer, makeunique=true);
df_heating_dia_C = join(df_heating_dia_C, dfdia_int_14_C, on=:time, kind = :outer, makeunique=true);
global df_heating_dia_C = join(df_heating_dia_C, dfdia_int_15_C, on=:time, kind = :outer, makeunique=true);

df_heating_dia_D = join(dfdia_int_11_D, dfdia_int_12_D, on=:time, kind = :outer, makeunique=true);
df_heating_dia_D = join(df_heating_dia_D, dfdia_int_13_D, on=:time, kind = :outer, makeunique=true);
df_heating_dia_D = join(df_heating_dia_D, dfdia_int_14_D, on=:time, kind = :outer, makeunique=true);
global df_heating_dia_D = join(df_heating_dia_D, dfdia_int_15_D, on=:time, kind = :outer, makeunique=true);


df_heating_noche_C = join(dfnoche_int_11_C, dfnoche_int_12_C, on=:time, kind = :outer, makeunique=true);
df_heating_noche_C = join(df_heating_noche_C, dfnoche_int_13_C, on=:time, kind = :outer, makeunique=true);
df_heating_noche_C = join(df_heating_noche_C, dfnoche_int_14_C, on=:time, kind = :outer, makeunique=true);
global df_heating_noche_C = join(df_heating_noche_C, dfnoche_int_15_C, on=:time, kind = :outer, makeunique=true);

df_heating_noche_D = join(dfnoche_int_11_D, dfnoche_int_12_D, on=:time, kind = :outer, makeunique=true);
df_heating_noche_D = join(df_heating_noche_D, dfnoche_int_13_D, on=:time, kind = :outer, makeunique=true);
df_heating_noche_D = join(df_heating_noche_D, dfnoche_int_14_D, on=:time, kind = :outer, makeunique=true);
global df_heating_noche_D = join(df_heating_noche_D, dfnoche_int_15_D, on=:time, kind = :outer, makeunique=true);



## OTC

df_otc_dia_C = join(dfdia_int_16_C, dfdia_int_17_C, on=:time, kind = :outer, makeunique=true);
df_otc_dia_C = join(df_otc_dia_C, dfdia_int_18_C, on=:time, kind = :outer, makeunique=true);
df_otc_dia_C = join(df_otc_dia_C, dfdia_int_19_C, on=:time, kind = :outer, makeunique=true);
global df_otc_dia_C = join(df_otc_dia_C, dfdia_int_20_C, on=:time, kind = :outer, makeunique=true);

df_otc_dia_D = join(dfdia_int_16_D, dfdia_int_17_D, on=:time, kind = :outer, makeunique=true);
df_otc_dia_D = join(df_otc_dia_D, dfdia_int_18_D, on=:time, kind = :outer, makeunique=true);
df_otc_dia_D = join(df_otc_dia_D, dfdia_int_19_D, on=:time, kind = :outer, makeunique=true);
global df_otc_dia_D = join(df_otc_dia_D, dfdia_int_20_D, on=:time, kind = :outer, makeunique=true);

df_otc_noche_C = join(dfnoche_int_16_C, dfnoche_int_17_C, on=:time, kind = :outer, makeunique=true);
df_otc_noche_C = join(df_otc_noche_C, dfnoche_int_18_C, on=:time, kind = :outer, makeunique=true);
df_otc_noche_C = join(df_otc_noche_C, dfnoche_int_19_C, on=:time, kind = :outer, makeunique=true);
global df_otc_noche_C = join(df_otc_noche_C, dfnoche_int_20_C, on=:time, kind = :outer, makeunique=true);

df_otc_noche_D = join(dfnoche_int_16_D, dfnoche_int_17_D, on=:time, kind = :outer, makeunique=true);
df_otc_noche_D = join(df_otc_noche_D, dfnoche_int_18_D, on=:time, kind = :outer, makeunique=true);
df_otc_noche_D = join(df_otc_noche_D, dfnoche_int_19_D, on=:time, kind = :outer, makeunique=true);
global df_otc_noche_D = join(df_otc_noche_D, dfnoche_int_20_D, on=:time, kind = :outer, makeunique=true);


##OpenSpace

df_openspace_dia_C = join(dfdia_int_21_C, dfdia_int_22_C, on=:time, kind = :outer, makeunique=true);
df_openspace_dia_C = join(df_openspace_dia_C, dfdia_int_23_C, on=:time, kind = :outer, makeunique=true);
global df_openspace_dia_C = join(df_openspace_dia_C, dfdia_int_25_C, on=:time, kind = :outer, makeunique=true);

df_openspace_dia_D = join(dfdia_int_21_D, dfdia_int_22_D, on=:time, kind = :outer, makeunique=true);
df_openspace_dia_D = join(df_openspace_dia_D, dfdia_int_23_D, on=:time, kind = :outer, makeunique=true);
global df_openspace_dia_D = join(df_openspace_dia_D, dfdia_int_25_D, on=:time, kind = :outer, makeunique=true);

df_openspace_noche_C = join(dfnoche_int_21_C, dfnoche_int_22_C, on=:time, kind = :outer, makeunique=true);
df_openspace_noche_C = join(df_openspace_noche_C, dfnoche_int_23_C, on=:time, kind = :outer, makeunique=true);
global df_openspace_noche_C = join(df_openspace_noche_C, dfnoche_int_25_C, on=:time, kind = :outer, makeunique=true);

df_openspace_noche_D = join(dfnoche_int_21_D, dfnoche_int_22_D, on=:time, kind = :outer, makeunique=true);
df_openspace_noche_D = join(df_openspace_noche_D, dfnoche_int_23_D, on=:time, kind = :outer, makeunique=true);
global df_openspace_noche_D = join(df_openspace_noche_D, dfnoche_int_25_D, on=:time, kind = :outer, makeunique=true);






#means air_tem_loc

df_heating_mean_airtemp_noche = collect(1:size(df_heating_noche_D.Air_temp_loc)[1])
df_heating_mean_airtemp_noche=convert.(Float16, df_heating_mean_airtemp_noche)
for x = 1:size(df_heating_noche_D.Air_temp_loc)[1]
global df_heating_mean_airtemp_noche[x] =
(
#df_heating_noche_D.Air_temp_loc_1[x]+
df_heating_noche_D.Air_temp_loc_2[x]+
df_heating_noche_D.Air_temp_loc_3[x]+
df_heating_noche_D.Air_temp_loc_4[x])/3 
end
 
##writedlm("Heating_mean_airtemp_noche.csv",df_heating_mean_airtemp_noche);

df_otc_mean_airtemp_noche = collect(1:size(df_otc_noche_D.Air_temp_loc)[1])
df_otc_mean_airtemp_noche=convert.(Float32, df_otc_mean_airtemp_noche)
for x = 1:size(df_otc_noche_D.Air_temp_loc)[1]
global df_otc_mean_airtemp_noche[x] =
(
df_otc_noche_D.Air_temp_loc_1[x]+
df_otc_noche_D.Air_temp_loc_2[x]+
df_otc_noche_D.Air_temp_loc_3[x]+
df_otc_noche_D.Air_temp_loc_4[x])/4 
end

##writedlm("OTC_mean_airtemp_noche.csv",df_otc_mean_airtemp_noche);
 
df_openspace_mean_airtemp_noche = collect(1:size(df_openspace_noche_D.Air_temp_loc)[1])
df_openspace_mean_airtemp_noche=convert.(Float32, df_openspace_mean_airtemp_noche)
for x = 1:size(df_openspace_noche_D.Air_temp_loc)[1]
global df_openspace_mean_airtemp_noche[x] =
(df_openspace_noche_D.Air_temp_loc[x]+
df_openspace_noche_D.Air_temp_loc_1[x]+
df_openspace_noche_D.Air_temp_loc_2[x]+
df_openspace_noche_D.Air_temp_loc_3[x])/4 
end
 
##writedlm("OpenSpace_mean_airtemp_noche.csv",df_openspace_mean_airtemp_noche);



df_heating_mean_airtemp_dia = collect(1:size(df_heating_dia_D.Air_temp_loc)[1])
df_heating_mean_airtemp_dia=convert.(Float32, df_heating_mean_airtemp_dia)
for x = 1:size(df_heating_dia_D.Air_temp_loc)[1]
global df_heating_mean_airtemp_dia[x] =
(
#df_heating_dia_D.Air_temp_loc_1[x]+
df_heating_dia_D.Air_temp_loc_2[x]+
df_heating_dia_D.Air_temp_loc_3[x]+
df_heating_dia_D.Air_temp_loc_4[x])/3 
end
##writedlm("Heating_mean_airtemp_dia.csv",df_heating_mean_airtemp_dia);
 
df_otc_mean_airtemp_dia = collect(1:size(df_otc_dia_D.Air_temp_loc)[1])
df_otc_mean_airtemp_dia=convert.(Float32, df_otc_mean_airtemp_dia)
for x = 1:size(df_otc_dia_D.Air_temp_loc)[1]
global df_otc_mean_airtemp_dia[x] =
(
df_otc_dia_D.Air_temp_loc_1[x]+
df_otc_dia_D.Air_temp_loc_2[x]+
df_otc_dia_D.Air_temp_loc_3[x]+
df_otc_dia_D.Air_temp_loc_4[x])/4 
end
##writedlm("OTC_mean_airtemp_dia.csv",df_otc_mean_airtemp_dia);
 
df_openspace_mean_airtemp_dia = collect(1:size(df_openspace_dia_D.Air_temp_loc)[1])
df_openspace_mean_airtemp_dia=convert.(Float32, df_openspace_mean_airtemp_dia)
for x = 1:size(df_openspace_dia_D.Air_temp_loc)[1]
global df_openspace_mean_airtemp_dia[x] =
(df_openspace_dia_D.Air_temp_loc[x]+
df_openspace_dia_D.Air_temp_loc_1[x]+
df_openspace_dia_D.Air_temp_loc_2[x]+
df_openspace_dia_D.Air_temp_loc_3[x])/4 
end
 
##writedlm("OpenSpace_mean_airtemp_dia.csv",df_openspace_mean_airtemp_dia);

a=boxplot(["Heating"],df_heating_mean_airtemp_noche,color="red",leg = false);
a=boxplot!(["OTC"],df_otc_mean_airtemp_noche,color="green",leg = false);
a=boxplot!(["OpenSpace"],df_openspace_mean_airtemp_noche,color="blue",leg = false);
a=boxplot!(["AmbientTemp"],df_openspace_noche_D.Ambient_1,color="orange",leg = false, title = "Air Temp Nigth",yaxis="[°C]",ylims=(0,11),xtickfontsize=6, grid = false);

b=boxplot(["Heating"],df_heating_mean_airtemp_dia,color="red",leg = false); 
b=boxplot!(["OTC"],df_otc_mean_airtemp_dia,color="green",leg = false);
b=boxplot!(["OpenSpace"],df_openspace_mean_airtemp_dia,color="blue",leg = false);
b=boxplot!(["AmbientTemp"],df_openspace_dia_D.Ambient_1,color="orange",leg = false, title = "Air Temp Day",yaxis="[°C]",ylims=(0,11),xtickfontsize=6, grid = false);

plot(a,b);
savefig("boxplot.pdf");

a=dotplot(["Heating"],df_heating_mean_airtemp_noche,color="red",leg = false);
a=dotplot!(["OTC"],df_otc_mean_airtemp_noche,color="green",leg = false);
a=dotplot!(["OpenSpace"],df_openspace_mean_airtemp_noche,color="blue",leg = false)
a=dotplot!(["AmbientTemp"],df_openspace_noche_D.Ambient_1,color="orange",leg = false, title = "Air Temp Nigth",yaxis="[°C]",ylims=(0,11),xtickfontsize=6,grid = false);

b=dotplot(["Heating"],df_heating_mean_airtemp_dia,color="red",leg = false);
b=dotplot!(["OTC"],df_otc_mean_airtemp_dia,color="green",leg = false);
b=dotplot!(["OpenSpace"],df_openspace_mean_airtemp_dia,color="blue",leg = false);
b=dotplot!(["AmbientTemp"],df_openspace_dia_D.Ambient_1,color="orange",leg = false, title = "Air Temp Day",yaxis="[°C]",ylims=(0,11),xtickfontsize=6,grid = false);



plot(a,b);
savefig("dotplot.pdf");




## Plants


df_heating_mean_D_dia = collect(1:size(df_heating_dia_D.TempPlant1)[1]);
df_heating_mean_D_dia = convert.(Float32, df_heating_mean_D_dia);
for x = 1:size(df_heating_dia_D.TempPlant1)[1]
global df_heating_mean_D_dia[x] =
(df_heating_dia_D.TempPlant1[x]+
df_heating_dia_D.TempPlant2[x]+
df_heating_dia_D.TempPlant2_2[x]+
df_heating_dia_D.TempPlant3[x]+
df_heating_dia_D.TempPlant3_2[x]+
df_heating_dia_D.TempPlant4_1[x]+
df_heating_dia_D.TempPlant4_3[x]+
df_heating_dia_D.TempPlant6[x]+
df_heating_dia_D.TempPlant1_1[x]+
df_heating_dia_D.TempPlant2_1[x]+
df_heating_dia_D.TempPlant2_3[x]+
df_heating_dia_D.TempPlant3_1[x]+
df_heating_dia_D.TempPlant4[x]+
df_heating_dia_D.TempPlant4_2[x]+
df_heating_dia_D.TempPlant5[x])/15 
end
##writedlm("Heating_mean_PlantD_dia.csv",df_heating_mean_D_dia);


df_heating_mean_C_dia = collect(1:size(df_heating_dia_C.TempPlant1)[1])
df_heating_mean_C_dia=convert.(Float32, df_heating_mean_C_dia)
for x = 1:size(df_heating_dia_C.TempPlant1)[1]
global df_heating_mean_C_dia[x] =
(df_heating_dia_C.TempPlant1[x]+
df_heating_dia_C.TempPlant1_2[x]+
df_heating_dia_C.TempPlant3[x]+
df_heating_dia_C.TempPlant4[x]+
df_heating_dia_C.TempPlant5_1[x]+
df_heating_dia_C.TempPlant5_3[x]+
df_heating_dia_C.TempPlant6_1[x]+
df_heating_dia_C.TempPlant6_3[x]+
df_heating_dia_C.TempPlant1_1[x]+
df_heating_dia_C.TempPlant2[x]+
df_heating_dia_C.TempPlant3_1[x]+
df_heating_dia_C.TempPlant5[x]+
df_heating_dia_C.TempPlant5_2[x]+
df_heating_dia_C.TempPlant6[x]+
df_heating_dia_C.TempPlant6_2[x])/15 
end
##writedlm("Heating_mean_PlantC_dia.csv",df_heating_mean_C_dia);

df_otc_mean_D_dia = collect(1:size(df_otc_dia_D.TempPlant1)[1])
df_otc_mean_D_dia=convert.(Float32, df_otc_mean_D_dia)
for x = 1:size(df_otc_dia_D.TempPlant1)[1]
global df_otc_mean_D_dia[x] =
(df_otc_dia_D.TempPlant1[x]+
df_otc_dia_D.TempPlant3[x]+
df_otc_dia_D.TempPlant3_2[x]+
df_otc_dia_D.TempPlant4[x]+
df_otc_dia_D.TempPlant5[x]+
df_otc_dia_D.TempPlant5_2[x]+
df_otc_dia_D.TempPlant5_4[x]+
df_otc_dia_D.TempPlant6_1[x]+
df_otc_dia_D.TempPlant2[x]+
df_otc_dia_D.TempPlant3_1[x]+
df_otc_dia_D.TempPlant3_3[x]+
df_otc_dia_D.TempPlant4_1[x]+
df_otc_dia_D.TempPlant5_1[x]+
df_otc_dia_D.TempPlant5_3[x]+
df_otc_dia_D.TempPlant6[x])/15 
end

##writedlm("OTC_mean_PlantD_dia.csv",df_otc_mean_D_dia);

df_otc_mean_C_dia = collect(1:size(df_otc_dia_C.TempPlant1)[1])
df_otc_mean_C_dia=convert.(Float32, df_otc_mean_C_dia)
for x = 1:size(df_otc_dia_C.TempPlant1)[1]
global df_otc_mean_C_dia[x] =
(df_otc_dia_C.TempPlant1[x]+
df_otc_dia_C.TempPlant1_2[x]+
df_otc_dia_C.TempPlant2[x]+
df_otc_dia_C.TempPlant2_2[x]+
df_otc_dia_C.TempPlant3[x]+
df_otc_dia_C.TempPlant4_1[x]+
df_otc_dia_C.TempPlant6[x]+
df_otc_dia_C.TempPlant6_2[x]+
df_otc_dia_C.TempPlant1_1[x]+
df_otc_dia_C.TempPlant1_3[x]+
df_otc_dia_C.TempPlant2_1[x]+
df_otc_dia_C.TempPlant2_3[x]+
df_otc_dia_C.TempPlant4[x]+
df_otc_dia_C.TempPlant4_2[x]+
df_otc_dia_C.TempPlant6_1[x])/15 
end
##writedlm("OTC_mean_PlantC_dia.pdf",df_otc_mean_C_dia);

df_openspace_mean_D_dia = collect(1:size(df_openspace_dia_D.TempPlant1)[1])
df_openspace_mean_D_dia=convert.(Float32, df_openspace_mean_D_dia)
for x = 1:size(df_openspace_dia_D.TempPlant1)[1]
global df_openspace_mean_D_dia[x] =
(df_openspace_dia_D.TempPlant1[x]+
df_openspace_dia_D.TempPlant1_2[x]+
df_openspace_dia_D.TempPlant2_1[x]+
df_openspace_dia_D.TempPlant4[x]+
df_openspace_dia_D.TempPlant5_1[x]+
df_openspace_dia_D.TempPlant6_1[x]+
df_openspace_dia_D.TempPlant1_1[x]+
df_openspace_dia_D.TempPlant2[x]+
df_openspace_dia_D.TempPlant3[x]+
df_openspace_dia_D.TempPlant5[x]+
df_openspace_dia_D.TempPlant6[x]+
df_openspace_dia_D.TempPlant6_2[x])/12 
end
##writedlm("OpenSpace_mean_PlantD_dia.csv",df_openspace_mean_D_dia);

df_openspace_mean_C_dia = collect(1:size(df_openspace_dia_C.TempPlant1)[1])
df_openspace_mean_C_dia=convert.(Float32, df_openspace_mean_C_dia)
for x = 1:size(df_openspace_dia_C.TempPlant1)[1]
global df_openspace_mean_C_dia[x] =
(df_openspace_dia_C.TempPlant1[x]+
df_openspace_dia_C.TempPlant2_1[x]+
df_openspace_dia_C.TempPlant3_1[x]+
df_openspace_dia_C.TempPlant4[x]+
df_openspace_dia_C.TempPlant4_2[x]+
df_openspace_dia_C.TempPlant5_1[x]+
df_openspace_dia_C.TempPlant2[x]+
df_openspace_dia_C.TempPlant3[x]+
df_openspace_dia_C.TempPlant3_2[x]+
df_openspace_dia_C.TempPlant4_1[x]+
df_openspace_dia_C.TempPlant5[x]+
df_openspace_dia_C.TempPlant6[x])/12 
end
##writedlm("OpenSpace_mean_PlantC_dia.csv",df_openspace_mean_C_dia);




df_heating_mean_D_noche = collect(1:size(df_heating_noche_D.TempPlant1)[1]);
df_heating_mean_D_noche=convert.(Float32, df_heating_mean_D_noche);
for x = 1:size(df_heating_noche_D.TempPlant1)[1]
global df_heating_mean_D_noche[x] =
(df_heating_noche_D.TempPlant1[x]+
df_heating_noche_D.TempPlant2[x]+
df_heating_noche_D.TempPlant2_2[x]+
df_heating_noche_D.TempPlant3[x]+
df_heating_noche_D.TempPlant3_2[x]+
df_heating_noche_D.TempPlant4_1[x]+
df_heating_noche_D.TempPlant4_3[x]+
df_heating_noche_D.TempPlant6[x]+
df_heating_noche_D.TempPlant1_1[x]+
df_heating_noche_D.TempPlant2_1[x]+
df_heating_noche_D.TempPlant2_3[x]+
df_heating_noche_D.TempPlant3_1[x]+
df_heating_noche_D.TempPlant4[x]+
df_heating_noche_D.TempPlant4_2[x]+
df_heating_noche_D.TempPlant5[x])/15 
end


##writedlm("Heating_mean_PlantD_noche.csv",df_heating_mean_D_noche);



df_heating_mean_C_noche = collect(1:size(df_heating_noche_C.TempPlant1)[1])
df_heating_mean_C_noche=convert.(Float32, df_heating_mean_C_noche)
for x = 1:size(df_heating_noche_C.TempPlant1)[1]
global df_heating_mean_C_noche[x] =
(df_heating_noche_C.TempPlant1[x]+
df_heating_noche_C.TempPlant1_2[x]+
df_heating_noche_C.TempPlant3[x]+
df_heating_noche_C.TempPlant4[x]+
df_heating_noche_C.TempPlant5_1[x]+
df_heating_noche_C.TempPlant5_3[x]+
df_heating_noche_C.TempPlant6_1[x]+
df_heating_noche_C.TempPlant6_3[x]+
df_heating_noche_C.TempPlant1_1[x]+
df_heating_noche_C.TempPlant2[x]+
df_heating_noche_C.TempPlant3_1[x]+
df_heating_noche_C.TempPlant5[x]+
df_heating_noche_C.TempPlant5_2[x]+
df_heating_noche_C.TempPlant6[x]+
df_heating_noche_C.TempPlant6_2[x])/15 
end
##writedlm("Heating_mean_PlantC_noche.csv",df_heating_mean_C_noche);

df_otc_mean_D_noche = collect(1:size(df_otc_noche_D.TempPlant1)[1])
df_otc_mean_D_noche=convert.(Float32, df_otc_mean_D_noche)
for x = 1:size(df_otc_noche_D.TempPlant1)[1]
global df_otc_mean_D_noche[x] =
(df_otc_noche_D.TempPlant1[x]+
df_otc_noche_D.TempPlant3[x]+
df_otc_noche_D.TempPlant3_2[x]+
df_otc_noche_D.TempPlant4[x]+
df_otc_noche_D.TempPlant5[x]+
df_otc_noche_D.TempPlant5_2[x]+
df_otc_noche_D.TempPlant5_4[x]+
df_otc_noche_D.TempPlant6_1[x]+
df_otc_noche_D.TempPlant2[x]+
df_otc_noche_D.TempPlant3_1[x]+
df_otc_noche_D.TempPlant3_3[x]+
df_otc_noche_D.TempPlant4_1[x]+
df_otc_noche_D.TempPlant5_1[x]+
df_otc_noche_D.TempPlant5_3[x]+
df_otc_noche_D.TempPlant6[x])/15 
end

##writedlm("OTC_mean_PlantD_noche.csv",df_otc_mean_D_noche);

df_otc_mean_C_noche = collect(1:size(df_otc_noche_C.TempPlant1)[1])
df_otc_mean_C_noche=convert.(Float32, df_otc_mean_C_noche)
for x = 1:size(df_otc_noche_C.TempPlant1)[1]
global df_otc_mean_C_noche[x] =
(df_otc_noche_C.TempPlant1[x]+
df_otc_noche_C.TempPlant1_2[x]+
df_otc_noche_C.TempPlant2[x]+
df_otc_noche_C.TempPlant2_2[x]+
df_otc_noche_C.TempPlant3[x]+
df_otc_noche_C.TempPlant4_1[x]+
df_otc_noche_C.TempPlant6[x]+
df_otc_noche_C.TempPlant6_2[x]+
df_otc_noche_C.TempPlant1_1[x]+
df_otc_noche_C.TempPlant1_3[x]+
df_otc_noche_C.TempPlant2_1[x]+
df_otc_noche_C.TempPlant2_3[x]+
df_otc_noche_C.TempPlant4[x]+
df_otc_noche_C.TempPlant4_2[x]+
df_otc_noche_C.TempPlant6_1[x])/15 
end
##writedlm("OTC_mean_PlantC_noche.csv",df_otc_mean_C_noche);

df_openspace_mean_D_noche = collect(1:size(df_openspace_noche_D.TempPlant1)[1])
df_openspace_mean_D_noche=convert.(Float32, df_openspace_mean_D_noche)
for x = 1:size(df_openspace_noche_D.TempPlant1)[1]
global df_openspace_mean_D_noche[x] =
(df_openspace_noche_D.TempPlant1[x]+
df_openspace_noche_D.TempPlant1_2[x]+
df_openspace_noche_D.TempPlant2_1[x]+
df_openspace_noche_D.TempPlant4[x]+
df_openspace_noche_D.TempPlant5_1[x]+
df_openspace_noche_D.TempPlant6_1[x]+
df_openspace_noche_D.TempPlant1_1[x]+
df_openspace_noche_D.TempPlant2[x]+
df_openspace_noche_D.TempPlant3[x]+
df_openspace_noche_D.TempPlant5[x]+
df_openspace_noche_D.TempPlant6[x]+
df_openspace_noche_D.TempPlant6_2[x])/12 
end
##writedlm("OpenSpace_mean_PlantD_noche.csv",df_openspace_mean_D_noche);


df_openspace_mean_C_noche = collect(1:size(df_openspace_noche_C.TempPlant1)[1])
df_openspace_mean_C_noche=convert.(Float32, df_openspace_mean_C_noche)
for x = 1:size(df_openspace_noche_C.TempPlant1)[1]
global df_openspace_mean_C_noche[x] =
(df_openspace_noche_C.TempPlant1[x]+
df_openspace_noche_C.TempPlant2_1[x]+
df_openspace_noche_C.TempPlant3_1[x]+
df_openspace_noche_C.TempPlant4[x]+
df_openspace_noche_C.TempPlant4_2[x]+
df_openspace_noche_C.TempPlant5_1[x]+
df_openspace_noche_C.TempPlant2[x]+
df_openspace_noche_C.TempPlant3[x]+
df_openspace_noche_C.TempPlant3_2[x]+
df_openspace_noche_C.TempPlant4_1[x]+
df_openspace_noche_C.TempPlant5[x]+
df_openspace_noche_C.TempPlant6[x])/12 
end

##writedlm("OpenSpace_mean_PlantC_noche.csv",df_openspace_mean_C_noche);

a=dotplot(["Heating"],df_heating_mean_C_dia,color="red",leg = false);
a=dotplot!(["OTC"],df_otc_mean_C_dia,color="green",leg = false);
a=dotplot!(["OpenSpace"],df_otc_mean_C_dia,color="blue",leg = false);
a=dotplot!(["AmbientTemp"],df_openspace_dia_C.Ambient_1,color="orange",leg = false, title = "Colobanthus quitensis. Day",yaxis="°C",ylims=(1,13),xtickfontsize=6,guidefont=font(12),titlefont=font(10),grid = false);

b=dotplot(["Heating"],df_heating_mean_C_noche,color="red",leg = false);
b=dotplot!(["OTC"],df_otc_mean_C_noche,color="green",leg = false);
b=dotplot!(["OpenSpace"],df_otc_mean_C_noche,color="blue",leg = false);
b=dotplot!(["AmbientTemp"],df_openspace_noche_C.Ambient_1,color="orange",leg = false, title = "Colobanthus quitensis. Nigth",yaxis="°C",ylims=(1,13),xtickfontsize=6,guidefont=font(12),titlefont=font(10),grid = false);

plot(a,b);
savefig("Colobanthus_Dot.pdf");

a=dotplot(["Heating"],df_heating_mean_D_dia,color="red",leg = false);
a=dotplot!(["OTC"],df_otc_mean_D_dia,color="green",leg = false);
a=dotplot!(["OpenSpace"],df_otc_mean_D_dia,color="blue",leg = false);
a=dotplot!(["AmbientTemp"],df_openspace_dia_D.Ambient_1,color="orange",leg = false, title ="Deschampsia antarctica. Day" ,yaxis="°C",ylims=(1,13),xtickfontsize=6,guidefont=font(12),titlefont=font(10),grid = false);

b=dotplot(["Heating"],df_heating_mean_D_noche,color="red",leg = false);
b=dotplot!(["OTC"],df_otc_mean_D_noche,color="green",leg = false);
b=dotplot!(["OpenSpace"],df_otc_mean_D_noche,color="blue",leg = false);
b=dotplot!(["AmbientTemp"],df_openspace_noche_D.Ambient_1,color="orange",leg = false, title = "Deschampsia antarctica. Nigth",yaxis="°C",ylims=(1,13),xtickfontsize=6,guidefont=font(12),titlefont=font(10),grid = false);

plot(a,b);
savefig("Deschampsia_Dot.pdf");






a=boxplot(["Heating"],df_heating_mean_C_dia,color="red",leg = false);
a=boxplot!(["OTC"],df_otc_mean_C_dia,color="green",leg = false);
a=boxplot!(["OpenSpace"],df_otc_mean_C_dia,color="blue",leg = false);
a=boxplot!(["AmbientTemp"],df_openspace_dia_C.Ambient_1,color="orange",leg = false, title = "Colobanthus quitensis. Day",yaxis="[°C]",ylims=(1,13),xtickfontsize=6,guidefont=font(12),titlefont=font(10),grid = false);

b=boxplot(["Heating"],df_heating_mean_C_noche,color="red",leg = false);
b=boxplot!(["OTC"],df_otc_mean_C_noche,color="green",leg = false);
b=boxplot!(["OpenSpace"],df_otc_mean_C_noche,color="blue",leg = false);
b=boxplot!(["AmbientTemp"],df_openspace_noche_C.Ambient_1,color="orange",leg = false, title = "Colobanthus quitensis. Nigth",yaxis="[°C]",ylims=(1,13),xtickfontsize=6,guidefont=font(12),titlefont=font(10),grid = false);

plot(a,b,grid = false);
savefig("Colobanthus_Box.pdf");

a=boxplot(["Heating"],df_heating_mean_D_dia,color="red",leg = false);
a=boxplot!(["OTC"],df_otc_mean_D_dia,color="green",leg = false);
a=boxplot!(["OpenSpace"],df_otc_mean_D_dia,color="blue",leg = false);
a=boxplot!(["AmbientTemp"],df_openspace_dia_D.Ambient_1,color="orange",leg = false, title ="Deschampsia antarctica. Day" ,yaxis="[°C]",ylims=(1,13),xtickfontsize=6,guidefont=font(12),titlefont=font(10),grid = false);

b=boxplot(["Heating"],df_heating_mean_D_noche,color="red",leg = false);
b=boxplot!(["OTC"],df_otc_mean_D_noche,color="green",leg = false);
b=boxplot!(["OpenSpace"],df_otc_mean_D_noche,color="blue",leg = false);
b=boxplot!(["AmbientTemp"],df_openspace_noche_D.Ambient_1,color="orange",leg = false, title = "Deschampsia antarctica. Nigth",yaxis="[°C]",ylims=(1,13),xtickfontsize=6,guidefont=font(12),titlefont=font(10),grid = false);

plot(a,b,grid = false);
savefig("Deschampsia_Box.pdf");






dates=Dates.format.(df_heating_noche_D.time, "HH:MM")
a=plot(dates,df_heating_mean_D_noche,color="red",label = "Heating");
a=plot!(df_otc_mean_D_noche,color="black",label = "OTC");
a=plot!(df_openspace_mean_D_noche,color="blue",label = "OSpace");

a=plot!(df_openspace_noche_D.Ambient_1,color="orange",label = "ATemp", title = "Deschampsia antarctica. Nigth");
#plot(a);
#savefig("Deschampsia_Noche_Line.pdf")

dates=Dates.format.(df_heating_dia_D.time, "HH:MM")
b=plot(dates,df_heating_mean_D_dia,color="red",label = "Heating");
b=plot!(df_otc_mean_D_dia,color="black",label = "OTC");
b=plot!(df_openspace_mean_D_dia,color="blue",label = "OSpace");
b=plot!(df_openspace_dia_D.Ambient_1,color="orange",label = "A.Temp", title = "Deschampsia antarctica. Day");
#plot(b);
#savefig("Deschampsia_Dia_Line.pdf")
dates=Dates.format.(df_heating_noche_C.time, "HH:MM")
c=plot(dates,df_heating_mean_C_noche,color="red",label = "Heating");
c=plot!(df_otc_mean_C_noche,color="black",label = "OTC");
c=plot!(df_openspace_mean_C_noche,color="blue",label = "OSpace");

c=plot!(df_openspace_noche_C.Ambient_1,color="orange",label = "ATemp", title = "Colobanthus quitensis. Nigth")#, xticks=(0:60:600), xlims=(0,600));




#plot(c);
#savefig("Deschampsia_Noche_Line.pdf")
dates=Dates.format.(df_heating_dia_C.time, "HH:MM")
d=plot(dates,df_heating_mean_C_dia,color="red",label = "Heating");
d=plot!(df_otc_mean_C_dia,color="black",label = "OTC");
d=plot!(df_openspace_mean_C_dia,color="blue",label = "OSpace");
d=plot!(df_openspace_dia_C.Ambient_1,color="orange",label = "ATemp", title = "Colobanthus quitensis. Day");
#plot(d);
#savefig("Deschampsia_Dia_Line.pdf")
plot(b,a,d,c,legendfont=font(5),titlefont=font(8),xtickfontsize=5,guidefont=font(5),ylims=(1,13), ylabel="[°C]", xlabel = "[Hours]",xrotation=90);
savefig("Plants_Line.pdf")









dates=Dates.format.(df_heating_dia_D.time, "HH:MM")
plot(dates,df_heating_mean_airtemp_dia,color="red", label = "Heting")

plot!(df_openspace_mean_airtemp_dia, color = "blue",label = "OSpace")


df_otc_mean_airtemp_dia[776] = (df_otc_mean_airtemp_dia[775] + df_otc_mean_airtemp_dia[777])/2

plot!(df_otc_mean_airtemp_dia, color = "black" ,label = "OTC")


plot!(title="Air Temp Day Compared",legendfont=font(6),guidefont=font(8),titlefont=font(10)
       ,xtickfontsize=7,ylims=(3,11),xlabel="[Hours]",ylabel="[°C]",xrotation=90)

plot!(size=(500,400))


savefig("air_group_day_compared.pdf");



#fix
df_heating_mean_airtemp_noche[96] = (df_heating_mean_airtemp_noche[95]+df_heating_mean_airtemp_noche[97])/2;
df_heating_mean_airtemp_noche[123] = (df_heating_mean_airtemp_noche[122]+df_heating_mean_airtemp_noche[124])/2;
df_heating_mean_airtemp_noche[388] = (df_heating_mean_airtemp_noche[387]+df_heating_mean_airtemp_noche[389])/2;

dates=Dates.format.(df_heating_noche_D.time, "HH:MM")
plot(dates,df_heating_mean_airtemp_noche,color="red", label = "Heting")

plot!(df_openspace_mean_airtemp_noche, color = "blue",label = "OSpace")

plot!(df_otc_mean_airtemp_noche, color = "black" ,label = "OTC")


plot!(title="Air Temp Nigth Compared",legendfont=font(6),guidefont=font(8),titlefont=font(10)
       ,xtickfontsize=7,ylims=(2,6.5),xlabel="[Hours]",ylabel="[°C]",xrotation=90)

plot!(size=(500,400))

savefig("air_group_nigth_compared.pdf");



#=
### analisis ###


TempPlant1   TempPlant2    TempPlant2_2  TempPlant3    TempPlant3_2  TempPlant4_1  TempPlant4_3  TempPlant6
TempPlant1_1 TempPlant2_1  TempPlant2_3  TempPlant3_1  TempPlant4    TempPlant4_2  TempPlant5


mean(df_heating_noche_D.TempPlant1)
mean(df_heating_noche_D.TempPlant2)
mean(df_heating_noche_D.TempPlant2_2)
mean(df_heating_noche_D.TempPlant3)
mean(df_heating_noche_D.TempPlant3_2)
mean(df_heating_noche_D.TempPlant4_1)
mean(df_heating_noche_D.TempPlant4_3)
mean(df_heating_noche_D.TempPlant6)
mean(df_heating_noche_D.TempPlant1_1)
mean(df_heating_noche_D.TempPlant2_1)
mean(df_heating_noche_D.TempPlant2_3)
mean(df_heating_noche_D.TempPlant3_1)
mean(df_heating_noche_D.TempPlant4)
mean(df_heating_noche_D.TempPlant4_2)
mean(df_heating_noche_D.TempPlant5)


TempPlant1   TempPlant1_2  TempPlant3    TempPlant4    TempPlant5_1  TempPlant5_3  TempPlant6_1  TempPlant6_3
TempPlant1_1 TempPlant2    TempPlant3_1  TempPlant5    TempPlant5_2  TempPlant6    TempPlant6_2

mean(df_heating_noche_C.TempPlant1)
mean(df_heating_noche_C.TempPlant1_2)
mean(df_heating_noche_C.TempPlant3)
mean(df_heating_noche_C.TempPlant4)
mean(df_heating_noche_C.TempPlant5_1)
mean(df_heating_noche_C.TempPlant5_3)
mean(df_heating_noche_C.TempPlant6_1)
mean(df_heating_noche_C.TempPlant6_3)
mean(df_heating_noche_C.TempPlant1_1)
mean(df_heating_noche_C.TempPlant2)
mean(df_heating_noche_C.TempPlant3_1)
mean(df_heating_noche_C.TempPlant5)
mean(df_heating_noche_C.TempPlant5_2)
mean(df_heating_noche_C.TempPlant6)
mean(df_heating_noche_C.TempPlant6_2)

TempPlant1   TempPlant3    TempPlant3_2  TempPlant4    TempPlant5    TempPlant5_2  TempPlant5_4  TempPlant6_1
TempPlant2   TempPlant3_1  TempPlant3_3  TempPlant4_1  TempPlant5_1  TempPlant5_3  TempPlant6

mean(df_otc_noche_D.TempPlant1)
mean(df_otc_noche_D.TempPlant3)
mean(df_otc_noche_D.TempPlant3_2)
mean(df_otc_noche_D.TempPlant4)
mean(df_otc_noche_D.TempPlant5)
mean(df_otc_noche_D.TempPlant5_2)
mean(df_otc_noche_D.TempPlant5_4)
mean(df_otc_noche_D.TempPlant6_1)
mean(df_otc_noche_D.TempPlant2)
mean(df_otc_noche_D.TempPlant3_1)
mean(df_otc_noche_D.TempPlant3_3)
mean(df_otc_noche_D.TempPlant4_1)
mean(df_otc_noche_D.TempPlant5_1)
mean(df_otc_noche_D.TempPlant5_3)
mean(df_otc_noche_D.TempPlant6)



TempPlant1   TempPlant1_2  TempPlant2    TempPlant2_2  TempPlant3    TempPlant4_1  TempPlant6    TempPlant6_2
TempPlant1_1 TempPlant1_3  TempPlant2_1  TempPlant2_3  TempPlant4    TempPlant4_2  TempPlant6_1

mean(df_otc_noche_C.TempPlant1)
mean(df_otc_noche_C.TempPlant1_2)
mean(df_otc_noche_C.TempPlant2)
mean(df_otc_noche_C.TempPlant2_2)
mean(df_otc_noche_C.TempPlant3)
mean(df_otc_noche_C.TempPlant4_1)
mean(df_otc_noche_C.TempPlant6)
mean(df_otc_noche_C.TempPlant6_2)
mean(df_otc_noche_C.TempPlant1_1)
mean(df_otc_noche_C.TempPlant1_3)
mean(df_otc_noche_C.TempPlant2_1)
mean(df_otc_noche_C.TempPlant2_3)
mean(df_otc_noche_C.TempPlant4)
mean(df_otc_noche_C.TempPlant4_2)
mean(df_otc_noche_C.TempPlant6_1)


TempPlant1   TempPlant1_2  TempPlant2_1  TempPlant4    TempPlant5_1  TempPlant6_1
TempPlant1_1 TempPlant2    TempPlant3    TempPlant5    TempPlant6    TempPlant6_2


mean(df_openspace_noche_D.TempPlant1)
mean(df_openspace_noche_D.TempPlant1_2)
mean(df_openspace_noche_D.TempPlant2_1)
mean(df_openspace_noche_D.TempPlant4)
mean(df_openspace_noche_D.TempPlant5_1)
mean(df_openspace_noche_D.TempPlant6_1)
mean(df_openspace_noche_D.TempPlant1_1)
mean(df_openspace_noche_D.TempPlant2)
mean(df_openspace_noche_D.TempPlant3)
mean(df_openspace_noche_D.TempPlant5)
mean(df_openspace_noche_D.TempPlant6)
mean(df_openspace_noche_D.TempPlant6_2)




TempPlant1   TempPlant2_1  TempPlant3_1  TempPlant4    TempPlant4_2  TempPlant5_1
TempPlant2   TempPlant3    TempPlant3_2  TempPlant4_1  TempPlant5    TempPlant6

mean(df_openspace_noche_C.TempPlant1)
mean(df_openspace_noche_C.TempPlant2_1)
mean(df_openspace_noche_C.TempPlant3_1)
mean(df_openspace_noche_C.TempPlant4)
mean(df_openspace_noche_C.TempPlant4_2)
mean(df_openspace_noche_C.TempPlant5_1)
mean(df_openspace_noche_C.TempPlant2)
mean(df_openspace_noche_C.TempPlant3)
mean(df_openspace_noche_C.TempPlant3_2)
mean(df_openspace_noche_C.TempPlant4_1)
mean(df_openspace_noche_C.TempPlant5)
mean(df_openspace_noche_C.TempPlant6)



### DIA ###


TempPlant1   TempPlant2    TempPlant2_2  TempPlant3    TempPlant3_2  TempPlant4_1  TempPlant4_3  TempPlant6
TempPlant1_1 TempPlant2_1  TempPlant2_3  TempPlant3_1  TempPlant4    TempPlant4_2  TempPlant5


mean(df_heating_dia_D.TempPlant1)
mean(df_heating_dia_D.TempPlant2)
mean(df_heating_dia_D.TempPlant2_2)
mean(df_heating_dia_D.TempPlant3)
mean(df_heating_dia_D.TempPlant3_2)
mean(df_heating_dia_D.TempPlant4_1)
mean(df_heating_dia_D.TempPlant4_3)
mean(df_heating_dia_D.TempPlant6)
mean(df_heating_dia_D.TempPlant1_1)
mean(df_heating_dia_D.TempPlant2_1)
mean(df_heating_dia_D.TempPlant2_3)
mean(df_heating_dia_D.TempPlant3_1)
mean(df_heating_dia_D.TempPlant4)
mean(df_heating_dia_D.TempPlant4_2)
mean(df_heating_dia_D.TempPlant5)


TempPlant1   TempPlant1_2  TempPlant3    TempPlant4    TempPlant5_1  TempPlant5_3  TempPlant6_1  TempPlant6_3
TempPlant1_1 TempPlant2    TempPlant3_1  TempPlant5    TempPlant5_2  TempPlant6    TempPlant6_2

mean(df_heating_dia_C.TempPlant1)
mean(df_heating_dia_C.TempPlant1_2)
mean(df_heating_dia_C.TempPlant3)
mean(df_heating_dia_C.TempPlant4)
mean(df_heating_dia_C.TempPlant5_1)
mean(df_heating_dia_C.TempPlant5_3)
mean(df_heating_dia_C.TempPlant6_1)
mean(df_heating_dia_C.TempPlant6_3)
mean(df_heating_dia_C.TempPlant1_1)
mean(df_heating_dia_C.TempPlant2)
mean(df_heating_dia_C.TempPlant3_1)
mean(df_heating_dia_C.TempPlant5)
mean(df_heating_dia_C.TempPlant5_2)
mean(df_heating_dia_C.TempPlant6)
mean(df_heating_dia_C.TempPlant6_2)

TempPlant1   TempPlant3    TempPlant3_2  TempPlant4    TempPlant5    TempPlant5_2  TempPlant5_4  TempPlant6_1
TempPlant2   TempPlant3_1  TempPlant3_3  TempPlant4_1  TempPlant5_1  TempPlant5_3  TempPlant6

mean(df_otc_dia_D.TempPlant1)
mean(df_otc_dia_D.TempPlant3)
mean(df_otc_dia_D.TempPlant3_2)
mean(df_otc_dia_D.TempPlant4)
mean(df_otc_dia_D.TempPlant5)
mean(df_otc_dia_D.TempPlant5_2)
mean(df_otc_dia_D.TempPlant5_4)
mean(df_otc_dia_D.TempPlant6_1)
mean(df_otc_dia_D.TempPlant2)
mean(df_otc_dia_D.TempPlant3_1)
mean(df_otc_dia_D.TempPlant3_3)
mean(df_otc_dia_D.TempPlant4_1)
mean(df_otc_dia_D.TempPlant5_1)
mean(df_otc_dia_D.TempPlant5_3)
mean(df_otc_dia_D.TempPlant6)



TempPlant1   TempPlant1_2  TempPlant2    TempPlant2_2  TempPlant3    TempPlant4_1  TempPlant6    TempPlant6_2
TempPlant1_1 TempPlant1_3  TempPlant2_1  TempPlant2_3  TempPlant4    TempPlant4_2  TempPlant6_1

mean(df_otc_dia_C.TempPlant1)
mean(df_otc_dia_C.TempPlant1_2)
mean(df_otc_dia_C.TempPlant2)
mean(df_otc_dia_C.TempPlant2_2)
mean(df_otc_dia_C.TempPlant3)
mean(df_otc_dia_C.TempPlant4_1)
mean(df_otc_dia_C.TempPlant6)
mean(df_otc_dia_C.TempPlant6_2)
mean(df_otc_dia_C.TempPlant1_1)
mean(df_otc_dia_C.TempPlant1_3)
mean(df_otc_dia_C.TempPlant2_1)
mean(df_otc_dia_C.TempPlant2_3)
mean(df_otc_dia_C.TempPlant4)
mean(df_otc_dia_C.TempPlant4_2)
mean(df_otc_dia_C.TempPlant6_1)


TempPlant1   TempPlant1_2  TempPlant2_1  TempPlant4    TempPlant5_1  TempPlant6_1
TempPlant1_1 TempPlant2    TempPlant3    TempPlant5    TempPlant6    TempPlant6_2


mean(df_openspace_dia_D.TempPlant1)
mean(df_openspace_dia_D.TempPlant1_2)
mean(df_openspace_dia_D.TempPlant2_1)
mean(df_openspace_dia_D.TempPlant4)
mean(df_openspace_dia_D.TempPlant5_1)
mean(df_openspace_dia_D.TempPlant6_1)
mean(df_openspace_dia_D.TempPlant1_1)
mean(df_openspace_dia_D.TempPlant2)
mean(df_openspace_dia_D.TempPlant3)
mean(df_openspace_dia_D.TempPlant5)
mean(df_openspace_dia_D.TempPlant6)
mean(df_openspace_dia_D.TempPlant6_2)




TempPlant1   TempPlant2_1  TempPlant3_1  TempPlant4    TempPlant4_2  TempPlant5_1
TempPlant2   TempPlant3    TempPlant3_2  TempPlant4_1  TempPlant5    TempPlant6

mean(df_openspace_dia_C.TempPlant1)
mean(df_openspace_dia_C.TempPlant2_1)
mean(df_openspace_dia_C.TempPlant3_1)
mean(df_openspace_dia_C.TempPlant4)
mean(df_openspace_dia_C.TempPlant4_2)
mean(df_openspace_dia_C.TempPlant5_1)
mean(df_openspace_dia_C.TempPlant2)
mean(df_openspace_dia_C.TempPlant3)
mean(df_openspace_dia_C.TempPlant3_2)
mean(df_openspace_dia_C.TempPlant4_1)
mean(df_openspace_dia_C.TempPlant5)
mean(df_openspace_dia_C.TempPlant6)













air_heating_noche=df_heating_noche_D.Air_temp_loc_1

air_otc_noche=df_otc_noche_D.Air_temp_loc

air_openspace_noche=df_openspace_noche_D.Air_temp_loc

 a=plot(air_heating_noche,seriestype = :scatter, legend = false, title = "noche heating");
 b=plot(air_otc_noche,seriestype = :scatter, legend = false, title = "noche otc");
 c=plot(air_openspace_noche,seriestype = :scatter, legend = false, title = "noche openspace");


air_heating_dia=df_heating_dia_D.Air_temp_loc_1
air_otc_dia=df_otc_dia_D.Air_temp_loc_3
air_openspace_dia=df_openspace_dia_D.Air_temp_loc

 a=plot(air_heating_dia,seriestype = :scatter, legend = false, title = "dia heating");
 b=plot(air_otc_dia,seriestype = :scatter, legend = false, title = "dia otc");
 c=plot(air_openspace_dia,seriestype = :scatter, legend = false, title = "diaopenspace");




plant_heating_dia=df_heating_dia_D.TempPlant1; 
plant_otc_dia=df_otc_dia_D.TempPlant1;
plant_openspace_dia=df_openspace_dia_D.TempPlant1;  

a=plot(plant_heating_dia,seriestype = :scatter, legend = false, title = L"dia heating");
b=plot(plant_otc_dia,seriestype = :scatter, legend = false, title = "dia otc");
c=plot(plant_openspace_dia,seriestype = :scatter, legend = false, title = L"dia openspace");
plot(a,b,c)




plant_heating_noche=df_heating_noche_D.TempPlant1; 
plant_otc_noche=df_otc_noche_D.TempPlant1;
plant_openspace_noche=df_openspace_noche_D.TempPlant1; 

a=plot(plant_heating_noche,seriestype = :scatter, legend = false, title = "noche heating");
b=plot(plant_otc_noche,seriestype = :scatter, legend = false, title = "noche otc");
c=plot(potc_above_10,otc_above_15,otc_below_0,seriestype = :hist, legend = false, title = "noche openspace"); 

histogram()



#MEANS

air_heating_dia_0=mean(df_heating_dia_D.Air_temp_loc)
air_heating_dia_1=mean(df_heating_dia_D.Air_temp_loc_1)
air_heating_dia_2=mean(df_heating_dia_D.Air_temp_loc_2)
air_heating_dia_3=mean(df_heating_dia_D.Air_temp_loc_3)
air_heating_dia_4=mean(df_heating_dia_D.Air_temp_loc_4)



air_otc_dia_0=mean(df_otc_dia_D.Air_temp_loc)
air_otc_dia_1=mean(df_otc_dia_D.Air_temp_loc_1)
air_otc_dia_2=mean(df_otc_dia_D.Air_temp_loc_2)
air_otc_dia_3=mean(df_otc_dia_D.Air_temp_loc_3)
air_otc_dia_4=mean(df_otc_dia_D.Air_temp_loc_4)


air_openspace_dia_0=mean(df_openspace_dia_D.Air_temp_loc)
air_openspace_dia_1=mean(df_openspace_dia_D.Air_temp_loc_1)
air_openspace_dia_2=mean(df_openspace_dia_D.Air_temp_loc_2)
air_openspace_dia_3=mean(df_openspace_dia_D.Air_temp_loc_3)



air_heating_noche_0=mean(df_heating_noche_D.Air_temp_loc)
air_heating_noche_1=mean(df_heating_noche_D.Air_temp_loc_1)
air_heating_noche_2=mean(df_heating_noche_D.Air_temp_loc_2)
air_heating_noche_3=mean(df_heating_noche_D.Air_temp_loc_3)
air_heating_noche_4=mean(df_heating_noche_D.Air_temp_loc_4)



air_otc_noche_0=mean(df_otc_noche_D.Air_temp_loc)
air_otc_noche_1=mean(df_otc_noche_D.Air_temp_loc_1)
air_otc_noche_2=mean(df_otc_noche_D.Air_temp_loc_2)
air_otc_noche_3=mean(df_otc_noche_D.Air_temp_loc_3)
air_otc_noche_4=mean(df_otc_noche_D.Air_temp_loc_4)


air_openspace_noche_0=mean(df_openspace_noche_D.Air_temp_loc)
air_openspace_noche_1=mean(df_openspace_noche_D.Air_temp_loc_1)
air_openspace_noche_2=mean(df_openspace_noche_D.Air_temp_loc_2)
air_openspace_noche_3=mean(df_openspace_noche_D.Air_temp_loc_3)


print("dia\n")
(air_heating_dia_0+air_heating_dia_1+air_heating_dia_2+air_heating_dia_3+air_heating_dia_4)/5
(air_otc_dia_0 + air_otc_dia_1+air_otc_dia_2+air_otc_dia_3+air_otc_dia_4)/5
(air_openspace_dia_0+air_openspace_dia_1+air_openspace_dia_2+air_openspace_dia_3)/4
print("noche\n")

(air_heating_noche_0+air_heating_noche_1+air_heating_noche_2+air_heating_noche_3+air_heating_noche_4)/5
(air_otc_noche_0 + air_otc_noche_1+air_otc_noche_2+air_otc_noche_3+air_otc_noche_4)/5
(air_openspace_noche_0+air_openspace_noche_1+air_openspace_noche_2+air_openspace_noche_3)/4

=#





