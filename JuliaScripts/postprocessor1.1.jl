#v1.1 

#releases: 


#unlimeted nodes can be precessed using AllNodesFrames(frame). frame can be dfb or dfs
#data is organized in directories "data". Name of the directory depend of NodeID
#Plots are organized in directorie "img". Name of the directory depend of NodeID

#old function also can works!


using DataFrames;
using CSV;
using Dates;
using Plots;

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



#dfb22 = nodeframe(dfb,13);
#dfb22 = dfb22[7:300,:];
#t = collect(1:size(dfb22,1))
#data = [dfb22.AirTemp_1 dfb22.AirTempLoc dfb22.PlantTemp1 dfb22.PlantTemp2 dfb22.PlantTemp3 dfb22.PlantTemp4 dfb22.PlantTemp5 dfb22.PlantTemp6]
#time = [t t t t t t t t ]
#plot(time,data, title="Heating");#, label= ["Air", "A", "B", "C", "D", "E", "F"])
#plot!(                                                                           
                       #Plots.stroke(3, :black)                                   
    #line=(:black, 0.5, 6, :solid),              
                                                                               
    #xticks = (1:1:12),   
 #   xlabel = "time [min]", 
#    ylabel = "Number of slice LUT",                                                                     
#    title  = "Resources used vs. scale factor",    
#legend=false,                                                                                     
 #   )  

#savefig("OS.pdf");
#plot([t t],[dfb22.AirTempLoc dfb22.PlantTemp6], title="OTC with heating 24h Plant 6", label= ["Ambient - outside OTC", "Plant"])

##plot([t t t t], [dfb22.AirTemp dfb22.AirTemp_1 dfb22.AirTempLoc dfb22.PlantTemp3], title="OTC, Free Air, Free air SHT", label=["OTC","FreeAir","FreeAir SHT","Plant3" ])

#dfbm = [dfbm; nodeframe(dfb,24)]
#by(dfbm, :NodeID, :PlantTemp1 => mean)






###################################################################
############################# NEW CODE ############################
###################################################################  		

#human explain: 
#read all sheet, do magic, put all on individual directories, next we will cooking nice_plots.pdf and data.csv for biologist.xlsx





function AllNodesFrames(frame)



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
					
				new_dir = mkdir(Dates.format(now(),"Biological YY:HH:MM"));				
				new_dir;	#create a directory "YY:HH:MM"
				cd(new_dir);

				name_data_dir = mkdir("data");
				name_img_dir  = mkdir("img");
				
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
		CSV.write( "$NodeID dfb.csv",  dfb);	#Write individual $NodeID dfb.csv

		
		#################################
		#### cooking nice plots data ####
		#################################


		df = CSV.read("$NodeID dfb.csv");
		cd(img_dir);
		imgpdf = mkdir("$NodeID");
		cd(imgpdf);

		t = collect(1:size(df,1));
		data = [df.AirTempLoc df.PlantTemp1 df.PlantTemp2 df.PlantTemp3 df.PlantTemp4 df.PlantTemp5 df.PlantTemp6];

#df.AirTempLoc_1 dont working!!! FIX 

		time = [t t t t t t t];
		plot(time,data, title="Heating");
		plot!(xlabel = "time [min]", 
   		#ylabel = "Number of slice LUT",                                                                     
   		legend=false);  

		savefig("$NodeID.pdf");
					
		
	
	
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
					
				new_dir = Dates.format(now(),"YY:HH:MM");				
				new_dir = "System "*new_dir;
				new_dir = mkdir(new_dir);
				cd(new_dir);

				name_data_dir = mkdir("data");
				name_img_dir  = mkdir("img");
				
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
		CSV.write( "$NodeID dfs.csv",  dfs);	#Write individual $NodeID dfs.csv



					
		end	#end for
	end	#end if

cd(initial_dir);		#return home!!						 

end	#end function










