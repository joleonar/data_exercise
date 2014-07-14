peso <- read.table("ControlPeso.txt",header=T)
peso$Fecha <- as.Date(peso$Fecha)

with(peso,plot(Fecha,Peso,xlab="Fecha",ylab="Peso",main="Peso diario"))
with(subset(peso,weekdays(Fecha)=="viernes"),points(Fecha,Peso,pch=20,col="yellow"))
#with(subset(peso,weekdays(Fecha)=="domingo"),points(Fecha,Peso,pch=20,col="red"))
with(subset(peso,weekdays(Fecha)=="lunes"),points(Fecha,Peso,pch=20,col="blue"))
abline(lm(peso$Peso~peso$Fecha),col="blue",lwd=3)
legend("topright",c("diario","sábado","domingo","lunes"),pch=c(1,20,20,20),col=c(1,"yellow","red","blue"))
dev.copy(png,file="peso.png")
dev.off()
a <- lm(peso$Peso~peso$Fecha)
summary(a)

M <- matrix(peso$Peso,7,12)

colMeans(M,na.rm=TRUE)

