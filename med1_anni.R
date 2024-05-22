


M1_fg_summits =read.table("~/MED1_fgrs_summits", sep="\t")

names(M1_fg_summits)=c("chr", "summitStart", "summitEnd", "peakName", "qVal", "chrFGR", "startFGR", "endFGR", "txCount", "chrName", "strand", "start", "end", "color", "Region", "count_")

M1_fg_summits$Region<-ifelse(M1_fg_summits$Region==".", "untranscribed", M1_fg_summits$Region)

M1_promoter = subset(M1_fg_summits, Region=="promoter")
M1_enhancer = subset(M1_fg_summits, Region=="enhancer")
M1_CPS = subset(M1_fg_summits, Region=="CPS")
M1_TW = subset(M1_fg_summits, Region=="TW")
M1_geneBody = subset(M1_fg_summits, Region=="geneBody")
M1_divergent = subset(M1_fg_summits, Region=="divergent")
M1_unstranscribed = subset(M1_fg_summits, Region=="untranscribed")

test = M1_fg_summits
test = M1_fg_summits[-grep(".", M1_fg_summits$Region),]
#test = test[-grep("TW", test$Region),]
#test = test[-grep("geneBody", test$Region),]
#test = test[-grep("enhancer", test$Region),]
#test = test[-grep("divergent", test$Region),]
#test = test[-grep("CPS", test$Region),]
#test = test[-grep("promoter", test$Region),]


test$Region ="unTxMaybe"
M1_new = rbind(M1_promoter, M1_enhancer, M1_divergent, M1_CPS, M1_geneBody, M1_TW, M1_unstranscribed, test)
M1_new$Region <-ifelse(M1_new$Region=="unTxMaybe", paste("untranscribed"), M1_new$Region) 

M1_new = M1_new[!duplicated(M1_new[,c(1:3)]),]
table(M1_new$Region)

## Gives the percentages:
table(M1_new$Region) / dim(M1_new)[1] *100

write.table(M1_new, file="MED1_distribution_to_FGRs.txt", col.names=F, row.names=F, sep="\t", quote=F)
dim(M1_new)
