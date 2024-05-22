library(ggplot2)
library(tidyverse)
library(dplyr)


df$region = factor(df$region, c("enhancer", "divergent", "promoter", "geneBody", "CPS", "TW", "untranscribed"))
table(C8m$region)
table(C8m$score)
# create separate violin plot
head(C8m)
boxplot(C8m$score ~ C8m$Region)
boxplot(C8m$score ~ C8m$Region, outline=F)
boxplot(C8m$score ~ C8m$Region)
region = c(C8m$Region)
score = c(C8m$score)
df_C8m <- data.frame(region = c(C8m$Region), score = c(C8m$score))
df_C8m$region = factor(df_C8m$region, c("enhancer", "divergent", "promoter", "geneBody", "CPS", "TW", "untranscribed"))
ggplot(df_C8m, aes(x=region, y=score, fill = region)) + 
  geom_violin(trim = FALSE) +
  scale_fill_manual(values=c("#CCFF00", "#CC33FF", "#FF9933", "#000000", "#33CCFF", "#FF3333", "#CCCCCC"))+
  scale_color_manual(values=c("#00FFFF")) +
  ggtitle("Cdk8 Violin plot") +
  xlab("")
####can also be done  y=log2(score)
##boxplot with vioplot showing median and qurtile

df <- data.frame(region = c(C8m$Region), score = c(C8m$score))
df$region = factor(df$region, c("enhancer", "divergent", "promoter", "geneBody", "CPS", "TW", "untranscribed"))
ggplot(df, aes(x=region, y=score, fill = region)) + 
  geom_violin(position=position_dodge(1)) +
  geom_boxplot(width=0.05, color="#3333FF") +
  scale_fill_manual(values=c("#CCFF00", "#CC33FF", "#FF9933", "#000000", "#33CCFF", "#FF3333", "#CCCCCC"))+
  scale_color_manual(values=c("#00FFFF")) +
  ggtitle("Cdk8 Violin plot with median and quartile ") +
  xlab("") +
  theme_minimal()

#Add mean and standard deviation
df_C8m <- data.frame(region = c(C8m$Region), score = c(C8m$score))
df$region = factor(df$region, c("enhancer", "divergent", "promoter", "geneBody", "CPS", "TW", "untranscribed"))
ggplot(df_C8m, aes(x=region, y=score, fill = region)) + 
  geom_violin(trim = FALSE) +
  scale_fill_manual(values=c("#CCFF00", "#CC33FF", "#FF9933", "#000000", "#33CCFF", "#FF3333", "#CCCCCC"))+
  stat_summary(fun.data=mean_sdl,
               geom="pointrange", color="#3333FF") +
  scale_color_manual(values=c("#00FFFF")) +
  ggtitle("CDK8 Violin plot with mean & stadard deviation") +
  xlab("") +
  theme_minimal()
 
#Violin plot with jitter
df_C8m <- data.frame(region = c(C8m$Region), score = c(C8m$score))
df$region = factor(df$region, c("enhancer", "divergent", "promoter", "geneBody", "CPS", "TW", "untranscribed"))  
  ggplot(df_C8m, aes(x=region, y=score, fill = region)) + 
    geom_violin(trim = FALSE) +
    scale_fill_manual(values=c("#CCFF00", "#CC33FF", "#FF9933", "#000000", "#33CCFF", "#FF3333", "#CCCCCC"))+
    geom_jitter(shape=16, position=position_jitter(0.1), color="#CCFFCC")+
    ggtitle("Cdk8 Violin plot with jitter")
  ####dotplots
  df_C8m <- data.frame(region = c(C8m$Region), score = c(C8m$score))
  ggplot(df_C8m, aes(x=region, y=score, fill = region)) + 
    geom_violin(trim = FALSE) +
    geom_dotplot(binaxis='score', stackdir='center', dotsize=3) +
    scale_fill_manual(values=c("green", "purple", "orange", "black", "blue", "red", "grey"))+
    ggtitle("Cdk8 Violin plot with dots")
  
  
  #MED1 basic violin plot
  head(M1m)
  M1m = M1m[order(-M1m$score),]
  head(M1m)
  boxplot(M1m$score ~ M1m$Region)
  boxplot(M1m$score ~ M1m$Region, outline=F)
  boxplot(M1m$score ~ M1m$Region)
  region = c(M1m$Region)
  score = c(M1m$score)
  df_M1m <- data.frame(region = c(M1m$Region), score = c(M1m$score))
  df_M1m$region = factor(df_M1m$region, c("enhancer", "divergent", "promoter", "geneBody", "CPS", "TW", "untranscribed"))
  table(df_M1m$region)
  ggplot(df_M1m, aes(x=region, y=score, fill = region)) + 
    geom_violin(trim = FALSE) +
    scale_fill_manual(values=c("#CCFF00", "#CC33FF", "#FF9933", "#000000", "#33CCFF", "#FF3333", "#CCCCCC"))+
    scale_color_manual(values=c("#00FFFF")) +
    ggtitle("MED1 Violin plot") +
    xlab("")
  

  ##boxplot with vioplot showing median and qurtile
   
  df_M1m <- data.frame(region = c(M1m$Region), score = c(M1m$score))
  df_M1m$region = factor(df_M1m$region, c("enhancer", "divergent", "promoter", "geneBody", "CPS", "TW", "untranscribed"))
  table(df_M1m$region)
  ggplot(df_M1m, aes(x=region, y=score, fill = region)) + 
    geom_violin(position=position_dodge(1)) +
    geom_boxplot(width=0.05, color="#3333FF") +
    scale_fill_manual(values=c("#CCFF00", "#CC33FF", "#FF9933", "#000000", "#33CCFF", "#FF3333", "#CCCCCC"))+
    scale_color_manual(values=c("#00FFFF")) +
    ggtitle("MED1 Violin plot with median and quartile") +
    xlab("") +
    theme_minimal()
  
  #Add mean and standard deviation
  
  df_M1m <- data.frame(region = c(M1m$Region), score = c(M1m$score))
  df_M1m$region = factor(df_M1m$region, c("enhancer", "divergent", "promoter", "geneBody", "CPS", "TW", "untranscribed"))
  table(df_M1m$region)
  ggplot(df_M1m, aes(x=region, y=score, fill = region)) + 
    geom_violin(trim = FALSE) +
    scale_fill_manual(values=c("#CCFF00", "#CC33FF", "#FF9933", "#000000", "#33CCFF", "#FF3333", "#CCCCCC"))+
    stat_summary(fun.data=mean_sdl,
                 geom="pointrange", color="#3333FF") +
    scale_color_manual(values=c("#00FFFF")) +
    ggtitle("MED1 Violin plot with mean & stadard deviation") +
    xlab("") +
    theme_minimal()
  