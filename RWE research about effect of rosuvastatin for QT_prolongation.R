library(RODBC)
library(data.table)
library(dplyr)
library(MatchIt)
library(survival)
library(comorbidity)
library(tidyr)
library(zoo)
install.packages("readr")
library(readr)
install.packages("stringr")
library(stringr)
install.packages("Matching")
library(Matching)
install.packages("rbounds")
library("rbounds")

Sys.setenv("LANGUAGE" = "EN")

#Adopting DB from SQL server
dbhandle <- odbcDriverConnect('driver={SQL Server};server=;database=;UID=;PWD=')
dbhandle2 <- odbcDriverConnect('driver={SQL Server};server=;database=;UID=;PWD=')
dbhandle3 <- odbcDriverConnect('driver={SQL Server};server=;database=;UID=;PWD=')
dbhandle4 <- odbcDriverConnect('driver={SQL Server};server=;database=;UID=;PWD=')
##############################################


rm(prescription)
sql <- paste0("select * from YSE.dbo.dislipidemia_20t_60t_30t_RECU_TOTAL_DAYS_join_2004_2009")
prescription <- sqlQuery(dbhandle4, sql)
prescription <- data.table(prescription)
setindex(prescription, PERSON_ID)
colnames(prescription) <- c("PERSON_ID", "RECU_FR_DT", "GNL_NM_CD", "PER_1TIME", "PER_1DAY", "TOTAL_DAYS")
head(prescription)

sql <- paste0("select * from ALL_rosuvastatin_2004_2009_not_overlapped_during_2004_2013")
ROSU_CASE_FINAL <- sqlQuery(dbhandle4, sql)
ROSU_CASE_FINAL <- data.table(ROSU_CASE_FINAL)
setindex(ROSU_CASE_FINAL, PERSON_ID)
head(ROSU_CASE_FINAL)

sql <- paste0("select * from ALL_atorvastatin_2004_2009_not_overlapped_during_2004_2013")
ATOR_CASE_FINAL <- sqlQuery(dbhandle4, sql) 
ATOR_CASE_FINAL <- data.table(ATOR_CASE_FINAL)
setindex(ATOR_CASE_FINAL, PERSON_ID)
head(ATOR_CASE_FINAL)

sql <- paste0("select * from QT_PR_drug_qt_code_score_Final")
Drug_list <- sqlQuery(dbhandle4, sql)
Drug_list <- data.table(Drug_list)
setindex(Drug_list, GNL_NM_CD)
head(Drug_list)

sql <- paste0("select * from dislipidemia_20t_60t_40t_JK_distinct_2004_2009_join")
DL_CASE_FINAL <- sqlQuery(dbhandle4, sql)
DL_CASE_FINAL <- data.table(DL_CASE_FINAL)
setindex(DL_CASE_FINAL, PERSON_ID)
head(DL_CASE_FINAL)

rm(ATOR_CASE_FINAL, ROSU_CASE_FINAL)
rm(ATOR_CASE_PERSON_ID, ROSU_CASE_FINAL)
rm(control_1)
####################################################
ROSU_CASE_PERSON_ID <- ROSU_CASE_FINAL[,c("PERSON_ID")]
case_1 <- inner_join(DL_CASE_FINAL, ROSU_CASE_PERSON_ID, by = 'PERSON_ID')
case_1 <- data.table(case_1)

colnames(case_1) <- c("PERSON_ID","KEY_SEQ","DL_year","GNL_NM_CD","SEX","AGE_GROUP","MAIN_SICK","SUB_SICK","SICK_SYM")
case_1 <- distinct(case_1, PERSON_ID,KEY_SEQ,DL_year,GNL_NM_CD,SEX,AGE_GROUP,MAIN_SICK,SUB_SICK,SICK_SYM)
case_1$DL_year <- substr(case_1$DL_year,1,4)
case_1$CASE_CONTROL <- 1
setindex(case_1, PERSON_ID)
head(case_1)

ATOR_CASE_PERSON_ID <- ATOR_CASE_FINAL[,c("PERSON_ID")]
control_1 <- inner_join(DL_CASE_FINAL, ATOR_CASE_PERSON_ID, by = 'PERSON_ID')
colnames(control_1) <- c("PERSON_ID","KEY_SEQ","DL_year","GNL_NM_CD","SEX","AGE_GROUP","MAIN_SICK","SUB_SICK","SICK_SYM")
control_1 <- distinct(control_1, PERSON_ID,KEY_SEQ,DL_year,GNL_NM_CD,SEX,AGE_GROUP,MAIN_SICK,SUB_SICK,SICK_SYM)
control_1 <- data.table(control_1)
head(control_1)
control_1$DL_year <- substr(control_1$DL_year,1,4)
control_1$CASE_CONTROL <- 0
setindex(control_1, PERSON_ID)
head(control_1)


#####QT_causing_drug
distinct_prescription <- distinct(prescription, PERSON_ID, RECU_FR_DT, GNL_NM_CD, PER_1TIME, PER_1DAY, TOTAL_DAYS)
distinct_prescription <- distinct_prescription %>% mutate(PERSON_ID = as.integer(PERSON_ID))
distinct_prescription <- distinct_prescription %>% mutate(GNL_NM_CD = as.factor(GNL_NM_CD))
head(distinct_prescription)

test1 <- inner_join(distinct_prescription, Drug_list, by ='GNL_NM_CD')
QT_causing_drug_1_1 <- case_1[,c("PERSON_ID")]
QT_causing_drug_1_1 <- inner_join(QT_causing_drug_1_1, test1, by = 'PERSON_ID')

QT_causing_drug_1_1 <- distinct(QT_causing_drug_1_1, PERSON_ID, RECU_FR_DT, GNL_NM_CD, PER_1TIME, PER_1DAY, TOTAL_DAYS, drug)
QT_causing_drug_1_1$number <- rep(1:nrow(QT_causing_drug_1_1))
QT_causing_drug_1_1 <- spread(QT_causing_drug_1_1, drug, TOTAL_DAYS, fill = 0)
head(QT_causing_drug_1_1)

count_QT_causing_drug_table <- QT_causing_drug_1_1 %>% 
  group_by(PERSON_ID) %>% 
  summarise(Conditional= sum(Conditional),   Known= sum(Known), Possible= sum(Possible))
head(count_QT_causing_drug_table)

case_1 <- left_join(case_1, count_QT_causing_drug_table, by = 'PERSON_ID')
case_1[is.na(case_1)] <- 0


rm(data, distinct_case_1, distinct_DL_CASE_FINAL,QT_causing_drug_1_1,distinct_prescription, prescription)
head(case_1)
head(control_1)
rm(control_1)


test1 <- inner_join(distinct_prescription, Drug_list, by ='GNL_NM_CD')
QT_causing_drug_1_1 <- control_1[,c("PERSON_ID")]
QT_causing_drug_1_1 <- inner_join(QT_causing_drug_1_1, test1, by = 'PERSON_ID')

QT_causing_drug_1_1 <- distinct(QT_causing_drug_1_1, PERSON_ID, RECU_FR_DT, GNL_NM_CD, PER_1TIME, PER_1DAY, TOTAL_DAYS, drug)
QT_causing_drug_1_1$number <- rep(1:nrow(QT_causing_drug_1_1))
QT_causing_drug_1_1 <- spread(QT_causing_drug_1_1, drug, TOTAL_DAYS, fill = 0)
head(QT_causing_drug_1_1)

count_QT_causing_drug_table <- QT_causing_drug_1_1 %>% 
  group_by(PERSON_ID) %>% 
  summarise(Conditional= sum(Conditional),   Known= sum(Known), Possible= sum(Possible))  
count_QT_causing_drug_table <- count_QT_causing_drug_table %>% 
  group_by(PERSON_ID) %>% 
  summarise(Conditional= sum(Conditional),   Known= sum(Known), Possible= sum(Possible))  
head(count_QT_causing_drug_table)

control_1 <- left_join(control_1, count_QT_causing_drug_table, by = 'PERSON_ID')
control_1[is.na(control_1)] <- 0
head(control_1)

total1 <- bind_rows(case_1, control_1)
head(total1)
str(total1)
arrange(total1, PERSON_ID, DL_year)
unique_total2 = total1[-which(duplicated(total1$PERSON_ID)),]
head(unique_total2)
unique_total3 <-unique_total2[ ,c("PERSON_ID","DL_year", "SEX", "AGE_GROUP", "CASE_CONTROL", "Conditional", "Known", "Possible")]


PSmatch_ROSU <- matchit(CASE_CONTROL ~ DL_year + SEX+ AGE_GROUP + Conditional+Known+Possible, data = unique_total3, method="nearest", exact='DL_year', ratio=3)
summary(PSmatch_ROSU)
plot(PSmatch_ROSU, type = 'jitter', interactive = FALSE)

metacum(PSmatch_ROSU, pooled = "random")

case <- match.data(PSmatch_ROSU, group = 'treat', subclass = 'subclass')
case$subclass <- rownames(case)
control <- match.data(PSmatch_ROSU, group = 'control', subclass = 'subclass')
control$subclass <- rownames(control)
head(case)
head(control)
case <- case[,c("PERSON_ID","DL_year","subclass","CASE_CONTROL")]
control <- control[,c("PERSON_ID","DL_year","subclass","CASE_CONTROL")]

write.csv(case, "C:\\Users\\ABMI\\Downloads\\epo\\rosuvastatin\\ROSU_case.csv")
write.csv(control, "C:\\Users\\ABMI\\Downloads\\epo\\rosuvastatin\\ATOR_control.csv")


#Printing SQL query prolongation causing drug. 
for (i in QT_prolongation_drug_name){
  sql <-paste0("insert into YSE.dbo.QT_PR_v2_drug_0813 select GNL_NM_CD, '",i,"' as drug from GNL_NM_CD where GNL_NM like '%",i,"%'", sep="")
  print(sql)
  sqlQuery(dbhandle3, sql)
}

#Printing QT prolongation causing drug. EX) ketoconazole = sum(ketoconazole),
for (i in QT_prolongation_drug){
  sql <-paste0(i,"= sum(",i,"),", sep="")
  print(sql)
}