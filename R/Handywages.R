#' 上传工资信息
#'
#' @param dms_token
#' @param FYEAR
#' @param FMONTH
#' @param FBaseWages
#' @param FattendanceDays
#' @param FleaveDays
#'
#'
#' @return
#' @export
#'
#' @examples
#' Handywages_upload()
Handywages_upload <- function(dms_token,FYEAR,FMONTH,FNAME,FBaseWages,FattendanceDays,FleaveDays) {
  sql=paste0("
  insert into rds_t_HandyWages_input values('",FYEAR,"','",FMONTH,"','",FNAME,"','",FBaseWages,"','",FattendanceDays,"','",FleaveDays,"')
             ")


  tsda::sql_insert2(token = dms_token,sql_str = sql)

  sql_insert =paste0("
  insert into rds_t_HandyWages(FYEAR,FMONTH,FDAYS,FNAME,FBaseWages,FattendanceDays,FleaveDays,FDeductionwages,Fsettlementwages)
select FYEAR,FMONTH,CASE
WHEN FMONTH=12 THEN 12
ELSE
day(cast(CAST(FYEAR as varchar(4))+'-'+CAST(FMONTH+1 as varchar(2))+'-01' as datetime)-1)
END AS FDAYS,
FNAME,FBaseWages,FattendanceDays,FleaveDays ,
CASE
WHEN FattendanceDays>=28  OR FleaveDays=0  THEN 0
WHEN FMONTH=2 and FattendanceDays>=26 then 0
when FMONTH in(1,3,5,7,8,10,12) and FattendanceDays < 28 and FleaveDays > 0 then  (FBaseWages/29)*FleaveDays
when FMONTH in(4,6,9,11) and FattendanceDays < 28 and FleaveDays > 0 then  (FBaseWages/28)*FleaveDays
when day(cast(CAST(FYEAR as varchar(4))+'-'+CAST(FMONTH+1 as varchar(2))+'-01' as datetime)-1) =28
and FattendanceDays < 26 and FleaveDays > 0  then  (FBaseWages/26)*FleaveDays
when day(cast(CAST(FYEAR as varchar(4))+'-'+CAST(FMONTH+1 as varchar(2))+'-01' as datetime)-1) =29
and FattendanceDays < 26 and FleaveDays > 0  then (FBaseWages/27)*FleaveDays
END as FDeductionwages,
FBaseWages-(CASE
WHEN FattendanceDays>=28  OR FleaveDays=0  THEN 0
WHEN FMONTH=2 and FattendanceDays>=26 then 0
when FMONTH in(1,3,5,7,8,10,12) and FattendanceDays < 28 and FleaveDays > 0 then  (FBaseWages/29)*FleaveDays
when FMONTH in(4,6,9,11) and FattendanceDays < 28 and FleaveDays > 0 then  (FBaseWages/28)*FleaveDays
when day(cast(CAST(FYEAR as varchar(4))+'-'+CAST(FMONTH+1 as varchar(2))+'-01' as datetime)-1) =28
and FattendanceDays < 26 and FleaveDays > 0  then  (FBaseWages/26)*FleaveDays
when day(cast(CAST(FYEAR as varchar(4))+'-'+CAST(FMONTH+1 as varchar(2))+'-01' as datetime)-1) =29
and FattendanceDays < 26 and FleaveDays > 0  then (FBaseWages/27)*FleaveDays
END) as Fsettlementwages
from rds_t_HandyWages_input

             ")

  tsda::sql_insert2(token = dms_token,sql_str = sql_insert)

  sql_delete=paste0("truncate table rds_t_HandyWages_input")

  tsda::sql_delete2(token = dms_token,sql_str = sql_delete)
  res= tsui::pop_notice('已上传')


  return(res)

}



#' 计时计件工资表删除
#'
#' @param dms_token
#' @param FID
#'
#' @return
#' @export
#'
#' @examples
#' Handywages_delete()
Handywages_delete <- function(dms_token,FID) {
  sql=paste0(" DELETE FROM rds_t_HandyWages WHERE FID='",FID,"'
             ")
  res=tsda::sql_delete2(token = dms_token,sql_str = sql)
  return(res)

}

#' 工资表查询
#'
#' @param dms_token
#' @param FNAME
#'
#' @return
#' @export
#'
#' @examples
#' Handywages_view()
Handywages_view <- function(dms_token,FNAME) {
if(FNAME==''){
  sql=paste0("SELECT [FID] as 编码
      ,[FYEAR] 年份
      ,[FMONTH] 月份
      ,[FDAYS] 当月天数
      ,[FNAME] 员工姓名
      ,[FBaseWages] 基础工资
      ,[FattendanceDays] 出勤天数
      ,[FleaveDays] 请假天数
      ,[FDeductionwages] 扣减工资
      ,[Fsettlementwages] 结算工资
  FROM [bydms].[dbo].[rds_t_HandyWages]")

}
  else{
    sql=paste0("SELECT [FID] as 编码
      ,[FYEAR] 年份
      ,[FMONTH] 月份
      ,[FDAYS] 当月天数
      ,[FNAME] 员工姓名
      ,[FBaseWages] 基础工资
      ,[FattendanceDays] 出勤天数
      ,[FleaveDays] 请假天数
      ,[FDeductionwages] 扣减工资
      ,[Fsettlementwages] 结算工资
  FROM [bydms].[dbo].[rds_t_HandyWages]
    where FNAME='",FNAME,"'


               ")

  }

  res = tsda::sql_select2(token =dms_token ,sql = sql)

  return(res)

  #end

}






