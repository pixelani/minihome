

	/* DB 꼭 필요하신분들은 아래 명령 차례로 실행하셔서 기존테이블 drop 후 
	create 및 foreign key 설정하시고 사용하시기 바랍니다.
	
	수정 필요한 부분 말씀해주세요!
	
	drop table minip_user
	drop table minip_coupon
	drop table minip_review
	
	drop table store
	
	drop table user
	drop table coupon
	drop table review
	drop table seller
	drop table food_category
	drop table menu
	drop table menu_category
	drop table jumun
	drop table sale_menu
	drop table cart
	drop table store

	*/
	create table user
	(
		 user_idx  			 int primary key auto_increment,
		 user_name  	 	 varchar(100) not null,
		 user_id    		 varchar(100) unique not null,
		 user_pwd   	 	 varchar(100) not null,
		 user_cellphone		 varchar(100) not null,
		 user_email	         varchar(100) not null,
		 user_addr			 varchar(100) default '서울시 강남구',
		 user_order_addr     varchar(100),
		 user_grade          varchar(100),
		 user_created_date   datetime default now(),
		 user_modified_date  datetime default now(),
		 user_proof			 text
	);

	
	create table coupon
	(
		coupon_idx          	int primary key auto_increment,
		user_idx               	int,
		coupon_name             varchar(100) not null,
		coupon_content			varchar(100) not null,
		deducted_price			int not null,
		coupon_min_order_price  int default 20000,
		coupon_created_date     datetime default now(),
		coupon_expired_date     datetime default now(),
		coupon_status           varchar(100) default '사용가능'
	);
		
	alter table coupon add constraint fk_coupon_user_idx foreign key(user_idx) references user(user_idx);
	
	create table review
	(
		review_idx int primary key not null auto_increment,
		user_idx               	int not null,
		seller_idx              int not null,
		menu_idx				int not null,
		menu_rating             int not null,
		review_content          text,
		review_photo            text,
		review_created_date		datetime default now(),
		review_modified_date    datetime default now(),
		review_status           varchar(100)
	);
	

	alter table review add constraint fk_review_user_idx foreign key(user_idx) references user(user_idx);
	alter table review add constraint fk_review_seller_idx foreign key(seller_idx) references seller(seller_idx);
	alter table review add constraint fk_review_menu_idx foreign key(menu_idx) references menu(menu_idx);
	
	
	create table seller
	(
		seller_idx				int primary key auto_increment,
		seller_name				varchar(100) not null,
		food_category_idx       int not null,
		food_category_name   	varchar(100) not null,
		seller_addr				varchar(100) not null,
		seller_photo			text not null,
		seller_phone			varchar(100) not null,
		delivery_type			varchar(100) default '배달가능',
		seller_intro			text,
		seller_min_order_price	int,
		seller_rating			int,
		seller_review_num       int default 0,
		seller_operation_hours  varchar(100) not null,
		seller_close_days       varchar(100) not null,
		seller_created_date     datetime default now(),
		seller_modified_date	datetime default now(),
		seller_status			varchar(100) not null,
		user_idx				int not null,
		seller_photo_ip  	    int not null
	);
	
	select * from seller
	
	alter table seller modify seller_photo_ip varchar(100);
	

	create table food_category
	(
		food_category_idx    int primary key,
		food_category_name   varchar(100) not null
	);
	
	delete from food_category where food_category_idx=0
	
	insert into food_category values(1,'전통시장');
	insert into food_category values(2,'한식');
	insert into food_category values(3,'중식');
	insert into food_category values(4,'일식');
	insert into food_category values(5,'아시안');
	insert into food_category values(6,'야식');
	insert into food_category values(7,'분식');
	insert into food_category values(8,'양식');
	insert into food_category values(9,'디저트');
	insert into food_category values(10,'족발');
	insert into food_category values(11,'피자');

	select * from food_category
	
	delete from food_category where food_category_idx=8;
	
	create table menu
	(
		menu_idx			int primary key auto_increment,
		seller_idx			int not null,
		menu_name			varchar(100) not null,
		menu_category_idx   int not null,
		menu_category_name  varchar(100) not null,
		menu_detail			text,
		menu_photo          text not null,
		menu_price          int not null,
		menu_created_date   datetime default now(),
		menu_modified_date  datetime default now(),
		menu_status         varchar(100) default '주문가능',
		menu_rating_avg     int default 0,
		menu_photo_ip		varchar(100)
	);
	
	select * from menu;
	
	delete from menu ;
	
	alter table menu add constraint fk_menu_seller_idx foreign key(seller_idx) references seller(seller_idx);
	alter table menu modify menu_photo_ip varchar(1000);

	create table menu_category
	(
		menu_category_idx  int primary key,
		menu_category_name varchar(100) not null
	);
	
	insert into menu_category values(1,'식사류');
	insert into menu_category values(2,'디저트');
	insert into menu_category values(3,'음료');
	insert into menu_category values(4,'주류');

	create table jumun
	(
		jumun_idx				int primary key auto_increment,
		cart_idx				int not null,
		user_idx				int not null,
		seller_idx				int not null,
		total_price				int not null,
		pay_method				varchar(100) default '신용카드',
		jumun_created_date		datetime default now(),
		jumun_modified_date		datetime default now()
	);
	
	
	alter table jumun add constraint fk_jumun_cart_idx foreign key(cart_idx) references cart(cart_idx);
	alter table jumun add constraint fk_jumun_user_idx foreign key(user_idx) references user(user_idx);
	alter table jumun add constraint fk_jumun_seller_idx foreign key(seller_idx) references seller(seller_idx);


	create table sale_menu
	(
		sale_idx			int primary key auto_increment,
		menu_idx			int not null,
		seller_idx			int not null,
		discount_rate		float not null,
		start_date_time  	datetime default now(),
		end_date_time       datetime default now(),
		menu_category_idx   int not null
	);
	
	
	alter table sale_menu add constraint fk_sale_menu_menu_idx foreign key(menu_idx) references menu(menu_idx);
	alter table sale_menu add constraint fk_sale_menu_seller_idx foreign key(seller_idx) references seller(seller_idx);

	

	create table cart
	(
		cart_idx	       int primary key auto_increment,
		menu_idx		   int not null,
		sale_idx		   int not null,
		menu_count         int default 0,
		cart_price         int default 0,
		cart_created_date  datetime default now(),
		cart_modified_date datetime default now()
	);
	
	
	alter table cart add constraint fk_cart_menu_idx foreign key(menu_idx) references menu(menu_idx);
	alter table cart add constraint fk_cart_sale_idx foreign key(sale_idx) references sale_menu(sale_idx);


	/*---조인.... */
	select *,m.menu_category_idx from menu m inner join menu_category mc on m.menu_category_idx=mc.menu_category_idx;
	


