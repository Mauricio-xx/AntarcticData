#v1.3 

#releases 1.3:

#new function!!
#Analayze(node,group,plant)
#create a new frame with only D or C plants for specifical group and node


#releases 1.2:

#unlimeted nodes can be precessed using AllFramesNotFilter("frame"). "frame" can be dfb or dfs 
#data is organized in directories "data not filter ". Name of the directory depend of NodeID
#Plots are organized in directories "img not filter". Name of the directory depend of NodeID


#unlimeted nodes can be precessed and data is filtred using FilterAllFrames("frame"). "frame" only can be dfb!
#data is organized in directories "data filter ". Name of the directory depend of NodeID
#Plots are organized in directorie "img filter". Name of the directory depend of NodeID


#old function(v1.0) also can works!


using DataFrames;
using CSV;
using Dates;
using Plots;
using Statistics;

dfbiolpattern = DataFrame(Date=String[], NodeID=Int16[], FrameID = Int8[], MeasurementCounter = Int16[], PlantTemp1=Float32[], PlantTemp2=Float32[], PlantTemp3=Float32[], PlantTemp4=Float32[], PlantTemp5=Float32[], PlantTemp6=Float32[], AirTempLoc=Float32[], Humidity=Float32[], AirTemp=Float32[]);
dfsyspattern  = DataFrame(Date=String[], NodeID=Int16[], FrameID = Int8[], MeasurementCounter = Int16[], SystemVoltage=Int16[], CoreTemperature=Int16[],
EI2C=Int8[], ECAN=Int8[], EFAT=Int8[], LEC=Int8[], TEC=Int8[], REC = Int8[]);


dfb = dfbiolpattern;
dfs = dfsyspattern;
let
  dfbiol = dfbiolpattern;
  dfsys  = dfsyspattern;
  dir = readdir(pwd());				#read directory

 for i in dir
	str = SubString(i,1:5);				#biol or sys file?
		if str == "dfbio"
			dfi=  CSV.read("$i");	#read $i.csv (DEPEND OF DIRECTORY!)
            dfbiol = [dfbiol; dfi];			#put data dfi in dfbiol
		end

		if str == "dfsys"
			dfi=  CSV.read("$i");	#read $i.csv (DEPEND OF DIRECTORY!)
            dfsys = [dfsys; dfi];			#put data dfi in dfsys
		end
	end

	global dfb = dfbiol;				#define global variables
	global dfs = dfsys;
end






#########################################
#### old functions also can works... ####
#########################################


function nodeframesummary(frame, NodeID)

nn = size(frame);

if length(frame) == 13			

	if nn[2] == 13
		d1 = frame[(frame.FrameID .==16) .& (frame.NodeID .==NodeID), 1:4];
		d2 = frame[(frame.FrameID .==17) .& (frame.NodeID .==NodeID), [1, 5,6,7] ];
		d3 = frame[(frame.FrameID .==18) .& (frame.NodeID .==NodeID), [1, 8,9,10]];
		d4 = frame[(frame.FrameID .==19) .& (frame.NodeID .==NodeID), [1, 11,12,13]];
        	dfb = join(d1,d2, on = :Date);
		dfb = join(dfb,d3, on = :Date);
		dfb = join(dfb,d4, on = :Date);
		return describe(dfb);dfb

    	end



	if nn[2] == 12
		d1 = frame[(frame.FrameID .==16) .& (frame.NodeID .==NodeID), 1:7];		
	    	d2 = frame[(frame.FrameID .==17) .& (frame.NodeID .==NodeID), [1, 8]];
		d3 = frame[(frame.FrameID .==18) .& (frame.NodeID .==NodeID), [1, 9]];
		d4 = frame[(frame.FrameID .==19) .& (frame.NodeID .==NodeID), [1, 10]];
        	dfs = join(d1,d2, on = :Date);
		dfs = join(dfs,d3, on = :Date);
		dfs = join(dfs,d4, on = :Date);
		return describe(dfs);
	end
end

end


function nodeframe(frame, NodeID)

nn = size(frame);
	if nn[2] == 13
        	d1 = frame[(frame.FrameID .==16) .& (frame.NodeID .==NodeID), 1:4];
	   	d2 = frame[(frame.FrameID .==17) .& (frame.NodeID .==NodeID), [1,5,6,7]];
        	d3 = frame[(frame.FrameID .==18) .& (frame.NodeID .==NodeID), [1,8,9,10]];
		d4 = frame[(frame.FrameID .==19) .& (frame.NodeID .==NodeID), [1,11,12,13]];
        	d5 = frame[(frame.FrameID .==17) .& (frame.NodeID .==NodeID), [1,13]];
        	dfb = join(d1,d2, on = :Date);				#do magic 			
		dfb = join(dfb,d3, on = :Date);				#more magic
		dfb = join(dfb,d4, on = :Date);				#and more
        	dfb = join(dfb,d5, on = :Date, makeunique=true);	#end of the show
	return (dfb);							#return dfb
    	end

	if nn[2] == 12
		d1 = frame[(frame.FrameID .==16) .& (frame.NodeID .==NodeID), 1:4];
		d2 = frame[(frame.FrameID .==17) .& (frame.NodeID .==NodeID), [1,5,6,7]];
		d3 = frame[(frame.FrameID .==18) .& (frame.NodeID .==NodeID), [1,8,9,10]];
		d4 = frame[(frame.FrameID .==19) .& (frame.NodeID .==NodeID), [1,11,12]];
		#d5 = frame[(frame.FrameID .==17) .& (frame.NodeID .==NodeID), [1,13]];
		dfs = join(d1,d2, on = :Date);				#do magic 
		dfs = join(dfs,d3, on = :Date);				#more magic
		dfs = join(dfs,d4, on = :Date, makeunique=true);	#and more
		return (dfs);						#end of the show					 
	end


end




###################################################################
############################# NEW CODE ############################
###################################################################  		

#human explain: 
#read all sheet, do magic, put all on individual directories, next we will cooking nice_plots.pdf and data.csv for biologist.xlsx



function AllFramesNotFilter(frame)



nn = size(frame);					#we need know if data is biological or if is about the system



	if nn[2] == 13					#for biologic data
		
		Nodes_dfb = unique(dfb.NodeID);			##search all nodes in dfb
		nNodes_dfb = length(Nodes_dfb);			##how unique elements are

		for x = 1:nNodes_dfb				#read files to all nodes
	
		NodeID = Nodes_dfb[x];				
        
		d1 = frame[(frame.FrameID .==16) .& (frame.NodeID .==NodeID), 1:4];
	    	d2 = frame[(frame.FrameID .==17) .& (frame.NodeID .==NodeID), [1,5,6,7]];
        	d3 = frame[(frame.FrameID .==18) .& (frame.NodeID .==NodeID), [1,8,9,10]];
		d4 = frame[(frame.FrameID .==19) .& (frame.NodeID .==NodeID), [1,11,12,13]];
        	d5 = frame[(frame.FrameID .==17) .& (frame.NodeID .==NodeID), [1,13]];
	
	       
		dfb = join(d1,d2, on = :Date);				
		dfb = join(dfb,d3, on = :Date);
		dfb = join(dfb,d4, on = :Date);
       		dfb = join(dfb,d5, on = :Date, makeunique=true);



			if x == 1
				
				f_dir = pwd();
				global initial_dir = f_dir;	#save the root dir 
					
				new_dir = mkdir(Dates.format(now(),"N.F Bio YY:HH:MM"));				
				new_dir;	#create a directory "YY:HH:MM"
				cd(new_dir);

				name_data_dir = mkdir("data not filer");
				name_img_dir  = mkdir("img not filter");
				
				data_dir = name_data_dir;			#########################
				data_dir = initial_dir*"/";			#########################
				data_dir = data_dir*new_dir;			###save data directory###
				data_dir = data_dir*"/";			#########################
				global data_dir = data_dir*name_data_dir; 	#########################

				img_dir = name_img_dir;				#########################
				img_dir = initial_dir*"/";			#########################
				img_dir = img_dir*new_dir;			###save img directory####	
				img_dir = img_dir*"/";				#########################
				global img_dir = img_dir*name_img_dir; 		#########################
				
				
			end
		
				
		
		########################
		#### organized data ####
		########################


					
		cd(data_dir);				#Go to data directory
		datacsv = mkdir("$NodeID");		#Enumerate Nodes
		cd(datacsv);				#Go to individual directory (depend of the NodeID)		
		CSV.write( "$NodeID (not filter)dfb.csv",  dfb);	#Write individual $NodeID dfb.csv

		
		#################################
		#### cooking nice plots data ####
		#################################


		df = CSV.read("$NodeID (not filter)dfb.csv");
		cd(img_dir);
		imgpdf = mkdir("$NodeID");
		cd(imgpdf);

		t = collect(1:size(df,1));
		data = [df.AirTempLoc df.PlantTemp1 df.PlantTemp2 df.PlantTemp3 df.PlantTemp4 df.PlantTemp5 df.PlantTemp6];



		time = [t t t t t t t];
		plot(time,data, title="Heating");
		plot!(xlabel = "time [min]", 
   		#ylabel = "Number of slice LUT",                                                                     
   		legend=false);  

		savefig("$NodeID (not filter).pdf");
					
		
	
	
		end   	#end for 

	
			
	end	#end if	





	if nn[2] == 12					#for system data.csv
			
		Nodes_dfs = unique(dfs.NodeID);			##search all nodes in dfs
	   	nNodes_dfs = length(Nodes_dfs);			##how unique elements are
		
		for x = 1:nNodes_dfs				#read files to all nodes				
		NodeID = Nodes_dfs[x];					

		d1 = frame[(frame.FrameID .==16) .& (frame.NodeID .==NodeID), 1:4];
		d2 = frame[(frame.FrameID .==17) .& (frame.NodeID .==NodeID), [1,5,6,7]];
		d3 = frame[(frame.FrameID .==18) .& (frame.NodeID .==NodeID), [1,8,9,10]];
		d4 = frame[(frame.FrameID .==19) .& (frame.NodeID .==NodeID), [1,11,12]];
		#d5 = frame[(frame.FrameID .==17) .& (frame.NodeID .==NodeID), [1,13]];
		dfs = join(d1,d2, on = :Date);				#do magic 
		dfs = join(dfs,d3, on = :Date);				#more magic
		dfs = join(dfs,d4, on = :Date, makeunique=true);	#and more

			if x == 1
				
				f_dir = pwd();
				global initial_dir = f_dir;	#save the root dir 
					
				new_dir = Dates.format(now(),"NF. YY:HH:MM");				
				new_dir = "System "*new_dir;
				new_dir = mkdir(new_dir);
				cd(new_dir);

				name_data_dir = mkdir("data not filter");
				name_img_dir  = mkdir("img not filter");
				
				data_dir = name_data_dir;				#########################
				data_dir = initial_dir*"/";			#########################
				data_dir = data_dir*new_dir;			###save data directory###
				data_dir = data_dir*"/";			#########################
				global data_dir = data_dir*name_data_dir; 	#########################

				img_dir = name_img_dir;				#########################
				img_dir = initial_dir*"/";			#########################
				img_dir = img_dir*new_dir;			###save img directory####	
				img_dir = img_dir*"/";				#########################
				global img_dir = img_dir*name_img_dir; 		#########################
				
			end

		
		########################
		#### organized data ####
		########################

							
		cd(data_dir);				#Go to data directory
		datacsv = mkdir("$NodeID");		#Enumerate Nodes
		cd(datacsv);				#Go to individual directory (depend of the NodeID)		
		CSV.write( "$NodeID (not filter)dfs.csv",  dfs);	#Write individual $NodeID dfs.csv

					
		end	#end for
	end	#end if

cd(initial_dir);		#return home!!						 

end	#end function





function AllFramesFilter(frame)



nn = size(frame);					#we need know if data is biological or if is about the system



	if nn[2] == 13					#for biologic data
		
		Nodes_dfb = unique(dfb.NodeID);			##search all nodes in dfb
		nNodes_dfb = length(Nodes_dfb);			##how unique elements are

		for x = 1:nNodes_dfb				#read files to all nodes
	
		global NodeID = Nodes_dfb[x];				
        
		d1 = frame[(frame.FrameID .==16) .& (frame.NodeID .==NodeID), 1:4];
	    	d2 = frame[(frame.FrameID .==17) .& (frame.NodeID .==NodeID), [1,5,6,7]];
        	d3 = frame[(frame.FrameID .==18) .& (frame.NodeID .==NodeID), [1,8,9,10]];
		d4 = frame[(frame.FrameID .==19) .& (frame.NodeID .==NodeID), [1,11,12,13]];
        	d5 = frame[(frame.FrameID .==17) .& (frame.NodeID .==NodeID), [1,13]];
	
	       
		dfb = join(d1,d2, on = :Date);				
		dfb = join(dfb,d3, on = :Date);
		dfb = join(dfb,d4, on = :Date);
       		dfb = join(dfb,d5, on = :Date, makeunique=true);



			if x == 1
				
				f_dir = pwd();
				global initial_dir = f_dir;	#save the root dir 
					
				new_dir = mkdir(Dates.format(now(),"F. Bio YY:HH:MM"));				
				new_dir;	#create a directory "YY:HH:MM"
				cd(new_dir);

				name_data_dir = mkdir("data filter");
				name_img_dir  = mkdir("img filter");
				
				

				data_dir = name_data_dir;			#########################
				data_dir = initial_dir*"/";			#########################
				data_dir = data_dir*new_dir;			###save data directory###
				data_dir = data_dir*"/";			#########################
				global data_dir = data_dir*name_data_dir; 	#########################

				img_dir = name_img_dir;				#########################
				img_dir = initial_dir*"/";			#########################
				img_dir = img_dir*new_dir;			###save img directory####	
				img_dir = img_dir*"/";				#########################
				global img_dir = img_dir*name_img_dir; 		#########################


				#############################
				#############################
				###### Separate Groups ######
				#############################
				#############################


				############
				####Data####
				############
				
				cd(data_dir);
				

				name_heating_data_dir = mkdir("Heating");	
				
				heating_data_dir = name_heating_data_dir;
				heating_data_dir = initial_dir*"/";
				heating_data_dir = heating_data_dir*new_dir;
				heating_data_dir = heating_data_dir*"/";
				heating_data_dir = heating_data_dir*name_data_dir;
				heating_data_dir = heating_data_dir*"/";
				global heating_data_dir = heating_data_dir*name_heating_data_dir;
				
										
				name_openspace_data_dir = mkdir("OpenSpace");	
				
				openspace_data_dir = name_openspace_data_dir;
				openspace_data_dir = initial_dir*"/";
				openspace_data_dir = openspace_data_dir*new_dir;
				openspace_data_dir = openspace_data_dir*"/";
				openspace_data_dir = openspace_data_dir*name_data_dir;	
				openspace_data_dir = openspace_data_dir*"/";				
				global openspace_data_dir = openspace_data_dir*name_openspace_data_dir;

				
					
				name_otc_data_dir = mkdir("OTC");
				otc_data_dir = name_otc_data_dir;
				otc_data_dir = initial_dir*"/";
				otc_data_dir = otc_data_dir*new_dir;
				otc_data_dir = otc_data_dir*"/";
				otc_data_dir = otc_data_dir*name_data_dir;
				otc_data_dir = otc_data_dir*"/";	
				global otc_data_dir = otc_data_dir*name_otc_data_dir;
			
				cd(f_dir);		#return to the first directory 	


								
				############						
				####img#####
				############

				cd(new_dir);	
				cd(img_dir);

				name_heating_img_dir = mkdir("Heating");	
				
				heating_img_dir = name_heating_img_dir;
				heating_img_dir = initial_dir*"/";
				heating_img_dir = heating_img_dir*new_dir;
				heating_img_dir = heating_img_dir*"/";
				heating_img_dir = heating_img_dir*name_img_dir ;
				heating_img_dir = heating_img_dir*"/";
				global heating_img_dir = heating_img_dir*name_heating_img_dir;
				


										
				name_openspace_img_dir = mkdir("OpenSpace");	
				
				openspace_img_dir = name_openspace_img_dir;
				openspace_img_dir = initial_dir*"/";
				openspace_img_dir = openspace_img_dir*new_dir;
				openspace_img_dir = openspace_img_dir*"/";
				openspace_img_dir = openspace_img_dir*name_img_dir;
				openspace_img_dir = openspace_img_dir*"/";
				global openspace_img_dir = openspace_img_dir*name_openspace_img_dir;

				
					
				name_otc_img_dir = mkdir("OTC");

				otc_img_dir = name_otc_img_dir;
				otc_img_dir = initial_dir*"/";
				otc_img_dir = otc_img_dir*new_dir;
				otc_img_dir = otc_img_dir*"/";
				otc_img_dir = otc_img_dir*name_img_dir;
				otc_img_dir = otc_img_dir*"/";
				global otc_img_dir = otc_img_dir*name_otc_img_dir;

				cd(f_dir);		#return to the first directory 
													
			end
		
				
		
		########################
		#### organized data ####
		########################

		
		global dHeating=CSV.read("HeatingGroup.csv");
		global NodesHeating = [0,0,0,0,0];
			
			for x = 1:5
				dataArray = split(dHeating[1,x]);
				Nnumber = parse(Int64, dataArray[1]);
				global NodesHeating[x] = Nnumber;
			end


		
			if NodeID in NodesHeating
							
				cd(heating_data_dir);			#Go to Group data directory (heating, otc, open space)
				datacsv = mkdir("$NodeID");		#Enumerate Nodes
				cd(datacsv);				#Go to individual directory (depend of the NodeID)
				CSV.write( "$NodeID dfb.csv",  dfb);	#Write individual $NodeID dfb.csv
		
				FilterAndPlot();
										
			end

		
		
		global dOTC=CSV.read("OtcGroup.csv");
		global NodesOTC = [0,0,0,0,0];
			
			for x = 1:5
				dataArray = split(dOTC[1,x]);
				Nnumber = parse(Int64, dataArray[1]);
				global NodesOTC[x] = Nnumber;
			end
			
					
			if NodeID in NodesOTC


									
				cd(otc_data_dir);			#Go to Group data directory (heating, otc, open space)
				datacsv = mkdir("$NodeID");		#Enumerate Nodes
				cd(datacsv);				#Go to individual directory (depend of the NodeID)
				CSV.write( "$NodeID dfb.csv",  dfb);	#Write individual $NodeID dfb.csv
		

				FilterAndPlot();
					

					
			end
				
		
		global dOpenSpace=CSV.read("OpenSpaceGroup.csv");
		global NodesOpenSpace = [0,0,0,0,0];
			
			for x = 1:5
				dataArray = split(dOpenSpace[1,x]);
				Nnumber = parse(Int64, dataArray[1]);
				global NodesOpenSpace[x] = Nnumber;
			end
				
				
			if NodeID in NodesOpenSpace

									
				cd(openspace_data_dir);			#Go to Group data directory (heating, otc, open space)
				datacsv = mkdir("$NodeID");		#Enumerate Nodes
				cd(datacsv);				#Go to individual directory (depend of the NodeID)
				CSV.write( "$NodeID dfb.csv",  dfb);	#Write individual $NodeID dfb.csv
		

				FilterAndPlot();			#Function run on cd(datacsv); !!
											
			end


		
		end   	#end for x = 1:nNodes_dfb	

	
			
	end	#end if	nn[2] = 13


cd(initial_dir);		#return home!!						 

end	#end function




function FilterAndPlot()

	temp_max = 50;
	if NodeID != 10 # NodeID = 1O case!
		

	df = CSV.read("$NodeID dfb.csv"; copycols=true);		#read orginal .csv file

	
	#df =dropmissing(df);
	
	#= mean_tempPlant1 = mean(df.PlantTemp1);
	mean_tempPlant2 = mean(df.PlantTemp2);
	mean_tempPlant3 = mean(df.PlantTemp3);
	mean_tempPlant4 = mean(df.PlantTemp4);				#Calculate mean for all plants
	mean_tempPlant5 = mean(df.PlantTemp5);
	=# mean_tempPlant6 = mean(df.PlantTemp6);
	
	#df = CSV.read("$NodeID dfb.csv"; copycols=true);
	size_df = size(df);
	df.PlantTemp1 =convert(Vector{Union{Missing,Float64}}, df.PlantTemp1);
	df.PlantTemp2 =convert(Vector{Union{Missing,Float64}}, df.PlantTemp2);
	df.PlantTemp3 =convert(Vector{Union{Missing,Float64}}, df.PlantTemp3);
	df.PlantTemp4 =convert(Vector{Union{Missing,Float64}}, df.PlantTemp4);	## For use missing type and Float type
	df.PlantTemp5 =convert(Vector{Union{Missing,Float64}}, df.PlantTemp5);
	df.PlantTemp6 =convert(Vector{Union{Missing,Float64}}, df.PlantTemp6);

	df.AirTempLoc =convert(Vector{Union{Missing,Float64}}, df.AirTempLoc);
	
		###### FILTER ORIGINAL .csv FILE ###### 

		
		for x = 1:size_df[1];
           
			
            		value = df.PlantTemp1[x];
            
		
			if ismissing(value) == false && value > temp_max 	
				df.PlantTemp1[x] = missing;
			end


			if  ismissing(value) == false && value < -30
			
				df.PlantTemp1[x] = missing ;
			end
				
			
			if x == size_df[1]		
				CSV.write( "$NodeID dfb.csv",  df);
			end
		end

		for x = 1:size_df[1]
           
		
            		
            		value = df.PlantTemp2[x];
            
		
			if ismissing(value) == false && value > temp_max
			
				df.PlantTemp2[x] = missing ;
			end

			if  ismissing(value) == false && value < -30
			
				df.PlantTemp2[x] = missing ;
			end
				
			
			if x == size_df[1]
				CSV.write( "$NodeID dfb.csv",  df);
			end
		end

		for x = 1:size_df[1]
           
		
            		
            		value = df.PlantTemp3[x];
            
		
			if ismissing(value) == false && value > temp_max
			
				df.PlantTemp3[x] = missing ;
			end


			if  ismissing(value) == false && value < -30
			
				df.PlantTemp3[x] = missing ;
			end
				
			
			if x == size_df[1]
				CSV.write( "$NodeID dfb.csv",  df);
			end
		end

		for x = 1:size_df[1]
           
		
            		
            		value = df.PlantTemp4[x];
            
		
			if ismissing(value) == false && value > temp_max
			
				df.PlantTemp4[x] = missing ;
			end


			if  ismissing(value) == false && value < -30
			
				df.PlantTemp4[x] = missing ;
			end
				
			
			if x == size_df[1]
				CSV.write( "$NodeID dfb.csv",  df);
			end
		end


		for x = 1:size_df[1]
           
		
            		
            		value = df.PlantTemp5[x];
            
		
			if ismissing(value) == false && value > temp_max
			
				df.PlantTemp5[x] = missing ;
			end


			if  ismissing(value) == false && value < -30
			
				df.PlantTemp5[x] = missing ;
			end
				
			
			if x == size_df[1]
				CSV.write( "$NodeID dfb.csv",  df);
			end
		end


		for x = 1:size_df[1]
           
		
            		
            		value = df.PlantTemp6[x];
            
		
			if ismissing(value) == false && value > temp_max
			
				df.PlantTemp6[x] = missing ;
			end


			if  ismissing(value) == false && value < -30
			
				df.PlantTemp6[x] = missing ;
			end
				
			
			if x == size_df[1]
				CSV.write( "$NodeID dfb.csv",  df);
			end

		end

			##fix ambient temp sensors

		for x = 1:size_df[1]
           
		
            		
            		value = df.AirTempLoc[x];
            
		
			if ismissing(value) == false && value > 40
			
				df.AirTempLoc[x] = missing ;
			end


			if  ismissing(value) == false && value < -30
			
				df.AirTempLoc[x] = missing ;
			end
				
			
			if x == size_df[1]
				CSV.write( "$NodeID dfb.csv",  df);
			end


		end

		
		#################################
		#### cooking nice plots data ####
		#################################


		df = CSV.read("$NodeID dfb.csv");



                if NodeID in NodesHeating


			cd(heating_img_dir);
			imgpdf = mkdir("$NodeID");
			cd(imgpdf);

			t = collect(1:size(df,1));
			data = [df.AirTempLoc df.PlantTemp1 df.PlantTemp2 df.PlantTemp3 df.PlantTemp4 df.PlantTemp5 df.PlantTemp6];
	
			#df.AirTempLoc_1 dont working!!! FIX 

			time = [t t t t t t t];
			plot(time,data, title="Node: $NodeID | Heating + OTC");
			plot!(xlabel = "time [min]", 
   			#ylabel = "Number of slice LUT",                                                                     
   			legend=false);  

			savefig("$NodeID (filter).pdf");
					
					

					
		end

		if NodeID in NodesOTC


									
			cd(otc_img_dir);
			imgpdf = mkdir("$NodeID");
			cd(imgpdf);

			t = collect(1:size(df,1));
			data = [df.AirTempLoc df.PlantTemp1 df.PlantTemp2 df.PlantTemp3 df.PlantTemp4 df.PlantTemp5 df.PlantTemp6];
	
			#df.AirTempLoc_1 dont working!!! FIX 

			time = [t t t t t t t];
			plot(time,data, title="Node: $NodeID | Only OTC");
			plot!(xlabel = "time [min]", 
   			#ylabel = "Number of slice LUT",                                                                     
   			legend=false);  

			savefig("$NodeID (filter).pdf");

					
		end



		if NodeID in NodesOpenSpace			

									
			cd(openspace_img_dir);
			imgpdf = mkdir("$NodeID");
			cd(imgpdf);

			t = collect(1:size(df,1));
			data = [df.AirTempLoc df.PlantTemp1 df.PlantTemp2 df.PlantTemp3 df.PlantTemp4 df.PlantTemp5 df.PlantTemp6];
	
			#df.AirTempLoc_1 dont working!!! FIX 

			time = [t t t t t t t];
			plot(time,data, title="Node: $NodeID | Open Space");
			plot!(xlabel = "time [min]", 
   			#ylabel = "Number of slice LUT",                                                                     
   			legend=false);  

			savefig("$NodeID (filter).pdf");
					
		end
		
	end	#end if nodeid = 10
cd(initial_dir);
end #end function FilterAndPlot()


function Analyze( node = Int[], group = String[], plant = String[])

	
	#create new data frame	
	for x = 1:6
			
		if x == 1 
			global df = DataFrame(number = String[], sensor = String[], plant = String[]);	
		end					


			if group == "heating"					##create data frame from dHeating, dOpenSpace or dOTC
										##it's necessary for procces the data
		
				for y = 1:length(NodesHeating)

              		 		if NodesHeating[y] == node
                   	    		global column = y

                  	 		end
               	 		end 


				global GroupArray = split(dHeating[x,:0+column]);

			end

			if group == "openspace"  

				for y = 1:length(NodesOpenSpace)
              		 		if NodesOpenSpace[y] == node
                   	    		global column = y
                  	 		end
               	 		end 


				global GroupArray = split(dOpenSpace[x,:0+column]);
			end

			if group == "otc"


				for y = 1:length(NodesOTC)
              		 		if  NodesOTC[y] == node
                   	    		global column = y
                  	 		end
				end

				global GroupArray = split(dOTC[x,:0 + column]);
				

			end
			
		global  df = push!(df, GroupArray);	



		if x == 1
            		global D_df=DataFrame(number=String[],sensor=String[],plant=String[]);	#DATA FRAME ONLY WITH D.. #plants				
	   		global C_df=DataFrame(number=String[],sensor=String[],plant=String[]);	#DATA FRAME ONLY WITH C.. plants

			global sensors_C = DataFrame(sensor_number=[0,0,0]);
			global sensors_D = DataFrame(sensor_number=[0,0,0]);
			
			global C = 0;
			global D = 0;
		
		end

				
		readframe = df[x+0,:];


		if readframe[3] == "D"
			D_df = push!(D_df, df[x+0,:]);				#DATA FRAME ONLY WITH D.. plants
			
			
			sensors_D[1+D,1] = x;
			D = D+1;
	
			if D == 3
														#assign number to a sensors
				global D_df = insert!(D_df, 3, sensors_D.sensor_number, :sensor_number);	#A=1,B=2,..,F=6		
			end
			
		end				

		if readframe[3] == "C"
			C_df = push!(C_df, df[x+0,:]);				#DATA FRAME ONLY WITH C.. plants

			sensors_C[1+C,1] = x;							#""""
			C = C+1;
			
			if C == 3		
				global C_df = insert!(C_df, 3, sensors_C.sensor_number, :sensor_number);	#A=1,B=2,..,F=6	
			end
		end


	end #end first for



	if group == "heating"
			
		if node in NodesHeating
			node=string(node);
			cd(heating_data_dir*"/"*node);
				
				if plant == "D"

					for j = 1:3
							
						sensor_number = D_df.sensor_number[j];
						if j == 1
							global file = CSV.read( "$node dfb.csv");	#read $node data
							global D_data_heating = DataFrame();			#data frama for save D data
						end
							
						global column = DataFrame(w = file[:,:4 + sensor_number]);	#calc position PlantTempx

				#CREATE D_data. This dataframa have only data of D.. plants							
						global D_data_heating = insert!(D_data_heating, j, column.w, Symbol.("TempPlant$sensor_number"));
								
						if j == 3
							ambient_column = DataFrame(u = file[:,:14]);
			global D_data_heating = insert!(D_data_heating, j+1, ambient_column.u, Symbol.("Ambient_1_$sensor_number"));
							CSV.write("$node Only_D.csv", D_data_heating );

						println("also you have new csv file call $node Only_D.csv in $heating_data_dir");

node = parse(Int,node);

if node == 11 
	global D_data_heating_11 = D_data_heating; 
	println("now you have new dataframe call 'D_data_heating_11' enjoy! "); 
end

if node == 12 
	global D_data_heating_12 = D_data_heating; 
	println("now you have new dataframe call 'D_data_heating_12' enjoy! "); 
end

if node == 13 
	global D_data_heating_13 = D_data_heating; 
	println("now you have new dataframe call 'D_data_heating_13' enjoy! "); 
end

if node == 14 
	global D_data_heating_14 = D_data_heating; 
	println("now you have new dataframe call 'D_data_heating_14' enjoy! "); 
end

if node == 15 
	global D_data_heating_15 = D_data_heating; 
	println("now you have new dataframe call 'D_data_heating_15' enjoy! "); 
end

							
						end # end j ==3
					end
						
				#end #if plant == "D"

				elseif plant == "C"

					for j = 1:3
							
						sensor_number = C_df.sensor_number[j];
						if j == 1
							global file = CSV.read( "$node dfb.csv");
							global C_data_heating = DataFrame();
						end
							
						global column = DataFrame(w = file[:,:4 + sensor_number]);
					
						#CREATE C_data. This dataframa have only data of C.. plants	
				global C_data_heating = insert!(C_data_heating, j, column.w, Symbol.("TempPlant$sensor_number"));
						if j == 3
						ambient_column = DataFrame(u = file[:,:14]);
			global C_data_heating = insert!(C_data_heating, j+1, ambient_column.u, Symbol.("Ambient_1_$sensor_number"));
							CSV.write("$node Only_C.csv",C_data_heating);

						println("also you have new csv file call $node Only_C.csv in $heating_data_dir");

node = parse(Int,node);

if node == 11 
	global C_data_heating_11 = C_data_heating; 
	println("now you have new dataframe call 'C_data_heating_11' enjoy! "); 
end

if node == 12 
	global C_data_heating_12 = C_data_heating; 
	println("now you have new dataframe call 'C_data_heating_12' enjoy! "); 
end

if node == 13 
	global C_data_heating_13 = C_data_heating; 
	println("now you have new dataframe call 'C_data_heating_13' enjoy! "); 
end

if node == 14 
	global C_data_heating_14 = C_data_heating; 
	println("now you have new dataframe call 'C_data_heating_14' enjoy! "); 
end

if node == 15 
	global C_data_heating_15 = C_data_heating; 
	println("now you have new dataframe call 'C_data_heating_15' enjoy! "); 
end


						end  #end j ==3 									

					end
				#end


				else
					println("TWO OPTIONS: C or D");
				end	#if plant == "C"
				
							
			#end 

		else 
			println("This is not a heating node!");
			println("Write: 'NodesHeating' for see the nodes");
		end #if node in NodesHeating
cd(initial_dir);	
	end #if group = "heating"
				
	
	if group == "otc"
		
		if node in NodesOTC
			node=string(node);
			cd(otc_data_dir*"/"*node);
				
				if plant == "D"

					for j = 1:3
							
						sensor_number = D_df.sensor_number[j];
						if j == 1
							global file = CSV.read( "$node dfb.csv");	#read $node data
							global D_data_otc = DataFrame();		#data frama for save D data
						end
							
						global column = DataFrame(w = file[:,:4 + sensor_number]); #calc position PlantTempx

			#CREATE D_data. This dataframa have only data of D.. plants							
					global D_data_otc = insert!(D_data_otc, j, column.w, Symbol.("TempPlant$sensor_number"));

						if j == 3
							ambient_column = DataFrame(u = file[:,:14]);
				global D_data_otc = insert!(D_data_otc, j+1, ambient_column.u, Symbol.("Ambient_1_$sensor_number"));
							CSV.write("$node Only_D.csv", D_data_otc);
							println("now yo have new dataframe call 'D_data_otc' enjoy! ");
						println("also you have new csv file call $node Only_D.csv in $otc_data_dir");


node = parse(Int,node);

if node == 16 
	global D_data_otc_16 = D_data_otc; 
	println("now you have new dataframe call 'D_data_otc_16' enjoy! "); 
end

if node == 17 
	global D_data_otc_17 = D_data_otc; 
	println("now you have new dataframe call 'D_data_otc_17' enjoy! ");  
end

if node == 18 
	global D_data_otc_18 = D_data_otc; 
	println("now you have new dataframe call 'D_data_otc_18' enjoy! "); 
end

if node == 19 
	global D_data_otc_19 = D_data_otc; 
	println("now you have new dataframe call 'D_data_otc_19' enjoy! "); 
end

if node == 20 
	global D_data_otc_20 = D_data_otc; 
	println("now you have new dataframe call 'D_data_otc_20' enjoy! "); 
end

						

				end # j==3							 


							

					end
						
				#end #if plant == "D"

				elseif plant == "C"

					for j = 1:3
							
						sensor_number = C_df.sensor_number[j];
						if j == 1
							global file = CSV.read( "$node dfb.csv");
							global C_data_otc = DataFrame();
						end
							
						global column = DataFrame(w = file[:,:4 + sensor_number]);
						#CREATE C_data. This dataframa have only data of C.. plants	
					global C_data_otc = insert!(C_data_otc, j, column.w, Symbol.("TempPlant$sensor_number"));

						if j == 3
							ambient_column = DataFrame(u = file[:,:14]);
				global C_data_otc = insert!(C_data_otc, j+1, ambient_column.u, Symbol.("Ambient_1_$sensor_number"));
							CSV.write("$node Only_C.csv", C_data_otc);

						println("also you have new csv file call $node Only_C.csv in $otc_data_dir");



node = parse(Int,node);

if node == 16 
	global C_data_otc_16 = C_data_otc; 
	println("now you have new dataframe call 'D_data_otc_16' enjoy! "); 
end

if node == 17 
	global C_data_otc_17 = C_data_otc; 
	println("now you have new dataframe call 'C_data_otc_17' enjoy! ");  
end

if node == 18 
	global C_data_otc_18 = C_data_otc; 
	println("now you have new dataframe call 'C_data_otc_18' enjoy! "); 
end

if node == 19 
	global C_data_otc_19 = C_data_otc; 
	println("now you have new dataframe call 'C_data_otc_19' enjoy! "); 
end

if node == 20 
	global C_data_otc_20 = C_data_otc; 
	println("now you have new dataframe call 'C_data_otc_20' enjoy! "); 
end


						end #end j == 3
						
					end
				 


				else
					println("TWO OPTIONS: C or D"); 
				end	
				
			
	else 
			println("This is not a OTC node!");
			println("Write: 'NodesOTC' for see the nodes");
	end	#if node in NodesOTC
	
cd(initial_dir);
	end #if group = "otc"




	if group == "openspace"

	
		if node in NodesOpenSpace
			node=string(node);
			cd(openspace_data_dir*"/"*node);
				
				if plant == "D"

					for j = 1:3
							
						sensor_number = D_df.sensor_number[j];
						if j == 1
							global file = CSV.read( "$node dfb.csv");	#read $node data
							global D_data_openspace = DataFrame();		#data frama for save D data
						end
							
						global column = DataFrame(w = file[:,:4 + sensor_number]); #calc position PlantTempx

			    #CREATE D_data. This dataframa have only data of D.. plants				
				global D_data_openspace = insert!(D_data_openspace, j, column.w, Symbol.("TempPlant$sensor_number"));



						if j == 3
							ambient_column = DataFrame(u = file[:,:14]);
			global D_data_openspace = insert!(D_data_openspace, j+1, ambient_column.u, Symbol.("Ambient_1_$sensor_number"));

							CSV.write("$node Only_D.csv", D_data_openspace);
						println("also you have new csv file call $node Only_D.csv in $openspace_data_dir");


node = parse(Int,node);

if node == 21 
	global D_data_openspace_21 = D_data_openspace; 
	println("now you have new dataframe call 'D_data_openspace_21' enjoy! "); 
end

if node == 22 
	global D_data_openspace_22 = D_data_openspace; 
	println("now you have new dataframe call 'D_data_openspace_22' enjoy! ");  
end

if node == 23 
	global D_data_openspace_23 = D_data_openspace; 
	println("now you have new dataframe call 'D_data_openspace_23' enjoy! "); 
end

if node == 24 
	global D_data_openspace_24 = D_data_openspace; 
	println("now you have new dataframe call 'D_data_openspace_24' enjoy! "); 
end

if node == 25 
	global D_data_openspace_25 = D_data_openspace; 
	println("now you have new dataframe call 'D_data_openspace_25' enjoy! "); 
end

								
						end #end if j == 3
							

					end
						
				#end #if plant == "D"

				elseif plant == "C"

					for j = 1:3
							
						sensor_number = C_df.sensor_number[j];
						if j == 1
							global file = CSV.read( "$node dfb.csv");
							global C_data_openspace = DataFrame();
						end
							
						global column = DataFrame(w = file[:,:4 + sensor_number]);
						#CREATE C_data. This dataframa have only data of C.. plants	
			global C_data_openspace = insert!(C_data_openspace, j, column.w, Symbol.("TempPlant$sensor_number"));		

						if j == 3
							ambient_column = DataFrame(u = file[:,:14]);

			global C_data_openspace = insert!(C_data_openspace, j+1, ambient_column.u, Symbol.("Ambient_1_$sensor_number"));
							CSV.write("$node Only_C.csv", C_data_openspace);

						println("also you have new csv file call $node Only_C.csv in $openspace_data_dir");
					


						end #end j == 3

if node == 21 
	global C_data_openspace_21 = C_data_openspace; 
	println("now you have new dataframe call 'C_data_openspace_21' enjoy! "); 
end

if node == 22 
	global C_data_openspace_22 = C_data_openspace; 
	println("now you have new dataframe call 'C_data_openspace_22' enjoy! ");  
end

if node == 23 
	global C_data_openspace_23 = C_data_openspace; 
	println("now you have new dataframe call 'C_data_openspace_23' enjoy! "); 
end

if node == 24 
	global C_data_openspace_24 = C_data_openspace; 
	println("now you have new dataframe call 'C_data_openspace_24' enjoy! "); 
end

if node == 25 
	global C_data_openspace_25 = C_data_openspace; 
	println("now you have new dataframe call 'C_data_openspace_25' enjoy! "); 
end
								
						

					end			 

				else
					println("TWO OPTIONS: C or D"); 
				end
				


		else 
			println("This is not a OpenSpace node!");
			println("Write: 'NodesOpenSpace' for see the nodes");
		end	#if node in OpenSpace
		
cd(initial_dir);
	end #if group = "openspace"


end #analayze 

