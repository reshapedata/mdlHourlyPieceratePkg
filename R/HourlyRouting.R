#' 计时工资表查询
#'
#' @param token
#' @param FRoutingNumber
#'
#' @return
#' @export
#'
#' @examples
#' HourlyRouting_view()
HourlyRouting_view <- function(token,FRoutingNumber) {

  if(FRoutingNumber=="" )
  {sql=paste0("

SELECT FRoutingNumber	AS	工艺路线编码	,
FRoutingName	AS	工艺路线名称	,
FProcessNumber	AS	工序号	,
FProcessName	AS	工序名称
 FROM rds_t_Routing

             ")}
  else{
    sql=paste0("
 SELECT FRoutingNumber	AS	工艺路线编码	,
FRoutingName	AS	工艺路线名称	,
FProcessNumber	AS	工序号	,
FProcessName	AS	工序名称
 FROM rds_t_Routing
 where FRoutingNumber='",FRoutingNumber,"'

             ")
  }

  res=tsda::sql_select2(token = token,sql = sql)
  return(res)

}



#' 计时计件工资表删除
#'
#' @param token
#' @param FRoutingNumber
#'
#' @return
#' @export
#'
#' @examples
#' HourlyRouting_delete()
HourlyRouting_delete <- function(token,FRoutingNumber) {
  sql=paste0(" delete  from rds_t_Routing  where FRoutingNumber='",FRoutingNumber,"'
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
#' HourlyRouting_upload()
HourlyRouting_upload <- function(token,file_name) {


  data <- readxl::read_excel(file_name,col_types =  c("text","text","numeric","text"
  ))
  data = as.data.frame(data)

  data = tsdo::na_standard(data)
  #上传服务器----------------
  res=tsda::db_writeTable2(token = token,table_name = 'rds_t_Routing',r_object = data,append = TRUE)

  return(res)

  #end

}






