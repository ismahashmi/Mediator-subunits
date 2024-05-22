#cdk8 coordinates
cdk8 = read.table("~/Downloads/Mediator_toIsma_Jan21st2024 2/K562_chm13v2_CDK8_peaks.narrowPeak")
head (cdk8)
names(cdk8)=c("chr", "peakStart", "peakEnd", "peakName", "score","strand", "foldEnrichment", "pValue", "qValue", "summit")
head(cdk8)
head(C8_new)
dim(cdk8)
dim(C8_new)
C8m = merge(C8_new, cdk8[,c(2:5,7,10)], by="peakName")
head(C8m)
C8m = C8m[order(-C8m$score),]
head(C8m)
boxplot(C8m$score ~ C8m$Region)
boxplot(C8m$score ~ C8m$Region, outline=F)
boxplot(C8m$score ~ C8m$Region)

##Med1 coordinates

M1 = read.table("~/Downloads/Mediator_toIsma_Jan21st2024 2/K562_chm13v2_MED1_peaks.narrowPeak")
head (M1)
names(M1)=c("chr", "peakStart", "peakEnd", "peakName", "score","strand", "foldEnrichment", "pValue", "qValue", "summit")
head(M1)
head(M1_new)
dim(M1)
dim(M1_new)
M1m = merge(M1_new, M1[,c(2:5,7,10)], by="peakName")
head(M1m)
M1m = M1m[order(-M1m$score),]
head(M1m)
boxplot(M1m$score ~ M1m$Region)
boxplot(M1m$score ~ M1m$Region, outline=F)
boxplot(M1m$score ~ M1m$Region)


## combine two data frames

coordinates.R <- rbind(C8m, M1m)
print(coordinates.R)
write.table(coordinates.R, file = "coordinates.R.txt", col.names=F, row.names=F, quote=F, sep="\t")


head(coordinates.R)
dim(coordinates.R)
