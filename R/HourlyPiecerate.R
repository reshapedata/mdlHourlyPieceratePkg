#' 计时计件工资表查询
#'
#' @param token
#' @param FProductionNumber
#'
#' @return
#' @export
#'
#' @examples
#' HourlyPiecerate_view()
HourlyPiecerate_view <- function(token,FProductionNumber) {
  sql=paste0("
  select
a.FInputCardDate as 输卡时间,
a.FNumber as 编号,
a.FIdentificationNumber as 识别号,
a.FProductionNumber as 生产订单号,
a.Fseq as 生产订单行号,
a.FProductCode as 产品编码,
a.FProductOldCode as 产品旧编码,
a.FProductName as 产品名称,
a.FSpecificationsModels as 规格型号,
a.FProductDrawingNumber as 产品图号,
a.FUnitMeasure as 计量单位,
a.FProductionLotNumber as 生产批号,
a.FBOMVersion as BOM版本,
a.FRoutingNumber as 工艺路线编号,
a.FOperationNumber as 工序,
a.FNameOperation as 工序名称,
a.FManufactureDate as 生产日期,
a.FProductionTime as 生产时间,
a.FShift as 班次,
a.FMachine_No as 机台,
a.FMachineTime as 机器用时,
a.FModulusRatio as 模比,
a.FCompoundName as 胶料名称,
a.FReferenceModulus as 参考模数,
a.FPlannedNumber_Productions as 计划生产数,
a.FActualProduction_Reported as 实际生产数,
a.FCapacityAttainmentRate as 产能达成率,
a.FGoodProductsNumber as 良品数,
a.FNumberDefects as 不良数,
a.FBadCauses as 不良原因,
a.FScrappedNumber as 报废数,
a.FReasonObsolescence as 报废原因,
a.FTeam as 班组,
a.FOperator as 操作人,
a.FTiming_Hour as 计时_小时,
a.FStoppageTime_Hour as 补时_小时,
a.FTeamLeaderSigned as 班组长签字,
a.FRemark as 备注,
a.FProductUnitPrice_UnitPiece as 产品单价,
a.FProductAmount_PieceWages as 产品金额,
a.FHourlyUnitPrice as 计时单价,
a.FHourlyAmount as 计时金额,
a.FStoppageTimeUnit_price as 补时单价,
a.FStoppageTimeAmount as 补时金额,
a.FSalarySubtotal as 工资小计
 from rds_t_HourlyPiecerate a
 where a.FProductionNumber='",FProductionNumber,"'

             ")
  res=tsda::sql_select2(token = token,sql = sql)
  return(res)

}



#' 计时计件工资表删除
#'
#' @param token
#' @param a.FProductionNumber
#' @param Fseq
#'
#' @return
#' @export
#'
#' @examples
#' HourlyPiecerate_delete()
HourlyPiecerate_delete <- function(token,a.FProductionNumber,Fseq) {
  sql=paste0(" delete  from rds_t_HourlyPiecerate  where a.FProductionNumber='",a.FProductionNumber,"' and  Fseq ='",Fseq,"'
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
#' HourlyPiecerate_upload()
HourlyPiecerate_upload <- function(token,file_name) {


  data <- readxl::read_excel(file_name,col_types =  c("date", "numeric", "text",
                                                      "text", "numeric", "text", "text",
                                                      "text", "text", "text", "text", "text",
                                                      "text", "text", "text", "text", "date",
                                                      "text", "text", "text", "text", "text",
                                                      "text", "text", "numeric", "numeric",
                                                      "numeric", "numeric", "numeric",
                                                      "text", "numeric", "text", "text",
                                                      "text", "numeric", "numeric", "text",
                                                      "text", "numeric", "numeric", "numeric",
                                                      "numeric", "numeric", "numeric",
                                                      "numeric"))
  data = as.data.frame(data)

  data = tsdo::na_standard(data)
  #上传服务器----------------
  res=tsda::db_writeTable2(token = token,table_name = 'rds_t_HourlyPiecerate',r_object = data,append = TRUE)

  return(res)

  #end

}

#' 计时计件工资表预览
#'
#' @param file_name
#' @param token
#'
#' @return
#' @export
#'
#' @examples
#' HourlyPiecerate_preview()
HourlyPiecerate_preview <- function(token,file_name) {


  data <- readxl::read_excel(file_name,col_types =  c("date", "numeric", "text",
                                                      "text", "numeric", "text", "text",
                                                      "text", "text", "text", "text", "text",
                                                      "text", "text", "text", "text", "date",
                                                      "text", "text", "text", "text", "text",
                                                      "text", "text", "numeric", "numeric",
                                                      "numeric", "numeric", "numeric",
                                                      "text", "numeric", "text", "text",
                                                      "text", "numeric", "numeric", "text",
                                                      "text", "numeric", "numeric", "numeric",
                                                      "numeric", "numeric", "numeric",
                                                      "numeric"))
  data = as.data.frame(data)

  res = tsdo::na_standard(data)

  return(res)

  #end

}


#' 计时计件工资表查询
#'
#' @param token
#' @param
#'
#' @return
#' @export
#'
#' @examples
#' HourlyPiecerate_viewAll()
HourlyPiecerate_viewAll <- function(token) {
  sql=paste0("
  select
a.FInputCardDate as 输卡时间,
a.FNumber as 编号,
a.FIdentificationNumber as 识别号,
a.FProductionNumber as 生产订单号,
a.Fseq as 生产订单行号,
a.FProductCode as 产品编码,
a.FProductOldCode as 产品旧编码,
a.FProductName as 产品名称,
a.FSpecificationsModels as 规格型号,
a.FProductDrawingNumber as 产品图号,
a.FUnitMeasure as 计量单位,
a.FProductionLotNumber as 生产批号,
a.FBOMVersion as BOM版本,
a.FRoutingNumber as 工艺路线编号,
a.FOperationNumber as 工序,
a.FNameOperation as 工序名称,
a.FManufactureDate as 生产日期,
a.FProductionTime as 生产时间,
a.FShift as 班次,
a.FMachine_No as 机台,
a.FMachineTime as 机器用时,
a.FModulusRatio as 模比,
a.FCompoundName as 胶料名称,
a.FReferenceModulus as 参考模数,
a.FPlannedNumber_Productions as 计划生产数,
a.FActualProduction_Reported as 实际生产数,
a.FCapacityAttainmentRate as 产能达成率,
a.FGoodProductsNumber as 良品数,
a.FNumberDefects as 不良数,
a.FBadCauses as 不良原因,
a.FScrappedNumber as 报废数,
a.FReasonObsolescence as 报废原因,
a.FTeam as 班组,
a.FOperator as 操作人,
a.FTiming_Hour as 计时_小时,
a.FStoppageTime_Hour as 补时_小时,
a.FTeamLeaderSigned as 班组长签字,
a.FRemark as 备注,
a.FProductUnitPrice_UnitPiece as 产品单价,
a.FProductAmount_PieceWages as 产品金额,
a.FHourlyUnitPrice as 计时单价,
a.FHourlyAmount as 计时金额,
a.FStoppageTimeUnit_price as 补时单价,
a.FStoppageTimeAmount as 补时金额,
a.FSalarySubtotal as 工资小计
 from rds_t_HourlyPiecerate a

             ")
  res=tsda::sql_select2(token = token,sql = sql)
  return(res)

}


