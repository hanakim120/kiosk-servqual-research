##############################################################
#
#   Stucutured Equation Modeling: final model
#     6 exogeous constructs of 20 indicators
#
##############################################################

library(tidyverse)
library(lavaan)

#  Data set prepration

load("kiosk_clean.rda")
sq_per <- kiosk_clean[, seq(from=7, to=53, by=2)]
ipa_sat <- kiosk_clean[, seq(from=113, to=159, by=2)]

sq_per <- cbind(sq_per, kiosk_clean[,160:163])
for(i in 1:24) names(sq_per)[i] <- paste("x",i,sep="")
for(i in 1:4) names(sq_per)[24+i] <- paste("y",i,sep="")

ipa_sat <- cbind(ipa_sat, kiosk_clean[,160:163])
for(i in 1:24) names(ipa_sat)[i] <- paste("x",i,sep="")
for(i in 1:4) names(ipa_sat)[24+i] <- paste("y",i,sep="")


#     
#                 SEM1 model     
#         6 exogeous constructs with 20 indicators
#         1 endogeous construct with 4 indicators
# 

sem1 <-"
# Factor loadings (LAMDA-X)
F1 =~ x4 + x5 + x6 + x22              # 유형성 (tangible)
F2 =~ x19 + x20 + x21                 # 보안성 (security)
F3 =~ x10 + x11 + x18                 # 절약성 (economy)
F4 =~ x13 + x14 + x15 + x16 + x17     # 편리성 (convenience)
F5 =~ x1 + x2 + x3                    # 유용성 (reliability)
F6 =~ x7 + x8                         # 통제성 (control)
# Factor loadings (LAMDA-Y)
R =~ y1 + y2 +y3 + y4
# Covariance Between exogenous Latent variables (PHI)
F1 ~~ F1; F2 ~~ F2; F3 ~~ F3; F4 ~~ F4; F5 ~~ F5; F6 ~~ F6;
F1 ~~ F2; F1 ~~ F3; F1 ~~ F4; F1 ~~ F5; F1 ~~ F6; F2 ~~ F3;
F2 ~~ F4; F2 ~~ F5; F2 ~~ F6; F3 ~~ F4; F3 ~~ F5; F3 ~~ F6;
F4 ~~ F5; F4 ~~ F6; F5 ~~ F6
# Covariance Between endogenous latent variables (PSI)
R ~~ R
# Variances of observed exognous variables (THETA-delta)
x1 ~~ x1; x2 ~~ x2; x3 ~~ x3; x4 ~~ x4; x5 ~~ x5;
x6 ~~ x6; x7 ~~ x7; x8 ~~ x8; x10 ~~ x10;
x11 ~~ x11; x13 ~~ x13; x14 ~~ x14; x15 ~~ x15; x16 ~~ x16; 
x17 ~~ x17; x18 ~~ x18; x19 ~~ x19; x20 ~~ x20;
x21 ~~ x21; x22 ~~ x22
# Variances observed endogenous variables (THETA-epsilon)
y1 ~~ y1; y2 ~~ y2; y3 ~~ y3; y4 ~~y4
# Exogenous Factors influence on endogenous factors (GAMMA)
R ~ F1; R ~ F2; R ~ F3; R ~ F4; R ~ F5; R ~ F6
"

sat_sem1 <- sem(sem1, data=ipa_sat)
summary(sat_sem1, fit.measures=T, standardized=T)

#     
#                 SEM2 model     
#         6 exogeous constructs with 20 indicators
#         2 endogeous constructs (full model)
# 

sem2 <-"
# Factor loadings (LAMDA-X)
F1 =~ x4 + x5 + x6 + x22              # 유형성 (tangible)
F2 =~ x19 + x20 + x21                 # 보안성 (security)
F3 =~ x10 + x11 + x18                 # 절약성 (economy)
F4 =~ x13 + x14 + x15 + x16 + x17     # 편리성 (convenience)
F5 =~ x1 + x2 + x3                    # 유용성 (reliability)
F6 =~ x7 + x8                         # 통제성 (control)
# Factor loadings (LAMDA-Y)
R1 =~ y1 + y2
R2 =~ y3 + y4
# Covariance Between exogenous Latent variables (PHI)
F1 ~~ F1; F2 ~~ F2; F3 ~~ F3; F4 ~~ F4; F5 ~~ F5; F6 ~~ F6;
F1 ~~ F2; F1 ~~ F3; F1 ~~ F4; F1 ~~ F5; F1 ~~ F6; F2 ~~ F3;
F2 ~~ F4; F2 ~~ F5; F2 ~~ F6; F3 ~~ F4; F3 ~~ F5; F3 ~~ F6;
F4 ~~ F5; F4 ~~ F6; F5 ~~ F6
# Covariance Between endogenous latent variables (PSI)
R1 ~~ R1; R2 ~~ R2
# Variances of observed exognous variables (THETA-delta)
x1 ~~ x1; x2 ~~ x2; x3 ~~ x3; x4 ~~ x4; x5 ~~ x5;
x6 ~~ x6; x7 ~~ x7; x8 ~~ x8; x10 ~~ x10;
x11 ~~ x11; x13 ~~ x13; x14 ~~ x14; x15 ~~ x15; x16 ~~ x16; 
x17 ~~ x17; x18 ~~ x18; x19 ~~ x19; x20 ~~ x20;
x21 ~~ x21; x22 ~~ x22
# Variances observed endogenous variables (THETA-epsilon)
y1 ~~ y1; y2 ~~ y2; y3 ~~ y3; y4 ~~y4
# Exogenous Factors influence on endogenous factors (GAMMA)
R1 ~ F1; R1 ~ F2; R1 ~ F3; R1 ~ F4; R1 ~ F5; R1 ~ F6
R2 ~ F1; R2 ~ F2; R2 ~ F3; R2 ~ F4; R2 ~ F5; R2 ~ F6
# Endogenous factors influces on endogenuous factors (BETA)
R2 ~ R1
"

sat_sem2 <- sem(sem2, data=ipa_sat)
summary(sat_sem2, fit.measures=T, standardized=T)

#     
#                 SEM3 model     
#         6 exogeous constructs with 20 indicators
#         2 endogeous constructs (full model exluding R1 -> R2)
# 

sem3 <-"
# Factor loadings (LAMDA-X)
F1 =~ x4 + x5 + x6 + x22              # 유형성 (tangible)
F2 =~ x19 + x20 + x21                 # 보안성 (security)
F3 =~ x10 + x11 + x18                 # 절약성 (economy)
F4 =~ x13 + x14 + x15 + x16 + x17     # 편리성 (convenience)
F5 =~ x1 + x2 + x3                    # 유용성 (reliability)
F6 =~ x7 + x8                         # 통제성 (control)
# Factor loadings (LAMDA-Y)
R1 =~ y1 + y2
R2 =~ y3 + y4
# Covariance Between exogenous Latent variables (PHI)
F1 ~~ F1; F2 ~~ F2; F3 ~~ F3; F4 ~~ F4; F5 ~~ F5; F6 ~~ F6;
F1 ~~ F2; F1 ~~ F3; F1 ~~ F4; F1 ~~ F5; F1 ~~ F6; F2 ~~ F3;
F2 ~~ F4; F2 ~~ F5; F2 ~~ F6; F3 ~~ F4; F3 ~~ F5; F3 ~~ F6;
F4 ~~ F5; F4 ~~ F6; F5 ~~ F6
# Covariance Between endogenous latent variables (PSI)
R1 ~~ R1; R2 ~~ R2
# Variances of observed exognous variables (THETA-delta)
x1 ~~ x1; x2 ~~ x2; x3 ~~ x3; x4 ~~ x4; x5 ~~ x5;
x6 ~~ x6; x7 ~~ x7; x8 ~~ x8; x10 ~~ x10;
x11 ~~ x11; x13 ~~ x13; x14 ~~ x14; x15 ~~ x15; x16 ~~ x16; 
x17 ~~ x17; x18 ~~ x18; x19 ~~ x19; x20 ~~ x20;
x21 ~~ x21; x22 ~~ x22
# Variances observed endogenous variables (THETA-epsilon)
y1 ~~ y1; y2 ~~ y2; y3 ~~ y3; y4 ~~y4
# Exogenous Factors influence on endogenous factors (GAMMA)
R1 ~ F1; R1 ~ F2; R1 ~ F3; R1 ~ F4; R1 ~ F5; R1 ~ F6
R2 ~ F1; R2 ~ F2; R2 ~ F3; R2 ~ F4; R2 ~ F5; R2 ~ F6
"

sat_sem3 <- sem(sem3, data=ipa_sat)
summary(sat_sem3, fit.measures=T, standardized=T)


#
#  6 exogeous constructs with 20 indicators
#  2 enddogeous construct with 4 indicators (moderating model)
# 

sem4 <-"
# Factor loadings (LAMDA-X)
F1 =~ x4 + x5 + x6 + x22              # 유형성 (tangible)
F2 =~ x19 + x20 + x21                 # 보안성 (security)
F3 =~ x10 + x11 + x18                 # 절약성 (economy)
F4 =~ x13 + x14 + x15 + x16 + x17     # 편리성 (convenience)
F5 =~ x1 + x2 + x3                    # 유용성 (reliability)
F6 =~ x7 + x8                         # 통제성 (control)
# Factor loadings (LAMDA-Y)
R1 =~ y1 + y2
R2 =~ y3 + y4
# Covariance Between exogenous Latent variables (PHI)
F1 ~~ F1; F2 ~~ F2; F3 ~~ F3; F4 ~~ F4; F5 ~~ F5; F6 ~~ F6;
F1 ~~ F2; F1 ~~ F3; F1 ~~ F4; F1 ~~ F5; F1 ~~ F6; F2 ~~ F3;
F2 ~~ F4; F2 ~~ F5; F2 ~~ F6; F3 ~~ F4; F3 ~~ F5; F3 ~~ F6;
F4 ~~ F5; F4 ~~ F6; F5 ~~ F6
# Covariance Between endogenous latent variables (PSI)
R1 ~~ R1; R2 ~~ R2
# Variances of observed exognous variables (THETA-delta)
x1 ~~ x1; x2 ~~ x2; x3 ~~ x3; x4 ~~ x4; x5 ~~ x5;
x6 ~~ x6; x7 ~~ x7; x8 ~~ x8; x10 ~~ x10;
x11 ~~ x11; x13 ~~ x13; x14 ~~ x14; x15 ~~ x15; x16 ~~ x16; 
x17 ~~ x17; x18 ~~ x18; x19 ~~ x19; x20 ~~ x20;
x21 ~~ x21; x22 ~~ x22
# Variances observed endogenous variables (THETA-epsilon)
y1 ~~ y1; y2 ~~ y2; y3 ~~ y3; y4 ~~y4
# Exogenous Factors influence on endogenous factors (GAMMA)
R1 ~ F1; R1 ~ F2; R1 ~ F3; R1 ~ F4; R1 ~ F5; R1 ~ F6
# Endogenous factors influces on endogenuous factors (BETA)
R2 ~ R1
"

sat_sem4 <- sem(sem4, data=ipa_sat)
summary(sat_sem4, fit.measures=T, standardized=T)


anova(sat_sem2, sat_sem3, sat_sem4)
