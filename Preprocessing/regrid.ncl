; regrid everything to the same resolution
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl" 

; read new coordinates
coordfile=addfile("latlon.nc","r")
newlat=coordfile->latitude 	; -77.01048 to 89.89626
newlon=coordfile->longitude 	; -180 to 179.5

; read previous coordinates 
yyyymm=yyyymm_time(1992,2021,"integer")
starred=addfile("/datacommons/hulab/LabData/Obs/OceanReanalysis/SSH/ssh_grids_v2205_2015060212.nc","r")
lat=starred->Latitude
lon=starred->Longitude
Fill=starred->SLA@_FillValue

; initiate new data
newvar=new((/360,545,720/),"float",var0@_FillValue)
newvar!0="time"
newvar!1="lat"
newvar!2="lon"
newvar&time=yyyymm
newvar&lat=newlat
newvar&lon=newlon

newvar@units="m" 	; change this for specific variable



; read raw data 
tempMonth=new((/7,545,720/),"float",Fill)
do i=0,359
	srcfile=systemfunc("ls /datacommons/hulab/LabData/Obs/OceanReanalysis/SSH/ssh_grids_v2205_"+yyyymm(i)+"*.nc")
	NN=dimsizes(srcfile)
	print("i: "+i)
	do j=0,NN-1
		starred=addfile(srcfile(j),"r")
		var0=starred->SLA(0,:,:)
		vartemp=linint2_Wrap(lon,lat,var0,False,newlon+180.,newlat,0)
		tempMonth(j,:,:)=vartemp
	end do 
	temp1=dim_avg_n(tempMonth(0:NN-1,:,:),0)
	newvar(i,:,:)=(/temp1/)
	tempMonth=Fill 
end do
newvar=lonPivot(newvar)
printVarSummary(newvar)

; save regridded data
tgtfile="project_SSH_1992-2021.nc" 	
if (isfilepresent(tgtfile)) then
	system("rm -rf "+tgtfile)
end if 
flagged=addfile(tgtfile,"c")
flagged->SSH=newvar 	









