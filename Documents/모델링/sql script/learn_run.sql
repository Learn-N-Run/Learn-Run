show databases;
use learnrun;
show tables;

SET foreign_key_checks = 1;
SET SQL_SAFE_UPDATES=1;

SELECT *
FROM reply r LEFT JOIN reply t
ON r.no = t.no;



desc learnrun.reply;
DROP TABLE reply;
desc reply;
select * from subject;
select * from reply;
SELECT * FROM user_group;
SELECT * FROM class;
SELECT * FROM buyer;
select * from category;
select * from user_group;
select * from user;
select * from receiver_info;
SELECT * FROM curriculum;


INSERT INTO `learnrun`.`reply` (`no`, `user_id`, `content`, `class_no`) VALUES ('1', 'creatertest01', '본문', '1');
INSERT INTO `learnrun`.`reply` (`no`, `user_id`, `content`, `class_no`) VALUES ('2', 'user1', '본문', '1');
INSERT INTO `learnrun`.`reply` (`no`, `target_no`, `user_id`, `content`, `class_no`) VALUES ('3', '2', 'user2', '태클', '1');
INSERT INTO `learnrun`.`reply` (`no`, `target_no`, `user_id`, `content`, `class_no`) VALUES ('4', '2', 'user3', '태클', '1');
INSERT INTO `learnrun`.`reply` (`no`,  `user_id`, `content`, `class_no`) VALUES ('5',  'user1', '본문', '1');
INSERT INTO `learnrun`.`reply` (`no`, `target_no`, `user_id`, `content`, `class_no`) VALUES ('6', '5', 'user1', '태클', '1');
INSERT INTO `learnrun`.`reply` (`no`, `target_no`, `user_id`, `content`, `class_no`) VALUES ('8', '1', 'user1', '태클', '1');

-- 커뮤니티

SELECT r.no no, r.target_no target_no, r.user_id user_id, r.content content,
	 r.date date, r.class_no class_no, r.curriculum_no curriculum_no, j.count count
FROM reply r LEFT JOIN (SELECT no, COUNT(*) count
					FROM reply
					WHERE target_no is null
					GROUP BY no) j
ON r.no = j.no
WHERE r.no = 1;

SELECT r.no no, r.target_no target_no, r.user_id user_id, r.content content,
	 r.date date, r.class_no class_no, r.curriculum_no curriculum_no, j.count count
FROM reply r LEFT JOIN (SELECT no, COUNT(*) count
					FROM reply
					WHERE target_no is null
					GROUP BY no) j
ON r.no = j.no
WHERE r.target_no is null
ORDER BY r.no ASC LIMIT 0, 5;

SELECT no
			FROM reply r 
			WHERE target_no = #{targetNo}
			ORDER BY r.no ASC LIMIT 0, 10;


SELECT *
FROM reply
WHERE target_no = 2
ORDER BY no DESC LIMIT 0, 10;





desc reply;


-- 커뮤니티 댓글여부
SELECT no, COUNT(*) count
FROM reply
WHERE target_no is null
GROUP BY no;




select * from reply;
desc curriculum;

desc class;
desc category;

desc user;
desc user_group;
desc reply;

-- 커뮤니티 리플
SELECT u.id 'id', u.email 'email', u.profile_img 'profile_img', u.nickname 'nickname', g.name 'usergroup',
		r.no 'no', r.content 'content', r.date 'date', r.group 'group', r.reply_id 'reply_id', r.class_no 'class_no', r.curriculm_no 'curriculm_no'
FROM user u JOIN user_group g JOIN reply r
ON u.user_group_no = g.no AND u.id = r.user_id
WHERE r.class_no = 1;

SELECT * FROM user_group g JOIN user u JOIN reply r;

-- 비디오 시청 리플
SELECT u.id 'id', u.pass 'pass', u.name 'name', u.email 'email', u.creator_url 'creator_url',
	u.profile_img 'profile_img', u.nickname 'nickname', u.number 'number', u.joinDate 'joinDate', g.name 'usergroup' 
FROM user u JOIN user_group g
ON u.user_group_no = g.no;




SELECT cl.no 'no', cl.cre_id 'creator', cl.cover_img 'cover_img', cl.title 'title', cl.content 'content'
FROM class cl JOIN category ca
ON cl.category_no = ca.no
WHERE ca.name = '공예';

		SELECT c.no, d.topclasscount, c.cre_id, c.cover_img, c.title, c.detail_category,
				c.content, c.material_img, c.material_content, c.expiration, c.tuition, c.category_no
		FROM class c join (SELECT class_no, COUNT(*) 'topclasscount'
							FROM buyer
							group by class_no
							ORDER BY classpop DESC LIMIT 5) d
		ON d.class_no = c.no
		GROUP BY c.no;

			SELECT * FROM category;


SELECT * FROM jjim;
SELECT * FROM buyer;
SELECT * FROM class;
SELECT * FROM category;


-- buyer count TopClassDTO ---
SELECT cl.no 'classNo',cl.cre_id 'creator',cl.cover_img 'coverImg',cl.title 'title',ca.no 'categoryNo', ca.name 'categoryName', 
		count(*) 'TopRankCount' FROM class cl join category ca join buyer buy
ON cl.category_no=ca.no
-- AND cl.no = buy.class_no
GROUP BY cl.no LIMIT 5;

-- jjim count InterestedClassDTO ---
SELECT cl.no 'classNo',cl.cre_id 'creator',cl.cover_img 'coverImg',cl.title 'title',ca.no 'categoryNo', ca.name 'categoryName', 
		count(*) 'interestCount' FROM class cl join category ca join jjim jj
ON cl.category_no=ca.no
	AND cl.no = jj.class_no
WHERE ca.name = '요리'
GROUP BY cl.no
LIMIT 5;


-- ---------------------INSERT record list-------------------------

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
-- -----------------------------------------------------
-- Data for table `learnrun`.`user_group`
-- -----------------------------------------------------
START TRANSACTION;
USE `learnrun`;


insert into user_group(no,name) values(1,'회원'),(2,'크리에이터'),(3,'관리자') ;


COMMIT;

		SELECT c.cover_img, c.category_no, c.title, count(b.class_no) AS 'count'
		FROM class c join buyer b
		GROUP BY c.cover_img, c.category_no, c.title 
		ORDER BY count DESC LIMIT 5;		

desc class;

c.no,
c.cre_id,
c.cover_img,
c.title,
c.detail_category,
c.content,
c.material_img,
c.material_content,
c.expiration,
c.tuition,
c.category_no
d.count;

SELECT class_no, COUNT(*) 'classpop' FROM buyer
				group by class_no
				ORDER BY classpop DESC LIMIT 5;

		SELECT c.no, d.classpop, c.cre_id, c.cover_img, c.title, c.detail_category,
				c.content, c.material_img, c.material_content, c.expiration, c.tuition, c.category_no
		FROM class c
        join (SELECT class_no, COUNT(*) 'classpop' FROM buyer
				group by class_no
				ORDER BY classpop DESC LIMIT 5) d
		ON d.class_no = c.no
		GROUP BY c.no;
        
        
-- -----------------------------------------------------
-- Data for table `learnrun`.`user`
-- -----------------------------------------------------
START TRANSACTION;
USE `learnrun`;
INSERT INTO `learnrun`.`user` (`id`, `pass`, `name`, `email`, `creator_url`, `profile_img`, `nickname`, `number`, `joinDate`, `user_group_no`) VALUES ('creatertest01', '1234', '크리에이터', 'create@test.com', 'test.com', '이미지없음', '크리', 01011111111, '2019-01-02', 01);
INSERT INTO `learnrun`.`user` (`id`, `pass`, `name`, `email`, `creator_url`, `profile_img`, `nickname`, `number`, `joinDate`, `user_group_no`) VALUES ('user2', '1234', '곤잘레스', 'crea23te@test.com', 'tes4t.com', '이미지없음', '크리3', 01011111111, '2019-01-02', 02);
INSERT INTO `learnrun`.`user` (`id`, `pass`, `name`, `email`, `creator_url`, `profile_img`, `nickname`, `number`, `joinDate`, `user_group_no`) VALUES ('user1', '1234', '알렉산더', 'cre234ate@test.com', 't434est.com', '이미지없음', '크2리', 01011111111, '2019-01-02', 02);
INSERT INTO `learnrun`.`user` (`id`, `pass`, `name`, `email`, `creator_url`, `profile_img`, `nickname`, `number`, `joinDate`, `user_group_no`) VALUES ('user3', '1234', '뽀삐', '2a3te@test.com', 'tes2t.com', '이미지없음', '1크리', 01011111111, '2019-01-02', 02);

COMMIT;

-- -----------------------------------------------------
-- Data for table `learnrun`.`receiver_info`
-- -----------------------------------------------------

INSERT INTO receiver_info(name, number,address1,address2,address3,delievery_msg) VALUES("홍길",01000000000,"주소1","주2소","3주소","딜리버리 메세지");


SELECT * FROM category;

ALTER TABLE category CHANGE img image varchar(300);


START TRANSACTION;
USE `learnrun`;
INSERT INTO `learnrun`.`category` (`no`, `name`, `img`) VALUES (1, '요리', '/3_img/cateimg/food.png');
INSERT INTO `learnrun`.`category` (`no`, `name`, `img`) VALUES (2, '카메라', '/3_img/cateimg/crafts.png');
INSERT INTO `learnrun`.`category` (`no`, `name`, `img`) VALUES (3, '미용', '/3_img/cateimg/art.png');
INSERT INTO `learnrun`.`category` (`no`, `name`, `img`) VALUES (4, '코딩', '/3_img/cateimg/design.png');
INSERT INTO `learnrun`.`category` (`no`, `name`, `img`) VALUES (5, '음악', '/3_img/cateimg/music.png');
INSERT INTO `learnrun`.`category` (`no`, `name`, `img`) VALUES (6, '켈리그래피', '/3_img/cateimg/calligraphy.png');
INSERT INTO `learnrun`.`category` (`no`, `name`, `img`) VALUES (7, '운동', '/3_img/cateimg/activity.png');
INSERT INTO `learnrun`.`category` (`no`, `name`, `img`) VALUES (8, '미술', '/3_img/cateimg/art.png');

COMMIT;
-- -----------------------------------------------------
-- Data for table `learnrun`.`class`
-- -----------------------------------------------------
START TRANSACTION;
USE `learnrun`;
INSERT INTO `learnrun`.`class` (`no`, `cre_id`, `cover_img`, `title`, `detail_category`, `content`, `material_img`, `material_content`, `expiration`, `tuition`, `category_no`) VALUES (1, 'creatertest01', '이미지없음', '여기가 타이틀', '디테일카테고리', '콘텐츠부분', '이미지가 또있네?', '이미지콘텐츠?', 111111, 22222222, 1);
INSERT INTO `learnrun`.`class` (`no`, `cre_id`, `cover_img`, `title`, `detail_category`, `content`, `material_img`, `material_content`, `expiration`, `tuition`, `category_no`) VALUES (2, 'creatertest01', '이미지없음', '여기가 타이틀', '디테일카테고리', '콘텐츠부분', '이미지가 또있네?', '이미지콘텐츠?', 111111, 22222222, 2);
INSERT INTO `learnrun`.`class` (`no`, `cre_id`, `cover_img`, `title`, `detail_category`, `content`, `material_img`, `material_content`, `expiration`, `tuition`, `category_no`) VALUES (3, 'creatertest01', '이미지없음', '여기가 타이틀', '디테일카테고리', '콘텐츠부분', '이미지가 또있네?', '이미지콘텐츠?', 111111, 22222222, 2);
INSERT INTO `learnrun`.`class` (`no`, `cre_id`, `cover_img`, `title`, `detail_category`, `content`, `material_img`, `material_content`, `expiration`, `tuition`, `category_no`) VALUES (4, 'creatertest01', '이미지없음', '4번클래스', '디테일카테고리', '콘텐츠부분', '이미지가 또있네?', '이미지콘텐츠?', 111111, 22222222, 3);
INSERT INTO `learnrun`.`class` (`no`, `cre_id`, `cover_img`, `title`, `detail_category`, `content`, `material_img`, `material_content`, `expiration`, `tuition`, `category_no`) VALUES (5, 'creatertest01', '이미지없음', '5번클래스', '디테일카테고리', '콘텐츠부분', '이미지가 또있네?', '이미지콘텐츠?', 111111, 22222222, 4);
INSERT INTO `learnrun`.`class` (`no`, `cre_id`, `cover_img`, `title`, `detail_category`, `content`, `material_img`, `material_content`, `expiration`, `tuition`, `category_no`) VALUES (6, 'creatertest01', '이미지없음', '6버클래스', '디테일카테고리', '콘텐츠부분', '이미지가 또있네?', '이미지콘텐츠?', 111111, 22222222, 5);
INSERT INTO `learnrun`.`class` (`no`, `cre_id`, `cover_img`, `title`, `detail_category`, `content`, `material_img`, `material_content`, `expiration`, `tuition`, `category_no`) VALUES (7, 'creatertest01', '이미지없음', '7번클래스', '디테일카테고리', '콘텐츠부분', '이미지가 또있네?', '이미지콘텐츠?', 111111, 22222222, 5);
INSERT INTO `learnrun`.`class` (`no`, `cre_id`, `cover_img`, `title`, `detail_category`, `content`, `material_img`, `material_content`, `expiration`, `tuition`, `category_no`) VALUES (8, 'creatertest01', '이미지없음', '8래스', '디테일카테고리', '콘텐츠부분', '이미지가 또있네?', '이미지콘텐츠?', 111111, 22222222, 5);
INSERT INTO `learnrun`.`class` (`no`, `cre_id`, `cover_img`, `title`, `detail_category`, `content`, `material_img`, `material_content`, `expiration`, `tuition`, `category_no`) VALUES (9, 'creatertest01', '이미지없음', '7번클9래스', '디테일카테고리', '콘텐츠부분', '이미지가 또있네?', '이미지콘텐츠?', 111111, 22222222, 6);
INSERT INTO `learnrun`.`class` (`no`, `cre_id`, `cover_img`, `title`, `detail_category`, `content`, `material_img`, `material_content`, `expiration`, `tuition`, `category_no`) VALUES (10, 'creatertest01', '이미지없음', '7번10클래스', '디테일카테고리', '콘텐츠부분', '이미지가 또있네?', '이미지콘텐츠?', 111111, 22222222, 6);
INSERT INTO `learnrun`.`class` (`no`, `cre_id`, `cover_img`, `title`, `detail_category`, `content`, `material_img`, `material_content`, `expiration`, `tuition`, `category_no`) VALUES (11, 'creatertest01', '이미지없음', '7번11클래스', '디테일카테고리', '콘텐츠부분', '이미지가 또있네?', '이미지콘텐츠?', 111111, 22222222, 1);
COMMIT;


-- -----------------------------------------------------
-- Data for table `learnrun`.`jjim`
-- -----------------------------------------------------
START TRANSACTION;
USE `learnrun`;
INSERT INTO `learnrun`.`jjim` (`no`, `user_id`, `class_no`) VALUES (1, 'creatertest01', 1);
INSERT INTO `learnrun`.`jjim` (`user_id`, `class_no`) VALUES ('creatertest01', 1);
COMMIT;

-- -----------------------------------------------------
-- Data for table `learnrun`.`buyer`
-- -----------------------------------------------------
START TRANSACTION;
USE `learnrun`;
INSERT INTO `learnrun`.`buyer` (`no`, `user_id`, `last_tuition`, `order_date`, `class_no`,`receiver_info_no`) VALUES (01,'user3', '1234', '2019-01-02', 1,1);
INSERT INTO `learnrun`.`buyer` (`no`, `user_id`, `last_tuition`, `order_date`, `class_no`,`receiver_info_no`) VALUES (02,'user2', '1234', '2019-01-02', 1,2);
INSERT INTO `learnrun`.`buyer` (`no`, `user_id`, `last_tuition`, `order_date`, `class_no`,`receiver_info_no`) VALUES (03,'user1', '1234', '2019-01-02', 1,1);
INSERT INTO `learnrun`.`buyer` (`no`, `user_id`, `last_tuition`, `order_date`, `class_no`,`receiver_info_no`) VALUES (04,'user3', '1234', '2019-01-02', 2,1);
INSERT INTO `learnrun`.`buyer` (`no`, `user_id`, `last_tuition`, `order_date`, `class_no`,`receiver_info_no`) VALUES (05,'user2', '1234', '2019-01-02', 2,1);
INSERT INTO `learnrun`.`buyer` (`no`, `user_id`, `last_tuition`, `order_date`, `class_no`,`receiver_info_no`) VALUES (06,'user1', '1234', '2019-01-02', 1,1);
INSERT INTO `learnrun`.`buyer` (`no`, `user_id`, `last_tuition`, `order_date`, `class_no`,`receiver_info_no`) VALUES (07,'user3', '1234', '2019-01-02', 7,1);

COMMIT;

