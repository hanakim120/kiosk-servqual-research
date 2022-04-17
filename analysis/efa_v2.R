###########################################
#
#  Exploratory Factor Analysis
#
#########################################

install.packages("psych")
library(psych)

install.packages("GPArotation")
library(GPArotation)

#  Data set prepration

load("kiosk_clean.rda")
sq_exp <- kiosk_clean[,seq(from=6, to=53, by=2)]
sq_per <- kiosk_clean[, seq(from=7, to=53, by=2)]
sq <- sq_per - sq_exp
ipa_sat <- kiosk_clean[, seq(from=113, to=159, by=2)]

for(i in 1:24) names(sq_per)[i] <- paste("x",i,sep="")
for(i in 1:24) names(sq)[i] <- paste("x",i,sep="")
for(i in 1:24) names(ipa_sat)[i] <- paste("x",i,sep="")

#  Correlation analysis

cortest.bartlett(sq_per)
cortest.bartlett(ipa_sat)
cortest.bartlett(sq)

KMO(sq_per)
KMO(ipa_sat)
KMO(sq)

MSA <- data.frame(sq_per=KMO(sq_per)$MSAi, sERVQUAL=KMO(sq)$MSAi, ipa_sat=KMO(ipa_sat)$MSAi)
round(MSA,3)

#  Exploratory Factor Analysis with sq_per data sets

per_efa8_ml <- fa(sq_per, nfactors=8, rotate="none", fm="ml")
per_efa8_pa <- fa(sq_per, nfactors=8, rotate="none", fm="pa")

per_efa8_ml
per_efa8_pa

per_efa8_varimax_ml <- fa(sq_per, nfactors=8, rotate="varimax", fm="ml")
per_efa8_varimax_pa <- fa(sq_per, nfactors=8, rotate="varimax", fm="pa")
per_efa8_varimax_ml
per_efa8_varimax_pa$loadings

per_efa8_promax_ml <- fa(sq_per, nfactors=8, rotate="promax", fm="ml")
per_efa8_promax_pa <- fa(sq_per, nfactors=8, rotate="promax", fm="pa")
per_efa8_promax_ml
per_efa8_promax_pa$loadings

per_efa7_varimax_pa <- fa(sq_per, nfactors=7, rotate="varimax", fm="pa")
per_efa7_varimax_pa$loadings
per_efa7_promax_pa <- fa(sq_per, nfactors=7, rotate="promax", fm="pa")
per_efa7_promax_pa$loadings

per_efa6_varimax_pa <- fa(sq_per, nfactors=6, rotate="varimax", fm="pa")
per_efa6_varimax_pa$loadings
per_efa6_promax_pa <- fa(sq_per, nfactors=6, rotate="promax", fm="pa")
per_efa6_promax_pa$loadings


#  Exploratory Factor Analysis with ipa_sat data sets

sat_efa7_varimax_pa <- fa(ipa_sat, nfactors=7, rotate="varimax", fm="pa")
sat_efa7_varimax_pa$loadings
sat_efa7_promax_pa <- fa(ipa_sat, nfactors=7, rotate="promax", fm="pa")
sat_efa7_promax_pa$loadings

sat_efa6_varimax_pa <- fa(ipa_sat, nfactors=6, rotate="varimax", fm="pa")
sat_efa6_varimax_pa$loadings
sat_efa6_promax_pa <- fa(ipa_sat, nfactors=6, rotate="promax", fm="pa")
sat_efa6_promax_pa$loadings

