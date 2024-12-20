#' 计时工资表查询
#'
#' @param token
#' @param FRoutingNumber
#'
#' @return
#' @export
#'
#' @examples
#' productRouting_view()
productRouting_view <- function(token,FSpecification) {

  if(FSpecification=="" )
  {sql=paste0("

select  FMaterialNumber	as	产品代码	,
FMaterialName	as	产品名称	,
FSpecification	as	规格型号	,
FUnitID	as	单位	,
FRoutingNumber	as	工艺路线编码	,
FBoxQuantity	as	每箱数量
 from rds_t_productRouting

             ")}
  else{
    sql=paste0("
select  FMaterialNumber	as	产品代码	,
FMaterialName	as	产品名称	,
FSpecification	as	规格型号	,
FUnitID	as	单位	,
FRoutingNumber	as	工艺路线编码	,
FBoxQuantity	as	每箱数量
 from rds_t_productRouting
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
#' productRouting_delete()
productRouting_delete <- function(token,FSpecification) {
  sql=paste0(" delete  from rds_t_productRouting  where FSpecification='",FSpecification,"'
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
#' productRouting_upload()
productRouting_upload <- function(token,file_name) {


  data <- readxl::read_excel(file_name,col_types =  c("text","text","text","text","text","numeric"
  ))
  data = as.data.frame(data)

  data = tsdo::na_standard(data)
  #上传服务器----------------
  res=tsda::db_writeTable2(token = token,table_name = 'rds_t_productRouting',r_object = data,append = TRUE)

  return(res)

  #end

}






