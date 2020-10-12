#业务表sql
select sequence_f,takeoff_time  from air_ticket_pro.flight_bill ;
select * from air_ticket_pro.flight_bill_sum;
select status,status_desc,modify_time,total_price from air_ticket_pro.`order`;

select total_fee,crt_time from car_s.caocao_order co ;
select `result` ,cost_time from car_s.intfc_log il ;

select status ,login_type ,login_src from hotel_base_pro.log_user_logins lul ;
select jpush_status from hotel_base_pro.message m ;
#select send_flag , delivery_flag from hotel_base_pro.message_user_index mui ;
select order_state ,order_state_code from hotel_base_pro.`order` o; 
select pay_status from hotel_base_pro.payment_record_trace prt ;

select total_amt from hotel_order_pro.orders o ;

select order_price ,settlement_type ,train_date from train_ticket_pro.bill_train_details btd ;
select order_state,order_state_code,order_price from train_ticket_pro.`order` o ;
select * from train_ticket_pro.bill_train_sum bts ;

select status from login2.travel_apply ta ;
select cost_type , cost_fee from login2.travel_reimbursement_item tri ;

#sys schema 视图监控sql
#
#1,查看每个客户端IP过来的连接消耗了多少资源。
select * from sys.host_summary;
#2,查看某个数据文件上发生了多少IO请求。
select * from sys.io_global_by_file_by_bytes;
#3,查看每个用户消耗了多少资源。
select * from sys.user_summary;
#4,查看总共分配了多少内存。
select * from sys.memory_global_total;
#5,数据库连接来自哪里，以及这些连接对数据库的请求情况是怎样的？
select host, current_connections, statements from sys.host_summary;
#6,数据库中哪些SQL被频繁执行？TOP20
select * from sys.statement_analysis order by exec_count desc limit 20;
#7,哪个文件产生了最多的IO，读多，还是写的多？ TOP10
select * from sys.io_global_by_file_by_bytes limit 10;
#8,哪个表上的IO请求最多？TOP10
select * from sys.io_global_by_file_by_bytes order by total desc limit 10;
#9,哪个表被访问的最多？先访问statement_analysis，根据热门SQL排序找到相应的数据表。TOP20
select * from sys.statement_analysis order by avg_latency desc limit 20;
#10,哪些SQL执行了全表扫描或执行了排序操作？
select * from sys.statements_with_sorting;
select * from sys.statements_with_full_table_scans;
#11,哪些SQL语句使用了临时表，又有哪些用到了磁盘临时表？TOP20
select db, query, tmp_tables, tmp_disk_tables from sys.statement_analysis where tmp_tables>0 or tmp_disk_tables >0 order by (tmp_tables+tmp_disk_tables) desc limit 20;
#12,哪个表占用了最多的buffer pool？TOP10
select * from sys.innodb_buffer_stats_by_table order by allocated desc limit 10;
#13,每个库（database）占用多少buffer pool？TOP10
select * from sys.innodb_buffer_stats_by_schema order by allocated desc limit 10;
#14,每个连接分配多少内存？
select b.user, current_count_used, current_allocated, current_avg_alloc, 
current_max_alloc, total_allocated,current_statement from sys.memory_by_thread_by_current_bytes a, sys.`session` b where a.thread_id = b.thd_id;
#15,MySQL自增长字段的最大值和当前已经使用到的值？
select * from sys.schema_auto_increment_columns;
#16,MySQL有哪些冗余索引和无用索引？
select * from sys.schema_redundant_indexes;
select * from sys.schema_unused_indexes;
#17,查看事务等待情况
select * from sys.innodb_lock_waits;