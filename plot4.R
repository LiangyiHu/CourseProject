#Before run the program, please specify the location where your raw data is
#and where you want to store the PNG files.
RawDataDirectory<-"C:/Users/mosimtec/Desktop/Learning/ExploratoryDataAnalysis"
ScriptAndPlotDirectory<-"C:/Users/mosimtec/Desktop/Learning/ExploratoryDataAnalysis/CourseProject"
#input location above

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
png(file<-"plot4.png")

par(mfrow=c(2,2),cex.lab=1,mar=c(4,4,2,1),oma=c(1,1,1,1))
plot(finalimport[,1],finalimport[,2],xlab="",ylab="Global Active Power",type="l")
plot(finalimport[,1],finalimport[,4],xlab="datetime",ylab="Voltage",type="l")
plot(finalimport[,1],finalimport[,6],xlab="",ylab="Energy sub metering",type="l")
lines(finalimport[,1],finalimport[,7],col="red")
lines(finalimport[,1],finalimport[,8],col="blue")
legend("topright",col=c("black","red","blue"),legend=names(finalimport[,6:8]),lwd=2,bty="n")
plot(finalimport[,1],finalimport[,3],xlab="datetime",ylab="Global_reactive_power",type="l")

dev.off()
setwd(RawDataDirectory)