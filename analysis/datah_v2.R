#####################################################
#
#   3학년 품질경영 kiosk 설문조사 (데이터 작성)
#
######################################################

library(tidyverse)

#
#  load and rearrange kiosk data
#

# read kiosk data set

kiosk <- read.csv("kiosk.csv", stringsAsFactors = FALSE)

# Rearrage the columns (group, sq, kano, ipa, total) and change the name of variables

kiosk[, 1:163] <- kiosk[,c(1:3,153,163,4:17,20,21,18,19,22:61,155,156,62:91,108:120,156:158,92:105,121,122,106,107,123:152,159:162)]

# define variable names

name_group <- c("sex", "age", "frequency", "usage", "reason")

name_sq <- vector()
for(i in 1:24){
    name_sq[2*i-1] <- paste("sq",i,"_1", sep="")
    name_sq[2*i] <- paste("sq",i,"_2", sep="")
}

name_kano <- vector()
for(i in 1:29){
  name_kano[2*i-1] <- paste("kano",i,"_1", sep="") 
  name_kano[2*i] <- paste("kano",i,"_2", sep="")
}

name_ipa <- vector()
for(i in 1:24){
  name_ipa[2*i-1] <- paste("ipa",i,"_1", sep="") 
  name_ipa[2*i] <- paste("ipa",i,"_2", sep="")
}

name_total <- c(name_group, name_sq, name_kano, name_ipa, "total1","total2","total3","total4")
names(kiosk) <- name_total

# Change character vector to relevant factor vectors

kiosk$sex <- factor(kiosk$sex)
kiosk$age <- factor(kiosk$age, ordered=TRUE)
kiosk$frequency <- factor(kiosk$frequency, levels=c("사용한 적 없음", "6개월에 2~3회 이상","한달에 2~3회 이상","일주일에 2~3회 이상"),
                          ordered=TRUE)
kiosk$usage <- factor(kiosk$usage)

for(i in 54:111){
  kiosk[,i] <- factor(kiosk[,i], levels=c("마음에 든다.","당연하다.","아무런 느낌이 없다.", "하는 수 없다.","마음에 안 든다."))
}

# eliminate the obervations which marked "none" on frequency

kiosk_clean <- kiosk %>%
  filter(frequency!="사용한 적 없음")

summary(kiosk_clean[,1:5])

kiosk_clean <- kiosk_clean[-c(21,22,25,38,61,77,84,90,100,124,136,185,205),]

#
#  SERVQUAL, Kano, ipa 데이터셋의 분리 
#

sq_exp <- kiosk_clean[,seq(from=6, to=53, by=2)]
sq_per <- kiosk_clean[, seq(from=7, to=53, by=2)]

kano_pos <- kiosk_clean[,seq(from=54, to=111, by=2)]
kano_neg <- kiosk_clean[,seq(from=55, to=111, by=2)]

ipa_imp <- kiosk_clean[, seq(from=112, to=159, by=2)]
ipa_sat <- kiosk_clean[, seq(from=113, to=159, by=2)]

save(kiosk_clean, file="kiosk_clean.rda")
save(sq_exp, file="sq_exp.rda")
save(sq_per, file="sq_per.rda")
save(kano_pos, file="kano_pos.rda")
save(kano_neg, file="kano_neg.rda")
save(ipa_imp, file="ipa_imp.rda")
save(ipa_sat, file="ipa_sat.rda")

# 설문별 상관분석 

cor_exp_per <- vector(); cor_exp_imp <- vector(); cor_exp_sat <- vector()
cor_per_imp <- vector(); cor_per_sat <- vector(); cor_imp_sat <- vector()

for (i in 1:24){
  cor_exp_per[i] <- cor(sq_exp[[i]], sq_per[[i]])
  cor_exp_imp[i] <- cor(sq_exp[[i]], ipa_imp[[i]])
  cor_exp_sat[i] <- cor(sq_exp[[i]], ipa_sat[[i]])
  cor_per_imp[i] <- cor(sq_per[[i]], ipa_imp[[i]])
  cor_per_sat[i] <- cor(sq_per[[i]], ipa_sat[[i]])
  cor_imp_sat[i] <- cor(ipa_imp[[i]], ipa_sat[[i]])
}
cor_exp_per
mean(cor_exp_per)
cor_exp_imp
mean(cor_exp_imp)
cor_exp_sat
mean(cor_exp_sat)
cor_per_imp
mean(cor_per_imp)
cor_per_sat
mean(cor_per_sat)
cor_imp_sat
mean(cor_imp_sat)
