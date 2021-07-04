--插入一些数据进去


--地址
insert into "hbcEc2".address  values (0,'广东省','广州市','番禺');
insert into "hbcEc2".address  values (1,'广东省','广州市','黄埔');
insert into "hbcEc2".address  values (2,'广东省','东莞市','麻涌');
insert into "hbcEc2".address  values (3,'广东省','深圳市','鹅城');

--买家
insert into "hbcEc2".buyer_info values (0,'userA',0,'13712345678','password1','abcdefg@qq.com','1',21,to_date('20210702','yyyymmdd'),'2021-07');
insert into "hbcEc2".buyer_info values (1,'userB',1,'13712345678','password1','abcdefg@qq.com','0',21,to_date('20210702','yyyymmdd'),'2021-07');
insert into "hbcEc2".buyer_info values (2,'userC',2,'13712345678','password1','abcdefg@qq.com','1',21,to_date('20210602','yyyymmdd'),'2021-06');
insert into "hbcEc2".buyer_info values (3,'userD',3,'13712345678','password1','abcdefg@qq.com','1',21,to_date('20210502','yyyymmdd'),'2021-05');

--商家
insert into "hbcEc2".seller_info values (0,'seller0',3,'13712345678','password1','abcdefg@qq.com','1',21,to_date('20210502','yyyymmdd'),'2021-05');


--商品类别
insert  into "hbcEc2".cate_info values(0,'手机');
insert  into "hbcEc2".cate_info values(1,'电脑');
insert  into "hbcEc2".cate_info values(2,'鞋子');

--商品
insert  into "hbcEc2".sku values(0,0,0,0,100);
insert  into "hbcEc2".sku values(1,0,0,1,200);
insert  into "hbcEc2".sku values(2,0,1,0,150);
insert  into "hbcEc2".sku values(3,0,2,1,100);

--订单
insert  into "hbcEc2"."order"  values(0,0,1,100,to_date('20210102','yyyymmdd'),0,0,1,'2021-01');
insert  into "hbcEc2"."order"  values(1,1,1,100,to_date('20210102','yyyymmdd'),0,0,1,'2021-01');
insert  into "hbcEc2"."order"  values(2,1,1,100,to_date('20210202','yyyymmdd'),1,1,1,'2021-02');
insert  into "hbcEc2"."order"  values(3,0,1,100,to_date('20210302','yyyymmdd'),3,3,1,'2021-03');
insert  into "hbcEc2"."order"  values(4,3,1,100,to_date('20210402','yyyymmdd'),2,2,1,'2021-04');
insert  into "hbcEc2"."order"  values(5,3,1,100,to_date('20210102','yyyymmdd'),0,0,1,'2021-01');
insert  into "hbcEc2"."order"  values(6,0,1,100,to_date('20210302','yyyymmdd'),3,1,1,'2021-03');
insert  into "hbcEc2"."order"  values(7,0,1,100,to_date('20210102','yyyymmdd'),1,1,1,'2021-01');