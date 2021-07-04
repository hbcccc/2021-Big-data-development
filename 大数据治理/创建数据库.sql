CREATE TABLE "hbcEc2"."sell_info" ( "year_month" VARCHAR(10) NOT NULL , "city" VARCHAR(20) NOT NULL , "sex" CHAR(1) NOT NULL , "cate_id" int NOT NULL , "payment" FLOAT4,PRIMARY KEY ( "year_month" , "city" , "sex" , "cate_id" ) );

COMMENT ON TABLE "hbcEc2"."sell_info" IS '销售info';

COMMENT ON COLUMN "hbcEc2"."sell_info"."year_month" IS '年月';

COMMENT ON COLUMN "hbcEc2"."sell_info"."city" IS '城市';

COMMENT ON COLUMN "hbcEc2"."sell_info"."sex" IS '性别';

COMMENT ON COLUMN "hbcEc2"."sell_info"."cate_id" IS '类别id';

COMMENT ON COLUMN "hbcEc2"."sell_info"."payment" IS '金额';

CREATE TABLE "hbcEc2"."cate_info" ( "cate_id" int NOT NULL , "cate_name" VARCHAR(100),PRIMARY KEY ( "cate_id" ) );

COMMENT ON TABLE "hbcEc2"."cate_info" IS '类别info';

COMMENT ON COLUMN "hbcEc2"."cate_info"."cate_id" IS '类别_id';

COMMENT ON COLUMN "hbcEc2"."cate_info"."cate_name" IS '类别名_name';

CREATE TABLE "hbcEc2"."sku" ( "sku_id" int NOT NULL , "seller_id" int NOT NULL , "cate_id" int NOT NULL , "spu_id" int, "price" FLOAT4,PRIMARY KEY ( "sku_id" ) );

COMMENT ON TABLE "hbcEc2"."sku" IS 'sku';

COMMENT ON COLUMN "hbcEc2"."sku"."sku_id" IS 'sku_id';

COMMENT ON COLUMN "hbcEc2"."sku"."seller_id" IS '商家id';

COMMENT ON COLUMN "hbcEc2"."sku"."cate_id" IS '类别id';

COMMENT ON COLUMN "hbcEc2"."sku"."spu_id" IS 'spu_id';

COMMENT ON COLUMN "hbcEc2"."sku"."price" IS '价格';

CREATE TABLE "hbcEc2"."address" ( "address_id" int NOT NULL , "province" VARCHAR(20), "city" VARCHAR(20), "detail_address" VARCHAR(100),PRIMARY KEY ( "address_id" ) );

COMMENT ON TABLE "hbcEc2"."address" IS '地址info';

COMMENT ON COLUMN "hbcEc2"."address"."address_id" IS '地址id';

COMMENT ON COLUMN "hbcEc2"."address"."province" IS '省份';

COMMENT ON COLUMN "hbcEc2"."address"."city" IS '市';

COMMENT ON COLUMN "hbcEc2"."address"."detail_address" IS '具体地址';

CREATE TABLE "hbcEc2"."order" ( "order_id" int NOT NULL , "sku_id" int, "number" int, "total_payment" FLOAT4, "order_time" DATE, "buyer_id" int, "address_id" int, "order_state" int, "year_month" VARCHAR(10),PRIMARY KEY ( "order_id" ) );

COMMENT ON TABLE "hbcEc2"."order" IS '订单info';

COMMENT ON COLUMN "hbcEc2"."order"."order_id" IS 'order_id';

COMMENT ON COLUMN "hbcEc2"."order"."sku_id" IS 'sku_id';

COMMENT ON COLUMN "hbcEc2"."order"."number" IS 'number';

COMMENT ON COLUMN "hbcEc2"."order"."total_payment" IS 'total_payment';

COMMENT ON COLUMN "hbcEc2"."order"."order_time" IS 'order_time';

COMMENT ON COLUMN "hbcEc2"."order"."buyer_id" IS 'buyer_id';

COMMENT ON COLUMN "hbcEc2"."order"."address_id" IS 'address_id';

COMMENT ON COLUMN "hbcEc2"."order"."order_state" IS 'order_state';

COMMENT ON COLUMN "hbcEc2"."order"."year_month" IS 'year_month';

CREATE TABLE "hbcEc2"."seller_info" ( "user_id" int NOT NULL , "user_name" VARCHAR(20), "user_address" int, "telephone" VARCHAR(20), "password" VARCHAR(20), "email" VARCHAR(30), "sex" CHAR(1), "age" int, "registe_time" DATE, "year_month" VARCHAR(10),PRIMARY KEY ( "user_id" ) );

COMMENT ON TABLE "hbcEc2"."seller_info" IS '商家信息';

COMMENT ON COLUMN "hbcEc2"."seller_info"."user_id" IS '用户id';

COMMENT ON COLUMN "hbcEc2"."seller_info"."user_name" IS '用户名';

COMMENT ON COLUMN "hbcEc2"."seller_info"."user_address" IS '地址id';

COMMENT ON COLUMN "hbcEc2"."seller_info"."telephone" IS '电话';

COMMENT ON COLUMN "hbcEc2"."seller_info"."password" IS '密码';

COMMENT ON COLUMN "hbcEc2"."seller_info"."email" IS '邮件';

COMMENT ON COLUMN "hbcEc2"."seller_info"."sex" IS '性别';

COMMENT ON COLUMN "hbcEc2"."seller_info"."age" IS '年龄';

COMMENT ON COLUMN "hbcEc2"."seller_info"."registe_time" IS '注册时间';

COMMENT ON COLUMN "hbcEc2"."seller_info"."year_month" IS '注册年月';

CREATE TABLE "hbcEc2"."buyer_info" ( "user_id" int NOT NULL , "user_name" character varying(20), "user_address" int, "telephone" VARCHAR(20), "password" VARCHAR(20), "email" VARCHAR(30), "sex" CHAR(1), "age" int, "registe_time" DATE, "year_month" VARCHAR(10),PRIMARY KEY ( "user_id" ) );

COMMENT ON TABLE "hbcEc2"."buyer_info" IS '买家信息';

COMMENT ON COLUMN "hbcEc2"."buyer_info"."user_id" IS '用户id';

COMMENT ON COLUMN "hbcEc2"."buyer_info"."user_name" IS '用户名';

COMMENT ON COLUMN "hbcEc2"."buyer_info"."user_address" IS '地址id';

COMMENT ON COLUMN "hbcEc2"."buyer_info"."telephone" IS '电话';

COMMENT ON COLUMN "hbcEc2"."buyer_info"."password" IS '密码';

COMMENT ON COLUMN "hbcEc2"."buyer_info"."email" IS '邮件';

COMMENT ON COLUMN "hbcEc2"."buyer_info"."sex" IS '性别';

COMMENT ON COLUMN "hbcEc2"."buyer_info"."age" IS '年龄';

COMMENT ON COLUMN "hbcEc2"."buyer_info"."registe_time" IS '注册时间';

COMMENT ON COLUMN "hbcEc2"."buyer_info"."year_month" IS '注册年月';