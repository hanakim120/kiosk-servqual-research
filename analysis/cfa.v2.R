########################################################
#
#   Confirmatory Factor Analysis
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

sq <- cbind(sq, kiosk_clean[,160:163])
for(i in 1:24) names(sq)[i] <- paste("x",i,sep="")

ipa_sat <- cbind(ipa_sat, kiosk_clean[,160:163])
for(i in 1:24) names(ipa_sat)[i] <- paste("x",i,sep="")


#  CFA for sq_per (var12, var23 제외)

cfa1 <-"
# Factor loadings (LAMDA)
F1 =~ x4 + x5 + x6 + x22 + x24          # 유형성 (tangible)
F2 =~ x19 + x20 + x21                       # 보안성 (security)
F3 =~ x9 + x10 + x11 + x18                # 절약성 (economy)
F4 =~ x13 + x14 + x15 + x16 + x17       # 편리성 (convenience)
F5 =~ x1 + x2 + x3                          # 유용성 (reliability)
F6 =~ x7 + x8                                 # 통제성 (control)
# Covariance Between Latent variables (PHI)
F1 ~~ F1; F2 ~~ F2; F3 ~~ F3; F4 ~~ F4; F5 ~~ F5; F6 ~~ F6;
F1 ~~ F2; F1 ~~ F3; F1 ~~ F4; F1 ~~ F5; F1 ~~ F6; F2 ~~ F3;
F2 ~~ F4; F2 ~~ F5; F2 ~~ F6; F3 ~~ F4; F3 ~~ F5; F3 ~~ F6;
F4 ~~ F5; F4 ~~ F6; F5 ~~ F6
# Covariance Between observed variables (THETA)
x1 ~~ x1; x2 ~~ x2; x3 ~~ x3; x4 ~~ x4; x5 ~~ x5;
x6 ~~ x6; x7 ~~ x7; x8 ~~ x8; x9 ~~ x9; x10 ~~ x10;
x11 ~~ x11; x13 ~~ x13; x14 ~~ x14; x15 ~~ x15; x16 ~~ x16; 
x17 ~~ x17; x18 ~~ x18; x19 ~~ x19; x20 ~~ x20;
x21 ~~ x21; x22 ~~ x22; x24 ~~ x24
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

# Improve models with MI (modification index)

mi_1 <- modindices(per_cfa1)
mi_1 %>%
  arrange(desc(mi)) %>%
  head(40)


#  CFA ipa_sat for  (var12, var23 제외)

sat_cfa1 <- sem(cfa1, data=ipa_sat)
summary(sat_cfa1, fit.measures=T, standardized=T)

# compute CR(composite reliability) and AVE(average variance extected) for factors

est <- standardizedsolution(sat_cfa1)
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
mi_1 %>%
  arrange(desc(mi)) %>%
  head(40)


#  CFA SERVQUAL for  (var12, var23 제외)

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



#  add resultant questions total satistfaction and re-use intentions in CFA

cfa2 <- paste(cfa1,
"# add final questions into one latent dependent variable Y
Y =~ total1 + total2 + total3 + total4
Y ~~ Y; Y ~~ F1; Y ~~ F2; Y ~~ F3; Y ~~ F4; Y ~~ F5; Y ~~ F6
total1 ~~ total1; total2 ~~ total2; total3 ~~ total3; total4 ~~ total4"
)

f_cfa2 <- sem(cfa2, data=sbike_clean)
summary(f_cfa2, fit.measures=T, standardized=T)

est <- standardizedsolution(f_cfa2)
F1_loadings <- est[1:3, 4]
F1_thetas <- est[51:53, 4]
cr_ave(F1_loadings, F1_thetas)
F2_loadings <- est[4:6, 4]
F2_thetas <- est[42:44, 4]
cr_ave(F2_loadings, F2_thetas)
F3_loadings <- est[7:10, 4]
F3_thetas <- est[45:48, 4]
cr_ave(F3_loadings, F3_thetas)
F4_loadings <- est[11:13, 4]
F4_thetas <- est[54:56, 4]
cr_ave(F4_loadings, F4_thetas)
F5_loadings <- est[14:16, 4]
F5_thetas <- est[39:41, 4]
cr_ave(F5_loadings, F5_thetas)
F6_loadings <- est[17:18, 4]
F6_thetas <- est[49:50, 4]
cr_ave(F6_loadings, F6_thetas)
Y_loadings <- est[57:60,4]
Y_thetas <- est[67:70, 4]
cr_ave(Y_loadings, Y_thetas)

cfa3 <- paste(cfa1,
"# add final questions into two latent dependent variables Y1, Y2
Y1 =~ total1 + total2 
Y2 =~ total3 + total4
Y1 ~~ F1; Y1 ~~ F2; Y1 ~~ F3; Y1 ~~ F4; Y1 ~~ F5; Y1 ~~ F6
Y2 ~~ F1; Y2 ~~ F2; Y2 ~~ F3; Y2 ~~ F4; Y2 ~~ F5; Y2 ~~ F6
Y1 ~~ Y1; Y2 ~~ Y2; Y1 ~~ Y2
total1 ~~ total1; total2 ~~ total2; total3 ~~ total3; total4 ~~ total4"
)

f_cfa3 <- sem(cfa3, data=sbike_clean)
summary(f_cfa3, fit.measures=T, standardized=T)

est <- standardizedsolution(f_cfa3)
F1_loadings <- est[1:3, 4]
F1_thetas <- est[51:53, 4]
cr_ave(F1_loadings, F1_thetas)
F2_loadings <- est[4:6, 4]
F2_thetas <- est[42:44, 4]
cr_ave(F2_loadings, F2_thetas)
F3_loadings <- est[7:10, 4]
F3_thetas <- est[45:48, 4]
cr_ave(F3_loadings, F3_thetas)
F4_loadings <- est[11:13, 4]
F4_thetas <- est[54:56, 4]
cr_ave(F4_loadings, F4_thetas)
F5_loadings <- est[14:16, 4]
F5_thetas <- est[39:41, 4]
cr_ave(F5_loadings, F5_thetas)
F6_loadings <- est[17:18, 4]
F6_thetas <- est[49:50, 4]
cr_ave(F6_loadings, F6_thetas)
Y1_loadings <- est[57:58,4]
Y1_thetas <- est[76:77, 4]
cr_ave(Y1_loadings, Y1_thetas)
Y2_loadings <- est[59:60,4]
Y2_thetas <- est[78:79, 4]
cr_ave(Y2_loadings, Y2_thetas)
