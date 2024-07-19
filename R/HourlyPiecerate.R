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

  if(FProductionNumber=="" )
  {sql=paste0("
  select
FInputCardDate as 输卡日期,
FIdentificationNumber as 识别号,
FMachinetime as 机器用时,
FMachine as 机台,
FProductDrawingNumber as 产品图号,
FProductName as 产品名称,
FProductionNumber as 生产批号,
FVulcanizationDate as 硫化生产日期,
FVulcanizationShifts as 硫化班次,
FVulcanizationTime as 硫化生产用时,
FVulcanizationProducers as 硫化生产者,
FMoldthan as 模比,
FRubberName as 胶料名称,
FReferenceModulus as 参考模数,
FVulcanizationModulus as 硫化生产模数,
FVulcanizationTotal as 硫化生产总数,
FVulcanizationPlanNumber as 硫化计划生产数,
FORMAT(FVulcanizationAchievement, 'P') as 硫化产能达成率,
--FVulcanizationAchievement as 硫化产能达成率,
FVulcanizationScrapsNumber as 硫化废品总数,
FVulcanizationMixerScrapped as 硫化调机报废,
FVulcanizationCracking as 硫化开裂,
FSulfurizedRottenMouth as 硫化烂嘴巴,
FVulcanizedBubbles as 硫化气泡,
FVulcanizedDebris as 硫化杂料,
FVulcanizationOthers as 硫化其它,
FSulfideUnderSulfur as 硫化欠硫,
FTrachomaSulfide as 硫化沙眼,
FVulcanizationLacking as 硫化缺料,
FVulcanizationTiming as 硫化计时,
FSulfidationSupplementalTime as 硫化补时,
FVulcanizationNumber as 硫化编号,
FVulcanizationRemarks as 硫化备注,
FVulcanizationTeamLeader as 硫化班组长签字,
FVulcanizationCrew as 硫化班组,
FVulcanizationPlanQuantity as 硫化计划数量,
FVulcanizedUnitPrice as 硫化产品单价,
FVulcanizedProductsAmount as 硫化产品金额,
FVulcanizationTimerAmount as 硫化计时金额,
FSulfidationStoppageAmount as 硫化补时金额,
FVulcanizationtotalAmount as 硫化合计金额,
FDisulfideScrapsNumber as 二硫废品总数,
FDisulfideAging as 二硫老化,
FDisulfideOther as 二硫其他,
FDisulfurQualification as 二硫合格数,
FDisulfideOperator as 二硫操作人,
FDisulfideDate as 二硫日期,
FDisulfideRemarks as 二硫备注,
FTrimmingScrapsNumber as 修边废品总数,
FTrimmingCracking as 修边开裂,
FTrimmingOthers as 修边其他,
FTrimmingLacking as 修边缺料,
FTrimmingBubbles as 修边气泡,
FTrimmingUnderSulfur as 修边欠硫,
FTrimmingQuantity as 修边数量,
FTrimmer as 修边员,
FTrimmingDate as 修边日期,
FTrimmingUnitprice as 修边单价,
FTrimmingAmount as 修边金额,
FTrimmingTiming as 修边计时,
FTrimmingHourlyAmount as 修边计时金额,
FTrimmingStoppageTime as 修边补时,
FTrimmingStoppageTimeAmount as 修边补时金额,
FTrimmingTotalAmount as 修边金额合计,
FTrimmingRemarks as 修边备注,
FDrillingScrapsNumber as 钻孔废品总数,
FDrillHolesMisaligned as 钻孔打偏,
FDrillingOther as 钻孔其他,
FDrillingQuantity as 钻孔数量,
FDriller as 钻孔员,
FDrillingDate as 钻孔日期,
FDrillingUnitPrice as 钻孔单价,
FDrillingAmount as 钻孔金额,
FDrillingTiming as 钻孔计时,
FDrillingHourlyAmount as 钻孔计时金额,
FDrillingStoppageTime as 钻孔补时,
FDrillingStoppageTimeAmount as 钻孔补时金额,
FDrillingTotalAmount as 钻孔金额合计,
FDrillingRemarks as 钻孔备注,
FInspectionScrapsNumber as 检验废品总数,
FInspectCracking as 检验开裂,
FExamineRottenMouth as 检验烂嘴巴,
FCheckBubbles as 检验气泡,
FExamineTrachoma as 检验沙眼,
FInspectDeadGlue as 检验死胶,
FInspectOthers as 检验其他,
FInspectionQuantity as 检验数量,
FInspectors as 检验员,
FInspectionDate as 检验日期,
FInspectionUnitPrice as 检验单价,
FInspectionAmount as 检验金额,
FInspectionTiming as 检验计时,
FInspectionHourlyAmount as 检验计时金额,
FInspectionStoppageTime as 检验补时,
FInspectionAmountStoppageTime as 检验补时金额,
FInspectionTotalAmount as 检验金额合计,
FInspectionRemarks as 检验备注,
FRubQuantity as 擦油数量,
FOilWipingMan as 擦油员,
FRubOilDate as 擦油日期,
FRubOilUnitPrice as 擦油单价,
FRubOilAmount as 擦油金额,
FRubOilTiming as 擦油计时,
FRubOilHourlyAmount as 擦油计时金额,
FRubOilStoppageTime as 擦油补时,
FRubOilAmountStoppageTime as 擦油补时金额,
FRubOilTotalAmount as 擦油金额合计,
FRubOilRemarks as 擦油备注,
FClampsQuantity as 卡箍数量,
FLoadingCardHoopCrew as 装卡箍员,
FClampsDate as 卡箍日期,
FClampsUnitPrice as 卡箍单价,
FClampsAmount as 卡箍金额,
FClampsTiming as 卡箍计时,
FClampsHourlyAmount as 卡箍计时金额,
FClampsStoppageTime as 卡箍补时,
FClampsStoppageTimeAmount as 卡箍补时金额,
FClampsTotalAmount as 卡箍金额合计,
FClampsRemarks as 卡箍备注,
FPressingHolesQuantity as 压孔数量,
FHolePresser as 压孔员,
FPressingHolesDate as 压孔日期,
FPressingHolesUnitPrice as 压孔单价,
FPressingHolesAmount as 压孔金额,
FPressingHolesTiming as 压孔计时,
FPressingHolesHourlyAmount as 压孔计时金额,
FPressingHolesStoppageTime as 压孔补时,
FPressingHolesStoppageTimeAmount as 压孔补时金额,
FPressingHolesTotalAmount as 压孔金额合计,
FPressingHolesRemarks as 压孔备注,
FGP12TotalNumberScraps as GP12废品总数,
FGP12Cracking as GP12开裂,
FGP12RottenMouth as GP12烂嘴巴,
FGP12Bubbles as GP12气泡,
FGP12Trachoma as GP12沙眼,
FGP12HolePoor as GP12孔不良,
FGP12Other as GP12其他,
FGP12Quantity as GP12数量,
FGP12Member as GP12员,
FGP12Date as GP12日期,
FGP12UnitPrice as GP12单价,
FGP12Amount as GP12金额,
FGP12Timing as GP12计时,
FGP12HourlyAmount as GP12计时金额,
FGP12StoppageTime as GP12补时,
FGP12AmountTimeStoppage as GP12补时金额,
FGP12TotalAmount as GP12金额合计,
FGP12Remarks as GP12备注,
FPackagingQuantity as 包装数量,
FORMAT(FFinishedProductPassRate, 'P') as 硫化产能达成率,
--FFinishedProductPassRate as 成品合格率,
FPackagingStaff as 包装员工,
FPackagingDate as 包装日期,
FPackagingUnitPrice as 包装单价,
FPackagingAmount as 包装金额,
FPackagingTiming as 包装计时,
FPackagingHourlyAmount as 包装计时金额,
FPackagingStoppageTime as 包装补时,
FPackagingAmountTimeStoppage as 包装补时金额,
FPackagingTotalAmount as 包装金额合计,
FPackagingRemarks as 包装备注,
Ftotal as 总数,
FDifference as 差异

from rds_t_HourlyPiecerate

             ")}
  else{
    sql=paste0("
  select
FInputCardDate as 输卡日期,
FIdentificationNumber as 识别号,
FMachinetime as 机器用时,
FMachine as 机台,
FProductDrawingNumber as 产品图号,
FProductName as 产品名称,
FProductionNumber as 生产批号,
FVulcanizationDate as 硫化生产日期,
FVulcanizationShifts as 硫化班次,
FVulcanizationTime as 硫化生产用时,
FVulcanizationProducers as 硫化生产者,
FMoldthan as 模比,
FRubberName as 胶料名称,
FReferenceModulus as 参考模数,
FVulcanizationModulus as 硫化生产模数,
FVulcanizationTotal as 硫化生产总数,
FVulcanizationPlanNumber as 硫化计划生产数,
FORMAT(FVulcanizationAchievement, 'P') as 硫化产能达成率,
--FVulcanizationAchievement as 硫化产能达成率,
FVulcanizationScrapsNumber as 硫化废品总数,
FVulcanizationMixerScrapped as 硫化调机报废,
FVulcanizationCracking as 硫化开裂,
FSulfurizedRottenMouth as 硫化烂嘴巴,
FVulcanizedBubbles as 硫化气泡,
FVulcanizedDebris as 硫化杂料,
FVulcanizationOthers as 硫化其它,
FSulfideUnderSulfur as 硫化欠硫,
FTrachomaSulfide as 硫化沙眼,
FVulcanizationLacking as 硫化缺料,
FVulcanizationTiming as 硫化计时,
FSulfidationSupplementalTime as 硫化补时,
FVulcanizationNumber as 硫化编号,
FVulcanizationRemarks as 硫化备注,
FVulcanizationTeamLeader as 硫化班组长签字,
FVulcanizationCrew as 硫化班组,
FVulcanizationPlanQuantity as 硫化计划数量,
FVulcanizedUnitPrice as 硫化产品单价,
FVulcanizedProductsAmount as 硫化产品金额,
FVulcanizationTimerAmount as 硫化计时金额,
FSulfidationStoppageAmount as 硫化补时金额,
FVulcanizationtotalAmount as 硫化合计金额,
FDisulfideScrapsNumber as 二硫废品总数,
FDisulfideAging as 二硫老化,
FDisulfideOther as 二硫其他,
FDisulfurQualification as 二硫合格数,
FDisulfideOperator as 二硫操作人,
FDisulfideDate as 二硫日期,
FDisulfideRemarks as 二硫备注,
FTrimmingScrapsNumber as 修边废品总数,
FTrimmingCracking as 修边开裂,
FTrimmingOthers as 修边其他,
FTrimmingLacking as 修边缺料,
FTrimmingBubbles as 修边气泡,
FTrimmingUnderSulfur as 修边欠硫,
FTrimmingQuantity as 修边数量,
FTrimmer as 修边员,
FTrimmingDate as 修边日期,
FTrimmingUnitprice as 修边单价,
FTrimmingAmount as 修边金额,
FTrimmingTiming as 修边计时,
FTrimmingHourlyAmount as 修边计时金额,
FTrimmingStoppageTime as 修边补时,
FTrimmingStoppageTimeAmount as 修边补时金额,
FTrimmingTotalAmount as 修边金额合计,
FTrimmingRemarks as 修边备注,
FDrillingScrapsNumber as 钻孔废品总数,
FDrillHolesMisaligned as 钻孔打偏,
FDrillingOther as 钻孔其他,
FDrillingQuantity as 钻孔数量,
FDriller as 钻孔员,
FDrillingDate as 钻孔日期,
FDrillingUnitPrice as 钻孔单价,
FDrillingAmount as 钻孔金额,
FDrillingTiming as 钻孔计时,
FDrillingHourlyAmount as 钻孔计时金额,
FDrillingStoppageTime as 钻孔补时,
FDrillingStoppageTimeAmount as 钻孔补时金额,
FDrillingTotalAmount as 钻孔金额合计,
FDrillingRemarks as 钻孔备注,
FInspectionScrapsNumber as 检验废品总数,
FInspectCracking as 检验开裂,
FExamineRottenMouth as 检验烂嘴巴,
FCheckBubbles as 检验气泡,
FExamineTrachoma as 检验沙眼,
FInspectDeadGlue as 检验死胶,
FInspectOthers as 检验其他,
FInspectionQuantity as 检验数量,
FInspectors as 检验员,
FInspectionDate as 检验日期,
FInspectionUnitPrice as 检验单价,
FInspectionAmount as 检验金额,
FInspectionTiming as 检验计时,
FInspectionHourlyAmount as 检验计时金额,
FInspectionStoppageTime as 检验补时,
FInspectionAmountStoppageTime as 检验补时金额,
FInspectionTotalAmount as 检验金额合计,
FInspectionRemarks as 检验备注,
FRubQuantity as 擦油数量,
FOilWipingMan as 擦油员,
FRubOilDate as 擦油日期,
FRubOilUnitPrice as 擦油单价,
FRubOilAmount as 擦油金额,
FRubOilTiming as 擦油计时,
FRubOilHourlyAmount as 擦油计时金额,
FRubOilStoppageTime as 擦油补时,
FRubOilAmountStoppageTime as 擦油补时金额,
FRubOilTotalAmount as 擦油金额合计,
FRubOilRemarks as 擦油备注,
FClampsQuantity as 卡箍数量,
FLoadingCardHoopCrew as 装卡箍员,
FClampsDate as 卡箍日期,
FClampsUnitPrice as 卡箍单价,
FClampsAmount as 卡箍金额,
FClampsTiming as 卡箍计时,
FClampsHourlyAmount as 卡箍计时金额,
FClampsStoppageTime as 卡箍补时,
FClampsStoppageTimeAmount as 卡箍补时金额,
FClampsTotalAmount as 卡箍金额合计,
FClampsRemarks as 卡箍备注,
FPressingHolesQuantity as 压孔数量,
FHolePresser as 压孔员,
FPressingHolesDate as 压孔日期,
FPressingHolesUnitPrice as 压孔单价,
FPressingHolesAmount as 压孔金额,
FPressingHolesTiming as 压孔计时,
FPressingHolesHourlyAmount as 压孔计时金额,
FPressingHolesStoppageTime as 压孔补时,
FPressingHolesStoppageTimeAmount as 压孔补时金额,
FPressingHolesTotalAmount as 压孔金额合计,
FPressingHolesRemarks as 压孔备注,
FGP12TotalNumberScraps as GP12废品总数,
FGP12Cracking as GP12开裂,
FGP12RottenMouth as GP12烂嘴巴,
FGP12Bubbles as GP12气泡,
FGP12Trachoma as GP12沙眼,
FGP12HolePoor as GP12孔不良,
FGP12Other as GP12其他,
FGP12Quantity as GP12数量,
FGP12Member as GP12员,
FGP12Date as GP12日期,
FGP12UnitPrice as GP12单价,
FGP12Amount as GP12金额,
FGP12Timing as GP12计时,
FGP12HourlyAmount as GP12计时金额,
FGP12StoppageTime as GP12补时,
FGP12AmountTimeStoppage as GP12补时金额,
FGP12TotalAmount as GP12金额合计,
FGP12Remarks as GP12备注,
FPackagingQuantity as 包装数量,
FORMAT(FFinishedProductPassRate, 'P') as 硫化产能达成率,
--FFinishedProductPassRate as 成品合格率,
FPackagingStaff as 包装员工,
FPackagingDate as 包装日期,
FPackagingUnitPrice as 包装单价,
FPackagingAmount as 包装金额,
FPackagingTiming as 包装计时,
FPackagingHourlyAmount as 包装计时金额,
FPackagingStoppageTime as 包装补时,
FPackagingAmountTimeStoppage as 包装补时金额,
FPackagingTotalAmount as 包装金额合计,
FPackagingRemarks as 包装备注,
Ftotal as 总数,
FDifference as 差异

from rds_t_HourlyPiecerate
 where FProductionNumber='",FProductionNumber,"'

             ")
  }

  res=tsda::sql_select2(token = token,sql = sql)
  return(res)

}



#' 计时计件工资表删除
#'
#' @param token
#' @param a.FProductionNumber
#'
#' @return
#' @export
#'
#' @examples
#' HourlyPiecerate_delete()
HourlyPiecerate_delete <- function(token,FProductionNumber,Fseq) {
  sql=paste0(" delete  from rds_t_HourlyPiecerate  where FProductionNumber='",FProductionNumber,"'
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


  data <- readxl::read_excel(file_name,col_types =  c("date","text",  "numeric", "text",    "text",
                                                     "text", "text", "date","text","numeric","text", "numeric","text", "numeric", "numeric","numeric", "numeric",

"numeric",
"numeric", "numeric",  "numeric",
"numeric",   "numeric","numeric","numeric", "numeric", "numeric", "numeric",  "numeric", "numeric", "text",  "text",  "text",
"text","numeric","numeric","numeric","numeric","numeric",  "numeric", "numeric", "numeric", "numeric","numeric", "text",  "date",
 "text","numeric", "numeric","numeric", "numeric", "numeric","numeric",  "numeric",  "text","date", "numeric", "numeric", "numeric",
 "numeric","numeric","numeric", "numeric","text", "numeric","numeric", "numeric", "numeric", "text","date","numeric","numeric",
  "numeric", "numeric", "numeric","numeric", "numeric", "text", "numeric", "numeric", "numeric", "numeric","numeric", "numeric",
  "numeric","numeric","numeric", "date", "numeric","numeric","numeric",  "numeric",  "numeric","numeric","numeric","text","numeric","text",
"date","numeric","numeric","numeric","numeric","numeric","numeric","numeric","text","numeric","text","date","numeric","numeric","numeric","numeric",
"numeric","numeric","numeric","text","numeric","text","date","numeric","numeric","numeric","numeric","numeric","numeric","numeric","text",
"numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric","text","date","numeric","numeric","numeric","numeric","numeric","numeric",
"numeric","text","numeric","numeric","text","date","numeric","numeric","numeric","numeric","numeric","numeric","numeric","text","numeric","numeric"
  ))
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


  data <- readxl::read_excel(file_name,col_types =   c("date","text",  "numeric", "text",    "text",
                                                       "text", "text", "date","text","numeric","text", "numeric","text", "numeric", "numeric","numeric", "numeric",

                                                       "numeric",
                                                       "numeric", "numeric",  "numeric",
                                                       "numeric",   "numeric","numeric","numeric", "numeric", "numeric", "numeric",  "numeric", "numeric", "text",  "text",  "text",
                                                       "text","numeric","numeric","numeric","numeric","numeric",  "numeric", "numeric", "numeric", "numeric","numeric", "text",  "date",
                                                       "text","numeric", "numeric","numeric", "numeric", "numeric","numeric",  "numeric",  "text","date", "numeric", "numeric", "numeric",
                                                       "numeric","numeric","numeric", "numeric","text", "numeric","numeric", "numeric", "numeric", "text","date","numeric","numeric",
                                                       "numeric", "numeric", "numeric","numeric", "numeric", "text", "numeric", "numeric", "numeric", "numeric","numeric", "numeric",
                                                       "numeric","numeric","numeric", "date", "numeric","numeric","numeric",  "numeric",  "numeric","numeric","numeric","text","numeric","text",
                                                       "date","numeric","numeric","numeric","numeric","numeric","numeric","numeric","text","numeric","text","date","numeric","numeric","numeric","numeric",
                                                       "numeric","numeric","numeric","text","numeric","text","date","numeric","numeric","numeric","numeric","numeric","numeric","numeric","text",
                                                       "numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric","text","date","numeric","numeric","numeric","numeric","numeric","numeric",
                                                       "numeric","text","numeric","numeric","text","date","numeric","numeric","numeric","numeric","numeric","numeric","numeric","text","numeric","numeric"
  ))
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
FInputCardDate as 输卡日期,
FIdentificationNumber as 识别号,
FMachinetime as 机器用时,
FMachine as 机台,
FProductDrawingNumber as 产品图号,
FProductName as 产品名称,
FProductionNumber as 生产批号,
FVulcanizationDate as 硫化生产日期,
FVulcanizationShifts as 硫化班次,
FVulcanizationTime as 硫化生产用时,
FVulcanizationProducers as 硫化生产者,
FMoldthan as 模比,
FRubberName as 胶料名称,
FReferenceModulus as 参考模数,
FVulcanizationModulus as 硫化生产模数,
FVulcanizationTotal as 硫化生产总数,
FVulcanizationPlanNumber as 硫化计划生产数,
FVulcanizationAchievement as 硫化产能达成率,
FVulcanizationScrapsNumber as 硫化废品总数,
FVulcanizationMixerScrapped as 硫化调机报废,
FVulcanizationCracking as 硫化开裂,
FSulfurizedRottenMouth as 硫化烂嘴巴,
FVulcanizedBubbles as 硫化气泡,
FVulcanizedDebris as 硫化杂料,
FVulcanizationOthers as 硫化其它,
FSulfideUnderSulfur as 硫化欠硫,
FTrachomaSulfide as 硫化沙眼,
FVulcanizationLacking as 硫化缺料,
FVulcanizationTiming as 硫化计时,
FSulfidationSupplementalTime as 硫化补时,
FVulcanizationNumber as 硫化编号,
FVulcanizationRemarks as 硫化备注,
FVulcanizationTeamLeader as 硫化班组长签字,
FVulcanizationCrew as 硫化班组,
FVulcanizationPlanQuantity as 硫化计划数量,
FVulcanizedUnitPrice as 硫化产品单价,
FVulcanizedProductsAmount as 硫化产品金额,
FVulcanizationTimerAmount as 硫化计时金额,
FSulfidationStoppageAmount as 硫化补时金额,
FVulcanizationtotalAmount as 硫化合计金额,
FDisulfideScrapsNumber as 二硫废品总数,
FDisulfideAging as 二硫老化,
FDisulfideOther as 二硫其他,
FDisulfurQualification as 二硫合格数,
FDisulfideOperator as 二硫操作人,
FDisulfideDate as 二硫日期,
FDisulfideRemarks as 二硫备注,
FTrimmingScrapsNumber as 修边废品总数,
FTrimmingCracking as 修边开裂,
FTrimmingOthers as 修边其他,
FTrimmingLacking as 修边缺料,
FTrimmingBubbles as 修边气泡,
FTrimmingUnderSulfur as 修边欠硫,
FTrimmingQuantity as 修边数量,
FTrimmer as 修边员,
FTrimmingDate as 修边日期,
FTrimmingUnitprice as 修边单价,
FTrimmingAmount as 修边金额,
FTrimmingTiming as 修边计时,
FTrimmingHourlyAmount as 修边计时金额,
FTrimmingStoppageTime as 修边补时,
FTrimmingStoppageTimeAmount as 修边补时金额,
FTrimmingTotalAmount as 修边金额合计,
FTrimmingRemarks as 修边备注,
FDrillingScrapsNumber as 钻孔废品总数,
FDrillHolesMisaligned as 钻孔打偏,
FDrillingOther as 钻孔其他,
FDrillingQuantity as 钻孔数量,
FDriller as 钻孔员,
FDrillingDate as 钻孔日期,
FDrillingUnitPrice as 钻孔单价,
FDrillingAmount as 钻孔金额,
FDrillingTiming as 钻孔计时,
FDrillingHourlyAmount as 钻孔计时金额,
FDrillingStoppageTime as 钻孔补时,
FDrillingStoppageTimeAmount as 钻孔补时金额,
FDrillingTotalAmount as 钻孔金额合计,
FDrillingRemarks as 钻孔备注,
FInspectionScrapsNumber as 检验废品总数,
FInspectCracking as 检验开裂,
FExamineRottenMouth as 检验烂嘴巴,
FCheckBubbles as 检验气泡,
FExamineTrachoma as 检验沙眼,
FInspectDeadGlue as 检验死胶,
FInspectOthers as 检验其他,
FInspectionQuantity as 检验数量,
FInspectors as 检验员,
FInspectionDate as 检验日期,
FInspectionUnitPrice as 检验单价,
FInspectionAmount as 检验金额,
FInspectionTiming as 检验计时,
FInspectionHourlyAmount as 检验计时金额,
FInspectionStoppageTime as 检验补时,
FInspectionAmountStoppageTime as 检验补时金额,
FInspectionTotalAmount as 检验金额合计,
FInspectionRemarks as 检验备注,
FRubQuantity as 擦油数量,
FOilWipingMan as 擦油员,
FRubOilDate as 擦油日期,
FRubOilUnitPrice as 擦油单价,
FRubOilAmount as 擦油金额,
FRubOilTiming as 擦油计时,
FRubOilHourlyAmount as 擦油计时金额,
FRubOilStoppageTime as 擦油补时,
FRubOilAmountStoppageTime as 擦油补时金额,
FRubOilTotalAmount as 擦油金额合计,
FRubOilRemarks as 擦油备注,
FClampsQuantity as 卡箍数量,
FLoadingCardHoopCrew as 装卡箍员,
FClampsDate as 卡箍日期,
FClampsUnitPrice as 卡箍单价,
FClampsAmount as 卡箍金额,
FClampsTiming as 卡箍计时,
FClampsHourlyAmount as 卡箍计时金额,
FClampsStoppageTime as 卡箍补时,
FClampsStoppageTimeAmount as 卡箍补时金额,
FClampsTotalAmount as 卡箍金额合计,
FClampsRemarks as 卡箍备注,
FPressingHolesQuantity as 压孔数量,
FHolePresser as 压孔员,
FPressingHolesDate as 压孔日期,
FPressingHolesUnitPrice as 压孔单价,
FPressingHolesAmount as 压孔金额,
FPressingHolesTiming as 压孔计时,
FPressingHolesHourlyAmount as 压孔计时金额,
FPressingHolesStoppageTime as 压孔补时,
FPressingHolesStoppageTimeAmount as 压孔补时金额,
FPressingHolesTotalAmount as 压孔金额合计,
FPressingHolesRemarks as 压孔备注,
FGP12TotalNumberScraps as GP12废品总数,
FGP12Cracking as GP12开裂,
FGP12RottenMouth as GP12烂嘴巴,
FGP12Bubbles as GP12气泡,
FGP12Trachoma as GP12沙眼,
FGP12HolePoor as GP12孔不良,
FGP12Other as GP12其他,
FGP12Quantity as GP12数量,
FGP12Member as GP12员,
FGP12Date as GP12日期,
FGP12UnitPrice as GP12单价,
FGP12Amount as GP12金额,
FGP12Timing as GP12计时,
FGP12HourlyAmount as GP12计时金额,
FGP12StoppageTime as GP12补时,
FGP12AmountTimeStoppage as GP12补时金额,
FGP12TotalAmount as GP12金额合计,
FGP12Remarks as GP12备注,
FPackagingQuantity as 包装数量,
FFinishedProductPassRate as 成品合格率,
FPackagingStaff as 包装员工,
FPackagingDate as 包装日期,
FPackagingUnitPrice as 包装单价,
FPackagingAmount as 包装金额,
FPackagingTiming as 包装计时,
FPackagingHourlyAmount as 包装计时金额,
FPackagingStoppageTime as 包装补时,
FPackagingAmountTimeStoppage as 包装补时金额,
FPackagingTotalAmount as 包装金额合计,
FPackagingRemarks as 包装备注,
Ftotal as 总数,
FDifference as 差异

from rds_t_HourlyPiecerate
             ")
  res=tsda::sql_select2(token = token,sql = sql)
  return(res)

}


