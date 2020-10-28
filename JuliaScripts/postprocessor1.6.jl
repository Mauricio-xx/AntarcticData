#v1.4 


#releases 1.4:

#new function!!
#SeparateByDate(data_frame). Separate data_frame in differents days
#you need to run AllFrameFilter(dfb), and Analayze(Node,group,Plant)
#now in the Node directory you will have the new data separate by date.



#releases 1.3:

#new function!!
#Analayze(Node,group,Plant)
#create a new frame with only D or C Plants for specifical group and Node


#releases 1.2:

#unlimeted Nodes can be precessed using AllFramesNotFilter("frame"). "frame" can be dfb or dfs 
#data is organized in directories "data not filter ". Name of the directory depend of NodeID
#Plots are organized in directories "img not filter". Name of the directory depend of NodeID


#unlimeted Nodes can be precessed and data is filtred using FilterAllFrames("frame"). "frame" only can be dfb!
#data is organized in directories "data filter ". Name of the directory depend of NodeID
#Plots are organized in directorie "img filter". Name of the directory depend of NodeID


#old function(v1.0)  can works!


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
#### old functions  can works... ####
#########################################


function Nodeframesummary(frame, NodeID)

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


function Nodeframe(frame, NodeID)

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
		
		Nodes_dfb = unique(dfb.NodeID);			##search all Nodes in dfb
		nNodes_dfb = length(Nodes_dfb);			##how unique elements are

		for x = 1:nNodes_dfb				#read files to all Nodes
	
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
			
		Nodes_dfs = unique(dfs.NodeID);			##search all Nodes in dfs
	   	nNodes_dfs = length(Nodes_dfs);			##how unique elements are
		
		for x = 1:nNodes_dfs				#read files to all Nodes				
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
		
		Nodes_dfb = unique(dfb.NodeID);			##search all Nodes in dfb
		nNodes_dfb = length(Nodes_dfb);			##how unique elements are

		for x = 1:nNodes_dfb				#read files to all Nodes
	
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
	mean_tempPlant4 = mean(df.PlantTemp4);				#Calculate mean for all Plants
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
    df.Date =convert(Vector{Union{Missing,String}}, df.Date);

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
				#FixTime(df, 1);
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
				#FixTime(df, 1);
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
				#FixTime(df, 1);
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
				#FixTime(df, 1);
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
				#FixTime(df, 1);

				
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
				#FixTime(df, 1);
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
				#FixTime(df, 1);
			end


		end

		
		############################
		#### cooking nice plots ####
		############################	


		df = CSV.read("$NodeID dfb.csv");


#= ##########################################################################
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
	=#
#########################################
	end	#end if Nodeid = 10
cd(initial_dir);
end #end function FilterAndPlot()


function Analyze( node = Int[], group = String[], plant = String[])

global Node = node;
global Plant = plant; 
	#create new data frame	
	for x = 1:6
			
		if x == 1 
			global df = DataFrame(number = String[], sensor = String[], Plant = String[]);	
		end					


			if group == "heating"					##create data frame from dHeating, dOpenSpace or dOTC
										##it's necessary for procces the data
		
				for y = 1:length(NodesHeating)

              		 		if NodesHeating[y] == Node
                   	    		global column = y

                  	 		end
               	 		end 


				global GroupArray = split(dHeating[x,:0+column]);

			end

			if group == "openspace"  

				for y = 1:length(NodesOpenSpace)
              		 		if NodesOpenSpace[y] == Node
                   	    		global column = y
                  	 		end
               	 		end 


				global GroupArray = split(dOpenSpace[x,:0+column]);
			end

			if group == "otc"


				for y = 1:length(NodesOTC)
              		 		if  NodesOTC[y] == Node
                   	    		global column = y
                  	 		end
				end

				global GroupArray = split(dOTC[x,:0 + column]);
				

			end
			
		global  df = push!(df, GroupArray);	



		if x == 1
            		global D_df=DataFrame(number=String[],sensor=String[],Plant=String[]);	#DATA FRAME ONLY WITH D.. #Plants				
	   		global C_df=DataFrame(number=String[],sensor=String[],Plant=String[]);	#DATA FRAME ONLY WITH C.. Plants

			global sensors_C = DataFrame(sensor_number=[0,0,0]);
			global sensors_D = DataFrame(sensor_number=[0,0,0]);
			
			global C = 0;
			global D = 0;
		
		end
				
		readframe = df[x+0,:];


		if readframe[3] == "D"
			D_df = push!(D_df, df[x+0,:]);				#DATA FRAME ONLY WITH D.. Plants
			
			
			sensors_D[1+D,1] = x;
			D = D+1;
	
			if D == 3
														#assign number to a sensors
				global D_df = insert!(D_df, 3, sensors_D.sensor_number, :sensor_number);	#A=1,B=2,..,F=6		
			end
			
		end				

		if readframe[3] == "C"
			C_df = push!(C_df, df[x+0,:]);				#DATA FRAME ONLY WITH C.. Plants

			sensors_C[1+C,1] = x;							#""""
			C = C+1;
			
			if C == 3		
				global C_df = insert!(C_df, 3, sensors_C.sensor_number, :sensor_number);	#A=1,B=2,..,F=6	
			end
		end


	end #end first for



	if group == "heating"
			
		if Node in NodesHeating
			Node=string(Node);
			cd(heating_data_dir*"/"*Node);
			
				
				if Plant == "D"

					for j = 1:3
							
						sensor_number = D_df.sensor_number[j];
						if j == 1
							global file = CSV.read( "$Node dfb.csv");	#read $Node data
							global D_data_heating = DataFrame();			#data frama for save D data
												
						end
							
						global column = DataFrame(w = file[:,:4 + sensor_number]);	#calc position PlantTempx

						#CREATE D_data. This dataframa have only data of D.. Plants							
						global D_data_heating = insert!(D_data_heating, j, column.w, Symbol.("TempPlant$sensor_number"));
								
						if j == 3
							
							air_temp_loc = DataFrame(i = file[:,:11]);
							humedity = DataFrame(o = file[:,:12]);
							air_temp = DataFrame(p = file[:,:13]);
							ambient_column = DataFrame(u = file[:,:14]);
							date_column = DataFrame(date = file[:,:1]);

							D_data_heating = insert!(D_data_heating, j+1, air_temp_loc.i, Symbol.("Air_temp_loc"));
							D_data_heating = insert!(D_data_heating, j+2, humedity.o, Symbol.("Humedity"));
							D_data_heating = insert!(D_data_heating, j+3, air_temp.p, Symbol.("air_temp"));
							D_data_heating = insert!(D_data_heating, j+4, ambient_column.u, Symbol.("Ambient_1"));
														
							D_data_heating = insert!(D_data_heating, j+5, date_column.date, Symbol.("Date"));
							global D_data_heating = FixTime(D_data_heating, 0);
							
							CSV.write("$Node Only_D.csv", D_data_heating);

						println(" you have new csv file call $Node Only_D.csv in $heating_data_dir/$Node/$Node Only_D");

							global Node = parse(Int,Node);

							if Node == 11 
								global D_data_heating_11 = D_data_heating; 
								println("now you have new dataframe call 'D_data_heating_11' enjoy! ");	
								DiaNoche(dff,1);						
								SeparateByDate(dff);
									

							end

							if Node == 12 
								#global D_data_heating_12 = D_data_heating; 
								println("now you have new dataframe call 'D_data_heating_12' enjoy! ");
								DiaNoche(dff,1);
								SeparateByDate(dff);
								
							end

							if Node == 13 
								#global D_data_heating_13 = D_data_heating; 
								println("now you have new dataframe call 'D_data_heating_13' enjoy! "); 
								DiaNoche(dff,1);
								SeparateByDate(dff);
								
							end

							if Node == 14 
								#global D_data_heating_14 = D_data_heating; 
								println("now you have new dataframe call 'D_data_heating_14' enjoy! ");
								DiaNoche(dff,1);
								SeparateByDate(dff);
								
							end

							if Node == 15 
								#global D_data_heating_15 = D_data_heating; 
								println("now you have new dataframe call 'D_data_heating_15' enjoy! "); 
								DiaNoche(dff,1);
								SeparateByDate(dff);
								
							end

							
						end # end j ==3
					end
						
				#end #if Plant == "D"

				elseif Plant == "C"

					for j = 1:3
							
						sensor_number = C_df.sensor_number[j];
						if j == 1
							global file = CSV.read( "$Node dfb.csv");
							global C_data_heating = DataFrame();
						end
							
						global column = DataFrame(w = file[:,:4 + sensor_number]);
					
						#CREATE C_data. This dataframa have only data of C.. Plants	
				global C_data_heating = insert!(C_data_heating, j, column.w, Symbol.("TempPlant$sensor_number"));
						
						if j == 3

							air_temp_loc = DataFrame(i = file[:,:11]);
							humedity = DataFrame(o = file[:,:12]);
							air_temp = DataFrame(p = file[:,:13]);
							ambient_column = DataFrame(u = file[:,:14]);
							date_column = DataFrame(date = file[:,:1]);

							C_data_heating = insert!(C_data_heating, j+1, air_temp_loc.i, Symbol.("Air_temp_loc"));
							C_data_heating = insert!(C_data_heating, j+2, humedity.o, Symbol.("Humedity"));
							C_data_heating = insert!(C_data_heating, j+3, air_temp.p, Symbol.("air_temp"));
							C_data_heating = insert!(C_data_heating, j+4, ambient_column.u, Symbol.("Ambient_1"));
														
				C_data_heating = insert!(C_data_heating, j+5, date_column.date, Symbol.("Date"));

							global C_data_heating = FixTime(C_data_heating, 0);

							CSV.write("$Node Only_C.csv",C_data_heating);
							println(" you have new csv file call $Node Only_C.csv in $heating_data_dir");

							global Node = parse(Int,Node);

							if Node == 11 
								#global C_data_heating_11 = C_data_heating; 
								println("now you have new dataframe call 'C_data_heating_11' enjoy! ");	
								DiaNoche(dff,1);		
								SeparateByDate(dff); 
								
							end

							if Node == 12 
								#global C_data_heating_12 = C_data_heating; 
								println("now you have new dataframe call 'C_data_heating_12' enjoy! ");	
								DiaNoche(dff,1);						
								SeparateByDate(dff);   
								
							end

							if Node == 13 
								#global C_data_heating_13 = C_data_heating; 
								println("now you have new dataframe call 'C_data_heating_13' enjoy! "); 
								DiaNoche(dff,1);
								SeparateByDate(dff); 
								
							end

							if Node == 14 
								#global C_data_heating_14 = C_data_heating; 
								println("now you have new dataframe call 'C_data_heating_14' enjoy! "); 
								DiaNoche(dff,1);
								SeparateByDate(dff); 
								
							end

							if Node == 15 
								#global C_data_heating_15 = C_data_heating; 
								println("now you have new dataframe call 'C_data_heating_15' enjoy! "); 
								DiaNoche(dff,1);
								SeparateByDate(dff); 
								
							end


						end  #end j ==3 									

					end
				#end


				else
					println("TWO OPTIONS: C or D");
				end	#if Plant == "C"
				
							
			#end 

		else 
			println("This is not a heating Node!");
			println("Write: 'NodesHeating' for see the Nodes");
		end #if Node in NodesHeating
cd(initial_dir);	
	end #if group = "heating"
				
	
	if group == "otc"

		if Node in NodesOTC
			Node=string(Node);
			cd(otc_data_dir*"/"*Node);
		
				
				if Plant == "D"

					for j = 1:3
							
						sensor_number = D_df.sensor_number[j];
						if j == 1
							global file = CSV.read( "$Node dfb.csv");	#read $Node data
							global D_data_otc = DataFrame();		#data frama for save D data
						end
							
						global column = DataFrame(w = file[:,:4 + sensor_number]); #calc position PlantTempx

						#CREATE D_data. This dataframa have only data of D.. Plants							
						global D_data_otc = insert!(D_data_otc, j, column.w, Symbol.("TempPlant$sensor_number"));

						if j == 3
							air_temp_loc = DataFrame(i = file[:,:11]);
							humedity = DataFrame(o = file[:,:12]);
							air_temp = DataFrame(p = file[:,:13]);
							ambient_column = DataFrame(u = file[:,:14]);
							date_column = DataFrame(date = file[:,:1]);

							D_data_otc = insert!(D_data_otc, j+1, air_temp_loc.i, Symbol.("Air_temp_loc"));
							D_data_otc = insert!(D_data_otc, j+2, humedity.o, Symbol.("Humedity"));
							D_data_otc = insert!(D_data_otc, j+3, air_temp.p, Symbol.("air_temp"));
							D_data_otc = insert!(D_data_otc, j+4, ambient_column.u, Symbol.("Ambient_1"));
														
							D_data_otc = insert!(D_data_otc, j+5, date_column.date, Symbol.("Date"));
							D_data_otc = FixTime(D_data_otc, 0);

							CSV.write("$Node Only_D.csv", D_data_otc);
							println("now yo have new dataframe call 'D_data_otc' enjoy! ");
							println(" you have new csv file call $Node Only_D.csv in $otc_data_dir");


							global Node = parse(Int,Node);

							if Node == 16 
								#global D_data_otc_16 = D_data_otc; 
								println("now you have new dataframe call 'D_data_otc_16' enjoy! "); 
								DiaNoche(dff,1);
								SeparateByDate(dff); 
								
							end

							if Node == 17 
								#global D_data_otc_17 = D_data_otc; 
								println("now you have new dataframe call 'D_data_otc_17' enjoy! ");  
								DiaNoche(dff,1); 
								SeparateByDate(dff); 
								
							end

							if Node == 18 
								#global D_data_otc_18 = D_data_otc; 
								println("now you have new dataframe call 'D_data_otc_18' enjoy! "); 
								DiaNoche(dff,1);
								SeparateByDate(dff); 
								 
							end

							if Node == 19 
								#global D_data_otc_19 = D_data_otc; 
								println("now you have new dataframe call 'D_data_otc_19' enjoy! "); 
								DiaNoche(dff,1);
								SeparateByDate(dff);
								 
							end

							if Node == 20 
								#global D_data_otc_20 = D_data_otc; 
								println("now you have new dataframe call 'D_data_otc_20' enjoy! "); 
								DiaNoche(dff,1);
								SeparateByDate(dff); 
								
							end

						

						end # j==3							 


					end	#end #if Plant == "D"
						
				

				elseif Plant == "C"

					for j = 1:3
							
						sensor_number = C_df.sensor_number[j];
						if j == 1
							global file = CSV.read( "$Node dfb.csv");
							global C_data_otc = DataFrame();
						end
							
						global column = DataFrame(w = file[:,:4 + sensor_number]);
						#CREATE C_data. This dataframa have only data of C.. Plants	
						global C_data_otc = insert!(C_data_otc, j, column.w, Symbol.("TempPlant$sensor_number"));

						if j == 3
							air_temp_loc = DataFrame(i = file[:,:11]);
							humedity = DataFrame(o = file[:,:12]);
							air_temp = DataFrame(p = file[:,:13]);
							ambient_column = DataFrame(u = file[:,:14]);
							date_column = DataFrame(date = file[:,:1]);

							C_data_otc= insert!(C_data_otc, j+1, air_temp_loc.i, Symbol.("Air_temp_loc"));
							C_data_otc = insert!(C_data_otc, j+2, humedity.o, Symbol.("Humedity"));
							C_data_otc = insert!(C_data_otc, j+3, air_temp.p, Symbol.("air_temp"));
							C_data_otc = insert!(C_data_otc, j+4, ambient_column.u, Symbol.("Ambient_1"));
							C_data_otc = insert!(C_data_otc, j+5, date_column.date, Symbol.("Date"));


							global C_data_otc = FixTime(C_data_otc, 0);
							CSV.write("$Node Only_C.csv", C_data_otc);
							println(" you have new csv file call $Node Only_C.csv in $otc_data_dir");



							global Node = parse(Int,Node);

							if Node == 16 
								#global C_data_otc_16 = C_data_otc; 
								println("now you have new dataframe call 'D_data_otc_16' enjoy! "); 
								DiaNoche(dff,1);
								SeparateByDate(dff); 
								 
							end

							if Node == 17 
								#global C_data_otc_17 = C_data_otc; 
								println("now you have new dataframe call 'C_data_otc_17' enjoy! ");  
								DiaNoche(dff,1); 
								SeparateByDate(dff);
								
							end

							if Node == 18 
								#global C_data_otc_18 = C_data_otc; 
								println("now you have new dataframe call 'C_data_otc_18' enjoy! "); 
								DiaNoche(dff,1); 
								SeparateByDate(dff);
								
							end

							if Node == 19 
								#global C_data_otc_19 = C_data_otc; 
								println("now you have new dataframe call 'C_data_otc_19' enjoy! "); 
								DiaNoche(dff,1); 
								SeparateByDate(dff);
								
							end

							if Node == 20 
								#global C_data_otc_20 = C_data_otc; 
								println("now you have new dataframe call 'C_data_otc_20' enjoy! "); 
								DiaNoche(dff,1);
								SeparateByDate(dff); 
								
							end


						end #end j == 3
						
					end
				 


				else
					println("TWO OPTIONS: C or D"); 
				end	
				
			
	else 
			println("This is not a OTC Node!");
			println("Write: 'NodesOTC' for see the Nodes");
	end	#if Node in NodesOTC
	
cd(initial_dir);
	end #if group = "otc"




	if group == "openspace"

	
		if Node in NodesOpenSpace
			Node=string(Node);
			cd(openspace_data_dir*"/"*Node);
			
				
				if Plant == "D"

					for j = 1:3
							
						sensor_number = D_df.sensor_number[j];
						if j == 1
							global file = CSV.read( "$Node dfb.csv");	#read $Node data
							global D_data_openspace = DataFrame();		#data frama for save D data
						end
							
						global column = DataFrame(w = file[:,:4 + sensor_number]); #calc position PlantTempx

			    			#CREATE D_data. This dataframa have only data of D.. Plants				
						global D_data_openspace = insert!(D_data_openspace, j, column.w, Symbol.("TempPlant$sensor_number"));



						if j == 3
							air_temp_loc = DataFrame(i = file[:,:11]);
							humedity = DataFrame(o = file[:,:12]);
							air_temp = DataFrame(p = file[:,:13]);
							ambient_column = DataFrame(u = file[:,:14]);
							date_column = DataFrame(date = file[:,:1]);

							D_data_openspace = insert!(D_data_openspace, j+1, air_temp_loc.i, Symbol.("Air_temp_loc"));
							D_data_openspace = insert!(D_data_openspace, j+2, humedity.o, Symbol.("Humedity"));
							D_data_openspace = insert!(D_data_openspace, j+3, air_temp.p, Symbol.("air_temp"));
							D_data_openspace = insert!(D_data_openspace, j+4, ambient_column.u, Symbol.("Ambient_1"));
														
							D_data_openspace = insert!(D_data_openspace, j+5, date_column.date, Symbol.("Date"));
					
							global D_data_openspace = FixTime(D_data_openspace, 0);

							CSV.write("$Node Only_D.csv", D_data_openspace);
						println(" you have new csv file call $Node Only_D.csv in $openspace_data_dir");


						global Node = parse(Int,Node);

						if Node == 21 
							#global D_data_openspace_21 = D_data_openspace; 
							println("now you have new dataframe call 'D_data_openspace_21' enjoy! "); 
							DiaNoche(dff,1);	
							SeparateByDate(dff);							
						end

						if Node == 22 
							#global D_data_openspace_22 = D_data_openspace; 
							println("now you have new dataframe call 'D_data_openspace_22' enjoy! ");
							DiaNoche(dff,1);	
							SeparateByDate(dff);  
						end

						if Node == 23 
							#global D_data_openspace_23 = D_data_openspace; 
							println("now you have new dataframe call 'D_data_openspace_23' enjoy! "); 
							DiaNoche(dff,1);	
							SeparateByDate(dff);							
						end

						if Node == 24 
							#global D_data_openspace_24 = D_data_openspace; 
							println("now you have new dataframe call 'D_data_openspace_24' enjoy! "); 
							DiaNoche(dff,1);	
							SeparateByDate(dff);
							
						end

						if Node == 25 
							#global D_data_openspace_25 = D_data_openspace; 
							println("now you have new dataframe call 'D_data_openspace_25' enjoy! "); 
							DiaNoche(dff,1);	
							SeparateByDate(dff);
							
						end

								
						end #end if j == 3
							

					end	#end #if Plant == "D"
						
			
				elseif Plant == "C"

					for j = 1:3
							
						sensor_number = C_df.sensor_number[j];
						if j == 1
							global file = CSV.read( "$Node dfb.csv");
							global C_data_openspace = DataFrame();
						end
							
						global column = DataFrame(w = file[:,:4 + sensor_number]);
						#CREATE C_data. This dataframa have only data of C.. Plants	
						global C_data_openspace = insert!(C_data_openspace, j, column.w, Symbol.("TempPlant$sensor_number"));

						if j == 3
							air_temp_loc = DataFrame(i = file[:,:11]);
							humedity = DataFrame(o = file[:,:12]);
							air_temp = DataFrame(p = file[:,:13]);
							ambient_column = DataFrame(u = file[:,:14]);
							date_column = DataFrame(date = file[:,:1]);

							C_data_openspace = insert!(C_data_openspace, j+1, air_temp_loc.i, Symbol.("Air_temp_loc"));
							C_data_openspace = insert!(C_data_openspace, j+2, humedity.o, Symbol.("Humedity"));
							C_data_openspace = insert!(C_data_openspace, j+3, air_temp.p, Symbol.("air_temp"));
							C_data_openspace = insert!(C_data_openspace, j+4, ambient_column.u, Symbol.("Ambient_1"));
							C_data_openspace = insert!(C_data_openspace, j+5, date_column.date, Symbol.("Date"));

							global C_data_openspace = FixTime(C_data_openspace, 0);

							CSV.write("$Node Only_C.csv", C_data_openspace);
							println(" you have new csv file call $Node Only_C.csv in $openspace_data_dir");



							global Node = parse(Int,Node);

							if Node == 21 
								#global C_data_openspace_21 = C_data_openspace; 
								println("now you have new dataframe call 'D_data_openspace_21' enjoy! "); 
								DiaNoche(dff,1); 
								SeparateByDate(dff);
								
							end

							if Node == 22 
								#global C_data_openspace_22 = C_data_openspace; 
								println("now you have new dataframe call 'C_data_openspace_22' enjoy! ");  
								DiaNoche(dff,1); 
								SeparateByDate(dff);
								 
							end

							if Node == 23 
								#global C_data_openspace_23 = C_data_openspace; 
								println("now you have new dataframe call 'C_data_openspace_23' enjoy! "); 
								DiaNoche(dff,1); 
								SeparateByDate(dff);
								 
							end

							if Node == 24 
								#global C_data_openspace_24 = C_data_openspace; 
								println("now you have new dataframe call 'C_data_otc_14' enjoy! "); 
								DiaNoche(dff,1);
								SeparateByDate(dff);
								  
							end

							if Node == 25 
								#global C_data_openspace_25 = C_data_openspace; 
								println("now you have new dataframe call 'C_data_openspace_25' enjoy! "); 
								DiaNoche(dff,1); 
								SeparateByDate(dff);
								
							end


						end #end j == 3
						
					end
				 


				else
					println("TWO OPTIONS: C or D"); 
				end	
				
			
	else 
			println("This is not a openspace Node!");
			println("Write: 'NodesOpenSpace' for see the Nodes");
	end	#if Node in NodesOTC
	
cd(initial_dir);
	end #if group = "openspace"


end #analayze 



# script para generar un nuevo data frame con el vector de tiempo con un tick cada minuto

function FixTime(data_frame, general)
	# leer data Frame 
	#df = CSV.read(data_frame, delim=',', header=true);

	# converto to Dates format
	dates = Dates.DateTime.(data_frame.Date, "y-m-d H-M-S");
	

	# setear el primer valor
	d1 = round(dates[1], Dates.Minute(1))
	# generar vector de 20 valores consecutivos
	x = collect(0:70560-1);		#49 day = 70560 min

	# generar vector de tiempo
	#time=DateTime.(d1 + Dates.Minute.(x)); 
	time=DateTime.(DateTime(2020,1,21) + Dates.Minute.(x));

	# round varables to next minute 
	dates = round.(dates, Dates.Minute(1));
	time = round.(time, Dates.Minute(1));

	#make it DataFrame
	t = DataFrame([time]);
	da = DataFrame([dates]);

	#rename the variable name
	rename!(da, Dict(:x1 => :time));
	rename!(t,  Dict(:x1 => :time));
	
	if general == 1
		#get off the NOTHING! 
		dfm = data_frame[:, 1:14];
		# replace it with the new one (rounded and in DateTime format)
		dfn = [da dfm];

		# make the magic
		dff = join(dfn, t, on=:time, kind = :outer);
		# sort first column
		dff_general = sort(dff);
		CSV.write("$NodeID Fix_Time_dfb.csv", dff);
	end

	if general == 0
		#get off the Date column  
		dfm = data_frame[:, 1:7];
		# replace it with the new one (rounded and in DateTime format)
		dfn = [da dfm];

		# make the magic
		dff = join(dfn, t, on=:time, kind = :outer);
		# sort first column
		dff = unique(dff);

		global dff = sort(dff);
		
		
	end

end # End FixTime



function DiaNoche(data_frame, general)

df = data_frame; #cargamos el archivo csv
dft = df.time; #extraimos la columna de tiempo.
s = size(dft); #tama;o del vector
f = size(dft)[1];      #variable numero de filas de size(dft)

n11 = "06:05";
d11 = "20:55";
n21=  "23:59";
n12 = "07:05";
d12 = "19:05";
n22 = "23:59";
global z=0;
global o=0;
global p = 0;
global a = 0;
global b = 0;
global c = 0;
global d = 0;

change = DateTime.(DateTime(2020,2,22));

for i = 1:f


	if  dft[i] < change


			fecha       = dft[i]
			date_string = Dates.format(fecha,"yyyy-mm-dd HH:MM:SS");
			str         = SubString(date_string,12:16);

			if str == n11

				if general == 1
					global df_noche = df[1+p:i-1,:]
				end

				if general == 0
					global df_noche = df[1:i-1,:]
				end


			global z = i;

	 		end

			if str == d11

				df_dia = df[z:i-1,:]

				global o = i;

				DiaTotal=df_dia; 	

					if a == 1 && general == 1
						global DiaTotal=vcat(DiaTotalAnt,DiaTotal);	#general case
					end
				
				global DiaTotalAnt = DiaTotal;
				global a = 1;
		
				if general == 0
					CSV.write("$date Dia.csv", df_dia);					#individual case
				end

			end
		
			if str == n21
				df_noche2 = df[o:i,:];
				global p = i;
				
				NocheTotal=vcat(df_noche,df_noche2);	#concatenate tow dframes

					if b == 1 && general == 1
						global NocheTotal = vcat(NocheTotalAnt,NocheTotal);	
					end
				global NocheTotalAnt = NocheTotal;
				global b=1;
		
				if general == 0
					CSV.write("$date Noche.csv", NocheTotal);		
				end
		
			end

		end
	

		if  dft[i] > change

			fecha       = dft[i]
			date_string = Dates.format(fecha,"yyyy-mm-dd HH:MM:SS");
			str         = SubString(date_string,12:16);
	
			if str == n12

				if general == 1
					global df_noche = df[1+p:i-1,:]
				end

				if general == 0
					global df_noche = df[1:i-1,:]
				end
		
			global z = i;
		
	 		end

		
			if str == d12

				df_dia = df[z:i-1,:]

				global o = i;

				DiaTotal=df_dia; 	

					if general == 1
						global DiaTotal=vcat(DiaTotalAnt,DiaTotal);	#general case
							if Plant == "D" CSV.write("$Node Dia_D.csv", DiaTotal); end
							if Plant == "C" CSV.write("$Node Dia_C.csv", DiaTotal);	end				
					end
				
				global DiaTotalAnt = DiaTotal;
			
				if general == 0
					CSV.write("$date Dia.csv", df_dia);	#individual case
				end

			end


			if str == n22
				df_noche2 = df[o:i,:];
				global p = i;
				
				NocheTotal=vcat(df_noche,df_noche2);	#concatenate tow dframes

					if general == 1
						global NocheTotal = vcat(NocheTotalAnt,NocheTotal);
							if Plant == "D" CSV.write("$Node Noche_D.csv", NocheTotal); end
							if Plant == "C" CSV.write("$Node Noche_C.csv", NocheTotal);	end					
					end
				global NocheTotalAnt = NocheTotal;
				global b=1;
				
				if general == 0
					CSV.write("$date Noche.csv", NocheTotal);
				end
		
			end

		end

	end

end
	

function select(data_frame)

frame = findall(ismissing, data_frame);
frame = diff(frame);
global s = 0;

	for x = 1:size(frame)[1]-1

                  
    	       if frame[x] == 1 && frame[x+1] == 1
    	          
    	           global s+=1;
    	                 
    	       else 
    	         global s = 0;
				end

				if s == 5
					global s = 1;
					break;
				end
		end


end



function SeparateByDate(data_frame)

size_df = size(data_frame);
Data_frame = data_frame;
global j=0;

common_dir = pwd();

try
mkdir("$Node D_Selected");
mkdir("$Node C_Selected");
catch
end

		if Node in NodesOpenSpace

			date_string = Dates.format(Data_frame.time[1], "yyyy-mm-dd HH:MM:SS") #compatibility with FixTime()

			 Date = SubString(date_string, 1, 10);
			
				for x = 1:size_df[1]
      		
					date_string = Dates.format(Data_frame.time[x], "yyyy-mm-dd HH:MM:SS")
					if SubString(date_string, 1, 10) != Date || x == size_df[1]

						date_string = Dates.format(Data_frame.time[x-1], "yyyy-mm-dd HH:MM:SS")
						global date = SubString(date_string, 1, 10);
						new_DataFrame = Data_frame[j+1:x-1,:];
						global j = size(new_DataFrame)[1] + j; 



							if Plant == "D"
							
								selected_dir = "$common_dir"*"/"*"$Node D_Selected";
								select(new_DataFrame[:,:2]);
									if s == 0									
										cd(selected_dir);
										
										directory = mkdir("$date D");
										cd(directory);
										CSV.write("$date Only_D_Selected.csv", new_DataFrame);
										DiaNoche(new_DataFrame,0);
									end
								cd(common_dir);
								directory = mkdir("$date D");
								cd(directory);
								CSV.write("$date Only_D.csv", new_DataFrame);
								DiaNoche(new_DataFrame,0);

							end	
							if Plant == "C"
				
								selected_dir = "$common_dir"*"/"*"$Node C_Selected";
								select(new_DataFrame[:,:2]);
									if s == 0
									
										cd(selected_dir);
										
										directory = mkdir("$date C");
										cd(directory);
										CSV.write("$date Only_C_Selected.csv", new_DataFrame);
										DiaNoche(new_DataFrame,0);
									end									
										cd(common_dir);
										directory = mkdir("$date C");
										cd(directory);

								CSV.write("$date Only_C.csv", new_DataFrame);
								DiaNoche(new_DataFrame,0);
							end	
						
										
					end #! Date 
					
					date_string = Dates.format(Data_frame.time[x], "yyyy-mm-dd HH:MM:SS")					
					Date = SubString(date_string, 1, 10);		
				
				end	#end for 


		end #Node in NodesOpenSpace

		if Node in NodesHeating

			 	date_string = Dates.format(Data_frame.time[1], "yyyy-mm-dd HH:MM:SS") #compatibility with FixTime()

			 Date = SubString(date_string, 1, 10);
			
				for x = 1:size_df[1]
      		
					date_string = Dates.format(Data_frame.time[x], "yyyy-mm-dd HH:MM:SS")
					if SubString(date_string, 1, 10) != Date || x == size_df[1]

						date_string = Dates.format(Data_frame.time[x-1], "yyyy-mm-dd HH:MM:SS")
						global date = SubString(date_string, 1, 10);
						new_DataFrame = Data_frame[j+1:x-1,:];
						global j = size(new_DataFrame)[1] + j; 



							if Plant == "D"
	

								selected_dir = "$common_dir"*"/"*"$Node D_Selected";
								select(new_DataFrame[:,:2]);
									if s == 0
									
										cd(selected_dir);
										
										directory = mkdir("$date D");
										cd(directory);
										CSV.write("$date Only_D_Selected.csv", new_DataFrame);
										DiaNoche(new_DataFrame,0);
									end									
										cd(common_dir);
										directory = mkdir("$date D");
										cd(directory);									
								CSV.write("$date Only_D.csv", new_DataFrame);
								DiaNoche(new_DataFrame,0);
							end	
							if Plant == "C"

								selected_dir = "$common_dir"*"/"*"$Node C_Selected";
								select(new_DataFrame[:,2]);
									if s == 0
									
										cd(selected_dir);										
										directory = mkdir("$date C");
										cd(directory);
										CSV.write("$date Only_C_Selected.csv", new_DataFrame);
										DiaNoche(new_DataFrame,0);
									end									
										cd(common_dir);
										directory = mkdir("$date C");
										cd(directory);
								CSV.write("$date Only_C.csv", new_DataFrame);
								DiaNoche(new_DataFrame,0);
							end	
						
										
					end #! Date 
					
					date_string = Dates.format(Data_frame.time[x], "yyyy-mm-dd HH:MM:SS")					
					Date = SubString(date_string, 1, 10);		
				
				end	#end for 

 
		end #Node in NodesHeating

		if Node in NodesOTC
			date_string = Dates.format(Data_frame.time[1], "yyyy-mm-dd HH:MM:SS") #compatibility with FixTime()

			 Date = SubString(date_string, 1, 10);
			
				for x = 1:size_df[1]
      		
					date_string = Dates.format(Data_frame.time[x], "yyyy-mm-dd HH:MM:SS")
					if SubString(date_string, 1, 10) != Date || x == size_df[1]

						date_string = Dates.format(Data_frame.time[x-1], "yyyy-mm-dd HH:MM:SS")
						global date = SubString(date_string, 1, 10);
						new_DataFrame = Data_frame[j+1:x-1,:];
						global j = size(new_DataFrame)[1] + j; 



							if Plant == "D"

								selected_dir = "$common_dir"*"/"*"$Node D_Selected";
								select(new_DataFrame[:,:2]);
									if s == 0
										cd(selected_dir);
										directory = mkdir("$date D");
										cd(directory);
										CSV.write("$date Only_D_Selected.csv", new_DataFrame);
										DiaNoche(new_DataFrame,0);
									end									
										cd(common_dir);
										directory = mkdir("$date D");
										cd(directory);									
								CSV.write("$date Only_D.csv", new_DataFrame);
								DiaNoche(new_DataFrame,0);
							end	
							if Plant == "C"

								selected_dir = "$common_dir"*"/"*"$Node C_Selected";
								select(new_DataFrame[:,:2]);
									if s == 0
										cd(selected_dir);									
										directory = mkdir("$date C");
										cd(directory);
										CSV.write("$date Only_C_Selected.csv", new_DataFrame);
										DiaNoche(new_DataFrame,0);
									end									
										cd(common_dir);
										directory = mkdir("$date C");
										cd(directory);
								CSV.write("$date Only_C.csv", new_DataFrame);
								DiaNoche(new_DataFrame,0);
							end	
						
										
					end #! Date 
					
					date_string = Dates.format(Data_frame.time[x], "yyyy-mm-dd HH:MM:SS")					
					Date = SubString(date_string, 1, 10);		
				
				end	#end for 


		end	#Node in NodesOTC

end # end function
