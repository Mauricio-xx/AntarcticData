#v1.3 

#releases 1.3:


#releases 1.2:

#unlimeted nodes can be precessed using AllFramesNotFilter("frame"). "frame" can be dfb or dfs (not filter data!)
#data is organized in directories "data not filter ". Name of the directory depend of NodeID
#Plots are organized in directorie "img not filter". Name of the directory depend of NodeID


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

		
		dHeating=CSV.read("HeatingGroup.csv");
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

		
		
		dOTC=CSV.read("OtcGroup.csv");
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
				
		
		dOpenSpace=CSV.read("OpenSpaceGroup.csv");
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


	if NodeID != 10 # NodeID = 1O case!
		

	df = CSV.read("$NodeID dfb.csv"; copycols=true);		#read orginal .csv file

	
	#df =dropmissing(df);
	
	mean_tempPlant1 = mean(df.PlantTemp1);
	mean_tempPlant2 = mean(df.PlantTemp2);
	mean_tempPlant3 = mean(df.PlantTemp3);
	mean_tempPlant4 = mean(df.PlantTemp4);				#Calculate mean for all plants
	mean_tempPlant5 = mean(df.PlantTemp5);
	mean_tempPlant6 = mean(df.PlantTemp6);
	
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
            
		
			if ismissing(value) == false && value > 5*mean_tempPlant1
			
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
            
		
			if ismissing(value) == false && value > 5*mean_tempPlant2
			
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
            
		
			if ismissing(value) == false && value > 5*mean_tempPlant3
			
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
            
		
			if ismissing(value) == false && value > 5*mean_tempPlant4
			
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
            
		
			if ismissing(value) == false && value > 5*mean_tempPlant5
			
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
            
		
			if ismissing(value) == false && value > 5*mean_tempPlant6
			
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




