--商户注册数
select count(*)
from sc_company;
2020.09: 876
--商户月新增注册数
select count(*)
from sc_company
where  DATE_FORMAT(CREATE_TIME, '%Y-%m-%d')>=  DATE_FORMAT('2020-7-1', '%Y-%m-%d')
and DATE_FORMAT(CREATE_TIME, '%Y-%m-%d')<=  DATE_FORMAT('2020-7-30', '%Y-%m-%d');

select count(*)
from sc_company
where  DATE_FORMAT(CREATE_TIME, '%Y-%m-%d')>=  DATE_FORMAT('2020-8-1', '%Y-%m-%d')
and DATE_FORMAT(CREATE_TIME, '%Y-%m-%d')<=  DATE_FORMAT('2020-8-30', '%Y-%m-%d');

select count(*)
from sc_company
where  DATE_FORMAT(CREATE_TIME, '%Y-%m-%d')>=  DATE_FORMAT('2020-9-1', '%Y-%m-%d')
and DATE_FORMAT(CREATE_TIME, '%Y-%m-%d')<=  DATE_FORMAT('2020-9-30', '%Y-%m-%d');


--访问量
select sum(SKU_HITS) as PV
from cc_sku_extend;
2020.09: 209390355

--点击率最高前十SKU名称
select SKU_NAME, STORE_NAME, COMPANY_NAME
from cc_sku cs
where cs.SKU_ID in
(select SKU_ID, SKU_HITS
from cc_sku_extend
order by SKU_HITS DESC
limit 10)top_sku;

2020.09:
SKU_ID	SKU_HITS
ADBF5A20542B4EDEA3E0974C5CBF9023	2001062
D0D05F13DAF44EA1887B4684664D6A63	2001051
ED908BE83EA845CABC335A5A0AACB9E8	2001050
19F59D0EDC414496AF31B395511F4019	2001045
55BE38B88BC3458684C1DD61375E8586	2001033
5DF92EFA9AED43B7A6E0C96E7D7EEA19	2001032
48545401E436402BA95106EC638A3D1B	2001029
A47A13C38DA446D7B2BA2677F353B7DE	2001027
1A3AA9BB6D1A4D998B82A38CC8757EC3	2001023
5C12CC5ADC9E44BBB7B3552CAA504176	2001022

--某时间段内订单总额, 订单总数
select sum(TOTAL_AMOUNT) as sum_in_sept, count(*)
from tc_order
where DATE_FORMAT(CREATE_TIME, '%Y-%m-%d')>=  DATE_FORMAT('2020-8-1', '%Y-%m-%d')
and DATE_FORMAT(CREATE_TIME, '%Y-%m-%d')<=  DATE_FORMAT('2020-8-30', '%Y-%m-%d')
and ORDER_STATUS in (1,3,5,6,7,8) ;

select sum(TOTAL_AMOUNT) as sum_in_sept, count(*)
from tc_order
where DATE_FORMAT(CREATE_TIME, '%Y-%m-%d')>=  DATE_FORMAT('2020-9-1', '%Y-%m-%d')
and DATE_FORMAT(CREATE_TIME, '%Y-%m-%d')<=  DATE_FORMAT('2020-9-30', '%Y-%m-%d')
and ORDER_STATUS in (1,3,5,6,7,8) ;

select sum(TOTAL_AMOUNT) as sum_in_sept, count(*)
from tc_order
where DATE_FORMAT(CREATE_TIME, '%Y-%m-%d')>=  DATE_FORMAT('2020-9-1', '%Y-%m-%d')
and DATE_FORMAT(CREATE_TIME, '%Y-%m-%d')<=  DATE_FORMAT('2020-9-30', '%Y-%m-%d')
and ORDER_STATUS in (1,3,5,6,7,8) ;

2020.09:
七月:304994705.75000000
八月:256040064.67000000
九月:497466184.14000000

--各级专区订单额
select sum(TOTAL_AMOUNT)
from tc_order
group by PURCHASE_ZONE_LEVEL
having DATE_FORMAT(CREATE_TIME, '%Y-%m-%d')>=  DATE_FORMAT('2020-7-1', '%Y-%m-%d')
and DATE_FORMAT(CREATE_TIME, '%Y-%m-%d')<=  DATE_FORMAT('2020-7-30', '%Y-%m-%d')
and ORDER_STATUS in (1,3,5,6,7,8);

select sum(TOTAL_AMOUNT)
from tc_order
group by PURCHASE_ZONE_LEVEL
having DATE_FORMAT(CREATE_TIME, '%Y-%m-%d')>=  DATE_FORMAT('2020-8-1', '%Y-%m-%d')
and DATE_FORMAT(CREATE_TIME, '%Y-%m-%d')<=  DATE_FORMAT('2020-8-30', '%Y-%m-%d')
and ORDER_STATUS in (1,3,5,6,7,8) ;

select sum(TOTAL_AMOUNT)
from tc_order
group by PURCHASE_ZONE_LEVEL
having DATE_FORMAT(CREATE_TIME, '%Y-%m-%d')>=  DATE_FORMAT('2020-9-1', '%Y-%m-%d')
and DATE_FORMAT(CREATE_TIME, '%Y-%m-%d')<=  DATE_FORMAT('2020-9-30', '%Y-%m-%d')
and ORDER_STATUS in (1,3,5,6,7,8) ;

2020.09:
一级专区:
七月:157243229.14000000
八月:151780834.79000000
九月:304326749.15000000

二级专区:
七月:147751476.61000000
八月:104259229.88000000
九月:193452030.64000000

--某时间段内已付款订单总额
select sum(TOTAL_AMOUNT)
from tc_order
where DATE_FORMAT(CREATE_TIME, '%Y-%m-%d')>=  DATE_FORMAT('2020-7-1', '%Y-%m-%d')
and DATE_FORMAT(CREATE_TIME, '%Y-%m-%d')<=  DATE_FORMAT('2020-7-30', '%Y-%m-%d')
and ORDER_STATUS=7;

select sum(TOTAL_AMOUNT)
from tc_order
where DATE_FORMAT(CREATE_TIME, '%Y-%m-%d')>=  DATE_FORMAT('2020-8-1', '%Y-%m-%d')
and DATE_FORMAT(CREATE_TIME, '%Y-%m-%d')<=  DATE_FORMAT('2020-8-30', '%Y-%m-%d')
and ORDER_STATUS=7;

select sum(TOTAL_AMOUNT)
from tc_order
where DATE_FORMAT(CREATE_TIME, '%Y-%m-%d')>=  DATE_FORMAT('2020-9-1', '%Y-%m-%d')
and DATE_FORMAT(CREATE_TIME, '%Y-%m-%d')<=  DATE_FORMAT('2020-9-30', '%Y-%m-%d')
and ORDER_STATUS=7;
2020.09: 12068145.45000000

--上月商户注册数
select count(*)
from mc_company_audit mca
where DATE_FORMAT(mca.AUDIT_TIME, '%Y-%m-%d')>=  DATE_FORMAT('2020-7-1', '%Y-%m-%d')
and DATE_FORMAT(mca.AUDIT_TIME, '%Y-%m-%d')<=  DATE_FORMAT('2020-7-30', '%Y-%m-%d')
and BUSINESS_TYPE=1
and AUDIT_OPERATION=1;

select count(*)
from mc_company_audit mca
where DATE_FORMAT(mca.AUDIT_TIME, '%Y-%m-%d')>=  DATE_FORMAT('2020-8-1', '%Y-%m-%d')
and DATE_FORMAT(mca.AUDIT_TIME, '%Y-%m-%d')<=  DATE_FORMAT('2020-8-30', '%Y-%m-%d')
and BUSINESS_TYPE=1
and AUDIT_OPERATION=1;

select count(*)
from mc_company_audit mca
where DATE_FORMAT(mca.AUDIT_TIME, '%Y-%m-%d')>=  DATE_FORMAT('2020-9-1', '%Y-%m-%d')
and DATE_FORMAT(mca.AUDIT_TIME, '%Y-%m-%d')<=  DATE_FORMAT('2020-9-30', '%Y-%m-%d')
and BUSINESS_TYPE=1
and AUDIT_OPERATION=1;
--业务单据类型 1-商户注册 2-商户入驻 3-商户变更
--审核操作（0=不通过，1=通过，2=保存）
2020.09: 24

--商户注册总数
select count(*)
from mc_company_audit mca
where BUSINESS_TYPE=1
and AUDIT_OPERATION=1;
--业务单据类型 1-商户注册 2-商户入驻 3-商户变更
--审核操作（0=不通过，1=通过，2=保存）

--活跃用户数
select count(distinct APPLY_DEPT_ID)
from tc_order tco
where DATE_FORMAT(tco.CREATE_TIME, '%Y-%m-%d')>=  DATE_FORMAT('2020-7-1', '%Y-%m-%d')
and DATE_FORMAT(tco.CREATE_TIME, '%Y-%m-%d')<=  DATE_FORMAT('2020-7-30', '%Y-%m-%d')

select count(distinct APPLY_DEPT_ID)
from tc_order tco
where DATE_FORMAT(tco.CREATE_TIME, '%Y-%m-%d')>=  DATE_FORMAT('2020-8-1', '%Y-%m-%d')
and DATE_FORMAT(tco.CREATE_TIME, '%Y-%m-%d')<=  DATE_FORMAT('2020-8-30', '%Y-%m-%d')

select count(distinct APPLY_DEPT_ID)
from tc_order tco
where DATE_FORMAT(tco.CREATE_TIME, '%Y-%m-%d')>=  DATE_FORMAT('2020-9-1', '%Y-%m-%d')
and DATE_FORMAT(tco.CREATE_TIME, '%Y-%m-%d')<=  DATE_FORMAT('2020-9-30', '%Y-%m-%d')
232317

--商品总数
select count(*)
from cc_spu;
总数:363598
已上架:101182

--用户问题分布情况
select QUESTION_CATEGORY_BIG,QUESTION_CATEGORY_MIN,QUESTION_CATEGORY_NOTE,
    FEEDBACK_TIME_LONG,RECEIVER_TIME_LONG
from oc_purchase_problem
where DATE_FORMAT(SUBMIT_TIME, '%Y-%m-%d')>=  DATE_FORMAT('2020-9-1', '%Y-%m-%d')
and DATE_FORMAT(SUBMIT_TIME, '%Y-%m-%d')<=  DATE_FORMAT('2020-9-30', '%Y-%m-%d');

--稽核情况
select is_illegal, CATEGORY_ID, REASON_ID, situation
from cc_sku_inspect
where DATE_FORMAT(inspect_time, '%Y-%m-%d')>=  DATE_FORMAT('2020-9-1', '%Y-%m-%d')
and DATE_FORMAT(inspect_time, '%Y-%m-%d')<=  DATE_FORMAT('2020-9-30', '%Y-%m-%d');
318 illegal 8823 legal

--审批不通过情况
select down_id, reason
from cc_sku_down
where DATE_FORMAT(down_time, '%Y-%m-%d')>=  DATE_FORMAT('2020-9-1', '%Y-%m-%d')
and DATE_FORMAT(down_time, '%Y-%m-%d')<=  DATE_FORMAT('2020-9-30', '%Y-%m-%d');
总17059
问题量6,959
单位问题 64;
分类问题988;
价格问题1310+442=1752;
库存问题26;描述问题353;名称问题559;
其他问题28+16+2+2+1034+15+34+17+1=1149;
图片问题820+1+89+606+108+28+2+8=1662;
名称改变406;

--评价情况
select STORE_APPRAISE_ID, STORE_ID, DESC_GRADE, SERVICE_GRADE, LOGISTICS_GRADE
from sc_store_appraise
where DATE_FORMAT(CREATE_TIME, '%Y-%m-%d')>=  DATE_FORMAT('2020-9-1', '%Y-%m-%d')
and DATE_FORMAT(CREATE_TIME, '%Y-%m-%d')<=  DATE_FORMAT('2020-9-30', '%Y-%m-%d');
总331条
313个满分

