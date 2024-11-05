INSERT INTO `tb_department` (dept_no, dept_code,dept_name,eng_name,created_at,updated_at)
SELECT 1,'SALES-001','영업부','dept_sales',now(),now()
WHERE NOT EXISTS (SELECT 1 FROM tb_department WHERE dept_no = 1);

INSERT INTO `tb_department` (dept_no, dept_code,dept_name,eng_name,created_at,updated_at)
SELECT 2,'SS-001','영업 지원부','dept_sales_support',now(),now()
WHERE NOT EXISTS (SELECT 2 FROM tb_department WHERE dept_no = 2);

INSERT INTO `tb_department` (dept_no, dept_code,dept_name,eng_name,created_at,updated_at, parent_id)
SELECT 3,'SALES-002','영업 1팀','dept_sales_1',now(),now(), 1
WHERE NOT EXISTS (SELECT 1 FROM tb_department WHERE dept_no = 3);

INSERT INTO `tb_department` (dept_no, dept_code,dept_name,eng_name,created_at,updated_at, parent_id)
SELECT 4,'SALES-003','영업 2팀','dept_sales_2',now(),now(), 1
WHERE NOT EXISTS (SELECT 1 FROM tb_department WHERE dept_no = 4);

INSERT INTO `tb_department` (dept_no, dept_code,dept_name,eng_name,created_at,updated_at, parent_id)
SELECT 5,'SALES-004','영업 3팀','dept_sales_3',now(),now(), 1
WHERE NOT EXISTS (SELECT 1 FROM tb_department WHERE dept_no = 5);

-- >>>>>>>>>>>> 유저 <<<<<<<<<<<<<<
-- (비번은 1234로 통일 )

-- 관리자
INSERT INTO `tb_user` (user_no,name,email,password,employee_id,dept_id,role,created_at,updated_at,join_date,profile_url)
SELECT 1,'관리자','admin@naver.com','$2a$10$NQ5nj6.3UnFxec0idKxma.pn2mq5L5qIjouO4oueMRzjH/5tPX84e','20200711002',1,'ADMIN',now(),now(),now(),'https://s3.ap-northeast-2.amazonaws.com/salesboost-image/static/profile/cc3d78d8-3bc4-4c73-bff6-cf69b3bebbe5.jpg'
WHERE NOT EXISTS (SELECT 1 FROM tb_user WHERE email = 'admin@naver.com');

-- 테스트
INSERT INTO `tb_user` (user_no,name,email,password,employee_id,dept_id,role,created_at,updated_at,join_date,profile_url)
SELECT 14,'테스트','test@naver.com','$2a$10$NQ5nj6.3UnFxec0idKxma.pn2mq5L5qIjouO4oueMRzjH/5tPX84e','20230911001',1,'USER',now(),now(),now(),'https://s3.ap-northeast-2.amazonaws.com/salesboost-image/static/profile/3a4bff9e-7e94-4cc4-876b-c19068850269.png'
WHERE NOT EXISTS (SELECT 1 FROM tb_user WHERE email = 'test@naver.com');

-- 삼다수
INSERT INTO `tb_user` (user_no,name,email,password,employee_id,dept_id,role,created_at,updated_at,join_date,profile_url)
SELECT 15,'삼다수','samdasoo@naver.com','$2a$10$NQ5nj6.3UnFxec0idKxma.pn2mq5L5qIjouO4oueMRzjH/5tPX84e','20221011005',1,'USER',now(),now(),now(),'https://salesboost-image.s3.ap-northeast-2.amazonaws.com/static/profile/3a4bff9e-7e94-4cc4-876b-c19068850269.png'
WHERE NOT EXISTS (SELECT 1 FROM tb_user WHERE email = 'samdasoo@naver.com');

-- 영업부 (dept_id = 1)
INSERT INTO `tb_user` (user_no, name, email, password, employee_id, dept_id, role, created_at, updated_at, join_date, profile_url)
SELECT 2, '김영수', 'youngsu@company.com', '$2a$10$NQ5nj6.3UnFxec0idKxma.pn2mq5L5qIjouO4oueMRzjH/5tPX84e', '20241011001', 1, 'USER', now(), now(), now(),null
WHERE NOT EXISTS (SELECT 1 FROM tb_user WHERE email = 'youngsu@company.com');

INSERT INTO `tb_user` (user_no, name, email, password, employee_id, dept_id, role, created_at, updated_at, join_date, profile_url)
SELECT 3, '이민호', 'minho@company.com', '$2a$10$NQ5nj6.3UnFxec0idKxma.pn2mq5L5qIjouO4oueMRzjH/5tPX84e', '20241011002', 1, 'USER', now(), now(), now(), null
WHERE NOT EXISTS (SELECT 1 FROM tb_user WHERE email = 'minho@company.com');

INSERT INTO `tb_user` (user_no, name, email, password, employee_id, dept_id, role, created_at, updated_at, join_date, profile_url)
SELECT 4, '박은영', 'eunyoung@company.com', '$2a$10$NQ5nj6.3UnFxec0idKxma.pn2mq5L5qIjouO4oueMRzjH/5tPX84e', '20241011003', 1, 'USER', now(), now(), now(), null
WHERE NOT EXISTS (SELECT 1 FROM tb_user WHERE email = 'eunyoung@company.com');

-- 영업 지원부 (dept_id = 2)
INSERT INTO `tb_user` (user_no, name, email, password, employee_id, dept_id, role, created_at, updated_at, join_date, profile_url)
SELECT 5, '최수현', 'soohyun@company.com', '$2a$10$NQ5nj6.3UnFxec0idKxma.pn2mq5L5qIjouO4oueMRzjH/5tPX84e', '20241011004', 2, 'USER', now(), now(), now(), null
WHERE NOT EXISTS (SELECT 1 FROM tb_user WHERE email = 'soohyun@company.com');

INSERT INTO `tb_user` (user_no, name, email, password, employee_id, dept_id, role, created_at, updated_at, join_date, profile_url)
SELECT 6, '홍길동', 'gildong@company.com', '$2a$10$NQ5nj6.3UnFxec0idKxma.pn2mq5L5qIjouO4oueMRzjH/5tPX84e', '20241011005', 2, 'USER', now(), now(), now(), null
WHERE NOT EXISTS (SELECT 1 FROM tb_user WHERE email = 'gildong@company.com');

INSERT INTO `tb_user` (user_no, name, email, password, employee_id, dept_id, role, created_at, updated_at, join_date, profile_url)
SELECT 7, '강호진', 'hojin@company.com', '$2a$10$NQ5nj6.3UnFxec0idKxma.pn2mq5L5qIjouO4oueMRzjH/5tPX84e', '20241011006', 2, 'USER', now(), now(), now(), null
WHERE NOT EXISTS (SELECT 1 FROM tb_user WHERE email = 'hojin@company.com');

-- 영업 1팀 (dept_id = 3)
INSERT INTO `tb_user` (user_no, name, email, password, employee_id, dept_id, role, created_at, updated_at, join_date, profile_url)
SELECT 8, '박지훈', 'jihun@company.com', '$2a$10$NQ5nj6.3UnFxec0idKxma.pn2mq5L5qIjouO4oueMRzjH/5tPX84e', '20241011007', 3, 'USER', now(), now(), now(), null
WHERE NOT EXISTS (SELECT 1 FROM tb_user WHERE email = 'jihun@company.com');

INSERT INTO `tb_user` (user_no, name, email, password, employee_id, dept_id, role, created_at, updated_at, join_date, profile_url)
SELECT 9, '윤서현', 'seohyun@company.com', '$2a$10$NQ5nj6.3UnFxec0idKxma.pn2mq5L5qIjouO4oueMRzjH/5tPX84e', '20241011008', 3, 'USER', now(), now(), now(), null
WHERE NOT EXISTS (SELECT 1 FROM tb_user WHERE email = 'seohyun@company.com');

INSERT INTO `tb_user` (user_no, name, email, password, employee_id, dept_id, role, created_at, updated_at, join_date, profile_url)
SELECT 10, '김혜진', 'hyejin@company.com', '$2a$10$NQ5nj6.3UnFxec0idKxma.pn2mq5L5qIjouO4oueMRzjH/5tPX84e', '20241011009', 3, 'USER', now(), now(), now(), null
WHERE NOT EXISTS (SELECT 1 FROM tb_user WHERE email = 'hyejin@company.com');

-- 영업 2팀 (dept_id = 4)
INSERT INTO `tb_user` (user_no, name, email, password, employee_id, dept_id, role, created_at, updated_at, join_date, profile_url)
SELECT 11, '오성민', 'sungmin@company.com', '$2a$10$NQ5nj6.3UnFxec0idKxma.pn2mq5L5qIjouO4oueMRzjH/5tPX84e', '20241011010', 4, 'USER', now(), now(), now(), null
WHERE NOT EXISTS (SELECT 1 FROM tb_user WHERE email = 'sungmin@company.com');

INSERT INTO `tb_user` (user_no, name, email, password, employee_id, dept_id, role, created_at, updated_at, join_date, profile_url)
SELECT 12, '장하은', 'haeun@company.com', '$2a$10$NQ5nj6.3UnFxec0idKxma.pn2mq5L5qIjouO4oueMRzjH/5tPX84e', '20241011011', 4, 'USER', now(), now(), now(), null
WHERE NOT EXISTS (SELECT 1 FROM tb_user WHERE email = 'haeun@company.com');

INSERT INTO `tb_user` (user_no, name, email, password, employee_id, dept_id, role, created_at, updated_at, join_date, profile_url)
SELECT 13, '조성호', 'seongho@company.com', '$2a$10$NQ5nj6.3UnFxec0idKxma.pn2mq5L5qIjouO4oueMRzjH/5tPX84e', '20241011012', 4, 'USER', now(), now(), now(), null
WHERE NOT EXISTS (SELECT 1 FROM tb_user WHERE email = 'seongho@company.com');

--

INSERT INTO `tb_customer` (customer_no,name,company,dept,position,email,phone,tel,grade,is_keyman,user_no,created_at,updated_at)
SELECT 1, '김은경', '네이버','개발1팀','과장','abc@naver.com','010-1234-8888','03-1344-5999','S',true,1,now(),now()
WHERE NOT EXISTS (SELECT 1 FROM tb_customer WHERE customer_no=1);

-- >>>>>>>>>>>> 고객 <<<<<<<<<<<<<<

-- 고객 데이터 생성 (총 50개)
INSERT INTO `tb_customer` (customer_no, name, company, dept, position, email, phone, tel, grade, is_keyman, user_no, created_at, updated_at)
VALUES
    (1, '홍길동', '커피왕', '구매부', '매니저', 'customer1@coffee.com', '010-0001-0001', '02-0001-0001', 'A', false, 2, now(), now()),
    (2, '김영희', '원두전문', '영업부', '대리', 'customer2@beans.com', '010-0002-0002', '02-0002-0002', 'B', true, 2, now(), now()),
    (3, '박철수', '커피트레이드', '구매부', '과장', 'customer3@coffee.com', '010-0003-0003', '02-0003-0003', 'S', false, 3, now(), now()),
    (4, '이승현', '원두마켓', '구매부', '팀장', 'customer4@beans.com', '010-0004-0004', '02-0004-0004', 'C', true, 4, now(), now()),
    (5, '정민수', '커피플랜트', '구매부', '부장', 'customer5@coffee.com', '010-0005-0005', '02-0005-0005', 'D', false, 5, now(), now()),
    (6, '서지수', '커피나무', '영업부', '사원', 'customer6@beans.com', '010-0006-0006', '02-0006-0006', 'A', true, 6, now(), now()),
    (7, '김도현', '원두가게', '구매부', '과장', 'customer7@coffee.com', '010-0007-0007', '02-0007-0007', 'B', false, 7, now(), now()),
    (8, '최혜린', '커피스토어', '구매부', '대리', 'customer8@beans.com', '010-0008-0008', '02-0008-0008', 'S', true, 8, now(), now()),
    (9, '한지원', '원두파머', '영업부', '매니저', 'customer9@coffee.com', '010-0009-0009', '02-0009-0009', 'C', false, 9, now(), now()),
    (10, '장윤아', '원두드림', '구매부', '사원', 'customer10@beans.com', '010-0010-0010', '02-0010-0010', 'D', true, 10, now(), now()),
    (11, '고객11', '커피농장', '구매부', '대리', 'customer11@coffee.com', '010-0011-0011', '02-0011-0011', 'A', false, 11, now(), now()),
    (12, '고객12', '원두왕국', '영업부', '사원', 'customer12@beans.com', '010-0012-0012', '02-0012-0012', 'B', true, 12, now(), now()),
    (13, '고객13', '바리스타', '구매부', '부장', 'customer13@coffee.com', '010-0013-0013', '02-0013-0013', 'S', false, 2, now(), now()),
    (14, '고객14', '커피팜', '영업부', '과장', 'customer14@beans.com', '010-0014-0014', '02-0014-0014', 'C', true, 2, now(), now()),
    (15, '고객15', '원두해', '구매부', '팀장', 'customer15@coffee.com', '010-0015-0015', '02-0015-0015', 'D', false, 3, now(), now()),
    (16, '고객16', '커피향', '영업부', '매니저', 'customer16@beans.com', '010-0016-0016', '02-0016-0016', 'A', true, 4, now(), now()),
    (17, '고객17', '원두콜렉션', '구매부', '사원', 'customer17@coffee.com', '010-0017-0017', '02-0017-0017', 'B', false, 5, now(), now()),
    (18, '고객18', '커피로드', '영업부', '대리', 'customer18@beans.com', '010-0018-0018', '02-0018-0018', 'S', true, 6, now(), now()),
    (19, '고객19', '커피필드', '구매부', '부장', 'customer19@coffee.com', '010-0019-0019', '02-0019-0019', 'C', false, 7, now(), now()),
    (20, '고객20', '원두농장', '영업부', '과장', 'customer20@beans.com', '010-0020-0020', '02-0020-0020', 'D', true, 8, now(), now()),
    (21, '고객21', '커피의정원', '구매부', '팀장', 'customer21@coffee.com', '010-0021-0021', '02-0021-0021', 'A', false, 9, now(), now()),
    (22, '고객22', '커피월드', '영업부', '매니저', 'customer22@beans.com', '010-0022-0022', '02-0022-0022', 'B', true, 10, now(), now()),
    (23, '고객23', '원두유통', '구매부', '사원', 'customer23@coffee.com', '010-0023-0023', '02-0023-0023', 'S', false, 11, now(), now()),
    (24, '고객24', '커피와행복', '영업부', '대리', 'customer24@beans.com', '010-0024-0024', '02-0024-0024', 'C', true, 12, now(), now()),
    (25, '고객25', '커피사랑', '구매부', '부장', 'customer25@coffee.com', '010-0025-0025', '02-0025-0025', 'D', false, 4, now(), now()),
    (26, '고객26', '원두의고수', '영업부', '과장', 'customer26@beans.com', '010-0026-0026', '02-0026-0026', 'A', true, 2, now(), now()),
    (27, '고객27', '커피도시', '구매부', '팀장', 'customer27@coffee.com', '010-0027-0027', '02-0027-0027', 'B', false, 3, now(), now()),
    (28, '고객28', '원두의세계', '영업부', '매니저', 'customer28@beans.com', '010-0028-0028', '02-0028-0028', 'S', true, 4, now(), now()),
    (29, '고객29', '커피에세이', '구매부', '사원', 'customer29@coffee.com', '010-0029-0029', '02-0029-0029', 'C', false, 5, now(), now()),
    (30, '고객30', '커피히어로', '영업부', '대리', 'customer30@beans.com', '010-0030-0030', '02-0030-0030', 'D', true, 6, now(), now()),
    (31, '고객31', '커피플랜트', '구매부', '부장', 'customer31@coffee.com', '010-0031-0031', '02-0031-0031', 'A', false, 7, now(), now()),
    (32, '고객32', '원두장터', '영업부', '과장', 'customer32@beans.com', '010-0032-0032', '02-0032-0032', 'B', true, 8, now(), now()),
    (33, '고객33', '커피챔피언', '구매부', '팀장', 'customer33@coffee.com', '010-0033-0033', '02-0033-0033', 'S', false, 9, now(), now()),
    (34, '고객34', '커피스토어', '영업부', '매니저', 'customer34@beans.com', '010-0034-0034', '02-0034-0034', 'C', true, 10, now(), now()),
    (35, '고객35', '원두박사', '구매부', '사원', 'customer35@coffee.com', '010-0035-0035', '02-0035-0035', 'D', false, 11, now(), now()),
    (36, '고객36', '커피로드', '영업부', '대리', 'customer36@beans.com', '010-0036-0036', '02-0036-0036', 'A', true, 12, now(), now()),
    (37, '고객37', '커피유통', '구매부', '부장', 'customer37@coffee.com', '010-0037-0037', '02-0037-0037', 'B', false, 2, now(), now()),
    (38, '고객38', '원두하우스', '영업부', '과장', 'customer38@beans.com', '010-0038-0038', '02-0038-0038', 'S', true, 2, now(), now()),
    (39, '고객39', '커피존', '구매부', '팀장', 'customer39@coffee.com', '010-0039-0039', '02-0039-0039', 'C', false, 3, now(), now()),
    (40, '고객40', '커피네이션', '영업부', '매니저', 'customer40@beans.com', '010-0040-0040', '02-0040-0040', 'D', true, 4, now(), now()),
    (41, '고객41', '커피월드', '구매부', '사원', 'customer41@coffee.com', '010-0041-0041', '02-0041-0041', 'A', false, 5, now(), now()),
    (42, '고객42', '원두사랑', '영업부', '대리', 'customer42@beans.com', '010-0042-0042', '02-0042-0042', 'B', true, 6, now(), now()),
    (43, '고객43', '커피천국', '구매부', '부장', 'customer43@coffee.com', '010-0043-0043', '02-0043-0043', 'S', false, 7, now(), now()),
    (44, '고객44', '원두마을', '영업부', '과장', 'customer44@beans.com', '010-0044-0044', '02-0044-0044', 'C', true, 8, now(), now()),
    (45, '고객45', '커피마켓', '구매부', '팀장', 'customer45@coffee.com', '010-0045-0045', '02-0045-0045', 'D', false, 9, now(), now()),
    (46, '고객46', '커피천사', '영업부', '매니저', 'customer46@beans.com', '010-0046-0046', '02-0046-0046', 'A', true, 10, now(), now()),
    (47, '고객47', '원두천국', '구매부', '사원', 'customer47@coffee.com', '010-0047-0047', '02-0047-0047', 'B', false, 11, now(), now()),
    (48, '고객48', '커피존', '영업부', '대리', 'customer48@beans.com', '010-0048-0048', '02-0048-0048', 'S', true, 12, now(), now()),
    (49, '고객49', '커피장인', '구매부', '부장', 'customer49@coffee.com', '010-0049-0049', '02-0049-0049', 'C', false, 5, now(), now()),
    (50, '고객50', '커피와함께', '영업부', '과장', 'customer50@beans.com', '010-0050-0050', '02-0050-0050', 'D', true, 2, now(), now());


-- >>>>>>>>>>>> 잠재 고객 <<<<<<<<<<<<<<

-- 잠재고객 데이터 생성 (총 30개)
INSERT INTO `tb_poetntial_customer` (p_cust_no, name, company, dept, position, cls, contact_status, grade, phone, tel, email, fax, addr, note, user_no, register_date, created_at, updated_at)
VALUES
    (1, '이수진', '커피프라임', '마케팅', '사원', '이메일', 'TRY_CONTACT', 'A', '010-1001-0001', '02-1001-0001', 'potential1@coffee.com', '02-2001-0001', '서울시 강남구', '고객 상담 예정', 2, now(), now(), now()),
    (2, '박현아', '원두상회', '영업', '대리', '전화', 'CONTACTING', 'B', '010-1002-0002', '02-1002-0002', 'potential2@beans.com', '02-2002-0002', '서울시 서초구', '전화 통화 예정', 2, now(), now(), now()),
    (3, '김준호', '커피믹스', '구매', '과장', '방문', 'NO_CONTACT', 'S', '010-1003-0003', '02-1003-0003', 'potential3@coffee.com', '02-2003-0003', '서울시 송파구', '신규 고객 가능성 있음', 3, now(), now(), now()),
    (4, '정민우', '원두유통', '구매', '사원', '이메일', 'TRY_CONTACT', 'C', '010-1004-0004', '02-1004-0004', 'potential4@beans.com', '02-2004-0004', '경기도 성남시', '이메일 답변 대기 중', 4, now(), now(), now()),
    (5, '최현정', '커피이스트', '영업', '매니저', '전화', 'CONTACTING', 'X', '010-1005-0005', '02-1005-0005', 'potential5@coffee.com', '02-2005-0005', '서울시 영등포구', '곧 재방문 예정', 5, now(), now(), now()),
    (6, '황수민', '커피프로', '마케팅', '대리', '방문', 'NOT_CONTACT', 'A', '010-1006-0006', '02-1006-0006', 'potential6@beans.com', '02-2006-0006', '인천시 남동구', '연락 시도 금지 요청', 6, now(), now(), now()),
    (7, '장은성', '커피헬퍼', '구매', '사원', '전화', 'TRY_CONTACT', 'B', '010-1007-0007', '02-1007-0007', 'potential7@coffee.com', '02-2007-0007', '서울시 마포구', '새로운 프로젝트 협의 중', 7, now(), now(), now()),
    (8, '백지은', '원두월드', '영업', '과장', '이메일', 'NO_CONTACT', 'S', '010-1008-0008', '02-1008-0008', 'potential8@beans.com', '02-2008-0008', '서울시 노원구', '이메일 미응답 상태', 8, now(), now(), now()),
    (9, '이준석', '커피박스', '구매', '사원', '방문', 'CONTACTING', 'C', '010-1009-0009', '02-1009-0009', 'potential9@coffee.com', '02-2009-0009', '경기도 고양시', '접촉 중', 9, now(), now(), now()),
    (10, '하승민', '커피홈', '마케팅', '대리', '전화', 'NO_CONTACT', 'A', '010-1010-0010', '02-1010-0010', 'potential10@beans.com', '02-2010-0010', '서울시 은평구', '고객 전환 가능성 있음', 10, now(), now(), now()),
    (11, '최지훈', '커피링크', '구매', '매니저', '이메일', 'TRY_CONTACT', 'A', '010-1011-0011', '02-1011-0011', 'potential11@coffee.com', '02-2011-0011', '서울시 동작구', '상담 요청', 11, now(), now(), now()),
    (12, '김수정', '원두친구', '영업', '사원', '전화', 'NOT_CONTACT', 'B', '010-1012-0012', '02-1012-0012', 'potential12@beans.com', '02-2012-0012', '경기도 부천시', '접촉 금지 요청', 12, now(), now(), now()),
    (13, '한민기', '커피그린', '구매', '대리', '방문', 'CONTACTING', 'S', '010-1013-0013', '02-1013-0013', 'potential13@coffee.com', '02-2013-0013', '서울시 관악구', '담당자와 상담 예정', 2, now(), now(), now()),
    (14, '정하늘', '커피파머', '영업', '과장', '이메일', 'TRY_CONTACT', 'C', '010-1014-0014', '02-1014-0014', 'potential14@beans.com', '02-2014-0014', '경기도 안양시', '답변 대기 중', 2, now(), now(), now()),
    (15, '이하은', '커피트리', '구매', '사원', '전화', 'NO_CONTACT', 'A', '010-1015-0015', '02-1015-0015', 'potential15@coffee.com', '02-2015-0015', '서울시 강북구', '고객 전환 가능성 낮음', 3, now(), now(), now()),
    (16, '정성민', '커피파라다이스', '마케팅', '대리', '이메일', 'CONTACTING', 'A', '010-1016-0016', '02-1016-0016', 'potential16@coffee.com', '02-2016-0016', '서울시 광진구', '고객 관심 있음', 4, now(), now(), now()),
    (17, '박지현', '원두시장', '구매', '과장', '전화', 'TRY_CONTACT', 'B', '010-1017-0017', '02-1017-0017', 'potential17@beans.com', '02-2017-0017', '서울시 구로구', '재상담 필요', 5, now(), now(), now()),
    (18, '송다빈', '커피콜렉션', '영업', '사원', '방문', 'NO_CONTACT', 'S', '010-1018-0018', '02-1018-0018', 'potential18@coffee.com', '02-2018-0018', '경기도 의정부시', '방문 상담 예약', 6, now(), now(), now()),
    (19, '한예린', '커피퍼블릭', '구매', '사원', '전화', 'CONTACTING', 'C', '010-1019-0019', '02-1019-0019', 'potential19@beans.com', '02-2019-0019', '서울시 종로구', '문의 사항 추가', 7, now(), now(), now()),
    (20, '오현수', '원두닷컴', '마케팅', '매니저', '이메일', 'NOT_CONTACT', 'A', '010-1020-0020', '02-1020-0020', 'potential20@coffee.com', '02-2020-0020', '서울시 성북구', '이메일 발송 후 미응답', 8, now(), now(), now()),
    (21, '이영진', '커피피아', '구매', '대리', '방문', 'TRY_CONTACT', 'A', '010-1021-0021', '02-1021-0021', 'potential21@beans.com', '02-2021-0021', '경기도 파주시', '상담 요청', 9, now(), now(), now()),
    (22, '박진아', '원두팩토리', '영업', '과장', '전화', 'NO_CONTACT', 'B', '010-1022-0022', '02-1022-0022', 'potential22@coffee.com', '02-2022-0022', '서울시 중랑구', '추가 문의 예정', 10, now(), now(), now()),
    (23, '최선미', '커피월드', '구매', '사원', '이메일', 'CONTACTING', 'S', '010-1023-0023', '02-1023-0023', 'potential23@beans.com', '02-2023-0023', '서울시 서대문구', '상담 완료', 11, now(), now(), now()),
    (24, '김혜진', '커피포레스트', '구매', '대리', '방문', 'TRY_CONTACT', 'C', '010-1024-0024', '02-1024-0024', 'potential24@coffee.com', '02-2024-0024', '경기도 광주시', '재방문 필요', 12, now(), now(), now()),
    (25, '정하나', '원두라운드', '영업', '사원', '전화', 'NO_CONTACT', 'C', '010-1025-0025', '02-1025-0025', 'potential25@beans.com', '02-2025-0025', '서울시 관악구', '잠재 고객 전환 가능성 낮음', 2, now(), now(), now()),
    (26, '박성호', '원두마켓', '영업', '사원', '전화', 'CONTACTING', 'A', '010-1026-0026', '02-1026-0026', 'potential26@coffee.com', '02-2026-0026', '경기도 수원시', '고객 관심 있음', 10, now(), now(), now()),
    (27, '송민호', '커피유통', '구매', '대리', '방문', 'TRY_CONTACT', 'B', '010-1027-0027', '02-1027-0027', 'potential27@beans.com', '02-2027-0027', '서울시 성동구', '재방문 필요', 11, now(), now(), now()),
    (28, '김예지', '커피썸', '마케팅', '과장', '이메일', 'NOT_CONTACT', 'S', '010-1028-0028', '02-1028-0028', 'potential28@coffee.com', '02-2028-0028', '서울시 용산구', '접촉 금지 요청', 12, now(), now(), now()),
    (29, '이태영', '커피온', '영업', '사원', '전화', 'CONTACTING', 'C', '010-1029-0029', '02-1029-0029', 'potential29@beans.com', '02-2029-0029', '서울시 금천구', '고객 반응 좋음', 2, now(), now(), now()),
    (30, '한승호', '커피앤더스트리', '구매', '매니저', '방문', 'TRY_CONTACT', 'A', '010-1030-0030', '02-1030-0030', 'potential30@coffee.com', '02-2030-0030', '서울시 종로구', '상담 대기 중', 2, now(), now(), now());



-- >>>>>>>>>>>> 접촉 이력 <<<<<<<<<<<<<<

-- 접촉 이력 데이터 생성 (총 30개)
INSERT INTO `tb_contact_history` (contact_history_no, contact_date, cls, content, user_no, p_cust_no, created_at, updated_at)
VALUES
    (1, '2024-10-01', 'CALL', '첫 전화 상담', 1, 1, now(), now()),
    (2, '2024-10-02', 'EMAIL', '회사 소개 이메일 전송', 2, 2, now(), now()),
    (3, '2024-10-03', 'VISIT', '고객사 방문 및 상담', 3, 3, now(), now()),
    (4, '2024-10-05', 'ONLINE_MEET', '온라인 미팅 진행', 4, 4, now(), now()),
    (5, '2024-10-06', 'CHANNEL_TALK', '채널톡 문의 응답', 5, 5, now(), now()),
    (6, '2024-10-08', 'ETC', '기타 문의 사항 응대', 6, 6, now(), now()),
    (7, '2024-10-09', 'CALL', '재상담 요청에 따른 전화 통화', 7, 7, now(), now()),
    (8, '2024-10-10', 'EMAIL', '추가 자료 이메일 발송', 8, 8, now(), now()),
    (9, '2024-10-11', 'VISIT', '고객사 방문 및 추가 상담', 9, 9, now(), now()),
    (10, '2024-10-12', 'ONLINE_MEET', '화상 회의로 제품 설명', 10, 10, now(), now()),
    (11, '2024-10-13', 'CHANNEL_TALK', '고객 문의사항 응대', 11, 11, now(), now()),
    (12, '2024-10-14', 'ETC', '계약 관련 추가 문의', 12, 12, now(), now()),
    (13, '2024-10-15', 'CALL', '계약 진행 상황 업데이트', 1, 13, now(), now()),
    (14, '2024-10-16', 'EMAIL', '견적서 이메일 발송', 2, 14, now(), now()),
    (15, '2024-10-17', 'VISIT', '고객사 방문 및 계약 협의', 3, 15, now(), now()),
    (16, '2024-10-18', 'ONLINE_MEET', '화상 회의로 서비스 데모', 4, 16, now(), now()),
    (17, '2024-10-19', 'CHANNEL_TALK', '서비스 관련 상담', 5, 17, now(), now()),
    (18, '2024-10-20', 'ETC', '계약 관련 문의 사항 응답', 6, 18, now(), now()),
    (19, '2024-10-21', 'CALL', '재상담 요청', 7, 19, now(), now()),
    (20, '2024-10-22', 'EMAIL', '계약 내용 이메일 전송', 8, 20, now(), now()),
    (21, '2024-10-23', 'VISIT', '고객사 추가 방문', 9, 21, now(), now()),
    (22, '2024-10-24', 'ONLINE_MEET', '계약 세부사항 논의', 10, 22, now(), now()),
    (23, '2024-10-25', 'CHANNEL_TALK', '서비스 문의 사항 응대', 11, 23, now(), now()),
    (24, '2024-10-26', 'ETC', '추가 요청사항 처리', 12, 24, now(), now()),
    (25, '2024-10-27', 'CALL', '추가 계약 상담', 1, 25, now(), now()),
    (26, '2024-10-28', 'EMAIL', '제품 소개서 이메일 전송', 2, 26, now(), now()),
    (27, '2024-10-29', 'VISIT', '현장 방문 및 상담', 3, 27, now(), now()),
    (28, '2024-10-30', 'ONLINE_MEET', '화상 회의 및 문의 응대', 4, 28, now(), now()),
    (29, '2024-10-31', 'CHANNEL_TALK', '계약서 검토 요청 응대', 5, 29, now(), now()),
    (30, '2024-11-01', 'ETC', '계약 최종 확인', 6, 30, now(), now());


# INSERT INTO tb_calendar (no, user_no,created_at, updated_at) VALUES (1, 3, now(), now()),(2, 2, now(), now()),(3, 1, now(), now());
#
# INSERT INTO tb_lead (created_at, updated_at, start_date, end_date, exp_margin, exp_profit, exp_sales, name, note, process, status, sub_process, sucess_per, customer_no)
# VALUES (CURDATE(), CURDATE(), '2024-03-01', '2024-04-11', 20, 2000, 10000, '고객 A 영업', 'A에 대한 활동 메모', 1, 'SUCCESS', 5, 100, 1),
#        (CURDATE(), CURDATE(), '2024-05-01', '2024-06-11', 10, 800, 8000, '고객 B 영업', 'B에 대한 활동 메모', 1, 'SUCCESS', 5, 100,2),
#        (CURDATE(), CURDATE(), '2024-07-01', '2024-08-11', 20, 1000, 5000, '고객 C 영업', 'C에 대한 활동 메모', 1, 'SUCCESS', 5, 100, 3),
#        (CURDATE(), CURDATE(), '2024-09-01', '2024-10-11', 30, 1800, 6000, '고객 D 영업', 'D에 대한 활동 메모', 1, 'SUCCESS', 5, 100, 4),
#        (CURDATE(), CURDATE(), '2024-10-01', '2024-11-11', 30, 1800, 6000, '고객 E 영업', 'E에 대한 활동 메모', 1, 'SUCCESS', 3, 100, 5);
#
# INSERT INTO tb_act (created_at, updated_at, no, act_cont, act_date, cls, complete_yn, end_time, name, plan_cont, purpose, start_time, calendar_no, lead_no)
# VALUES
#     (NOW(), NOW(), 1, '화상 회의 플랫폼 논의', '2024-11-11', 'ONLINE', 'N', '15:00', '프로젝트 회의 준비', '신규 회의 준비', '프로젝트 논의', '13:00', 1, 1),
#     (NOW(), NOW(), 2, '거래처 방문', '2024-10-20', 'VISIT', 'Y', '17:00', '거래처 미팅', '계약 관련 회의', '상담 및 계약 체결', '15:00', 1, 2),
#     (NOW(), NOW(), 3, '전화 문의 응대', '2024-11-15', 'PHONE', 'N', '11:30', '문의사항 해결', '고객 문의 사항 응대', '고객 응대', '10:00', 1, 3),
#     (NOW(), NOW(), 4, '이메일 발송', '2024-11-07', 'EMAIL', 'Y', '14:00', '정보 이메일 발송', '상품 정보 제공', '상품 홍보 및 고객 안내', '13:00', 1, 4),
#     (NOW(), NOW(), 5, '온라인 미팅 준비', '2024-10-21', 'OTHER', 'N', '16:00', '프로젝트 미팅', '프로젝트 논의', '프로젝트 진행 상황 점검', '14:00', 1, 5);
#
#
# INSERT INTO tb_act (created_at, updated_at, act_cont, act_date, cls, complete_yn, end_time, name, plan_cont, purpose, start_time, calendar_no, lead_no)
# VALUES (NOW(), NOW(),'고객 상담', '2024-01-15', 'VISIT', 'Y', '12:30', '방문 상담', '계획된 고객 방문', '고객 요구 분석', '10:00', 1, 1),
#        (NOW(), NOW(),'전화 문의 응대', '2024-01-20', 'PHONE', 'N', '16:00', '전화 상담', '문의 응대 준비', '상품 설명', '15:00', 1, 2),
#        (NOW(), NOW(),'이메일 전송', '2024-03-05', 'EMAIL', 'Y', '11:30', '이메일 발송', '상품 정보 전송', '세부 정보 제공', '11:00', 1, 3),
#        (NOW(), NOW(),'온라인 미팅', '2024-04-12', 'ONLINE', 'Y', '14:00', '온라인 회의', '클라이언트 요구 분석', '서비스 논의', '13:00', 1, 4),
#        (NOW(), NOW(),'온라인 미팅', '2024-04-15', 'ONLINE', 'Y', '14:00', '온라인 회의', '클라이언트 요구 분석', '서비스 논의', '13:00', 1, 4),
#        (NOW(), NOW(),'온라인 미팅', '2024-04-16', 'ONLINE', 'Y', '14:00', '온라인 회의', '클라이언트 요구 분석', '서비스 논의', '13:00', 1, 4),
#        (NOW(), NOW(),'온라인 미팅', '2024-04-17', 'ONLINE', 'Y', '14:00', '온라인 회의', '클라이언트 요구 분석', '서비스 논의', '13:00', 1, 4),
#        (NOW(), NOW(),'현장 방문', '2024-07-18', 'VISIT', 'N', '13:00', '현장 점검', '시설 점검 및 회의', '프로젝트 관리', '10:30', 1, 5),
#        (NOW(), NOW(),'고객 방문', '2024-07-22', 'VISIT', 'Y', '17:00', '고객 미팅', '계약 논의', '제품 설명', '15:00', 1, 1),
#        (NOW(), NOW(),'전화 상담', '2024-07-10', 'PHONE', 'Y', '11:00', '전화 응대', '고객 불만 처리', '해결 방안 제시', '10:30', 1, 2),
#        (NOW(), NOW(),'이메일 회신', '2024-09-19', 'EMAIL', 'Y', '15:30', '이메일 답변', '기술 지원 제공', '제품 사용법 안내', '15:00', 1, 3),
#        (NOW(), NOW(),'온라인 회의', '2024-09-03', 'ONLINE', 'N', '16:00', '줌 미팅', '프로젝트 진행 상황 점검', '향후 일정 논의', '15:00', 1, 4),
#        (NOW(), NOW(),'고객 방문', '2024-10-11', 'VISIT', 'Y', '12:30', '고객 상담', '서비스 업그레이드 제안', '상세 요구 분석', '10:30', 1, 5),
#        (NOW(), NOW(),'고객 방문', '2024-10-12', 'VISIT', 'Y', '12:30', '고객 상담', '서비스 업그레이드 제안', '상세 요구 분석', '10:30', 1, 5),
#        (NOW(), NOW(),'전화 응대', '2024-10-23', 'PHONE', 'N', '10:00', '고객 전화 응대', '문제 해결 방안 제공', '이슈 처리', '09:30', 1, 1),
#        (NOW(), NOW(),'이메일 발송', '2024-12-30', 'EMAIL', 'Y', '13:00', '프로모션 이메일', '할인 행사 안내', '홍보 전략 수립', '12:30', 1, 2),
#        (NOW(), NOW(),'온라인 상담', '2022-01-18', 'ONLINE', 'Y', '17:30', '온라인 고객 상담', '기술 지원', '제품 문제 해결', '16:30', 1, 3),
#        (NOW(), NOW(),'고객 미팅', '2022-02-27', 'VISIT', 'N', '11:00', '고객 방문 회의', '계약 협상', '비용 산정', '10:00', 1, 4),
#        (NOW(), NOW(),'전화 상담', '2022-03-15', 'PHONE', 'Y', '15:30', '전화 고객 상담', '서비스 안내', '상품 설명', '15:00', 1, 5),
#        (NOW(), NOW(),'전화 응대', '2024-11-23', 'PHONE', 'N', '10:00', '고객 전화 응대', '문제 해결 방안 제공', '이슈 처리', '09:30', 2, 1),
#        (NOW(), NOW(),'이메일 발송', '2024-12-30', 'EMAIL', 'Y', '13:00', '프로모션 이메일', '할인 행사 안내', '홍보 전략 수립', '12:30', 2, 2),
#        (NOW(), NOW(),'온라인 상담', '2022-01-18', 'ONLINE', 'Y', '17:30', '온라인 고객 상담', '기술 지원', '제품 문제 해결', '16:30', 2, 3),
#        (NOW(), NOW(),'고객 미팅', '2022-02-27', 'VISIT', 'N', '11:00', '고객 방문 회의', '계약 협상', '비용 산정', '10:00', 2, 4),
#        (NOW(), NOW(),'전화 상담', '2022-03-15', 'PHONE', 'Y', '15:30', '전화 고객 상담', '서비스 안내', '상품 설명', '15:00', 2, 5),
#        (NOW(), NOW(),'이메일 발송', '2024-12-30', 'EMAIL', 'Y', '13:00', '프로모션 이메일', '할인 행사 안내', '홍보 전략 수립', '12:30', 3, 2),
#        (NOW(), NOW(),'온라인 상담', '2022-01-18', 'ONLINE', 'Y', '17:30', '온라인 고객 상담', '기술 지원', '제품 문제 해결', '16:30', 3, 3),
#        (NOW(), NOW(),'고객 미팅', '2022-02-27', 'VISIT', 'N', '11:00', '고객 방문 회의', '계약 협상', '비용 산정', '10:00', 3, 4),
#        (NOW(), NOW(),'전화 상담', '2022-03-15', 'PHONE', 'Y', '15:30', '전화 고객 상담', '서비스 안내', '상품 설명', '15:00', 3, 5),
#        (NOW(), NOW(),'전화 상담', '2022-03-15', 'PHONE', 'Y', '15:30', '전화 고객 상담', '서비스 안내', '상품 설명', '15:00', 3, 5);
#
# INSERT INTO tb_plan (no, created_at, updated_at, content, end_time, personal_yn, plan_cls, plan_date, start_time, title, calendar_no)
# VALUES
#     (1, NOW(), NOW(), '팀원 전체 회의', '10:00', 'N', 'COMPANY', '2024-11-02', '09:00', '회의 일정', 1),
#     (2, NOW(), NOW(), '신규 계약 검토', '15:00', 'Y', 'CONTRACT', '2024-11-17', '13:00', '계약 검토', 1),
#     (3, NOW(), NOW(), '개인 개발 공부', '22:00', 'Y', 'PERSONAL', '2024-11-21', '20:00', '개인 학습', 1),
#     (4, NOW(), NOW(), '견적서 작성', '17:00', 'N', 'ESTIMATE', '2024-11-11', '15:00', '견적서 작업', 1),
#     (5, NOW(), NOW(), '영업 전략 회의', '16:00', 'N', 'SALES', '2024-11-03', '14:00', '영업 전략 논의', 1),
#     (6, NOW(), NOW(), '제안서 서식 정리', '22:00', 'Y', 'PROPOSAL', '2024-11-24', '10:00', '제안서 서식', 1),
#     (7, NOW(), NOW(), 'OJT', '17:00', 'N', 'COMPANY', '2024-11-27', '15:00', '신입사원 OJT', 1),
#     (8, NOW(), NOW(), '주간 업무 리뷰', '11:00', 'N', 'COMPANY', '2024-11-05', '10:00', '업무 리뷰', 2),
#     (9, NOW(), NOW(), '부서별 프로젝트 검토', '17:00', 'Y', 'COMPANY', '2024-11-07', '15:00', '프로젝트 검토', 2),
#     (10, NOW(), NOW(), '팀 빌딩 워크샵 준비 회의', '16:00', 'N', 'COMPANY', '2024-11-09', '14:00', '워크샵 준비 회의', 2),
#     (11, NOW(), NOW(), '제품 개선 사항 검토', '12:00', 'Y', 'COMPANY', '2024-11-10', '10:00', '제품 검토', 3),
#     (12, NOW(), NOW(), '연말 보고서 작성 회의', '11:00', 'N', 'COMPANY', '2024-11-12', '09:00', '보고서 작성 회의', 3),
#     (13, NOW(), NOW(), 'PT', '17:00', 'N', 'PERSONAL', '2024-10-31', '15:00', 'PT 연습', 1),
#     (14, NOW(), NOW(), '제안서 작성', '22:00', 'Y', 'PROPOSAL', '2024-11-13', '10:00', '제안 작성', 1);
#
#
# INSERT INTO tb_todo (todo_no, created_at, updated_at, content, due_date, priority, private_yn, status, title, todo_cls, calendar_no)
# VALUES
#     (1, NOW(), NOW(), '고객사 자료 준비', '2024-11-10', 'HIGH', 'N', 'TODO', '자료 준비', 'SALES', 1),
#     (2, NOW(), NOW(), '팀 회의 참석', '2024-11-23', 'MEDIUM', 'N', 'INPROGRESS', '회의 참여', 'COMPANY', 1),
#     (3, NOW(), NOW(), '개인 일정 조율', '2024-11-29', 'LOW', 'Y', 'DONE', '일정 조율', 'PERSONAL', 1),
#     (4, NOW(), NOW(), '계약서 내용 확인', '2024-11-25', 'HIGH', 'N', 'TODO', '계약서 검토', 'CONTRACT', 1),
#     (5, NOW(), NOW(), '이메일 답변 작성', '2024-11-30', 'MEDIUM', 'N', 'TODO', '이메일 답변', 'EMAIL', 1);
