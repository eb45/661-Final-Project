srcfile=systemfunc("ls ./*/OA_CORA5.2_*_fld_TEMP_f.nc")
depLayer=145 	; layer of the depth
star=addfile(srcfile(384),"r")
T0=star->TEMP(0,depLayer,:,:)
ST=new((/360,545,720/),"float",T0@_FillValue)
ST!0="time"
ST!1="lat"
ST!2="lon"
ST&time=yyyymm_time(1992,2021,"integer")
ST&lat=T0&latitude
ST&lon=T0&longitude
ST@units=T0@units
ST@depth=star->depth(depLayer)
ST(0,:,:)=(/T0/)

do ii=385,743
	star=addfile(srcfile(ii),"r")
	T0=star->TEMP(0,depLayer,:,:)
	ST(ii-384,:,:)=(/T0/)
end do

printVarSummary(ST)
tgtfile="project_ST_1992-2021_dep-"+depLayer+".nc"
if (isfilepresent(tgtfile)) then
	system("rm -rf "+tgtfile)
end if
flag=addfile(tgtfile,"c")
flag->ST=ST



