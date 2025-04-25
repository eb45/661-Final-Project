f=addfile("project_SSH_1992-2021_orig.nc","r")
ssh0=f->SSH
lon=f->lon
lon2=lon+180.
ssh0&lon=lon2
ssh1=lonPivot(ssh0,180.)
printVarSummary(ssh1)
f2=addfile("project_SSH_1992-2021.nc","c")
f2->SSH=ssh1
system("ncdump -h project_SSH_1992-2021.nc")
exit
