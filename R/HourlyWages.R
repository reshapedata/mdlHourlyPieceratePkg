#' 计时工资表查询
#'
#' @param token
#' @param FOPERATIONNAME
#'
#' @return
#' @export
#'
#' @examples
#' HourlyWages_view()
HourlyWages_view <- function(token,FOPERATIONNAME) {

  if(FOPERATIONNAME=="" )
  {sql=paste0("
 select FSEQ as 序号,
FOPERATIONNAME as 工序名称,
Fwages as 计时工资标准,
FStartDate as 生效日期
from rds_t_HourlyWages

             ")}
  else{
    sql=paste0("
  select FSEQ as 序号,
FOPERATIONNAME as 工序名称,
Fwages as 计时工资标准,
FStartDate as 生效日期
from rds_t_HourlyWages
 where FOPERATIONNAME='",FOPERATIONNAME,"'

             ")
  }

  res=tsda::sql_select2(token = token,sql = sql)
  return(res)

}



#' 计时计件工资表删除
#'
#' @param token
#' @param FOPERATIONNAMEFSEQ
#'
#' @return
#' @export
#'
#' @examples
#' HourlyWages_delete()
HourlyWages_delete <- function(token,FOPERATIONNAMEFSEQ) {
  sql=paste0(" delete  from rds_t_HourlyWages  where FOPERATIONNAMEFSEQ='",FOPERATIONNAMEFSEQ,"'
             ")
  res=tsda::sql_delete2(token = token,sql_str = sql)
  return(res)

}

#' 计时计件工资表上传
#'
#' @param file_name
#' @param token
#'
#' @return
#' @export
#'
#' @examples
#' HourlyWages_upload()
HourlyWages_upload <- function(token,file_name) {


  data <- readxl::read_excel(file_name,col_types =  c("numeric","text","numeric","date"
  ))
  data = as.data.frame(data)

  data = tsdo::na_standard(data)
  #上传服务器----------------
  res=tsda::db_writeTable2(token = token,table_name = 'rds_t_HourlyWages',r_object = data,append = TRUE)

  return(res)

  #end

}






