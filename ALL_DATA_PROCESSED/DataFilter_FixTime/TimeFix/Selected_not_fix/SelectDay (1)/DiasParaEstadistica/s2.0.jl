


using CSV, DataFrames, Plots, Impute
selected = ["11 C_Selected"  "15 C_Selected" "19 C_Selected" "23 C_Selected" "11 D_Selected" "15 D_Selected" "19 D_Selected" "23 D_Selected" "12 C_Selected" "16 C_Selected" "20 C_Selected" "25 C_Selected" "12 D_Selected" "16 D_Selected" "20 D_Selected" "25 D_Selected" "13 C_Selected" "17 C_Selected" "21 C_Selected" "13 D_Selected" "17 D_Selected" "21 D_Selected" "14 C_Selected" "18 C_Selected" "22 C_Selected" "14 D_Selected" "18 D_Selected" "22 D_Selected"]

days = ["2020-01-24" "2020-02-09" "2020-02-10" "2020-02-11" "2020-02-12" "2020-02-13" "2020-02-14" "2020-02-15" "2020-02-18" "2020-02-19" "2020-02-20" "2020-02-21" "2020-02-23" "2020-02-29" "2020-03-02" "2020-03-03" "2020-03-06" "2020-03-07" "2020-03-08"]

original_dir = pwd(); #remember your home!
global n=0;
global m = 0;
global l = 0;
global p = 0;


for w in selected
	 
	cd("$w")
		for x in days
	#heating
			cd("$x")
	y =  ["$x"*"_C_11" "$x"*"_C_12" "$x"*"_C_13" "$x"*"_C_14" "$x"*"_D_11" "$x"*"_D_12" "$x"*"_D_13" "$x"*"_D_14"]
		
		
		dir = y[1]
		cd("$dir");
	
		df_heating_C_dia1 = CSV.read("$x"*" Dia.csv");
		df_heating_C_noche1 = CSV.read("$x"*" Noche.csv");
		
		cd("..");
		
		dir = y[2]
		cd("$dir");
		df_heating_C_dia2 = CSV.read("$x"*" Dia.csv");
		df_heating_C_noche2 = CSV.read("$x"*" Noche.csv");

		cd("..");

		dir = y[3]
		cd("$dir");
		df_heating_C_dia3 = CSV.read("$x"*" Dia.csv");
		df_heating_C_noche3 = CSV.read("$x"*" Noche.csv");	
		cd("..");

		dir = y[4]
		cd("$dir");
		df_heating_C_dia4 = CSV.read("$x"*" Dia.csv");
		df_heating_C_noche4 = CSV.read("$x"*" Noche.csv");		
		cd("..");

		dir = y[5]
		cd("$dir");
		df_heating_D_dia1 = CSV.read("$x"*" Dia.csv");
		df_heating_D_noche1 = CSV.read("$x"*" Noche.csv");
		
		cd("..");

		dir = y[6]
		cd("$dir");
		df_heating_D_dia2 = CSV.read("$x"*" Dia.csv");
		df_heating_D_noche2 = CSV.read("$x"*" Noche.csv");

		cd("..");

		dir = y[7]
		cd("$dir");
		df_heating_D_dia3 = CSV.read("$x"*" Dia.csv");
		df_heating_D_noche3 = CSV.read("$x"*" Noche.csv");	

		cd("..");
		dir = y[8]
		cd("$dir");
		df_heating_D_dia4 = CSV.read("$x"*" Dia.csv");
		df_heating_D_noche4 = CSV.read("$x"*" Noche.csv");	
	
		if n == 0		
			df_heating_D_dia_1 = join(df_heating_D_dia1[:,1:4], df_heating_D_dia2[:,1:4], on=:time, kind = :outer, makeunique=true);
			df_heating_D_dia_1 = join(df_heating_D_dia_1, df_heating_D_dia3[:,1:4], on=:time, kind = :outer, makeunique=true);
			global df_heating_D_dia_1 = join(df_heating_D_dia_1, df_heating_D_dia4[:,1:4], on=:time, kind = :outer, makeunique=true);
		else
			df_heating_D_dia_2 = join(df_heating_D_dia1[:,1:4], df_heating_D_dia2[:,1:4], on=:time, kind = :outer, makeunique=true);
			df_heating_D_dia_2 = join(df_heating_D_dia_2, df_heating_D_dia3[:,1:4], on=:time, kind = :outer, makeunique=true);
			global df_heating_D_dia_2 = join(df_heating_D_dia_2, df_heating_D_dia4[:,1:4], on=:time, kind = :outer, makeunique=true);
				if m == 0
					global df_heating_D_dia = vcat(df_heating_D_dia_1,df_heating_D_dia_2);
					global m = 1;			
				else 
					global df_heating_D_dia = vcat(df_heating_D_dia,df_heating_D_dia_2);
				end			
		end

	

		if n == 0		
			df_heating_D_noche_1 = join(df_heating_D_noche1[:,1:4], df_heating_D_noche2[:,1:4], on=:time, kind = :outer, makeunique=true);
			df_heating_D_noche_1 = join(df_heating_D_noche_1, df_heating_D_noche3[:,1:4], on=:time, kind = :outer, makeunique=true);
			global df_heating_D_noche_1 = join(df_heating_D_noche_1, df_heating_D_noche4[:,1:4], on=:time, kind = :outer, makeunique=true);
		else
			df_heating_D_noche_2 = join(df_heating_D_noche1[:,1:4], df_heating_D_noche2[:,1:4], on=:time, kind = :outer, makeunique=true);
			df_heating_D_noche_2 = join(df_heating_D_noche_2, df_heating_D_noche3[:,1:4], on=:time, kind = :outer, makeunique=true);
			global df_heating_D_noche_2 = join(df_heating_D_noche_2, df_heating_D_noche4[:,1:4], on=:time, kind = :outer, makeunique=true);
				if m == 1
					global df_heating_D_noche  = vcat(df_heating_D_noche_1,df_heating_D_noche_2);
					global m = 2;
				
				else 
					global df_heating_D_noche  = vcat(df_heating_D_noche ,df_heating_D_noche_2);
				end			
		end



		if n == 0		
			df_heating_C_dia_1 = join(df_heating_C_dia1[:,1:4], df_heating_C_dia2[:,1:4], on=:time, kind = :outer, makeunique=true);
			df_heating_C_dia_1 = join(df_heating_C_dia_1, df_heating_C_dia3[:,1:4], on=:time, kind = :outer, makeunique=true);
			global df_heating_C_dia_1 = join(df_heating_C_dia_1, df_heating_C_dia4[:,1:4], on=:time, kind = :outer, makeunique=true);
		else
			df_heating_C_dia_2 = join(df_heating_C_dia1[:,1:4], df_heating_C_dia2[:,1:4], on=:time, kind = :outer, makeunique=true);
			df_heating_C_dia_2 = join(df_heating_C_dia_2, df_heating_C_dia3[:,1:4], on=:time, kind = :outer, makeunique=true);
			global df_heating_C_dia_2 = join(df_heating_C_dia_2, df_heating_C_dia4[:,1:4], on=:time, kind = :outer, makeunique=true);
				if m == 2
					global df_heating_C_dia = vcat(df_heating_C_dia_1,df_heating_C_dia_2);
					global m = 3;
				
				else 
					global df_heating_C_dia = vcat(df_heating_C_dia,df_heating_C_dia_2);
				end			
		end

	

		if n == 0		
			df_heating_C_noche_1 = join(df_heating_C_noche1[:,1:4], df_heating_C_noche2[:,1:4], on=:time, kind = :outer, makeunique=true);
			df_heating_C_noche_1 = join(df_heating_C_noche_1, df_heating_C_noche3[:,1:4], on=:time, kind = :outer, makeunique=true);
			global df_heating_C_noche_1 = join(df_heating_C_noche_1, df_heating_C_noche4[:,1:4], on=:time, kind = :outer, makeunique=true);
		else
			df_heating_C_noche_2 = join(df_heating_C_noche1[:,1:4], df_heating_C_noche2[:,1:4], on=:time, kind = :outer, makeunique=true);
			df_heating_C_noche_2 = join(df_heating_C_noche_2, df_heating_C_noche3[:,1:4], on=:time, kind = :outer, makeunique=true);
			global df_heating_C_noche_2 = join(df_heating_C_noche_2, df_heating_C_noche4[:,1:4], on=:time, kind = :outer, makeunique=true);
				if m == 3
					global df_heating_C_noche  = vcat(df_heating_C_noche_1,df_heating_C_noche_2);
					global m = 4;
				
				else 
					global df_heating_C_noche  = vcat(df_heating_C_noche ,df_heating_C_noche_2);
				end			
		end


cd(original_dir);
	#otc
cd("$x")
cd("OTC")
	y =  ["$x"*"_C_16" "$x"*"_C_17" "$x"*"_C_18" "$x"*"_C_19" "$x"*"_D_16" "$x"*"_D_17" "$x"*"_D_18" "$x"*"_D_19"]
		
		
		dir = y[1]
		cd("$dir");
	
		df_otc_C_dia1 = CSV.read("$x"*" Dia.csv");
		df_otc_C_noche1 = CSV.read("$x"*" Noche.csv");
		
		cd("..");
		
		dir = y[2]
		cd("$dir");
		df_otc_C_dia2 = CSV.read("$x"*" Dia.csv");
		df_otc_C_noche2 = CSV.read("$x"*" Noche.csv");

		cd("..");

		dir = y[3]
		cd("$dir");
		df_otc_C_dia3 = CSV.read("$x"*" Dia.csv");
		df_otc_C_noche3 = CSV.read("$x"*" Noche.csv");	
		cd("..");

		dir = y[4]
		cd("$dir");
		df_otc_C_dia4 = CSV.read("$x"*" Dia.csv");
		df_otc_C_noche4 = CSV.read("$x"*" Noche.csv");		
		cd("..");

		dir = y[5]
		cd("$dir");
		df_otc_D_dia1 = CSV.read("$x"*" Dia.csv");
		df_otc_D_noche1 = CSV.read("$x"*" Noche.csv");
		
		cd("..");

		dir = y[6]
		cd("$dir");
		df_otc_D_dia2 = CSV.read("$x"*" Dia.csv");
		df_otc_D_noche2 = CSV.read("$x"*" Noche.csv");

		cd("..");

		dir = y[7]
		cd("$dir");
		df_otc_D_dia3 = CSV.read("$x"*" Dia.csv");
		df_otc_D_noche3 = CSV.read("$x"*" Noche.csv");	

		cd("..");
		dir = y[8]
		cd("$dir");
		df_otc_D_dia4 = CSV.read("$x"*" Dia.csv");
		df_otc_D_noche4 = CSV.read("$x"*" Noche.csv");	
	
		if n == 0		
			df_otc_D_dia_1 = join(df_otc_D_dia1[:,1:4], df_otc_D_dia2[:,1:4], on=:time, kind = :outer, makeunique=true);
			df_otc_D_dia_1 = join(df_otc_D_dia_1, df_otc_D_dia3[:,1:4], on=:time, kind = :outer, makeunique=true);
			global df_otc_D_dia_1 = join(df_otc_D_dia_1, df_otc_D_dia4[:,1:4], on=:time, kind = :outer, makeunique=true);
		else
			df_otc_D_dia_2 = join(df_otc_D_dia1[:,1:4], df_otc_D_dia2[:,1:4], on=:time, kind = :outer, makeunique=true);
			df_otc_D_dia_2 = join(df_otc_D_dia_2, df_otc_D_dia3[:,1:4], on=:time, kind = :outer, makeunique=true);
			global df_otc_D_dia_2 = join(df_otc_D_dia_2, df_otc_D_dia4[:,1:4], on=:time, kind = :outer, makeunique=true);
				if l == 0
					global df_otc_D_dia = vcat(df_otc_D_dia_1,df_otc_D_dia_2);
					global l = 1;			
				else 
					global df_otc_D_dia = vcat(df_otc_D_dia,df_otc_D_dia_2);
				end			
		end

	

		if n == 0		
			df_otc_D_noche_1 = join(df_otc_D_noche1[:,1:4], df_otc_D_noche2[:,1:4], on=:time, kind = :outer, makeunique=true);
			df_otc_D_noche_1 = join(df_otc_D_noche_1, df_otc_D_noche3[:,1:4], on=:time, kind = :outer, makeunique=true);
			global df_otc_D_noche_1 = join(df_otc_D_noche_1, df_otc_D_noche4[:,1:4], on=:time, kind = :outer, makeunique=true);
		else
			df_otc_D_noche_2 = join(df_otc_D_noche1[:,1:4], df_otc_D_noche2[:,1:4], on=:time, kind = :outer, makeunique=true);
			df_otc_D_noche_2 = join(df_otc_D_noche_2, df_otc_D_noche3[:,1:4], on=:time, kind = :outer, makeunique=true);
			global df_otc_D_noche_2 = join(df_otc_D_noche_2, df_otc_D_noche4[:,1:4], on=:time, kind = :outer, makeunique=true);
				if l == 1
					global df_otc_D_noche  = vcat(df_otc_D_noche_1,df_otc_D_noche_2);
					global l = 2;
				
				else 
					global df_otc_D_noche  = vcat(df_otc_D_noche ,df_otc_D_noche_2);
				end			
		end



		if n == 0		
			df_otc_C_dia_1 = join(df_otc_C_dia1[:,1:4], df_otc_C_dia2[:,1:4], on=:time, kind = :outer, makeunique=true);
			df_otc_C_dia_1 = join(df_otc_C_dia_1, df_otc_C_dia3[:,1:4], on=:time, kind = :outer, makeunique=true);
			global df_otc_C_dia_1 = join(df_otc_C_dia_1, df_otc_C_dia4[:,1:4], on=:time, kind = :outer, makeunique=true);
		else
			df_otc_C_dia_2 = join(df_otc_C_dia1[:,1:4], df_otc_C_dia2[:,1:4], on=:time, kind = :outer, makeunique=true);
			df_otc_C_dia_2 = join(df_otc_C_dia_2, df_otc_C_dia3[:,1:4], on=:time, kind = :outer, makeunique=true);
			global df_otc_C_dia_2 = join(df_otc_C_dia_2, df_otc_C_dia4[:,1:4], on=:time, kind = :outer, makeunique=true);
				if l == 2
					global df_otc_C_dia = vcat(df_otc_C_dia_1,df_otc_C_dia_2);
					global l = 3;
				
				else 
					global df_otc_C_dia = vcat(df_otc_C_dia,df_otc_C_dia_2);
				end			
		end

	

		if n == 0		
			df_otc_C_noche_1 = join(df_otc_C_noche1[:,1:4], df_otc_C_noche2[:,1:4], on=:time, kind = :outer, makeunique=true);
			df_otc_C_noche_1 = join(df_otc_C_noche_1, df_otc_C_noche3[:,1:4], on=:time, kind = :outer, makeunique=true);
			global df_otc_C_noche_1 = join(df_otc_C_noche_1, df_otc_C_noche4[:,1:4], on=:time, kind = :outer, makeunique=true);
		else
			df_otc_C_noche_2 = join(df_otc_C_noche1[:,1:4], df_otc_C_noche2[:,1:4], on=:time, kind = :outer, makeunique=true);
			df_otc_C_noche_2 = join(df_otc_C_noche_2, df_otc_C_noche3[:,1:4], on=:time, kind = :outer, makeunique=true);
			global df_otc_C_noche_2 = join(df_otc_C_noche_2, df_otc_C_noche4[:,1:4], on=:time, kind = :outer, makeunique=true);
				if l == 3
					global df_otc_C_noche  = vcat(df_otc_C_noche_1,df_otc_C_noche_2);
					global l = 4;
				
				else 
					global df_otc_C_noche  = vcat(df_otc_C_noche ,df_otc_C_noche_2);
				end			
		end


cd(original_dir);


	#openspace
cd("$x")
cd("OPENSPACE")
	y =  ["$x"*"_C_21" "$x"*"_C_23" "$x"*"_C_25" "$x"*"_D_21" "$x"*"_D_23" "$x"*"_D_25"]
		
		
		dir = y[1]
		cd("$dir");
	
		df_openspace_C_dia1 = CSV.read("$x"*" Dia.csv");
		df_openspace_C_noche1 = CSV.read("$x"*" Noche.csv");
		
		cd("..");
		
		dir = y[2]
		cd("$dir");
		df_openspace_C_dia2 = CSV.read("$x"*" Dia.csv");
		df_openspace_C_noche2 = CSV.read("$x"*" Noche.csv");

		cd("..");

		dir = y[3]
		cd("$dir");
		df_openspace_C_dia3 = CSV.read("$x"*" Dia.csv");
		df_openspace_C_noche3 = CSV.read("$x"*" Noche.csv");	
		cd("..");

		dir = y[4]
		cd("$dir");
		df_openspace_D_dia1 = CSV.read("$x"*" Dia.csv");
		df_openspace_D_noche1 = CSV.read("$x"*" Noche.csv");		
		cd("..");

		dir = y[5]
		cd("$dir");
		df_openspace_D_dia2 = CSV.read("$x"*" Dia.csv");
		df_openspace_D_noche2 = CSV.read("$x"*" Noche.csv");
		
		cd("..");

		dir = y[6]
		cd("$dir");
		df_openspace_D_dia3 = CSV.read("$x"*" Dia.csv");
		df_openspace_D_noche3 = CSV.read("$x"*" Noche.csv");

	
	
		if n == 0		
			df_openspace_D_dia_1 = join(df_openspace_D_dia1[:,1:4], df_openspace_D_dia2[:,1:4], on=:time, kind = :outer, makeunique=true);
			global df_openspace_D_dia_1 = join(df_openspace_D_dia_1, df_openspace_D_dia3[:,1:4], on=:time, kind = :outer, makeunique=true);
			
		else
			df_openspace_D_dia_2 = join(df_openspace_D_dia1[:,1:4], df_openspace_D_dia2[:,1:4], on=:time, kind = :outer, makeunique=true);
			global df_openspace_D_dia_2 = join(df_openspace_D_dia_2, df_openspace_D_dia3[:,1:4], on=:time, kind = :outer, makeunique=true);
			
				if p == 0
					global df_openspace_D_dia = vcat(df_openspace_D_dia_1,df_openspace_D_dia_2);
					global p = 1;			
				else 
					global df_openspace_D_dia = vcat(df_openspace_D_dia,df_openspace_D_dia_2);
				end			
		end

	

		if n == 0		
			df_openspace_D_noche_1 = join(df_openspace_D_noche1[:,1:4], df_openspace_D_noche2[:,1:4], on=:time, kind = :outer, makeunique=true);
			global df_openspace_D_noche_1 = join(df_openspace_D_noche_1, df_openspace_D_noche3[:,1:4], on=:time, kind = :outer, makeunique=true);
			
		else
			df_openspace_D_noche_2 = join(df_openspace_D_noche1[:,1:4], df_openspace_D_noche2[:,1:4], on=:time, kind = :outer, makeunique=true);
			global df_openspace_D_noche_2 = join(df_openspace_D_noche_2, df_openspace_D_noche3[:,1:4], on=:time, kind = :outer, makeunique=true);
	
				if p == 1
					global df_openspace_D_noche  = vcat(df_openspace_D_noche_1,df_openspace_D_noche_2);
					global p = 2;
				
				else 
					global df_openspace_D_noche  = vcat(df_openspace_D_noche ,df_openspace_D_noche_2);
				end			
		end



		if n == 0		
			df_openspace_C_dia_1 = join(df_openspace_C_dia1[:,1:4], df_openspace_C_dia2[:,1:4], on=:time, kind = :outer, makeunique=true);
			global df_openspace_C_dia_1 = join(df_openspace_C_dia_1, df_openspace_C_dia3[:,1:4], on=:time, kind = :outer, makeunique=true);
			
		else
			df_openspace_C_dia_2 = join(df_openspace_C_dia1[:,1:4], df_openspace_C_dia2[:,1:4], on=:time, kind = :outer, makeunique=true);
			global df_openspace_C_dia_2 = join(df_openspace_C_dia_2, df_openspace_C_dia3[:,1:4], on=:time, kind = :outer, makeunique=true);
			
				if p == 2
					global df_openspace_C_dia = vcat(df_openspace_C_dia_1,df_openspace_C_dia_2);
					global p = 3;
				
				else 
					global df_openspace_C_dia = vcat(df_openspace_C_dia,df_openspace_C_dia_2);
				end			
		end

	

		if n == 0		
			df_openspace_C_noche_1 = join(df_openspace_C_noche1[:,1:4], df_openspace_C_noche2[:,1:4], on=:time, kind = :outer, makeunique=true);
			global df_openspace_C_noche_1 = join(df_openspace_C_noche_1, df_openspace_C_noche3[:,1:4], on=:time, kind = :outer, makeunique=true);
			
		else
			df_openspace_C_noche_2 = join(df_openspace_C_noche1[:,1:4], df_openspace_C_noche2[:,1:4], on=:time, kind = :outer, makeunique=true);
			global df_openspace_C_noche_2 = join(df_openspace_C_noche_2, df_openspace_C_noche3[:,1:4], on=:time, kind = :outer, makeunique=true);
			
				if p == 3
					global df_openspace_C_noche  = vcat(df_openspace_C_noche_1,df_openspace_C_noche_2);
					global p = 4;
				
				else 
					global df_openspace_C_noche  = vcat(df_openspace_C_noche ,df_openspace_C_noche_2);
				end			
		end


cd(original_dir);



global n=1	
end

#interpolation 

df_heating_C_dia_int = Impute.interp(df_heating_C_dia[:,2:end]) |> Impute.locf() |> Impute.nocb();
df_heating_C_dia_int = hcat(df_heating_C_dia.time, df_heating_C_dia_int);

df_heating_C_noche_int = Impute.interp(df_heating_C_noche[:,2:end]) |> Impute.locf() |> Impute.nocb();
df_heating_C_noche_int = hcat(df_heating_C_noche.time, df_heating_C_noche_int);

df_heating_D_dia_int = Impute.interp(df_heating_D_dia[:,2:end]) |> Impute.locf() |> Impute.nocb();
df_heating_D_dia_int = hcat(df_heating_D_dia.time, df_heating_D_dia_int);

df_heating_D_noche_int = Impute.interp(df_heating_D_noche[:,2:end]) |> Impute.locf() |> Impute.nocb();
df_heating_D_noche_int = hcat(df_heating_D_noche.time, df_heating_D_noche_int);


names!(df_heating_C_dia_int,[:time,:H1,:H2,:H3,:H4,:H5,:H6,:H7,:H8,:H9,:H10,:H11,:H12]);
names!(df_heating_C_noche_int,[:time,:H1,:H2,:H3,:H4,:H5,:H6,:H7,:H8,:H9,:H10,:H11,:H12]);
names!(df_heating_D_dia_int,[:time,:H1,:H2,:H3,:H4,:H5,:H6,:H7,:H8,:H9,:H10,:H11,:H12]);
names!(df_heating_D_noche_int,[:time,:H1,:H2,:H3,:H4,:H5,:H6,:H7,:H8,:H9,:H10,:H11,:H12]);





df_otc_C_dia_int = Impute.interp(df_otc_C_dia[:,2:end]) |> Impute.locf() |> Impute.nocb();
df_otc_C_dia_int = hcat(df_otc_C_dia.time, df_otc_C_dia_int);

df_otc_C_noche_int = Impute.interp(df_otc_C_noche[:,2:end]) |> Impute.locf() |> Impute.nocb();
df_otc_C_noche_int = hcat(df_otc_C_noche.time, df_otc_C_noche_int);

df_otc_D_dia_int = Impute.interp(df_otc_D_dia[:,2:end]) |> Impute.locf() |> Impute.nocb();
df_otc_D_dia_int = hcat(df_otc_D_dia.time, df_otc_D_dia_int);

df_otc_D_noche_int = Impute.interp(df_otc_D_noche[:,2:end]) |> Impute.locf() |> Impute.nocb();
df_otc_D_noche_int = hcat(df_otc_D_noche.time, df_otc_D_noche_int);

names!(df_otc_C_dia_int,[:time,:O1,:O2,:O3,:O4,:O5,:O6,:O7,:O8,:O9,:O10,:O11,:O12]);
names!(df_otc_C_noche_int,[:time,:O1,:O2,:O3,:O4,:O5,:O6,:O7,:O8,:O9,:O10,:O11,:O12]);
names!(df_otc_D_dia_int,[:time,:O1,:O2,:O3,:O4,:O5,:O6,:O7,:O8,:O9,:O10,:O11,:O12]);
names!(df_otc_D_noche_int,[:time,:O1,:O2,:O3,:O4,:O5,:O6,:O7,:O8,:O9,:O10,:O11,:O12]);


df_openspace_C_dia_int = Impute.interp(df_openspace_C_dia[:,2:end]) |> Impute.locf() |> Impute.nocb();
df_openspace_C_dia_int = hcat(df_openspace_C_dia.time, df_openspace_C_dia_int);

df_openspace_C_noche_int = Impute.interp(df_openspace_C_noche[:,2:end]) |> Impute.locf() |> Impute.nocb();
df_openspace_C_noche_int = hcat(df_openspace_C_noche.time, df_openspace_C_noche_int);

df_openspace_D_dia_int = Impute.interp(df_openspace_D_dia[:,2:end]) |> Impute.locf() |> Impute.nocb();
df_openspace_D_dia_int = hcat(df_openspace_D_dia.time, df_openspace_D_dia_int);

df_openspace_D_noche_int = Impute.interp(df_openspace_D_noche[:,2:end]) |> Impute.locf() |> Impute.nocb();
df_openspace_D_noche_int = hcat(df_openspace_D_noche.time, df_openspace_D_noche_int);

names!(df_openspace_C_dia_int,[:time,:OS1,:OS2,:OS3,:OS4,:OS5,:OS6,:OS7,:OS8,:OS9]);
names!(df_openspace_C_noche_int,[:time,:OS1,:OS2,:OS3,:OS4,:OS5,:OS6,:OS7,:OS8,:OS9]);
names!(df_openspace_D_dia_int,[:time,:OS1,:OS2,:OS3,:OS4,:OS5,:OS6,:OS7,:OS8,:OS9]);
names!(df_openspace_D_noche_int,[:time,:OS1,:OS2,:OS3,:OS4,:OS5,:OS6,:OS7,:OS8,:OS9]);


df_dia_C = join(df_heating_C_dia_int,df_otc_C_dia_int ,on=:time, kind = :outer);
df_dia_C = join(df_dia_C ,df_openspace_C_dia_int ,on=:time, kind = :outer);

df_dia_D = join(df_heating_D_dia_int,df_otc_D_dia_int ,on=:time, kind = :outer);
df_dia_D = join(df_dia_D ,df_openspace_D_dia_int ,on=:time, kind = :outer);

df_noche_C = join(df_heating_C_noche_int,df_otc_C_noche_int ,on=:time, kind = :outer);
df_noche_C = join(df_noche_C ,df_openspace_C_noche_int ,on=:time, kind = :outer);

df_noche_D = join(df_heating_D_noche_int,df_otc_D_noche_int ,on=:time, kind = :outer);
df_noche_D = join(df_noche_D ,df_openspace_D_noche_int ,on=:time, kind = :outer);





CSV.write("df_dia_D.csv", df_dia_D);
CSV.write("df_dia_C.csv", df_dia_C);

CSV.write("df_noche_D.csv", df_noche_D);
CSV.write("df_noche_C.csv", df_noche_C);





#=




names!(df_heating_C_dia,[:time,:H1,:H2,:H3,:H4,:H5,:H6,:H7,:H8,:H9,:H10,:H11,:H12]);
names!(df_heating_C_noche,[:time,:H1,:H2,:H3,:H4,:H5,:H6,:H7,:H8,:H9,:H10,:H11,:H12]);
names!(df_heating_D_dia,[:time,:H1,:H2,:H3,:H4,:H5,:H6,:H7,:H8,:H9,:H10,:H11,:H12]);
names!(df_heating_D_noche,[:time,:H1,:H2,:H3,:H4,:H5,:H6,:H7,:H8,:H9,:H10,:H11,:H12]);




names!(df_otc_C_dia,[:time,:O1,:O2,:O3,:O4,:O5,:O6,:O7,:O8,:O9,:O10,:O11,:O12]);
names!(df_otc_C_noche,[:time,:O1,:O2,:O3,:O4,:O5,:O6,:O7,:O8,:O9,:O10,:O11,:O12]);
names!(df_otc_D_dia,[:time,:O1,:O2,:O3,:O4,:O5,:O6,:O7,:O8,:O9,:O10,:O11,:O12]);
names!(df_otc_D_noche,[:time,:O1,:O2,:O3,:O4,:O5,:O6,:O7,:O8,:O9,:O10,:O11,:O12]);



names!(df_openspace_C_dia,[:time,:OS1,:OS2,:OS3,:OS4,:OS5,:OS6,:OS7,:OS8,:OS9]);
names!(df_openspace_C_noche,[:time,:OS1,:OS2,:OS3,:OS4,:OS5,:OS6,:OS7,:OS8,:OS9]);
names!(df_openspace_D_dia,[:time,:OS1,:OS2,:OS3,:OS4,:OS5,:OS6,:OS7,:OS8,:OS9]);
names!(df_openspace_D_noche,[:time,:OS1,:OS2,:OS3,:OS4,:OS5,:OS6,:OS7,:OS8,:OS9]);


df_dia_C = join(df_heating_C_dia,df_otc_C_dia ,on=:time, kind = :outer);
df_dia_C = join(df_dia_C ,df_openspace_C_dia ,on=:time, kind = :outer);

df_dia_D = join(df_heating_D_dia,df_otc_D_dia ,on=:time, kind = :outer);
df_dia_D = join(df_dia_D ,df_openspace_D_dia ,on=:time, kind = :outer);

df_noche_C = join(df_heating_C_noche,df_otc_C_noche ,on=:time, kind = :outer);
df_noche_C = join(df_noche_C ,df_openspace_C_noche ,on=:time, kind = :outer);

df_noche_D = join(df_heating_D_noche,df_otc_D_noche ,on=:time, kind = :outer);
df_noche_D = join(df_noche_D ,df_openspace_D_noche ,on=:time, kind = :outer);




=#

















#will save files.csv

try
mkdir("DataSets");
cd("DataSets");
mkdir("Heating");
mkdir("OTC");
mkdir("OpenSpace");
cd(original_dir);
catch
end

cd("DataSets");
cd("Heating");
CSV.write("heating_C_Dia.csv", df_heating_C_dia_int);
CSV.write("heating_C_Noche.csv", df_heating_C_noche_int);
CSV.write("heating_D_Dia.csv", df_heating_D_dia_int);
CSV.write("heating_D_Noche.csv", df_heating_D_noche_int);
cd("..");
cd("OTC");
CSV.write("OTC_C_Dia.csv", df_otc_C_dia_int);
CSV.write("OTC_C_Noche.csv", df_otc_C_noche_int);
CSV.write("OTC_D_Dia.csv", df_otc_D_dia_int);
CSV.write("OTC_D_Noche.csv", df_otc_D_noche_int);
cd("..");
cd("OpenSpace");
CSV.write("OpenSpace_C_Dia.csv", df_openspace_C_dia_int);
CSV.write("OpenSpace_C_Noche.csv", df_openspace_C_noche_int);
CSV.write("OpenSpace_D_Dia.csv", df_openspace_D_dia_int);
CSV.write("OpenSpace_D_Noche.csv", df_openspace_D_noche_int);




cd(original_dir); #return home!



