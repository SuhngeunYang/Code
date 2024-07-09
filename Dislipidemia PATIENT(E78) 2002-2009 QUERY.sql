---drop table #EPO
--select * into #EPO from GNL_NM_CD where GNL_NM like '%erythropoietin%'

select * into YSE.dbo.rousvastatin_GNL_NM_CD from GNL_NM_CD where GNL_NM like '%rosuvastatin%'
drop table #tem2, #31t, #tem3, #21t, #jk, #41t, #21t_41t, #61t

--select * from #EPO

--60t
select PERSON_ID, KEY_SEQ, RECU_FR_DT, GNL_NM_CD, SEX, AGE_GROUP, MAIN_SICK, SUB_SICK, SICK_SYM into YSE.dbo.dislipidemia_rousvastatin_2002_2009
from YSE.dbo.dislipidemia_20t_60t_40t_JK_distinct_join where GNL_NM_CD in (select GNL_NM_CD from YSE.dbo.rousvastatin_GNL_NM_CD)


/*
select KEY_SEQ, SICK_SYM into #41t from NHID_GY40_T1_2002 where SICK_SYM LIKE 'E78%'
insert into #41t select KEY_SEQ, SICK_SYM from NHID_GY40_T1_2003 where SICK_SYM LIKE 'E78%'
insert into #41t select KEY_SEQ, SICK_SYM from NHID_GY40_T1_2004 where SICK_SYM LIKE 'E78%'

insert into #41t select KEY_SEQ, SICK_SYM from NHID_GY40_T1_2005 where SICK_SYM LIKE 'E78%'
insert into #41t select KEY_SEQ, SICK_SYM from NHID_GY40_T1_2006 where SICK_SYM LIKE 'E78%'
insert into #41t select KEY_SEQ, SICK_SYM from NHID_GY40_T1_2007 where SICK_SYM LIKE 'E78%'

insert into #41t select KEY_SEQ, SICK_SYM from NHID_GY40_T1_2008 where SICK_SYM LIKE 'E78%'
insert into #41t select KEY_SEQ, SICK_SYM from NHID_GY40_T1_2009 where SICK_SYM LIKE 'E78%'

select * into YSE.dbo.dislipidemia_40t_SICK_SYM from #41t
*/
/*
select KEY_SEQ, PERSON_ID, RECU_FR_DT, MAIN_SICK, SUB_SICK into #21t from NHID_GY20_T1_2002 where MAIN_SICK LIKE 'E78%' OR SUB_SICK LIKE 'E78%' OR KEY_SEQ IN (select KEY_SEQ from YSE.dbo.dislipidemia_40t_SICK_SYM)

insert into #21t select KEY_SEQ, PERSON_ID, RECU_FR_DT, MAIN_SICK, SUB_SICK from NHID_GY20_T1_2003 where MAIN_SICK LIKE 'E78%' OR SUB_SICK LIKE 'E78%' OR KEY_SEQ IN (select KEY_SEQ from YSE.dbo.dislipidemia_40t_SICK_SYM)
insert into #21t select KEY_SEQ, PERSON_ID, RECU_FR_DT, MAIN_SICK, SUB_SICK from NHID_GY20_T1_2004 where MAIN_SICK LIKE 'E78%' OR SUB_SICK LIKE 'E78%' OR KEY_SEQ IN (select KEY_SEQ from YSE.dbo.dislipidemia_40t_SICK_SYM)

insert into #21t select KEY_SEQ, PERSON_ID, RECU_FR_DT, MAIN_SICK, SUB_SICK from NHID_GY20_T1_2005 where MAIN_SICK LIKE 'E78%' OR SUB_SICK LIKE 'E78%' OR KEY_SEQ IN (select KEY_SEQ from YSE.dbo.dislipidemia_40t_SICK_SYM)
insert into #21t select KEY_SEQ, PERSON_ID, RECU_FR_DT, MAIN_SICK, SUB_SICK from NHID_GY20_T1_2006 where MAIN_SICK LIKE 'E78%' OR SUB_SICK LIKE 'E78%' OR KEY_SEQ IN (select KEY_SEQ from YSE.dbo.dislipidemia_40t_SICK_SYM)
insert into #21t select KEY_SEQ, PERSON_ID, RECU_FR_DT, MAIN_SICK, SUB_SICK from NHID_GY20_T1_2007 where MAIN_SICK LIKE 'E78%' OR SUB_SICK LIKE 'E78%' OR KEY_SEQ IN (select KEY_SEQ from YSE.dbo.dislipidemia_40t_SICK_SYM)

insert into #21t select KEY_SEQ, PERSON_ID, RECU_FR_DT, MAIN_SICK, SUB_SICK from NHID_GY20_T1_2008 where MAIN_SICK LIKE 'E78%' OR SUB_SICK LIKE 'E78%' OR KEY_SEQ IN (select KEY_SEQ from YSE.dbo.dislipidemia_40t_SICK_SYM)
insert into #21t select KEY_SEQ, PERSON_ID, RECU_FR_DT, MAIN_SICK, SUB_SICK from NHID_GY20_T1_2009 where MAIN_SICK LIKE 'E78%' OR SUB_SICK LIKE 'E78%' OR KEY_SEQ IN (select KEY_SEQ from YSE.dbo.dislipidemia_40t_SICK_SYM)

select * into YSE.dbo.dislipidemia_20t_SUB_MAIN from #21t
*/
/*
select GY20.PERSON_ID, GY20.KEY_SEQ, GY20.RECU_FR_DT, GY20.MAIN_SICK, GY20.SUB_SICK, GY40.SICK_SYM into #21t_41t
FROM #21t as GY20
FULL OUTER JOIN #41t as GY40 on GY40.KEY_SEQ = GY20.KEY_SEQ

select KEY_SEQ, GNL_NM_CD into #61t from NHID_GY60_T1_2002 where KEY_SEQ in (select KEY_SEQ from YSE.dbo.dislipidemia_20t_SUB_MAIN)
insert into #61t select KEY_SEQ, GNL_NM_CD from NHID_GY60_T1_2003 where KEY_SEQ in (select KEY_SEQ from YSE.dbo.dislipidemia_20t_SUB_MAIN)
insert into #61t select KEY_SEQ, GNL_NM_CD from NHID_GY60_T1_2004 where KEY_SEQ in (select KEY_SEQ from YSE.dbo.dislipidemia_20t_SUB_MAIN)

insert into #61t select KEY_SEQ, GNL_NM_CD from NHID_GY60_T1_2005 where KEY_SEQ in (select KEY_SEQ from YSE.dbo.dislipidemia_20t_SUB_MAIN)
insert into #61t select KEY_SEQ, GNL_NM_CD from NHID_GY60_T1_2006 where KEY_SEQ in (select KEY_SEQ from YSE.dbo.dislipidemia_20t_SUB_MAIN)
insert into #61t select KEY_SEQ, GNL_NM_CD from NHID_GY60_T1_2007 where KEY_SEQ in (select KEY_SEQ from YSE.dbo.dislipidemia_20t_SUB_MAIN)

insert into #61t select KEY_SEQ, GNL_NM_CD from NHID_GY60_T1_2008 where KEY_SEQ in (select KEY_SEQ from YSE.dbo.dislipidemia_20t_SUB_MAIN)
insert into #61t select KEY_SEQ, GNL_NM_CD from NHID_GY60_T1_2009 where KEY_SEQ in (select KEY_SEQ from YSE.dbo.dislipidemia_20t_SUB_MAIN)

select * into YSE.dbo.dislipidemia_60t_GNL_NM_CD from #61t 

select KEY_SEQ, DIV_CD into #31t from NHID_GY30_T1_2002 where KEY_SEQ in (select KEY_SEQ from #21t_41t)
insert into #31t select KEY_SEQ, DIV_CD from NHID_GY30_T1_2003 where KEY_SEQ in (select KEY_SEQ from #21t_41t) 
insert into #31t select KEY_SEQ, DIV_CD from NHID_GY30_T1_2004 where KEY_SEQ in (select KEY_SEQ from #21t_41t)

insert into #31t select KEY_SEQ, DIV_CD from NHID_GY30_T1_2005 where KEY_SEQ in (select KEY_SEQ from #21t_41t)
insert into #31t select KEY_SEQ, DIV_CD from NHID_GY30_T1_2006 where KEY_SEQ in (select KEY_SEQ from #21t_41t)
insert into #31t select KEY_SEQ, DIV_CD from NHID_GY30_T1_2007 where KEY_SEQ in (select KEY_SEQ from #21t_41t)

insert into #31t select KEY_SEQ, DIV_CD from NHID_GY30_T1_2008 where KEY_SEQ in (select KEY_SEQ from #21t_41t)
insert into #31t select KEY_SEQ, DIV_CD from NHID_GY30_T1_2009 where KEY_SEQ in (select KEY_SEQ from #21t_41t)

select * from #31t


select PERSON_ID, SEX, AGE_GROUP into #jk from dbo.NHID_JK_2002 where PERSON_ID in (select PERSON_ID from YSE.dbo.dislipidemia_20t_SUB_MAIN)
insert into #jk select PERSON_ID, SEX, AGE_GROUP from dbo.NHID_JK_2003 where PERSON_ID in (select PERSON_ID from YSE.dbo.dislipidemia_20t_SUB_MAIN)
insert into #jk select PERSON_ID, SEX, AGE_GROUP from dbo.NHID_JK_2004 where PERSON_ID in (select PERSON_ID from YSE.dbo.dislipidemia_20t_SUB_MAIN)

insert into #jk select PERSON_ID, SEX, AGE_GROUP from dbo.NHID_JK_2005 where PERSON_ID in (select PERSON_ID from YSE.dbo.dislipidemia_20t_SUB_MAIN)
insert into #jk select PERSON_ID, SEX, AGE_GROUP from dbo.NHID_JK_2006 where PERSON_ID in (select PERSON_ID from YSE.dbo.dislipidemia_20t_SUB_MAIN)
insert into #jk select PERSON_ID, SEX, AGE_GROUP from dbo.NHID_JK_2007 where PERSON_ID in (select PERSON_ID from YSE.dbo.dislipidemia_20t_SUB_MAIN)

insert into #jk select PERSON_ID, SEX, AGE_GROUP from dbo.NHID_JK_2008 where PERSON_ID in (select PERSON_ID from YSE.dbo.dislipidemia_20t_SUB_MAIN)
insert into #jk select PERSON_ID, SEX, AGE_GROUP from dbo.NHID_JK_2009 where PERSON_ID in (select PERSON_ID from YSE.dbo.dislipidemia_20t_SUB_MAIN)

select * into YSE.dbo.dislipidemia_jk_sex_age from #jk
*/
/*
select GY20_40.PERSON_ID, GY20_40.KEY_SEQ, GY20_40.RECU_FR_DT, GY60.GNL_NM_CD, GY20_40.MAIN_SICK, GY20_40.SUB_SICK into YSE.dbo.dislipidemia_20t_60t_join
---JK.SEX, JK.AGE_GROUP, , GY40.SICK_SYM
FROM YSE.dbo.dislipidemia_20t_SUB_MAIN as GY20_40
JOIN YSE.dbo.dislipidemia_60t_GNL_NM_CD as GY60 on GY60.KEY_SEQ = GY20_40.KEY_SEQ
*/
/*
select GY20_60.PERSON_ID, GY20_60.KEY_SEQ, GY20_60.RECU_FR_DT, GY20_60.GNL_NM_CD, GY20_60.MAIN_SICK, GY20_60.SUB_SICK, GY40.SICK_SYM into YSE.dbo.dislipidemia_20t_60t_40t_join
---JK.SEX, JK.AGE_GROUP,
FROM YSE.dbo.dislipidemia_20t_60t_join as GY20_60
JOIN YSE.dbo.dislipidemia_40t_SICK_SYM as GY40 on GY40.KEY_SEQ = GY20_60.KEY_SEQ
*/
/*
select GY20_60_40.PERSON_ID, GY20_60_40.KEY_SEQ, GY20_60_40.RECU_FR_DT, GY20_60_40.GNL_NM_CD, GY20_60_40.MAIN_SICK, GY20_60_40.SUB_SICK, GY20_60_40.SICK_SYM, JK.SEX, JK.AGE_GROUP into YSE.dbo.dislipidemia_20t_60t_40t_JK_join

FROM YSE.dbo.dislipidemia_20t_60t_40t_join as GY20_60_40
JOIN YSE.dbo.dislipidemia_jk_sex_age as JK on GY20_60_40.PERSON_ID = JK.PERSON_ID
*/
--where GY30.DIV_CD in (select div_cd from #tem2)
---in (select div_cd from #tem2)

select distinct PERSON_ID, KEY_SEQ, RECU_FR_DT, GNL_NM_CD, SEX, AGE_GROUP, MAIN_SICK, SUB_SICK, SICK_SYM into YSE.dbo.dislipidemia_20t_60t_40t_JK_distinct_join
from YSE.dbo.dislipidemia_20t_60t_40t_JK_join

/*
drop table #tem2, #31t, #tem3, #21t, #jk, #41t, #21t_41t, #61t
--drop table #EPO
*/