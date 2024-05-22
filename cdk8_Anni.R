


C8_fg_summits =read.table("~/CDK8_fgrs_summits", sep="\t")
dim(C8_fg_summits)
names(C8_fg_summits)=c("chr", "summitStart", "summitEnd", "peakName", "qVal", "chrFGR", 
                       "startFGR", "endFGR", "txCount", "chrName", "strand", "start", "end", "color", "Region", "count_")
head(C8_fg_summits)
C8_fg_summits$Region<-ifelse(C8_fg_summits$Region==".", "untranscribed", C8_fg_summits$Region)

C8_promoter = subset(C8_fg_summits, Region=="promoter")
C8_enhancer = subset(C8_fg_summits, Region=="enhancer")
C8_CPS = subset(C8_fg_summits, Region=="CPS")
C8_TW = subset(C8_fg_summits, Region=="TW")
C8_geneBody = subset(C8_fg_summits, Region=="geneBody")
C8_divergent = subset(C8_fg_summits, Region=="divergent")
C8_unstranscribed = subset(C8_fg_summits, Region=="untranscribed")

test = C8_fg_summits
test = C8_fg_summits[-grep(".", C8_fg_summits$Region),]
#test = test[-grep("TW", test$Region),]
#test = test[-grep("geneBody", test$Region),]
#test = test[-grep("enhancer", test$Region),]
#test = test[-grep("divergent", test$Region),]
#test = test[-grep("CPS", test$Region),]
#test = test[-grep("promoter", test$Region),]
# C8_new$Region <-ifelse(C8_new$Region=="unTxMaybe", paste("untranscribed"), C8_new$Region) 

test$Region ="unTxMaybe"
C8_new = rbind(C8_promoter, C8_enhancer, C8_divergent, C8_CPS, C8_geneBody, C8_TW, C8_unstranscribed, test)
C8_new$Region <-ifelse(C8_new$Region=="unTxMaybe", paste("untranscribed"), C8_new$Region) 

C8_new = C8_new[!duplicated(C8_new[,c(1:3)]),]
table(C8_new$Region)
head(C8_new)
## Gives the percentages:
table(C8_new$Region) / dim(C8_new)[1] *100

write.table(C8_new, file="CDK8_distribution_to_FGRs.txt", col.names=F, row.names=F, sep="\t", quote=F)


names(C8_new)=c("chr", "summitStart", "summitEnd", "peakName", "qVal", "chrFGR", "startFGR", "endFGR", "txCount", "chrName", "strand", "start", "end", "color", "Region", "count_")
head(C8_new)
dim(C8_new)
#sum the columns

