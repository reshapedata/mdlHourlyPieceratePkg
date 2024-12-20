#' 计时工资表查询
#'
#' @param token
#' @param FRoutingNumber
#'
#' @return
#' @export
#'
#' @examples
#' productprice_view()
productprice_view <- function(token,FSpecification) {

  if(FSpecification=="" )
  {sql=paste0("select FMaterialNumber	as	物料编码	,
FMaterialName	as	物料名称	,
FSpecification	as	规格型号	,
FProcessName	as	工序	,
Fprice	as	单价	,
FStartDate	as	生效日期
 from rds_t_productprice

             ")}
  else{
    sql=paste0("select FMaterialNumber	as	物料编码	,
FMaterialName	as	物料名称	,
FSpecification	as	规格型号	,
FProcessName	as	工序	,
Fprice	as	单价	,
FStartDate	as	生效日期
 from rds_t_productprice
 where FSpecification='",FSpecification,"'

             ")
  }

  res=tsda::sql_select2(token = token,sql = sql)
  return(res)

}



#' 计时计件工资表删除
#'
#' @param token
#' @param FSpecification
#'
#' @return
#' @export
#'
#' @examples
#' productprice_delete()
productprice_delete <- function(token,FSpecification) {
  sql=paste0(" delete  from rds_t_productprice  where FSpecification='",FSpecification,"'
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
#' productprice_upload()
productprice_upload <- function(token,file_name) {


  data <- readxl::read_excel(file_name,col_types =  c("text","text","text","text","numeric","date"
  ))
  data = as.data.frame(data)

  data = tsdo::na_standard(data)
  #上传服务器----------------
  res=tsda::db_writeTable2(token = token,table_name = 'rds_t_productprice',r_object = data,append = TRUE)

  return(res)

  #end

}

#' 获取订单核价单
#'
#' @param token
#' @param
#'
#' @return
#' @export
#'
#' @examples
#' productprice_get()
productprice_get <- function(token) {


    sql=paste0("select
a. FMaterialNumber	as	产品代码	,
a.FMaterialName	as	产品名称	,
a.FSpecification	as	规格型号	,
b.FProcessName as 工序,
c.Fprice AS 单价,
c.FStartDate as 生效日期
 from rds_t_productRouting a
 left join rds_t_Routing b on a.FRoutingNumber=b.FRoutingNumber
 left join rds_t_productprice c
 on  a.FMaterialNumber=c.FMaterialNumber and b.FProcessName=c.FProcessName

             ")


  res=tsda::sql_select2(token = token,sql = sql)
  return(res)

}





