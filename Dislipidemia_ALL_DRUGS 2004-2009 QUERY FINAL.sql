/*
drop table #41t
select KEY_SEQ into #41t from NHID.dbo.NHID_GY40_T1_2004 where SICK_SYM LIKE 'E78%'

insert into #41t select KEY_SEQ from NHID.dbo.NHID_GY40_T1_2005 where SICK_SYM LIKE 'E78%'
insert into #41t select KEY_SEQ from NHID.dbo.NHID_GY40_T1_2006 where SICK_SYM LIKE 'E78%'
insert into #41t select KEY_SEQ from NHID.dbo.NHID_GY40_T1_2007 where SICK_SYM LIKE 'E78%'

insert into #41t select KEY_SEQ from NHID.dbo.NHID_GY40_T1_2008 where SICK_SYM LIKE 'E78%'
insert into #41t select KEY_SEQ from NHID.dbo.NHID_GY40_T1_2009 where SICK_SYM LIKE 'E78%'

select * into YSE.dbo.dislipidemia_40t_SICK_SYM_2004_2009 from #41t
*/

/*
select KEY_SEQ, PERSON_ID, RECU_FR_DT into #21t from NHID_GY20_T1_2004 where MAIN_SICK LIKE 'E78%' OR SUB_SICK LIKE 'E78%' OR KEY_SEQ IN (select KEY_SEQ from YSE.dbo.dislipidemia_40t_SICK_SYM_2004_2009)

insert into #21t select KEY_SEQ, PERSON_ID, RECU_FR_DT from NHID_GY20_T1_2005 where MAIN_SICK LIKE 'E78%' OR SUB_SICK LIKE 'E78%' OR KEY_SEQ IN (select KEY_SEQ from YSE.dbo.dislipidemia_40t_SICK_SYM_2004_2009)
insert into #21t select KEY_SEQ, PERSON_ID, RECU_FR_DT from NHID_GY20_T1_2006 where MAIN_SICK LIKE 'E78%' OR SUB_SICK LIKE 'E78%' OR KEY_SEQ IN (select KEY_SEQ from YSE.dbo.dislipidemia_40t_SICK_SYM_2004_2009)
insert into #21t select KEY_SEQ, PERSON_ID, RECU_FR_DT from NHID_GY20_T1_2007 where MAIN_SICK LIKE 'E78%' OR SUB_SICK LIKE 'E78%' OR KEY_SEQ IN (select KEY_SEQ from YSE.dbo.dislipidemia_40t_SICK_SYM_2004_2009)

insert into #21t select KEY_SEQ, PERSON_ID, RECU_FR_DT from NHID_GY20_T1_2008 where MAIN_SICK LIKE 'E78%' OR SUB_SICK LIKE 'E78%' OR KEY_SEQ IN (select KEY_SEQ from YSE.dbo.dislipidemia_40t_SICK_SYM_2004_2009)
insert into #21t select KEY_SEQ, PERSON_ID, RECU_FR_DT from NHID_GY20_T1_2009 where MAIN_SICK LIKE 'E78%' OR SUB_SICK LIKE 'E78%' OR KEY_SEQ IN (select KEY_SEQ from YSE.dbo.dislipidemia_40t_SICK_SYM_2004_2009)

select * into YSE.dbo.dislipidemia_20t_SUB_MAIN_2004_2009 from #21t


select KEY_SEQ, DD_MQTY_FREQ, DD_MQTY_EXEC_FREQ, MDCN_EXEC_FREQ into YSE.dbo.dislipidemia_30t_2004_2009 from NHID_GY30_T1_2004 where KEY_SEQ in (select KEY_SEQ from YSE.dbo.dislipidemia_20t_SUB_MAIN_2004_2009)
insert into YSE.dbo.dislipidemia_30t_2004_2009 select KEY_SEQ, DD_MQTY_FREQ, DD_MQTY_EXEC_FREQ, MDCN_EXEC_FREQ from NHID_GY30_T1_2005 where KEY_SEQ in (select KEY_SEQ from YSE.dbo.dislipidemia_20t_SUB_MAIN_2004_2009)

insert into YSE.dbo.dislipidemia_30t_2004_2009 select KEY_SEQ, DD_MQTY_FREQ, DD_MQTY_EXEC_FREQ, MDCN_EXEC_FREQ from NHID_GY30_T1_2006 where KEY_SEQ in (select KEY_SEQ from YSE.dbo.dislipidemia_20t_SUB_MAIN_2004_2009)
insert into YSE.dbo.dislipidemia_30t_2004_2009 select KEY_SEQ, DD_MQTY_FREQ, DD_MQTY_EXEC_FREQ, MDCN_EXEC_FREQ from NHID_GY30_T1_2007 where KEY_SEQ in (select KEY_SEQ from YSE.dbo.dislipidemia_20t_SUB_MAIN_2004_2009)

insert into YSE.dbo.dislipidemia_30t_2004_2009 select KEY_SEQ, DD_MQTY_FREQ, DD_MQTY_EXEC_FREQ, MDCN_EXEC_FREQ from NHID_GY30_T1_2008 where KEY_SEQ in (select KEY_SEQ from YSE.dbo.dislipidemia_20t_SUB_MAIN_2004_2009)
insert into YSE.dbo.dislipidemia_30t_2004_2009 select KEY_SEQ, DD_MQTY_FREQ, DD_MQTY_EXEC_FREQ, MDCN_EXEC_FREQ from NHID_GY30_T1_2009 where KEY_SEQ in (select KEY_SEQ from YSE.dbo.dislipidemia_20t_SUB_MAIN_2004_2009)


select * into YSE.dbo.dislipidemia_30t_2004_2009 from #31t

*/
/*
select KEY_SEQ, GNL_NM_CD into YSE.dbo.dislipidemia_60t_2004_2009 from NHID_GY60_T1_2004 where KEY_SEQ in (select KEY_SEQ from YSE.dbo.dislipidemia_20t_SUB_MAIN_2004_2009)
insert into YSE.dbo.dislipidemia_60t_2004_2009 select KEY_SEQ, GNL_NM_CD from NHID_GY60_T1_2005 where KEY_SEQ in (select KEY_SEQ from YSE.dbo.dislipidemia_20t_SUB_MAIN_2004_2009)
insert into YSE.dbo.dislipidemia_60t_2004_2009 select KEY_SEQ, GNL_NM_CD from NHID_GY60_T1_2006 where KEY_SEQ in (select KEY_SEQ from YSE.dbo.dislipidemia_20t_SUB_MAIN_2004_2009)

insert into YSE.dbo.dislipidemia_60t_2004_2009 select KEY_SEQ, GNL_NM_CD from NHID_GY60_T1_2007 where KEY_SEQ in (select KEY_SEQ from YSE.dbo.dislipidemia_20t_SUB_MAIN_2004_2009)
insert into YSE.dbo.dislipidemia_60t_2004_2009 select KEY_SEQ, GNL_NM_CD from NHID_GY60_T1_2008 where KEY_SEQ in (select KEY_SEQ from YSE.dbo.dislipidemia_20t_SUB_MAIN_2004_2009)
insert into YSE.dbo.dislipidemia_60t_2004_2009 select KEY_SEQ, GNL_NM_CD from NHID_GY60_T1_2009 where KEY_SEQ in (select KEY_SEQ from YSE.dbo.dislipidemia_20t_SUB_MAIN_2004_2009)


*/


select Top1000() from dislipidemia_20t_60t_40t_JK_distinct_2004_2009_join

/*
select GY20_40.PERSON_ID, GY20_40.KEY_SEQ, GY20_40.RECU_FR_DT, GY60.GNL_NM_CD into YSE.dbo.dislipidemia_20t_60t_join_2004_2009
---JK.SEX, JK.AGE_GROUP, , GY40.SICK_SYM
FROM YSE.dbo.dislipidemia_20t_SUB_MAIN_2004_2009 as GY20_40
JOIN YSE.dbo.dislipidemia_60t_2004_2009 as GY60 on GY60.KEY_SEQ = GY20_40.KEY_SEQ
*/

select GY20_60.PERSON_ID, GY20_60.RECU_FR_DT, GY20_60.GNL_NM_CD, GY30.DD_MQTY_FREQ, GY30.DD_MQTY_EXEC_FREQ, GY30.MDCN_EXEC_FREQ into YSE.dbo.dislipidemia_20t_60t_30t_RECU_TOTAL_DAYS_join_2004_2009
---JK.SEX, JK.AGE_GROUP,
FROM YSE.dbo.dislipidemia_20t_60t_join_2004_2009 as GY20_60
JOIN YSE.dbo.dislipidemia_30t_2004_2009 as GY30 on GY30.KEY_SEQ = GY20_60.KEY_SEQ

/*
select PERSON_ID, KEY_SEQ, RECU_FR_DT, GNL_NM_CD, DD_MQTY_FREQ, DD_MQTY_EXEC_FREQ, MDCN_EXEC_FREQ 
into CKD_CASE_ICU_OP
from #tem3
drop table #tem2, #31t, #tem3, #21t, #jk, #41t, #21t_41t, #61t
--drop table #EPO
*/