install.packages("ggplot2")
install.packages("breakDown")
#recall packages

library(ggplot2)
library(breakDown)
library(dplyr)
library(tidyr)
##represent counts and colors of cdk8


df_C8 <- data.frame(
  region=c("enhancer", "divergent", "promoter", "geneBody", "CPS", "TW", "untranscribed"),
  count=c(1376, 1520, 6837, 2254, 150, 385, 776)
)
df_C8$region = factor(df_C8$region, c("enhancer", "divergent", "promoter", "geneBody", "CPS", "TW", "untranscribed"))
ggplot(df_C8, aes(x = region, y= count, fill=region)) +
  geom_bar(stat="identity", color="white") +
  scale_fill_manual(values=c("green", "purple", "orange", "black", "blue", "red", "grey", "yellow"))+
  geom_text(aes(label=count), vjust=-0.3, size=3.5) +
  labs(x = "C8_new$Region", y = "count", title = "CDK8 distribution to FGRs")
theme_minimal()


##represent counts and colors of med1
df_M1 <- data.frame(
  region=c("enhancer", "divergent", "promoter", "geneBody", "CPS", "TW", "untranscribed"),
  count=c(933, 1261, 3988, 3707, 227, 541, 1009)
)
df_M1$region = factor(df_M1$region, c("enhancer", "divergent", "promoter", "geneBody", "CPS", "TW", "untranscribed", "unTxMaybe"))
ggplot(df_M1, aes(x = region, y= count, fill=region)) +
  geom_bar(stat="identity", color="white") +
  scale_fill_manual(values=c("green", "purple", "orange", "black", "blue", "red", "grey", "yellow"))+
  geom_text(aes(label=count), vjust=-0.3, size=3.5) +
  labs(x = "M1_new$Region", y = "count", title = "MED1 distribution to FGRs")
theme_minimal()






#percentage another way for cdk8

str(C8_new)
C8_new$Region = factor(C8_new$Region, c("enhancer", "divergent", "promoter", "geneBody", "CPS", "TW", "untranscribed"))
ggplot(C8_new, aes(x = C8_new$Region, y = percent, fill= C8_new$Region)) +  
  geom_bar(aes(y = (..count..)/sum(..count..))) +
  scale_fill_manual(values=c("green", "purple", "orange", "black", "blue", "red", "grey")) +
  #geom_text(aes(label = paste0(..count.., "(", round(perc,1), "%)"),
               # vjust = -0.25))
  labs(x = "C8_new$Region", y = "percent", title = "CDK8 distribution to FGRs in %")+
  scale_y_continuous(labels = scales::percent)
  
  
#MED1 percentage

str(M1_new)
M1_new$Region = factor(M1_new$Region, c("enhancer", "divergent", "promoter", "geneBody", "CPS", "TW", "untranscribed"))
ggplot(M1_new, aes(x = M1_new$Region, y = percent, fill= M1_new$Region)) +  
  geom_bar(aes(y = (..count..)/sum(..count..))) +
  scale_fill_manual(values=c("green", "purple", "orange", "black", "blue", "red", "grey")) +
  #geom_text(aes(y = (..count..)/sum(..count..), label=y)) +
  labs(x = "M1_new$Region", y = "percent", title = "MED1 distribution to FGRs in %")+
  scale_y_continuous(labels = scales::percent)


