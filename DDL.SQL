-- Project Name : KD
-- Date/Time    : 2024/04/05 12:26:02
-- Author       : u011060
-- RDBMS Type   : PostgreSQL
-- Application  : A5:SQL Mk-2

/*
  << 注意！！ >>
  BackupToTempTable, RestoreFromTempTable疑似命令が付加されています。
  これにより、drop table, create table 後もデータが残ります。
  この機能は一時的に $$TableName のような一時テーブルを作成します。
  この機能は A5:SQL Mk-2でのみ有効であることに注意してください。
*/

-- 消込明細_入金
--* RestoreFromTempTable
create table t_d_deposit_application_payment (
  id integer not null
  , deposit_application_id integer not null
  , order_no integer not null
  , payment_id integer not null
  , created_by integer not null
  , created_at timestamp not null
  , created_pg character varying(100) not null
  , updated_by integer
  , updated_at timestamp
  , updated_pg character varying(100)
  , is_delete integer default 0 not null
  , deleted_by integer
  , deleted_at timestamp
  , deleted_pg character varying(100)
  , version integer default 0 not null
  , constraint t_d_deposit_application_payment_PKC primary key (id)
) ;

-- 消込明細_伝票
--* RestoreFromTempTable
create table t_d_deposit_application_slip (
  id integer not null
  , deposit_application_id integer not null
  , sort_no integer not null
  , slip_id integer not null
  , created_by integer not null
  , created_at timestamp not null
  , created_pg character varying(100) not null
  , updated_by integer
  , updated_at timestamp
  , updated_pg character varying(100)
  , is_delete integer default 0 not null
  , deleted_by integer
  , deleted_at timestamp
  , deleted_pg character varying(100)
  , version integer default 0 not null
  , constraint t_d_deposit_application_slip_PKC primary key (id)
) ;

-- 消込ヘッダ
--* RestoreFromTempTable
create table t_h_deposit_application (
  id  not null
  , "消込日"  not null
  , "差額調整区分" 
  , "差額調整額" 
  , "消込対象額"  not null
  , created_by integer not null
  , created_at timestamp not null
  , created_pg character varying(100) not null
  , updated_by integer
  , updated_at timestamp
  , updated_pg character varying(100)
  , is_delete integer default 0 not null
  , deleted_by integer
  , deleted_at timestamp
  , deleted_pg character varying(100)
  , version integer default 0 not null
  , constraint t_h_deposit_application_PKC primary key (id)
) ;

-- 入金データ
--* RestoreFromTempTable
create table t_payment (
  id  not null
  , payment_type  not null
  , furikomi_name 
  , member_id 
  , "入金日"  not null
  , "入金額"  not null
  , created_by integer not null
  , created_at timestamp not null
  , created_pg character varying(100) not null
  , updated_by integer
  , updated_at timestamp
  , updated_pg character varying(100)
  , is_delete integer default 0 not null
  , deleted_by integer
  , deleted_at timestamp
  , deleted_pg character varying(100)
  , version integer default 0 not null
  , constraint t_payment_PKC primary key (id)
) ;

-- 伝票明細
--* RestoreFromTempTable
create table t_d_slip (
  id integer not null
  , slip_id integer not null
  , product_id integer not null
  , unit_price numeric not null
  , tax_percent numeric not null
  , amount numeric not null
  , created_by integer not null
  , created_at timestamp not null
  , created_pg character varying(100) not null
  , updated_by integer
  , updated_at timestamp
  , updated_pg character varying(100)
  , is_delete integer default 0 not null
  , deleted_by integer
  , deleted_at timestamp
  , deleted_pg character varying(100)
  , version integer default 0 not null
  , constraint t_d_slip_PKC primary key (id)
) ;

-- 伝票ヘッダ
--* RestoreFromTempTable
create table t_h_slip (
  id integer not null
  , buyer_member_id integer not null
  , total_amount numeric not null
  , tax_fee numeric
  , tax_percent numeric
  , created_by integer not null
  , created_at timestamp not null
  , created_pg character varying(100) not null
  , updated_by integer
  , updated_at timestamp
  , updated_pg character varying(100)
  , is_delete integer default 0 not null
  , deleted_by integer
  , deleted_at timestamp
  , deleted_pg character varying(100)
  , version integer default 0 not null
  , constraint t_h_slip_PKC primary key (id)
) ;

-- 資格マスタ
--* RestoreFromTempTable
create table m_certificate (
  id integer not null
  , name character varying(100) not null
  , created_by integer not null
  , created_at timestamp not null
  , created_pg character varying(100) not null
  , updated_by integer
  , updated_at timestamp
  , updated_pg character varying(100)
  , is_delete integer default 0 not null
  , deleted_by integer
  , deleted_at timestamp
  , deleted_pg character varying(100)
  , version integer default 0 not null
  , constraint m_certificate_PKC primary key (id)
) ;

-- 商品マスタ
--* RestoreFromTempTable
create table m_product (
  id integer not null
  , name character varying(100) not null
  , price numeric(10,2) not null
  , created_by integer not null
  , created_at timestamp not null
  , created_pg character varying(100) not null
  , updated_by integer
  , updated_at timestamp
  , updated_pg character varying(100)
  , is_delete integer default 0 not null
  , deleted_by integer
  , deleted_at timestamp
  , deleted_pg character varying(100)
  , version integer default 0 not null
  , constraint m_product_PKC primary key (id)
) ;

-- クラブ
--* RestoreFromTempTable
create table m_club (
  id integer not null
  , name character varying(100) not null
  , branch_id integer not null
  , leader_member_id integer not null
  , mail_address character varying(200)
  , tel character varying(16)
  , fax character varying(16)
  , address1 character varying(200)
  , address2 character varying(200)
  , start_date date
  , close_date date
  , created_by integer not null
  , created_at timestamp not null
  , created_pg character varying(100) not null
  , updated_by integer
  , updated_at timestamp
  , updated_pg character varying(100)
  , is_delete integer default 0 not null
  , deleted_by integer
  , deleted_at timestamp
  , deleted_pg character varying(100)
  , version integer default 0 not null
  , constraint m_club_PKC primary key (id)
) ;

-- 支部
--* RestoreFromTempTable
create table m_branch (
  id integer not null
  , name character varying(100) not null
  , leader_member_id integer not null
  , created_by integer not null
  , created_at timestamp not null
  , created_pg character varying(100) not null
  , updated_by integer
  , updated_at timestamp
  , updated_pg character varying(100)
  , is_delete integer default 0 not null
  , deleted_by integer
  , deleted_at timestamp
  , deleted_pg character varying(100)
  , version integer default 0 not null
  , constraint m_branch_PKC primary key (id)
) ;

-- 会員
--* RestoreFromTempTable
create table m_member (
  id integer not null
  , last_name character varying(100) not null
  , first_name character varying(100) not null
  , cureent_club_id integer
  , gender integer not null
  , birthday date
  , mail_address character varying(200)
  , tel1 character varying(16)
  , tel2 character varying(16)
  , zip_code character varying(8)
  , address1 character varying(200)
  , address2 character varying(200)
  , join_date date
  , one_star bit
  , one_star_date date
  , one_star_certified_member_id integer
  , two_star bit
  , two_star_date date
  , two_star_certified_member_id integer
  , three_star bit
  , three_star_date date
  , three_star_certified_member_id integer
  , four_star bit
  , four_star_date date
  , four_star_certified_member_id integer
  , "１スターインストラクター" bit
  , "１スターインストラクター取得日" date
  , "１スターインストラクター認定者" integer
  , "２スターインストラクター" bit
  , "２スターインストラクター認定者" date
  , "３スターインストラクター" bit
  , "３スターインストラクター取得日" integer
  , "３スターインストラクター認定者" date
  , created_by integer not null
  , created_at timestamp not null
  , created_pg character varying(100) not null
  , updated_by integer
  , updated_at timestamp
  , updated_pg character varying(100)
  , is_delete integer default 0 not null
  , deleted_by integer
  , deleted_at timestamp
  , deleted_pg character varying(100)
  , version integer default 0 not null
  , constraint m_member_PKC primary key (id)
) ;

comment on table t_d_deposit_application_payment is '消込明細_入金';
comment on column t_d_deposit_application_payment.id is 'id';
comment on column t_d_deposit_application_payment.deposit_application_id is '消込ヘッダID';
comment on column t_d_deposit_application_payment.order_no is 'ソート順';
comment on column t_d_deposit_application_payment.payment_id is '入金データID';
comment on column t_d_deposit_application_payment.created_by is 'created_by';
comment on column t_d_deposit_application_payment.created_at is 'created_at';
comment on column t_d_deposit_application_payment.created_pg is 'created_pg';
comment on column t_d_deposit_application_payment.updated_by is 'updated_by';
comment on column t_d_deposit_application_payment.updated_at is 'updated_at';
comment on column t_d_deposit_application_payment.updated_pg is 'updated_pg';
comment on column t_d_deposit_application_payment.is_delete is 'is_delete';
comment on column t_d_deposit_application_payment.deleted_by is 'deleted_by';
comment on column t_d_deposit_application_payment.deleted_at is 'deleted_at';
comment on column t_d_deposit_application_payment.deleted_pg is 'deleted_pg';
comment on column t_d_deposit_application_payment.version is 'version';

comment on table t_d_deposit_application_slip is '消込明細_伝票';
comment on column t_d_deposit_application_slip.id is 'id';
comment on column t_d_deposit_application_slip.deposit_application_id is '消込ヘッダID';
comment on column t_d_deposit_application_slip.sort_no is 'ソート順';
comment on column t_d_deposit_application_slip.slip_id is '伝票明細ID';
comment on column t_d_deposit_application_slip.created_by is 'created_by';
comment on column t_d_deposit_application_slip.created_at is 'created_at';
comment on column t_d_deposit_application_slip.created_pg is 'created_pg';
comment on column t_d_deposit_application_slip.updated_by is 'updated_by';
comment on column t_d_deposit_application_slip.updated_at is 'updated_at';
comment on column t_d_deposit_application_slip.updated_pg is 'updated_pg';
comment on column t_d_deposit_application_slip.is_delete is 'is_delete';
comment on column t_d_deposit_application_slip.deleted_by is 'deleted_by';
comment on column t_d_deposit_application_slip.deleted_at is 'deleted_at';
comment on column t_d_deposit_application_slip.deleted_pg is 'deleted_pg';
comment on column t_d_deposit_application_slip.version is 'version';

comment on table t_h_deposit_application is '消込ヘッダ';
comment on column t_h_deposit_application.id is 'id';
comment on column t_h_deposit_application."消込日" is '消込日';
comment on column t_h_deposit_application."差額調整区分" is '差額調整区分';
comment on column t_h_deposit_application."差額調整額" is '差額調整額';
comment on column t_h_deposit_application."消込対象額" is '消込対象額';
comment on column t_h_deposit_application.created_by is 'created_by';
comment on column t_h_deposit_application.created_at is 'created_at';
comment on column t_h_deposit_application.created_pg is 'created_pg';
comment on column t_h_deposit_application.updated_by is 'updated_by';
comment on column t_h_deposit_application.updated_at is 'updated_at';
comment on column t_h_deposit_application.updated_pg is 'updated_pg';
comment on column t_h_deposit_application.is_delete is 'is_delete';
comment on column t_h_deposit_application.deleted_by is 'deleted_by';
comment on column t_h_deposit_application.deleted_at is 'deleted_at';
comment on column t_h_deposit_application.deleted_pg is 'deleted_pg';
comment on column t_h_deposit_application.version is 'version';

comment on table t_payment is '入金データ';
comment on column t_payment.id is 'id';
comment on column t_payment.payment_type is '入金方法:1:振込,2:現金';
comment on column t_payment.furikomi_name is '振込依頼人名';
comment on column t_payment.member_id is '振込会員ID';
comment on column t_payment."入金日" is '入金日';
comment on column t_payment."入金額" is '入金額';
comment on column t_payment.created_by is 'created_by';
comment on column t_payment.created_at is 'created_at';
comment on column t_payment.created_pg is 'created_pg';
comment on column t_payment.updated_by is 'updated_by';
comment on column t_payment.updated_at is 'updated_at';
comment on column t_payment.updated_pg is 'updated_pg';
comment on column t_payment.is_delete is 'is_delete';
comment on column t_payment.deleted_by is 'deleted_by';
comment on column t_payment.deleted_at is 'deleted_at';
comment on column t_payment.deleted_pg is 'deleted_pg';
comment on column t_payment.version is 'version';

comment on table t_d_slip is '伝票明細';
comment on column t_d_slip.id is 'id';
comment on column t_d_slip.slip_id is '伝票ID';
comment on column t_d_slip.product_id is '商品ID';
comment on column t_d_slip.unit_price is '単価';
comment on column t_d_slip.tax_percent is '数量';
comment on column t_d_slip.amount is '小計';
comment on column t_d_slip.created_by is 'created_by';
comment on column t_d_slip.created_at is 'created_at';
comment on column t_d_slip.created_pg is 'created_pg';
comment on column t_d_slip.updated_by is 'updated_by';
comment on column t_d_slip.updated_at is 'updated_at';
comment on column t_d_slip.updated_pg is 'updated_pg';
comment on column t_d_slip.is_delete is 'is_delete';
comment on column t_d_slip.deleted_by is 'deleted_by';
comment on column t_d_slip.deleted_at is 'deleted_at';
comment on column t_d_slip.deleted_pg is 'deleted_pg';
comment on column t_d_slip.version is 'version';

comment on table t_h_slip is '伝票ヘッダ';
comment on column t_h_slip.id is 'id';
comment on column t_h_slip.buyer_member_id is '購入者ID';
comment on column t_h_slip.total_amount is '合計金額(税抜)';
comment on column t_h_slip.tax_fee is '税額';
comment on column t_h_slip.tax_percent is '適用税率';
comment on column t_h_slip.created_by is 'created_by';
comment on column t_h_slip.created_at is 'created_at';
comment on column t_h_slip.created_pg is 'created_pg';
comment on column t_h_slip.updated_by is 'updated_by';
comment on column t_h_slip.updated_at is 'updated_at';
comment on column t_h_slip.updated_pg is 'updated_pg';
comment on column t_h_slip.is_delete is 'is_delete';
comment on column t_h_slip.deleted_by is 'deleted_by';
comment on column t_h_slip.deleted_at is 'deleted_at';
comment on column t_h_slip.deleted_pg is 'deleted_pg';
comment on column t_h_slip.version is 'version';

comment on table m_certificate is '資格マスタ';
comment on column m_certificate.id is 'ID';
comment on column m_certificate.name is '名称';
comment on column m_certificate.created_by is 'created_by';
comment on column m_certificate.created_at is 'created_at';
comment on column m_certificate.created_pg is 'created_pg';
comment on column m_certificate.updated_by is 'updated_by';
comment on column m_certificate.updated_at is 'updated_at';
comment on column m_certificate.updated_pg is 'updated_pg';
comment on column m_certificate.is_delete is 'is_delete';
comment on column m_certificate.deleted_by is 'deleted_by';
comment on column m_certificate.deleted_at is 'deleted_at';
comment on column m_certificate.deleted_pg is 'deleted_pg';
comment on column m_certificate.version is 'version';

comment on table m_product is '商品マスタ';
comment on column m_product.id is 'ID';
comment on column m_product.name is '商品名';
comment on column m_product.price is '単価';
comment on column m_product.created_by is 'created_by';
comment on column m_product.created_at is 'created_at';
comment on column m_product.created_pg is 'created_pg';
comment on column m_product.updated_by is 'updated_by';
comment on column m_product.updated_at is 'updated_at';
comment on column m_product.updated_pg is 'updated_pg';
comment on column m_product.is_delete is 'is_delete';
comment on column m_product.deleted_by is 'deleted_by';
comment on column m_product.deleted_at is 'deleted_at';
comment on column m_product.deleted_pg is 'deleted_pg';
comment on column m_product.version is 'version';

comment on table m_club is 'クラブ';
comment on column m_club.id is 'ID';
comment on column m_club.name is '名称';
comment on column m_club.branch_id is '支部ID';
comment on column m_club.leader_member_id is '代表ID';
comment on column m_club.mail_address is 'メールアドレス';
comment on column m_club.tel is '電話';
comment on column m_club.fax is 'FAX';
comment on column m_club.address1 is '住所１';
comment on column m_club.address2 is '住所２';
comment on column m_club.start_date is '発足日';
comment on column m_club.close_date is '閉鎖日';
comment on column m_club.created_by is 'created_by';
comment on column m_club.created_at is 'created_at';
comment on column m_club.created_pg is 'created_pg';
comment on column m_club.updated_by is 'updated_by';
comment on column m_club.updated_at is 'updated_at';
comment on column m_club.updated_pg is 'updated_pg';
comment on column m_club.is_delete is 'is_delete';
comment on column m_club.deleted_by is 'deleted_by';
comment on column m_club.deleted_at is 'deleted_at';
comment on column m_club.deleted_pg is 'deleted_pg';
comment on column m_club.version is 'version';

comment on table m_branch is '支部';
comment on column m_branch.id is 'ID';
comment on column m_branch.name is '名称';
comment on column m_branch.leader_member_id is '支部長ID';
comment on column m_branch.created_by is 'created_by';
comment on column m_branch.created_at is 'created_at';
comment on column m_branch.created_pg is 'created_pg';
comment on column m_branch.updated_by is 'updated_by';
comment on column m_branch.updated_at is 'updated_at';
comment on column m_branch.updated_pg is 'updated_pg';
comment on column m_branch.is_delete is 'is_delete';
comment on column m_branch.deleted_by is 'deleted_by';
comment on column m_branch.deleted_at is 'deleted_at';
comment on column m_branch.deleted_pg is 'deleted_pg';
comment on column m_branch.version is 'version';

comment on table m_member is '会員';
comment on column m_member.id is 'ID';
comment on column m_member.last_name is '姓';
comment on column m_member.first_name is '名';
comment on column m_member.cureent_club_id is '所属クラブID';
comment on column m_member.gender is '性別:1:男,2:女,3:その他';
comment on column m_member.birthday is '生年月日';
comment on column m_member.mail_address is 'メールアドレス';
comment on column m_member.tel1 is '電話番号１';
comment on column m_member.tel2 is '電話番号２';
comment on column m_member.zip_code is '郵便番号';
comment on column m_member.address1 is '住所１';
comment on column m_member.address2 is '住所２';
comment on column m_member.join_date is '入会日';
comment on column m_member.one_star is '１スター';
comment on column m_member.one_star_date is '１スター取得日';
comment on column m_member.one_star_certified_member_id is '１スター認定者';
comment on column m_member.two_star is '２スター';
comment on column m_member.two_star_date is '２スター取得日';
comment on column m_member.two_star_certified_member_id is '２スター認定者';
comment on column m_member.three_star is '３スター';
comment on column m_member.three_star_date is '３スター取得日';
comment on column m_member.three_star_certified_member_id is '３スター認定者';
comment on column m_member.four_star is '４スター';
comment on column m_member.four_star_date is '４スター取得日';
comment on column m_member.four_star_certified_member_id is '４スター認定者';
comment on column m_member."１スターインストラクター" is '１スターインストラクター';
comment on column m_member."１スターインストラクター取得日" is '１スターインストラクター取得日';
comment on column m_member."１スターインストラクター認定者" is '１スターインストラクター認定者';
comment on column m_member."２スターインストラクター" is '２スターインストラクター';
comment on column m_member."２スターインストラクター認定者" is '２スターインストラクター認定者';
comment on column m_member."３スターインストラクター" is '３スターインストラクター';
comment on column m_member."３スターインストラクター取得日" is '３スターインストラクター取得日';
comment on column m_member."３スターインストラクター認定者" is '３スターインストラクター認定者';
comment on column m_member.created_by is 'created_by';
comment on column m_member.created_at is 'created_at';
comment on column m_member.created_pg is 'created_pg';
comment on column m_member.updated_by is 'updated_by';
comment on column m_member.updated_at is 'updated_at';
comment on column m_member.updated_pg is 'updated_pg';
comment on column m_member.is_delete is 'is_delete';
comment on column m_member.deleted_by is 'deleted_by';
comment on column m_member.deleted_at is 'deleted_at';
comment on column m_member.deleted_pg is 'deleted_pg';
comment on column m_member.version is 'version';

