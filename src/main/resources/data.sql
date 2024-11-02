INSERT INTO `tb_department` (dept_no, dept_code,dept_name,eng_name,created_at,updated_at, dept_head)
SELECT 1,'001','영업부','dept_sales',now(),now(), '테스트'
WHERE NOT EXISTS (SELECT 1 FROM tb_department WHERE dept_no = 1);

INSERT INTO `tb_department` (dept_no, dept_code,dept_name,eng_name,created_at,updated_at, dept_head)
SELECT 2,'002','개발부','dept_coding',now(),now(), '삼다수'
WHERE NOT EXISTS (SELECT 1 FROM tb_department WHERE dept_no = 2);

INSERT INTO `tb_department` (dept_no, dept_code,dept_name,eng_name,created_at,updated_at, dept_head)
SELECT 3,'003','인사부','dept_people',now(),now(), '관리자'
WHERE NOT EXISTS (SELECT 1 FROM tb_department WHERE dept_no = 3);

INSERT INTO `tb_department` (dept_no, dept_code,dept_name,eng_name,created_at,updated_at)
SELECT 4,'004','총무부','dept_generalAffairs',now(),now()
WHERE NOT EXISTS (SELECT 1 FROM tb_department WHERE dept_no = 4);

INSERT INTO `tb_department` (dept_no, dept_code,dept_name,eng_name,created_at,updated_at)
SELECT 5,'005','기획부','dept_plan',now(),now()
WHERE NOT EXISTS (SELECT 1 FROM tb_department WHERE dept_no = 5);

INSERT INTO `tb_department` (dept_no, dept_code,dept_name,eng_name,created_at,updated_at)
SELECT 6,'006','전산,IT부','dept_IT',now(),now()
WHERE NOT EXISTS (SELECT 1 FROM tb_department WHERE dept_no = 6);

INSERT INTO `tb_department` (dept_no, dept_code,dept_name,eng_name,created_at,updated_at, parent_id)
SELECT 7,'007','영업 지원부','dept_sales_support',now(),now(), 1
WHERE NOT EXISTS (SELECT 1 FROM tb_department WHERE dept_no = 7);

INSERT INTO `tb_department` (dept_no, dept_code,dept_name,eng_name,created_at,updated_at, parent_id)
SELECT 8,'008','영업 지원 1팀','dept_sales_support_1',now(),now(), 7
WHERE NOT EXISTS (SELECT 1 FROM tb_department WHERE dept_no = 8);

INSERT INTO `tb_department` (dept_no, dept_code,dept_name,eng_name,created_at,updated_at, parent_id)
SELECT 9,'009','영업 지원 2팀','dept_sales_support_2',now(),now(), 7
WHERE NOT EXISTS (SELECT 1 FROM tb_department WHERE dept_no = 9);

INSERT INTO `tb_department` (dept_no, dept_code,dept_name,eng_name,created_at,updated_at, parent_id)
SELECT 10,'010','영업 지원 3팀','dept_sales_support_3',now(),now(), 7
WHERE NOT EXISTS (SELECT 1 FROM tb_department WHERE dept_no = 10);

INSERT INTO `tb_department` (dept_no, dept_code,dept_name,eng_name,created_at,updated_at, parent_id)
SELECT 11,'011','영업 관리부','dept_sales_management',now(),now(), 1
WHERE NOT EXISTS (SELECT 1 FROM tb_department WHERE dept_no = 11);

INSERT INTO `tb_department` (dept_no, dept_code,dept_name,eng_name,created_at,updated_at, parent_id)
SELECT 12,'012','개발 1팀','dept_coding_1',now(),now(), 2
WHERE NOT EXISTS (SELECT 1 FROM tb_department WHERE dept_no = 12);

INSERT INTO `tb_department` (dept_no, dept_code,dept_name,eng_name,created_at,updated_at, parent_id)
SELECT 13,'013','개발 2팀','dept_coding_2',now(),now(), 2
WHERE NOT EXISTS (SELECT 1 FROM tb_department WHERE dept_no = 13);

INSERT INTO `tb_department` (dept_no, dept_code,dept_name,eng_name,created_at,updated_at, parent_id)
SELECT 14,'014','개발 3팀','dept_coding_3',now(),now(), 2
WHERE NOT EXISTS (SELECT 1 FROM tb_department WHERE dept_no = 14);

INSERT INTO `tb_department` (dept_no, dept_code,dept_name,eng_name,created_at,updated_at, parent_id)
SELECT 15,'015','총무 1팀','dept_generalAffairs_1',now(),now(), 4
WHERE NOT EXISTS (SELECT 1 FROM tb_department WHERE dept_no = 15);

INSERT INTO `tb_department` (dept_no, dept_code,dept_name,eng_name,created_at,updated_at, parent_id)
SELECT 16,'016','총무 2팀','dept_generalAffairs_2',now(),now(), 4
WHERE NOT EXISTS (SELECT 1 FROM tb_department WHERE dept_no = 16);




INSERT INTO `tb_user` (user_no,name,email,password,employee_id,dept_id,role,created_at,updated_at,join_date)
SELECT 1,'테스트','test@naver.com','$2a$10$NQ5nj6.3UnFxec0idKxma.pn2mq5L5qIjouO4oueMRzjH/5tPX84e','20241011001','001','USER',now(),now(),now()
WHERE NOT EXISTS (SELECT 1 FROM tb_user WHERE email = 'test@naver.com');

INSERT INTO `tb_user` (user_no,name,email,password,employee_id,dept_id,role,created_at,updated_at,join_date)
SELECT 2,'삼다수','samdasoo@naver.com','$2a$10$NQ5nj6.3UnFxec0idKxma.pn2mq5L5qIjouO4oueMRzjH/5tPX84e','20241011005','006','USER',now(),now(),now()
WHERE NOT EXISTS (SELECT 1 FROM tb_user WHERE email = 'samdasoo@naver.com');

INSERT INTO `tb_user` (user_no,name,email,password,employee_id,dept_id,role,created_at,updated_at,join_date)
SELECT 3,'관리자','admin@naver.com','$2a$10$NQ5nj6.3UnFxec0idKxma.pn2mq5L5qIjouO4oueMRzjH/5tPX84e','20200711002','003','ADMIN',now(),now(),now()
WHERE NOT EXISTS (SELECT 1 FROM tb_user WHERE email = 'admin@naver.com');

INSERT INTO `tb_customer` (customer_no,name,company,dept,position,email,phone,tel,grade,is_keyman,user_no,created_at,updated_at)
SELECT 1, '김은경', '네이버','개발1팀','과장','abc@naver.com','010-1234-8888','03-1344-5999','S',true,1,now(),now()
WHERE NOT EXISTS (SELECT 1 FROM tb_customer WHERE customer_no=1);

INSERT INTO `tb_customer` (customer_no,name,company,dept,position,email,phone,tel,grade,is_keyman,user_no,created_at,updated_at)
SELECT 2, '이유진', '삼성','기획조정부','사원','samsung@gmail.com','010-1111-2222','02-888-999','B',false,1,now(),now()
WHERE NOT EXISTS (SELECT 1 FROM tb_customer WHERE customer_no=2);

INSERT INTO `tb_customer` (customer_no,name,company,dept,position,email,phone,tel,grade,is_keyman,user_no,created_at,updated_at)
SELECT 3, '정수진', 'LG','인사팀','대리','lg@gmail.com','010-1111-2222','02-888-999','A',false,1,now(),now()
WHERE NOT EXISTS (SELECT 1 FROM tb_customer WHERE customer_no=3);

INSERT INTO `tb_customer` (customer_no,name,company,dept,position,email,phone,tel,grade,is_keyman,user_no,created_at,updated_at)
SELECT 4, '이지정', '카카오','서버운영팀','사원','kakao@gmail.com','010-1111-2222','02-888-999','A',false,1,now(),now()
WHERE NOT EXISTS (SELECT 1 FROM tb_customer WHERE customer_no=4);

INSERT INTO `tb_customer` (customer_no,name,company,dept,position,email,phone,tel,grade,is_keyman,user_no,created_at,updated_at)
SELECT 5, '최규범', 'Google','인사과','사원','sampho@gmail.com','010-1111-2222','02-888-999','A',false,1,now(),now()
WHERE NOT EXISTS (SELECT 1 FROM tb_customer WHERE customer_no=5);

INSERT INTO `tb_customer` (customer_no,name,company,dept,position,email,phone,tel,grade,is_keyman,user_no,created_at,updated_at)
SELECT 6, '장현준', 'NC','개발팀','과장','nc@gmail.com','010-1111-2222','02-888-999','A',false,1,now(),now()
WHERE NOT EXISTS (SELECT 1 FROM tb_customer WHERE customer_no=6);

#
# INSERT INTO `tb_poetntial_customer` (p_cust_no ,created_at, updated_at,register_date, modify_date,  addr, cls, company, dept, email, fax, name, note, phone, position, tel, grade, contact_status,user_no)
# SELECT 100, now(),now(),'2024-09-22',null,'서울 송파구','지인소개','현대','영업부','hyndai@gmail.com','01-xxx-xxx','김현대','busy','010-1234-6789','팀장','02-7659-1313','A','TRY_CONTACT',2
# WHERE NOT EXISTS (SELECT 1 FROM tb_poetntial_customer WHERE p_cust_no=100);
#
# INSERT INTO `tb_poetntial_customer` (p_cust_no ,created_at, updated_at,register_date, modify_date,  addr, cls, company, dept, email, fax, name, note, phone, position, tel, grade, contact_status,user_no)
# SELECT 200, now(),now(),'2024-10-01',null,'서울 강남구','세미나','바다나라','어류','fish@gmail.com','01-xxx-xxx','고등어','종류가 많음','010-3333-3333','물고기','02-3333-6666','S','CONTACTING',2
# WHERE NOT EXISTS (SELECT 1 FROM tb_poetntial_customer WHERE p_cust_no=200);
#
# INSERT INTO `tb_poetntial_customer` (p_cust_no ,created_at, updated_at,register_date, modify_date,  addr, cls, company, dept, email, fax, name, note, phone, position, tel, grade, contact_status,user_no)
# SELECT 300, now(),now(),'2024-10-13',null,'서울 종로구','채팅','해양수족관','조개류','seashell@gmail.com','01-xxx-xxx','바지락','조개 종류많음','010-5555-5555','조개','02-0000-4422','B','NO_CONTACT',2
# WHERE NOT EXISTS (SELECT 1 FROM tb_poetntial_customer WHERE p_cust_no=300);
#
# INSERT INTO `tb_contact_history` (contact_history_no, p_cust_no, user_no, contact_date,cls, content,created_at,updated_at)
# SELECT 100 , 100 , 2 , '2024-10-20','EMAIL','메일 발송',now(),now()
# WHERE NOT EXISTS (SELECT 1 FROM tb_contact_history WHERE contact_history_no=100);
#
# INSERT INTO `tb_contact_history` (contact_history_no, p_cust_no, user_no, contact_date,cls, content,created_at,updated_at)
# SELECT 200 , 100 , 2 , '2024-11-03','VISIT','오후 2시 방문 예정',now(),now()
# WHERE NOT EXISTS (SELECT 1 FROM tb_contact_history WHERE contact_history_no=200);
