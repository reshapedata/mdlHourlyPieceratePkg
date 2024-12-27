#' 计时计件工资mingxi表查询
#'
#' @param token
#' @param FYEAR
#' @param FMONTH
#' @return
#' @export
#'
#' @examples
#' HourlyPiecerate_view()
HourlyPiecerate_detail_view <- function(dms_token,FYEAR,FMONTH) {

  sql=paste0("
 SELECT
d.	FSRCSPLITBILLNO	as	生产订单	,
d.	FmaterialNumber	as	物料编码	,
d.	FSPECIFICATION	as	产品图号	,
d.	FProductLots	as	产品批次	,
d.	FProcessName	as	工序 	,
d.	FFINISHQTY	as	实作产量	,
d.	FBoxQuantity	as	每箱数量	,
d.	FBoxQty	as	箱数	,
d.	FBoxFractionQty	as	零头数	,
d.	FScrappedQty	as	报废	,
d.	FManualtime	as	人工计时	,
d.	FManualstoppage	as	人工补时	,
d.	FOperator	as	操作工	,
d.	FProDate	as	生产日期	,
d.	FInputDate	as	输卡日期	,
d.	FHourlywages	as	工资小计
FROM

(SELECT a.FSRCSPLITBILLNO,a.FmaterialNumber,a.FSPECIFICATION,a.FProductLots,a.FProcessName,a.FFINISHQTY,a.FBoxQuantity,
a.FBoxQty,a.FBoxFractionQty,a.FScrappedQty,a.FManualtime,a.FManualstoppage,a.FOperator,a.FProDate,a.FInputDate ,
a.Fwages*a.FManualtime AS FHourlywages FROM
(
select a.FSRCSPLITBILLNO,a.FmaterialNumber,a.FSPECIFICATION,a.FProductLots,a.FProcessName,a.FFINISHQTY,a.FBoxQuantity,
a.FBoxQty,a.FBoxFractionQty,a.FScrappedQty,a.FManualtime,a.FManualstoppage,a.FOperator,a.FProDate,a.FInputDate ,
b.Fwages ,ROW_NUMBER() over(partition by a.FProductLots,a.FProcessName order by b.FStartDate desc) as Rowindex,
b.FStartDate
from
rds_t_productdaily a
left join [rds_t_HourlyWages] b on a.FProcessName =b.FOPERATIONNAME and a.fprodate>=b.FStartDate
where a.FManualtime>0
) a
WHERE Rowindex=1
union all
--人工补时
SELECT a.FSRCSPLITBILLNO,a.FmaterialNumber,a.FSPECIFICATION,a.FProductLots,a.FProcessName,a.FRealqty,a.FBoxQuantity,
a.FBoxQty,a.FBoxFractionQty,a.FScrappedQty,a.FManualtime,a.FManualstoppage,a.FOperator,a.FProDate,a.FInputDate ,
(isnull(a.FHourlywages,0)+isnull(a.FRealqty,0)*isnull(a.Fprice,0)) as FHourlywages from
(
SELECT a.FSRCSPLITBILLNO,a.FmaterialNumber,a.FSPECIFICATION,a.FProductLots,a.FProcessName,a.FFINISHQTY,a.FBoxQuantity,
a.FBoxQty,a.FBoxFractionQty,a.FScrappedQty,a.FManualtime,a.FManualstoppage,a.FOperator,a.FProDate,a.FInputDate ,
a.Fwages*a.FManualstoppage AS FHourlywages,(a.FFINISHQTY-b.FScrappedqty) as FRealqty,c.Fprice,
ROW_NUMBER() over(partition by a.FProductLots,a.FProcessName order by c.FStartDate desc) as Rowindex
FROM
(
select a.FSRCSPLITBILLNO,a.FmaterialNumber,a.FSPECIFICATION,a.FProductLots,a.FProcessName,a.FFINISHQTY,a.FBoxQuantity,
a.FBoxQty,a.FBoxFractionQty,a.FScrappedQty,a.FManualtime,a.FManualstoppage,a.FOperator,a.FProDate,a.FInputDate ,
b.Fwages ,ROW_NUMBER() over(partition by a.FProductLots,a.FProcessName order by b.FStartDate desc) as Rowindex,
b.FStartDate
from
rds_t_productdaily a
left join [rds_t_HourlyWages] b on a.FProcessName =b.FOPERATIONNAME and a.fprodate>=b.FStartDate
where a.FManualtime=0
) a
left join rds_vw_productdaily_ScrappedqtyByProcess b on a.FProductLots=b.FProductLots and a.FProcessName=b.FProcessName
left join rds_t_productprice c on a.FmaterialNumber=c.FmaterialNumber and a.FProcessName=c.FProcessName and a.fprodate>=c.FStartDate
WHERE a.Rowindex=1) a where  a.Rowindex=1) d
where year(d.FInputDate)='",FYEAR,"' and month(d.FInputDate)='",FMONTH,"'

             ")


  res=tsda::sql_select2(token = dms_token,sql = sql)
  return(res)

}

#' 计时计件工资表查询
#'
#' @param token
#' @param FYEAR
#' @param FMONTH
#' @return
#' @export
#'
#' @examples
#' HourlyPiecerate_view()
HourlyPiecerate_view <- function(dms_token,FYEAR,FMONTH) {

  sql=paste0("
 select year(FInputDate) as 年份,month(FInputDate) as 月份, FOperator as 员工姓名,sum(FHourlywages) as 员工工资 from
(
--工资计算 --人工计时不为0
SELECT a.FSRCSPLITBILLNO,a.FmaterialNumber,a.FSPECIFICATION,a.FProductLots,a.FProcessName,a.FFINISHQTY,a.FBoxQuantity,
a.FBoxQty,a.FBoxFractionQty,a.FScrappedQty,a.FManualtime,a.FManualstoppage,a.FOperator,a.FProDate,a.FInputDate ,
a.Fwages*a.FManualtime AS FHourlywages FROM
(
select a.FSRCSPLITBILLNO,a.FmaterialNumber,a.FSPECIFICATION,a.FProductLots,a.FProcessName,a.FFINISHQTY,a.FBoxQuantity,
a.FBoxQty,a.FBoxFractionQty,a.FScrappedQty,a.FManualtime,a.FManualstoppage,a.FOperator,a.FProDate,a.FInputDate ,
b.Fwages ,ROW_NUMBER() over(partition by a.FProductLots,a.FProcessName order by b.FStartDate desc) as Rowindex,
b.FStartDate
from
rds_t_productdaily a
left join [rds_t_HourlyWages] b on a.FProcessName =b.FOPERATIONNAME and a.fprodate>=b.FStartDate
where a.FManualtime>0
) a
WHERE Rowindex=1
union all
--人工补时
SELECT a.FSRCSPLITBILLNO,a.FmaterialNumber,a.FSPECIFICATION,a.FProductLots,a.FProcessName,a.FFINISHQTY,a.FBoxQuantity,
a.FBoxQty,a.FBoxFractionQty,a.FScrappedQty,a.FManualtime,a.FManualstoppage,a.FOperator,a.FProDate,a.FInputDate ,
(isnull(a.FHourlywages,0)+isnull(a.FRealqty,0)*isnull(a.Fprice,0)) as FHourlywages from
(
SELECT a.FSRCSPLITBILLNO,a.FmaterialNumber,a.FSPECIFICATION,a.FProductLots,a.FProcessName,a.FFINISHQTY,a.FBoxQuantity,
a.FBoxQty,a.FBoxFractionQty,a.FScrappedQty,a.FManualtime,a.FManualstoppage,a.FOperator,a.FProDate,a.FInputDate ,
a.Fwages*a.FManualstoppage AS FHourlywages,(a.FFINISHQTY-b.FScrappedqty) as FRealqty,c.Fprice,
ROW_NUMBER() over(partition by a.FProductLots,a.FProcessName order by c.FStartDate desc) as Rowindex
FROM
(
select a.FSRCSPLITBILLNO,a.FmaterialNumber,a.FSPECIFICATION,a.FProductLots,a.FProcessName,a.FFINISHQTY,a.FBoxQuantity,
a.FBoxQty,a.FBoxFractionQty,a.FScrappedQty,a.FManualtime,a.FManualstoppage,a.FOperator,a.FProDate,a.FInputDate ,
b.Fwages ,ROW_NUMBER() over(partition by a.FProductLots,a.FProcessName order by b.FStartDate desc) as Rowindex,
b.FStartDate
from
rds_t_productdaily a
left join [rds_t_HourlyWages] b on a.FProcessName =b.FOPERATIONNAME and a.fprodate>=b.FStartDate
where a.FManualtime=0
) a
left join rds_vw_productdaily_ScrappedqtyByProcess b on a.FProductLots=b.FProductLots and a.FProcessName=b.FProcessName
left join rds_t_productprice c on a.FmaterialNumber=c.FmaterialNumber and a.FProcessName=c.FProcessName and a.fprodate>=c.FStartDate
WHERE a.Rowindex=1) a
where  a.Rowindex=1)a
where year(a.FInputDate)='",FYEAR,"' and month(a.FInputDate)='",FMONTH,"'
group by  year(a.FInputDate) ,month(a.FInputDate) , a.FOperator
             ")


res=tsda::sql_select2(token = dms_token,sql = sql)
return(res)

}

