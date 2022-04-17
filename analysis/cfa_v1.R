########################################################
#
#   Confirmatory Factor Analysis: 
#     24개 측정변수, 8개 잠재변수를 모두 사용 
#
##########################################################

library(tidyverse)
library(lavaan)

#  Data set prepration

load("kiosk_clean.rda")
sq_exp <- kiosk_clean[,seq(from=6, to=53, by=2)]
sq_per <- kiosk_clean[, seq(from=7, to=53, by=2)]
sq <- sq_exp - sq_per
ipa_sat <- kiosk_clean[, seq(from=113, to=159, by=2)]

sq_per <- cbind(sq_per, kiosk_clean[,160:163])
for(i in 1:24) names(sq_per)[i] <- paste("x",i,sep="")
for( i in 1:4) names(sq_per)[24+i] <- paste("y",i,sep="")

sq <- cbind(sq, kiosk_clean[,160:163])
for(i in 1:24) names(sq)[i] <- paste("x",i,sep="")
for( i in 1:4) names(sq)[24+i] <- paste("y",i,sep="")

ipa_sat <- cbind(ipa_sat, kiosk_clean[,160:163])
for(i in 1:24) names(ipa_sat)[i] <- paste("x",i,sep="")
for( i in 1:4) names(ipa_sat)[24+i] <- paste("y",i,sep="")

#  CFA for sq_per

cfa1 <-"
# Factor loadings (LAMDA)
F1 =~ x1 + x2 + x3                 # 유용성 (reliability)
F2 =~ x4 + x5 + x6                 # 유희성 (fun)
F3 =~ x7 + x8 + x9                 # 통제성 (control)  
F4 =~ x10 + x11 + x12              # 절약성 (economy)  
F5 =~ x13 + x14 + x15              # 개인화 (personization)
F6 =~ x16 + x17 + x18              # 편리성 (convenience)
F7 =~ x19 + x20 + x21              # 보안성 (security)
F8 =~ x22 + x23 + x24              # 유형성 (tangible)
# Covariance Between Latent variables (PHI)
F1 ~~ F1; F2 ~~ F2; F3 ~~ F3; F4 ~~ F4; F5 ~~ F5; F6 ~~ F6; F7 ~~ F7; F8 ~~ F8
F1 ~~ F2; F1 ~~ F3; F1 ~~ F4; F1 ~~ F5; F1 ~~ F6; F1 ~~ F7; F1 ~~ F8
F2 ~~ F3; F2 ~~ F4; F2 ~~ F5; F2 ~~ F6; F2 ~~ F7; F2 ~~ F8; 
F3 ~~ F4; F3 ~~ F5; F3 ~~ F6; F3 ~~ F7; F3 ~~ F8; F4 ~~ F5; F4 ~~ F6; F4 ~~ F8;
F5 ~~ F6; F5 ~~ F7; F5 ~~ F8; F6 ~~ F7; F6 ~~ F8; F7 ~~ F8
# Covariance Between observed variables (THETA)
x1 ~~ x1; x2 ~~ x2; x3 ~~ x3; x4 ~~ x4; x5 ~~ x5;x6 ~~ x6; x7 ~~ x7; x8 ~~ x8; 
x9 ~~ x9; x10 ~~ x10; x11 ~~ x11; x12 ~~ x12; x13 ~~ x13; x14 ~~ x14; x15 ~~ x15; 
x16 ~~ x16; x17 ~~ x17; x18 ~~ x18; x19 ~~ x19; x20 ~~ x20;
x21 ~~ x21; x22 ~~ x22; x23 ~~ x23; x24 ~~ x24
"

per_cfa1 <- sem(cfa1, data=sq_per)
summary(per_cfa1, fit.measures=T, standardized=T)

# compute CR(composite reliability) and AVE(average variance extected) for factors

cr_ave <- function(loadings, thetas) {
  ss_l2 <- sum(loadings)^2
  ss_lsq <- sum(loadings^2)
  ss_thetas <- sum(thetas)
  CR <- ss_l2/(ss_l2+ss_thetas)
  AVE <- ss_lsq/(ss_lsq+ss_thetas)
  results <- cbind(CR, AVE)
  colnames(results) <- c("CR:composite reliability", "AVE: average variance extracted")
  results
}

est <- standardizedsolution(per_cfa1)
F1_loadings <- est[1:3, 4]
F1_thetas <- est[60:62,4]
cr_ave(F1_loadings, F1_thetas)
F2_loadings <- est[4:6, 4]
F2_thetas <- est[63:65, 4]
cr_ave(F2_loadings, F2_thetas)
F3_loadings <- est[7:9, 4]
F3_thetas <- est[66:68, 4]
cr_ave(F3_loadings, F3_thetas)
F4_loadings <- est[10:12, 4]
F4_thetas <- est[69:71, 4]
cr_ave(F4_loadings, F4_thetas)
F5_loadings <- est[13:15, 4]
F5_thetas <- est[72:74, 4]
cr_ave(F5_loadings, F5_thetas)
F6_loadings <- est[16:18, 4]
F6_thetas <- est[75:77, 4]
cr_ave(F6_loadings, F6_thetas)
F7_loadings <- est[19:21, 4]
F7_thetas <- est[78:80, 4]
cr_ave(F6_loadings, F6_thetas)
F8_loadings <- est[22:24, 4]
F8_thetas <- est[81:83, 4]
cr_ave(F6_loadings, F6_thetas)


# Improve models with MI (modification index)

mi_1 <- modindices(per_cfa1)
mi_1
mi_1 %>%
  arrange(desc(mi)) %>%
  head(40)


#  CFA ipa_sat for  

sat_cfa1 <- sem(cfa1, data=ipa_sat)
summary(sat_cfa1, fit.measures=T, standardized=T)

# compute CR(composite reliability) and AVE(average variance extected) for factors

est <- standardizedsolution(sat_cfa1)
F1_loadings <- est[1:3, 4]
F1_thetas <- est[60:62,4]
cr_ave(F1_loadings, F1_thetas)
F2_loadings <- est[4:6, 4]
F2_thetas <- est[63:65, 4]
cr_ave(F2_loadings, F2_thetas)
F3_loadings <- est[7:9, 4]
F3_thetas <- est[66:68, 4]
cr_ave(F3_loadings, F3_thetas)
F4_loadings <- est[10:12, 4]
F4_thetas <- est[69:71, 4]
cr_ave(F4_loadings, F4_thetas)
F5_loadings <- est[13:15, 4]
F5_thetas <- est[72:74, 4]
cr_ave(F5_loadings, F5_thetas)
F6_loadings <- est[16:18, 4]
F6_thetas <- est[75:77, 4]
cr_ave(F6_loadings, F6_thetas)
F7_loadings <- est[19:21, 4]
F7_thetas <- est[78:80, 4]
cr_ave(F6_loadings, F6_thetas)
F8_loadings <- est[22:24, 4]
F8_thetas <- est[81:83, 4]
cr_ave(F6_loadings, F6_thetas)

mi_1 <- modindices(sat_cfa1)
mi_1 %>%
  arrange(desc(mi)) %>%
  head(40)

#  SEVQUEAL: sq_per - sq_exp 모형 

sq_cfa1 <- sem(cfa1, data=sq)
summary(sq_cfa1, fit.measures=T, standardized=T)

# compute CR(composite reliability) and AVE(average variance extected) for factors

est <- standardizedsolution(sq_cfa1)
F1_loadings <- est[1:5, 4]
F1_thetas <- est[c(46:48, 63,64),4]
cr_ave(F1_loadings, F1_thetas)
F2_loadings <- est[6:8, 4]
F2_thetas <- est[c(60:62), 4]
cr_ave(F2_loadings, F2_thetas)
F3_loadings <- est[9:12, 4]
F3_thetas <- est[c(51,52,53,59), 4]
cr_ave(F3_loadings, F3_thetas)
F4_loadings <- est[13:17, 4]
F4_thetas <- est[55:58, 4]
cr_ave(F4_loadings, F4_thetas)
F5_loadings <- est[18:20, 4]
F5_thetas <- est[43:45, 4]
cr_ave(F5_loadings, F5_thetas)
F6_loadings <- est[21:22, 4]
F6_thetas <- est[49:50, 4]
cr_ave(F6_loadings, F6_thetas)

mi_1 <- modindices(sat_cfa1)
mi_1
mi_1 %>%
  arrange(desc(mi)) %>%
  head(40)

