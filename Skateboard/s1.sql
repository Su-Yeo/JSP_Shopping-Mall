SET NAMES UTF8;

create table member2(
id varchar(50) not null primary key,
passwd varchar(16) not null,
name varchar(10) not null,
addr varchar(100) not null,
tel varchar(20) not null,
email varchar(50) not null
)DEFAULT CHARSET=utf8 COLLATE utf8_general_ci; 

create table product(
pid int not null AUTO_INCREMENT,
name varchar(50) not null,
img varchar(100) not null,
price int(11) not null,
primary key(pid)
)DEFAULT CHARSET=utf8 COLLATE utf8_general_ci; 

create table cart(
cid int not null AUTO_INCREMENT,
uid varchar(50) not null,
pid int(50) not null,
quantity int(11) not null,
total int(11) not null,
primary key(cid),
FOREIGN KEY (uid) REFERENCES member2(id)
on delete cascade on update cascade,
FOREIGN KEY (pid) REFERENCES product(pid)
on delete cascade on update cascade
)DEFAULT CHARSET=utf8 COLLATE utf8_general_ci; 

create table video(
vid int not null AUTO_INCREMENT,
title varchar(50) not null,
text varchar(200) not null,
link varchar(100) not null,
primary key(vid)
) DEFAULT CHARSET=utf8 COLLATE utf8_general_ci; 

create table notice(
nid int not null AUTO_INCREMENT,
title varchar(150) not null,
text varchar(300) not null,
uid varchar(50) not null,
date datetime not null,
primary key(nid),
FOREIGN KEY (uid) REFERENCES member2(id)
on delete cascade on update cascade
) DEFAULT CHARSET=utf8 COLLATE utf8_general_ci; 

create table comment(
cmid int not null AUTO_INCREMENT,
nid int not null,
text varchar(200) not null,
uid varchar(50) not null,
date datetime not null,
primary key(cmid),
FOREIGN KEY (nid) REFERENCES notice(nid)
on delete cascade on update cascade,
FOREIGN KEY (uid) REFERENCES member2(id)
on delete cascade on update cascade
) DEFAULT CHARSET=utf8 COLLATE utf8_general_ci; 

insert into member2
values('admin','admin','admin','서울','010-0000-0000','admin@sk8mafia.com');

insert into product(name,img,price)
values('스케이트보드', 'images/p1.jpg', 130000);
insert into product(name,img,price)
values('스케이트보드2', 'images/p2.jpg', 280000);
insert into product(name,img,price)
values('스케이트보드3', 'images/p3.jpg', 190000);
insert into product(name,img,price)
values('스케이트보드4', 'images/p4.jpg', 230000);
insert into product(name,img,price)
values('스케이트보드5', 'images/p5.jpg', 170000);
insert into product(name,img,price)
values('스케이트보드6', 'images/p6.jpg', 300000);

insert into video(title,text,link)
values('보드 타기의 기본!', '멋진 자세가 보드 타기의 전부가 아니라는 점만 기억한다면 다치지 않고 보드의 재미를 즐길 수 있을 것입니다.', 'f5AZjcJ52lE');
insert into video(title,text,link)
values('스케이트보드를 멈추는 가장 좋은 방법', '보드를 멈추려면 엉덩이를 틀어 보드를 90도로 돌리고 발뒤꿈치에 힘을 준 다음 몸의 중심 근육을 이용해 무릎을 굽히면 됩니다.하지만 현실은 생각처럼 잘 되지 않는군요.', 'EvkMGffO0r0');
insert into video(title,text,link)
values('스케이트보드를 잘 타는 과학적 방법!', '경사로에서 스케이트보드를 타고 내려올 때 기억해야 할 것이 있습니다.
몸과 스케이트보드의 각도를 90도로 유지하는 것!
넘어지는 것이 두려울수록 몸이 앞이나 뒤로 쏠리게 되죠.
두려움을 극복한다면 스케이트보드를 멋있게 탈 수 있습니다.', '7I_4hbomUb0');
insert into video(title,text,link)
values('스케이트보드 기술 알리 성공 방법!', '알리를 성공시키기 위해서는 속력, 힘, 타이밍 이 세 박자가 맞아야 하죠.
하지만 원리를 알아도 성공하지 못하는 경우가 있는 것 같습니다.', 'mRZRhcaAcec');
insert into video(title,text,link)
values('스케이트보드로 경사를 질주하기 위한 과학!', '서핑에서 유래된 스케이트보드 타기. 
하지만 도시엔 파도가 없기에 인공적으로 조성된 경사로 등이 파도를 대신하게 된다. 
파도보다 훨씬 단단하지만 말이다.', 'y3xqZmfGlnk');

select * from member2;
select * from product;
select * from cart;
select * from video;
select * from notice;
select * from comment;

delete from member2;
delete from product;
delete from cart;
delete from video;
delete from notice;
delete from comment;

drop table member2;
drop table product;
drop table cart;
drop table video;
drop table notice;
drop table comment;