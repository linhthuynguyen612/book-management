drop table if exists `users`;

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL
);

LOCK TABLES `users` WRITE;
insert into thweb.users
values(1,"user","123456"),
(2,"admin","123456");
UNLOCK TABLES;


drop table if exists `books`;

create table `books`(
	id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    author VARCHAR(30) NOT NULL,
    yearPublished  int
);


LOCK TABLES `books` WRITE;
insert into `books` 
values (1,"Đại số tuyến tính","Nguyễn Văn Nam",2015),
(2,"Tiếng anh giao tiếp","Nguyễn Hoa Huệ",2022),
(3,"Hình học cao cấp","Trần Văn Hào",2015),
(4,"Giải tích 1","Lê Văn Hiếu",2016);
UNLOCK TABLES;
