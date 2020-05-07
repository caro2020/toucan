## essai Git

library(dplyr)



mes_ul<-data.frame(ape=c("10","16","42","10"),id=c("01010101","12121212","24242424","98989898"),r212=c(2000,4000,6000,5000),r213=c(100,200,400,300),r214=c(3000,4000,5000,4500),
                   r222=c(100,0,200,100),r302_202=c(10,12,16,34))


#calcul des CI
var_CI<-c("r212","r213","r214","r222","r302_202")
mes_ul$CI<-rowSums(mes_ul[,var_CI])

les_noms<-data.frame(denom=c("Cbon","toutenbois","Toutconstruit","ogout"),id=c("01010101","12121212","24242424","98989898"))

mes_ul_nom<-merge(mes_ul,les_noms,by="id")

#moyenne des achats

moyenne_par_achat<-colMeans(mes_ul[,c(var_CI,"CI")])

###

mat_prem_sup_moyen<-mes_ul[mes_ul$r212>moyenne_par_achat["r212"],]




#resultats par ape

sans_id<-mes_ul[,! names(mes_ul) %in% "id"]

mes_ul_ape<-  sans_id %>%
  group_by(ape) %>% 
  summarise_all(funs(sum))