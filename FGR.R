library(dplyr)
library(tidyr)
#simple steps of making fgrs table
C8_new$Mediator="CDK8"
M1_new$Mediator="MED1"
FGR_com <- rbind(C8_new, M1_new)
dim(FGR_com)
FGR_new=subset(FGR, select= -c(startFGR, endFGR, qVal, chrFGR, txCount, chrName, strand, start, end, color, count_))
ames(FGR_new)=c("chr", "summitStart", "summitEnd","peakName", "Region", "Mediator")
dim(FGR_new)

FGR_new$Mediator=""
subset(FGR_new, Mediator =="CDK8$peakname")
subset(M1_new, peakName =="MED1")
FGR_new$Mediator <-ifelse(C8_new$MedName=="CDK8", paste("CDK8"), FGR_new$Mediator)
FGR_new$Mediator <-ifelse(FGR_new$MedName=="MED1", paste("MED1"), FGR_new$Mediator)
table(FGR_new$Mediator)

write.table(FGR_new, file="FGR_CDK8_MED1.txt", col.names=T, row.names=F, quote=F, sep="\t")

write.table(FGR_com, file="FGR_com_CDK8_MED1.txt", col.names=T, row.names=F, quote=F, sep="\t")




#FGRS MED1only, CDK8only, both
##on terminal 1)Combining the CDK8 and MED1 peaks: 

cat /Users/ismahashmi/Downloads/Mediator_toIsma_Jan21st2024\ 2/K562_chm13v2_MED1_summits.bed /Users/ismahashmi/Downloads/Mediator_toIsma_Jan21st2024\ 2/K562_chm13v2_CDK8_summits.bed > MED1_CDK8_combinedsummits.bed
sortBed -i MED1_CDK8_combinedsummits.bed > MED1_CDK8_combinedsummits._sorted.bed
bedtools merge -i MED1_CDK8_combinedsummits._sorted.bed > MED1_CDK8_mergedsummits.bed
#wc -l  MED1_CDK8_mergedsummits.bed

#2) Identifying whether MED1 or CDK8 occupy the combined peaks.
bedtools intersect -a MED1_CDK8_mergedsummits.bed -b /Users/ismahashmi/Downloads/Mediator_toIsma_Jan21st2024\ 2/K562_chm13v2_MED1_summits.bed -c | awk -v OFS='\t' '{print $1,$2,$3, ($NF > 0) ? "MED1" : "no"}' > mergedFGRs_with_MED1_status.bed
bedtools intersect -a mergedFGRs_with_MED1_status.bed -b /Users/ismahashmi/Downloads/Mediator_toIsma_Jan21st2024\ 2/K562_chm13v2_CDK8_summits.bed  -c | awk -v OFS='\t' '{print $1,$2,$3,$4, ($NF > 0) ? "CDK8" : "no"}' > mergedFGRs_MED1_CDK8.bed

#3) Opening the file in R and generating a new column (column 6) that lists “both”, “MED1only” and “CDK8only”

mergedFGRs =read.table("~/mergedFGRs_MED1_CDK8.bed")
dim(mergedFGRs)
names(mergedFGRs)=c("chr", "mPeakStart", "mPeakEnd", "MED1", "CDK8")
mergedFGRs$Mediator =""
mergedFGRs$Mediator <-ifelse(mergedFGRs$MED1=="MED1" & mergedFGRs$CDK8=="CDK8", "both", mergedFGRs$Mediator)
mergedFGRs$Mediator <-ifelse(mergedFGRs$MED1=="MED1" & mergedFGRs$CDK8=="no", "MED1only", mergedFGRs$Mediator)
mergedFGRs$Mediator <-ifelse(mergedFGRs$MED1=="no" & mergedFGRs$CDK8=="CDK8", "CDK8only", mergedFGRs$Mediator)
head(mergedFGRs)
table(mergedFGRs$Mediator)
write.table(mergedFGRs, file="MediatorFGRs_MED1only_CDK8only_both.txt", col.names=T, row.names=F, quote=F, sep="\t")





FGRsPeakfile =read.table("~/Downloads/MediatorCenters.txt")
write.table(FGRsPeakfile, file="~/Downloads/MediatorCenters_noHeader.txt")
dim(FGRsPeakfile)
