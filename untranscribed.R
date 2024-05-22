
library(tidyverse)

cdk8 = read.table("~/Downloads/Mediator_toIsma_Jan21st2024 2/K562_chm13v2_CDK8_peaks.narrowPeak")
dim(M1_wC8)
dim(wC8)
dim(CDATm)
dim(cdk8_v)
dim(C8_unstranscribed)
dim(M1_WC8v)
dim(M1wa_WC8)


##binding sites by CDK81

C8_bs= data.frame(total_peaks=c(13298),open_chromatin=c(8288), closed_chromatin=c(5064),
                  without_MED1=c(6269), with_MED1=c(7029), unsbscribed=c(776))
final=table(C8_bs$total_peaks,C8_bs$open_chromatin,C8_bs$closed_chromatin,
            C8_bs$without_MED1,C8_bs$with_MED1,C8_bs$unsbscribed)
final

##binding sites by MED1

M1_bs= data.frame(total_peaks=c(11666),open_chromatin=c(4151), closed_chromatin=c(7542),
                  without_CDK8=c(4637), with_CDK8=c(7029), unsbscribed=c(1006))
final=table(M1_bs$total_peaks,M1_bs$open_chromatin,M1_bs$closed_chromatin,
            M1_bs$without_CDK8,M1_bs$with_CDK8,M1_bs$unsbscribed)
final


##CDK8 and MED1 binding sites on unsubscribed region



##
str(C8_new)
untrans_C8 = subset(C8_new, Region=="untranscribed")
dim(untrans_C8)



##
str(M1_new)
untrans_M1 = subset(M1_new, Region=="untranscribed")
dim(untrans_M1)

###save data files
save(untrans_C8, file = "untrans-C8.RData")
      save(untrans_M1, file = "untrans-M1.RData")

write.table(untrans_C8, file = "untrans-C8.txt", col.names=F, row.names=F, quote=F, sep="\t")
write.table(untrans_M1, file = "untrans-M1.txt", col.names=F, row.names=F, quote=F, sep="\t")

load("/Users/ismahashmi/untrans-C8.RData")
head(untrans_C8)

load("/Users/ismahashmi/untrans-M1.RData")
head(untrans_M1)


##intersecting med1 untranscribed regions with cdk8 untranscribed common untrnascribed

M1_int_un =read.table("~/M1_int_un")
head(M1_int_un)
dim(M1_int_un)


### note: same results found when intersecting cdk8 untranscribed intersecting with med1 for common regions

#intersecting med1 variants 

M1_unv =read.table("~/M1C8_unv")
head(M1_unv)
dim(M1_unv)
### note: same results found when intersecting cdk8 untranscribed intersecting with med1 for variants

C8_unv =read.table("~/M1C8_unv")
head(C8_unv)
dim(C8_unv)


##intersecting cdk8 untranscribed regions with atac-seq peak files

##cdk8 binding sites with ATAC_seq peaks

C8_At_p =read.table("~/CD8_aT_P")
head(C8_At_p)
dim(C8_At_p)

#cdk8 variants with ATAC_seq peaks
C8_At_V =read.table("~/C8_At_v")
head(C8_At_V)
dim(C8_At_V)

##intersecting med1 untranscribed regions with atac-seq peak files

##med1 binding sites with ATAC_seq peaks

M1_At_P =read.table("~/M1_At_p")
head(M1_At_P)
dim(M1_At_P)

#med1 variants with ATAC_seq peaks

M1_At_V =read.table("~/M1_At_v")
head(M1_At_V)
dim(M1_At_V)
