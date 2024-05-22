##Open the MediatorPeaks_MED1only_CDK8only_both.txt file in R and save it without the header.

mergedPeaksFile =read.table("~/Downloads/MediatorPeaks_MED1only_CDK8only_both.txt")
write.table(mergedPeaksFile, file="MediatorPeaks_MED1only_CDK8only_both_noHeader.txt", col.names=F, row.names=F, quote=F, sep="\t")
dim(mergedPeaksFile)
head(mergedPeaksFile)

###intersect the MED1 and CDK8 narrowPeak files with the MediatorPeaks_MED1only_CDK8only_both_noHeader.txt file
#bedtools intersect -wa -loj -a K562_chm13v2_MED1_peaks.narrowPeak -b MediatorPeaks_MED1only_CDK8only_both_noHeader.txt > MED1_wInfo.bed

#bedtools intersect -wa -loj -a K562_chm13v2_CDK8_peaks.narrowPeak -b MediatorPeaks_MED1only_CDK8only_both_noHeader.txt > CDK8_wInfo.bed

M1_info = read.table("MED1_wInfo.bed")
dim(M1_info)
head(M1_info)

C8_info= read.table("~/CDK8_wInfo.bed")
dim(C8_info)
head(C8_info)
table(C8_info$Mediator)
names(mergedPeaksFile)=c("chr", "mPeakStart", "mPeakEnd", "MED1", "CDK8", "Mediator")
table(mergedPeaksFile$Mediator)

##unison of FGRs

MediatorPeaks =read.table("~/Downloads/MediatorPeaks_MED1only_CDK8only_both.txt")
write.table(MediatorPeaks, file="MediatorPeaks_MED1only_CDK8only_both_noHeader.txt", col.names=F, row.names=F, quote=F, sep="\t")
head( MediatorPeaks)
names(MediatorPeaks)=c("chr", "mPeakStart", "mPeakEnd", "MED1", "CDK8", "Mediator")
head(MediatorPeaks)
dim(MediatorPeaks)
MediatorPeaks$qStart = (MediatorPeaks$mPeakStart + MediatorPeaks$mPeakEnd)/2
MediatorPeaks$qEnd =  MediatorPeaks$qStart
head( MediatorPeaks)
MediatorPeaks$qStart =as.integer(( MediatorPeaks$mPeakStart +  MediatorPeaks$mPeakEnd)/2)
MediatorPeaks$qEnd =  MediatorPeaks$qStart
head(MediatorPeaks)
MediatorFGRs_unison = MediatorPeaks[,c(1,7:8,4:6,2:3)]
head(MediatorFGRs_unison)
table(MediatorFGRs_unison$Mediator)
write.table(MediatorFGRs_unison, file = "MediatorFGRs_unison.txt", col.names=F, row.names=F, quote=F, sep="\t")
write.table(MediatorFGRs_unison, file = "MediatorFGRs_unison.txt_noHeader", col.names=F, row.names=F, quote=F, sep="\t")  


##bedtools intersect -wa -loj -a /Users/ismahashmi/Downloads/Mediator_toIsma_Jan21st2024\ 2/chm13v2_functionalGenomicRegions.bed -b /Users/ismahashmi/MediatorFGRs_unison.txt_noHeader > FGRs_wInfo.bed

FGRs_info = read.table("~/FGRs_wInfo.bed")
head(FGRs_info)
dim(FGRs_info)
names(FGRs_info)=c("chr", "startFGR", "endFGR", "score", "peakName", "strand", "StFGR", "EdFGR", "Region", "MediatorChr", "qStart", "qEnd", "MED1", "CDK8", "Mediator", "mPeakStart", "mPeakEnd")
head(FGRs_info)
dim(FGRs_info)
FGRs_info$StFGR<- NULL
FGRs_info$EdFGR<- NULL
head(FGRs_info)
dim(FGRs_info)
table(FGRs_info$Mediator)
write.table(FGRs_info, file = "FGRs_info.txt", col.names=F, row.names=F, quote=F, sep="\t")
write.table(FGRs_info, file = "FGRs_info.txt_noHeader", col.names=F, row.names=F, quote=F, sep="\t")  
