#Before run the program, please specify the location where your raw data is
#and where you want to store the PNG files.
RawDataDirectory<-"C:/Users/mosimtec/Desktop/Learning/ExploratoryDataAnalysis"
ScriptAndPlotDirectory<-"C:/Users/mosimtec/Desktop/Learning/ExploratoryDataAnalysis/CourseProject"


setwd(RawDataDirectory)
pre_import<-read.table("household_power_consumption.txt",header=TRUE,sep=";",nrows=2)
colnames<-names(pre_import)[-1]
colclasses<-c(rep("character",2),rep("numeric",7))
formalimport<-read.table("household_power_consumption.txt",sep=";",skip=66637,nrows=2880,colClasses=colclasses)
finalimport<-with(formalimport,data.frame(paste(formalimport[,1],formalimport[,2]),formalimport[,3:9]))
a<-strptime(as.character(finalimport[,1]),format="%d/%m/%Y %H:%M:%S")
finalimport<-cbind(a,finalimport[,2:8])
colnames(finalimport)<-colnames

setwd(ScriptAndPlotDirectory)
png(file<-"plot3.png")
plot(finalimport[,1],finalimport[,6],xlab="",ylab="Energy sub metering",type="l")
lines(finalimport[,1],finalimport[,7],col="red")
lines(finalimport[,1],finalimport[,8],col="blue")
legend("topright",col=c("black","red","blue"),legend=names(finalimport[,6:8]),lwd=2)
dev.off()
setwd(RawDataDirectory)