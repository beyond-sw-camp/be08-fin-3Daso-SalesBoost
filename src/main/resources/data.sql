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


-- >>>>>>>>>>>> 캘린더 @uzz99 <<<<<<<<<<<<<<
-- 관리자 캘린더
INSERT INTO `tb_calendar` (created_at, updated_at, user_no)
SELECT NOW(), NOW(), 1
WHERE NOT EXISTS (SELECT 1 FROM tb_calendar WHERE user_no = 1);

-- 테스트 캘린더
INSERT INTO `tb_calendar` (created_at, updated_at, user_no)
SELECT NOW(), NOW(), 14
WHERE NOT EXISTS (SELECT 1 FROM tb_calendar WHERE user_no = 14);

-- 삼다수 캘린더
INSERT INTO `tb_calendar` (created_at, updated_at, user_no)
SELECT NOW(), NOW(), 15
WHERE NOT EXISTS (SELECT 1 FROM tb_calendar WHERE user_no = 15);

-- 영업부 캘린더
INSERT INTO `tb_calendar` (created_at, updated_at, user_no)
SELECT NOW(), NOW(), 2
WHERE NOT EXISTS (SELECT 1 FROM tb_calendar WHERE user_no = 2);

INSERT INTO `tb_calendar` (created_at, updated_at, user_no)
SELECT NOW(), NOW(), 3
WHERE NOT EXISTS (SELECT 1 FROM tb_calendar WHERE user_no = 3);

INSERT INTO `tb_calendar` (created_at, updated_at, user_no)
SELECT NOW(), NOW(), 4
WHERE NOT EXISTS (SELECT 1 FROM tb_calendar WHERE user_no = 4);

-- 영업 지원부 캘린더
INSERT INTO `tb_calendar` (created_at, updated_at, user_no)
SELECT NOW(), NOW(), 5
WHERE NOT EXISTS (SELECT 1 FROM tb_calendar WHERE user_no = 5);

INSERT INTO `tb_calendar` (created_at, updated_at, user_no)
SELECT NOW(), NOW(), 6
WHERE NOT EXISTS (SELECT 1 FROM tb_calendar WHERE user_no = 6);

INSERT INTO `tb_calendar` (created_at, updated_at, user_no)
SELECT NOW(), NOW(), 7
WHERE NOT EXISTS (SELECT 1 FROM tb_calendar WHERE user_no = 7);

-- 영업 1팀 캘린더
INSERT INTO `tb_calendar` (created_at, updated_at, user_no)
SELECT NOW(), NOW(), 8
WHERE NOT EXISTS (SELECT 1 FROM tb_calendar WHERE user_no = 8);

INSERT INTO `tb_calendar` (created_at, updated_at, user_no)
SELECT NOW(), NOW(), 9
WHERE NOT EXISTS (SELECT 1 FROM tb_calendar WHERE user_no = 9);

INSERT INTO `tb_calendar` (created_at, updated_at, user_no)
SELECT NOW(), NOW(), 10
WHERE NOT EXISTS (SELECT 1 FROM tb_calendar WHERE user_no = 10);

-- 영업 2팀 캘린더
INSERT INTO `tb_calendar` (created_at, updated_at, user_no)
SELECT NOW(), NOW(), 11
WHERE NOT EXISTS (SELECT 1 FROM tb_calendar WHERE user_no = 11);

INSERT INTO `tb_calendar` (created_at, updated_at, user_no)
SELECT NOW(), NOW(), 12
WHERE NOT EXISTS (SELECT 1 FROM tb_calendar WHERE user_no = 12);

INSERT INTO `tb_calendar` (created_at, updated_at, user_no)
SELECT NOW(), NOW(), 13
WHERE NOT EXISTS (SELECT 1 FROM tb_calendar WHERE user_no = 13);


-- >>>>>>>>>>>> 할 일 @uzz99 <<<<<<<<<<<<<<
-- 관리자 일정 (calendar_no: 1)
INSERT INTO `tb_todo` (due_date, private_yn, calendar_no, created_at, updated_at, content, priority, title, todo_cls, status)
SELECT '2024-11-05', 'Y', 1, NOW(), NOW(), '팀 회의 준비', '높음', '주간 팀 회의', '회의', 'TODO'
WHERE NOT EXISTS (SELECT 1 FROM tb_todo WHERE due_date = '2024-11-05' AND calendar_no = 1 AND title = '주간 팀 회의');

INSERT INTO `tb_todo` (due_date, private_yn, calendar_no, created_at, updated_at, content, priority, title, todo_cls, status)
SELECT '2024-11-27', 'Y', 1, NOW(), NOW(), '부서별 업무 계획 정리', '중간', '업무 계획 정리', '계획', 'INPROGRESS'
WHERE NOT EXISTS (SELECT 1 FROM tb_todo WHERE due_date = '2024-11-12' AND calendar_no = 1 AND title = '업무 계획 정리');

INSERT INTO `tb_todo` (due_date, private_yn, calendar_no, created_at, updated_at, content, priority, title, todo_cls, status)
SELECT '2024-11-20', 'Y', 1, NOW(), NOW(), '내년 목표 설정', '높음', '목표 설정 회의', '회의', 'DONE'
WHERE NOT EXISTS (SELECT 1 FROM tb_todo WHERE due_date = '2024-11-20' AND calendar_no = 1 AND title = '목표 설정 회의');
-- 테스트 일정 (calendar_no: 14)
INSERT INTO `tb_todo` (due_date, private_yn, calendar_no, created_at, updated_at, content, priority, title, todo_cls, status)
SELECT '2024-01-10', 'Y', 14, NOW(), NOW(), '연간 목표 설정', '높음', '목표 설정', '목표', 'TODO'
WHERE NOT EXISTS (SELECT 1 FROM tb_todo WHERE due_date = '2024-01-10' AND calendar_no = 14 AND title = '목표 설정');

INSERT INTO `tb_todo` (due_date, private_yn, calendar_no, created_at, updated_at, content, priority, title, todo_cls, status)
SELECT '2024-02-15', 'Y', 14, NOW(), NOW(), '개인 개발 프로젝트 계획', '중간', '개발 계획', '개발', 'INPROGRESS'
WHERE NOT EXISTS (SELECT 1 FROM tb_todo WHERE due_date = '2024-02-15' AND calendar_no = 14 AND title = '개발 계획');

INSERT INTO `tb_todo` (due_date, private_yn, calendar_no, created_at, updated_at, content, priority, title, todo_cls, status)
SELECT '2024-03-22', 'Y', 14, NOW(), NOW(), '시스템 유지보수 계획 수립', '낮음', '유지보수 계획', '유지보수', 'DONE'
WHERE NOT EXISTS (SELECT 1 FROM tb_todo WHERE due_date = '2024-03-22' AND calendar_no = 14 AND title = '유지보수 계획');

-- 삼다수 일정 (calendar_no: 15)
INSERT INTO `tb_todo` (due_date, private_yn, calendar_no, created_at, updated_at, content, priority, title, todo_cls, status)
SELECT '2024-04-10', 'Y', 15, NOW(), NOW(), '회사 정책 검토 회의', '높음', '정책 회의', '회의', 'TODO'
WHERE NOT EXISTS (SELECT 1 FROM tb_todo WHERE due_date = '2024-04-10' AND calendar_no = 15 AND title = '정책 회의');

INSERT INTO `tb_todo` (due_date, private_yn, calendar_no, created_at, updated_at, content, priority, title, todo_cls, status)
SELECT '2024-05-12', 'Y', 15, NOW(), NOW(), '신규 프로젝트 조사', '중간', '프로젝트 조사', '조사', 'INPROGRESS'
WHERE NOT EXISTS (SELECT 1 FROM tb_todo WHERE due_date = '2024-05-12' AND calendar_no = 15 AND title = '프로젝트 조사');

INSERT INTO `tb_todo` (due_date, private_yn, calendar_no, created_at, updated_at, content, priority, title, todo_cls, status)
SELECT '2024-06-18', 'Y', 15, NOW(), NOW(), '외부 강사 초청 교육 준비', '높음', '교육 준비', '교육', 'DONE'
WHERE NOT EXISTS (SELECT 1 FROM tb_todo WHERE due_date = '2024-06-18' AND calendar_no = 15 AND title = '교육 준비');

INSERT INTO `tb_todo` (due_date, private_yn, calendar_no, created_at, updated_at, content, priority, title, todo_cls, status)
SELECT '2024-07-05', 'Y', 2, NOW(), NOW(), '하반기 영업 전략 수립', '높음', '영업 전략', '전략', 'TODO'
WHERE NOT EXISTS (SELECT 1 FROM tb_todo WHERE due_date = '2024-07-05' AND calendar_no = 2 AND title = '영업 전략');

INSERT INTO `tb_todo` (due_date, private_yn, calendar_no, created_at, updated_at, content, priority, title, todo_cls, status)
SELECT '2024-08-14', 'Y', 2, NOW(), NOW(), '고객 분석 및 관리 계획', '중간', '고객 관리 계획', '관리', 'INPROGRESS'
WHERE NOT EXISTS (SELECT 1 FROM tb_todo WHERE due_date = '2024-08-14' AND calendar_no = 2 AND title = '고객 관리 계획');

INSERT INTO `tb_todo` (due_date, private_yn, calendar_no, created_at, updated_at, content, priority, title, todo_cls, status)
SELECT '2024-09-20', 'Y', 3, NOW(), NOW(), '고객 초청 행사 준비', '높음', '행사 준비', '이벤트', 'DONE'
WHERE NOT EXISTS (SELECT 1 FROM tb_todo WHERE due_date = '2024-09-20' AND calendar_no = 2 AND title = '행사 준비');

INSERT INTO `tb_todo` (due_date, private_yn, calendar_no, created_at, updated_at, content, priority, title, todo_cls, status)
SELECT '2024-10-05', 'Y', 5, NOW(), NOW(), '고객 지원 계획 수립', '높음', '지원 계획', '계획', 'TODO'
WHERE NOT EXISTS (SELECT 1 FROM tb_todo WHERE due_date = '2024-10-05' AND calendar_no = 5 AND title = '지원 계획');

INSERT INTO `tb_todo` (due_date, private_yn, calendar_no, created_at, updated_at, content, priority, title, todo_cls, status)
SELECT '2024-11-10', 'Y', 5, NOW(), NOW(), '고객 만족도 조사 준비', '중간', '만족도 조사', '조사', 'INPROGRESS'
WHERE NOT EXISTS (SELECT 1 FROM tb_todo WHERE due_date = '2024-11-10' AND calendar_no = 5 AND title = '만족도 조사');

INSERT INTO `tb_todo` (due_date, private_yn, calendar_no, created_at, updated_at, content, priority, title, todo_cls, status)
SELECT '2024-12-15', 'Y', 5, NOW(), NOW(), '고객 피드백 분석', '높음', '피드백 분석', '분석', 'DONE'
WHERE NOT EXISTS (SELECT 1 FROM tb_todo WHERE due_date = '2024-12-15' AND calendar_no = 5 AND title = '피드백 분석');


-- >>>>>>>>>>>> 일정 @uzz99 <<<<<<<<<<<<<<
-- 관리자 전사 일정
INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, content, start_time, end_time, title, plan_cls)
SELECT 'N', '2024-10-15', 1, NOW(), NOW(), '전사 미팅', '09:00', '11:00', 'Q4 전사 미팅', 'COMPANY'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-10-15' AND calendar_no = 1 AND title = 'Q4 전사 미팅');

-- 테스트 전사 일정
INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, content, start_time, end_time, title, plan_cls)
SELECT 'N', '2024-11-25', 14, NOW(), NOW(), '사업 전략 발표', '09:00', '11:00', '전략 발표', 'COMPANY'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-11-25' AND calendar_no = 14 AND title = '전략 발표');

-- 삼다수 전사 일정
INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, content, start_time, end_time, title, plan_cls)
SELECT 'N', '2024-12-10', 15, NOW(), NOW(), '연말 결산 회의', '14:00', '17:00', '결산 회의', 'COMPANY'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-11-10' AND calendar_no = 15 AND title = '결산 회의');

-- 7~9월 1, 14, 15
INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-07-10', 1, NOW(), NOW(), NULL, '개인 업무 준비', '09:00', '10:00', '개인 준비', 'PERSONAL'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-01-10' AND calendar_no = 1 AND title = '개인 준비');

INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-07-15', 14, NOW(), NOW(), FLOOR(1 + (RAND() * 30)), '제안서 작성', '10:00', '12:00', '제안 준비', 'PROPOSAL'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-02-15' AND calendar_no = 14 AND title = '제안 준비');

INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-08-22', 15, NOW(), NOW(), FLOOR(1 + (RAND() * 30)), '신규 계약 체결', '14:00', '15:30', '계약 체결', 'CONTRACT'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-03-22' AND calendar_no = 15 AND title = '계약 체결');

INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-08-10', 1, NOW(), NOW(), FLOOR(1 + (RAND() * 30)), '고객 영업 활동', '13:00', '15:00', '영업 활동', 'SALES'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-04-10' AND calendar_no = 1 AND title = '영업 활동');

INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-08-18', 14, NOW(), NOW(), FLOOR(1 + (RAND() * 30)), '견적서 작성', '10:00', '12:00', '견적 작성', 'ESTIMATE'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-04-18' AND calendar_no = 14 AND title = '견적 작성');

INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-09-15', 1, NOW(), NOW(), NULL, '개인 프로젝트 계획', '08:30', '09:30', '프로젝트 계획', 'PERSONAL'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-05-15' AND calendar_no = 1 AND title = '프로젝트 계획');

INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-09-20', 14, NOW(), NOW(), NULL, '개인 연간 계획', '11:00', '12:30', '연간 계획', 'PERSONAL'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-06-20' AND calendar_no = 14 AND title = '연간 계획');

INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-09-10', 15, NOW(), NOW(), FLOOR(1 + (RAND() * 30)), '신규 제안서 작성', '09:00', '11:00', '제안서 작성', 'PROPOSAL'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-07-10' AND calendar_no = 15 AND title = '제안서 작성');

-- PERSONAL 일정
INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-10-03', 1, NOW(), NOW(), NULL, '개인 학습 진도 체크', '09:00', '10:00', '학습 체크', 'PERSONAL'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-10-03' AND calendar_no = 1 AND title = '학습 체크');

INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-10-15', 14, NOW(), NOW(), NULL, '개인 목표 재검토', '10:30', '11:30', '목표 검토', 'PERSONAL'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-10-15' AND calendar_no = 14 AND title = '목표 검토');

-- PROPOSAL 일정
INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-10-08', 15, NOW(), NOW(), FLOOR(1 + (RAND() * 30)), '신규 제안서 작성', '13:00', '15:00', '제안서 작성', 'PROPOSAL'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-10-08' AND calendar_no = 15 AND title = '제안서 작성');

INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-10-20', 1, NOW(), NOW(), FLOOR(1 + (RAND() * 30)), '연말 제안 검토', '10:00', '12:00', '제안 검토', 'PROPOSAL'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-10-20' AND calendar_no = 1 AND title = '제안 검토');

-- CONTRACT 일정
INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-10-12', 14, NOW(), NOW(), FLOOR(1 + (RAND() * 30)), '계약 검토 회의', '11:00', '13:00', '계약 검토', 'CONTRACT'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-10-12' AND calendar_no = 14 AND title = '계약 검토');

INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-10-25', 15, NOW(), NOW(), FLOOR(1 + (RAND() * 30)), '연말 계약 조건 논의', '09:30', '11:30', '계약 조건 논의', 'CONTRACT'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-10-25' AND calendar_no = 15 AND title = '계약 조건 논의');

-- SALES 일정
INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'N', '2024-10-28', 1, NOW(), NOW(), FLOOR(1 + (RAND() * 30)), '분기 매출 검토', '13:00', '16:00', '매출 검토', 'SALES'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-10-28' AND calendar_no = 1 AND title = '매출 검토');

-- ESTIMATE 일정
INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-10-30', 14, NOW(), NOW(), FLOOR(1 + (RAND() * 30)), '연말 견적 작성', '10:00', '12:00', '견적 작성', 'ESTIMATE'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-10-30' AND calendar_no = 14 AND title = '견적 작성');

-- 2024년 11월 일정
-- PROPOSAL 일정
INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-11-10', 15, NOW(), NOW(), FLOOR(1 + (RAND() * 30)), '제안서 수정 및 보완', '13:00', '15:00', '제안 보완', 'PROPOSAL'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-11-10' AND calendar_no = 15 AND title = '제안 보완');

INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-11-23', 1, NOW(), NOW(), FLOOR(1 + (RAND() * 30)), '신규 제안 검토', '10:00', '12:00', '제안 검토', 'PROPOSAL'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-11-23' AND calendar_no = 1 AND title = '제안 검토');

-- CONTRACT 일정
INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-11-05', 14, NOW(), NOW(), FLOOR(1 + (RAND() * 30)), '계약 조건 검토', '09:00', '11:00', '계약 검토', 'CONTRACT'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-11-05' AND calendar_no = 14 AND title = '계약 검토');

INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-11-20', 15, NOW(), NOW(), FLOOR(1 + (RAND() * 30)), '계약서 작성', '13:00', '15:00', '계약 작성', 'CONTRACT'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-11-20' AND calendar_no = 15 AND title = '계약 작성');

-- SALES 일정
INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-11-15', 1, NOW(), NOW(), FLOOR(1 + (RAND() * 30)), '연말 매출 실적 분석', '10:00', '12:30', '매출 분석', 'SALES'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-11-15' AND calendar_no = 1 AND title = '매출 분석');

-- ESTIMATE 일정
INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-11-28', 14, NOW(), NOW(), FLOOR(1 + (RAND() * 30)), '연말 견적서 검토', '10:00', '12:00', '견적 검토', 'ESTIMATE'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-11-28' AND calendar_no = 14 AND title = '견적 검토');

-- 2024년 12월 일정
-- PERSONAL 일정
INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-12-05', 1, NOW(), NOW(), NULL, '개인 연말 결산', '09:00', '10:30', '연말 결산', 'PERSONAL'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-12-05' AND calendar_no = 1 AND title = '연말 결산');

INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-12-15', 14, NOW(), NOW(), NULL, '내년도 목표 설정', '10:00', '12:00', '목표 설정', 'PERSONAL'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-12-15' AND calendar_no = 14 AND title = '목표 설정');

-- PROPOSAL 일정
INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-12-10', 15, NOW(), NOW(), FLOOR(1 + (RAND() * 30)), '신규 제안서 초안 작성', '09:30', '11:30', '제안 초안 작성', 'PROPOSAL'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-12-10' AND calendar_no = 15 AND title = '제안 초안 작성');

INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-12-22', 1, NOW(), NOW(), FLOOR(1 + (RAND() * 30)), '연말 제안서 최종 검토', '14:00', '16:00', '제안 검토', 'PROPOSAL'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-12-22' AND calendar_no = 1 AND title = '제안 검토');

-- CONTRACT 일정
INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-12-18', 14, NOW(), NOW(), FLOOR(1 + (RAND() * 30)), '계약 갱신 회의', '10:00', '11:30', '계약 갱신', 'CONTRACT'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-12-18' AND calendar_no = 14 AND title = '계약 갱신');

-- SALES 일정
INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-12-12', 15, NOW(), NOW(), FLOOR(1 + (RAND() * 30)), '연말 매출 실적 보고', '10:00', '12:00', '실적 보고', 'SALES'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-12-12' AND calendar_no = 15 AND title = '실적 보고');

-- 1번 캘린더 2024년 10월
-- PERSONAL 일정
INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-10-05', 1, NOW(), NOW(), NULL, '개인 목표 리뷰', '09:00', '10:00', '목표 리뷰', 'PERSONAL'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-10-05' AND calendar_no = 1 AND title = '목표 리뷰');

-- PROPOSAL 일정
INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-10-18', 1, NOW(), NOW(), FLOOR(1 + (RAND() * 30)), '연말 제안서 작성', '10:00', '12:00', '제안서 작성', 'PROPOSAL'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-10-18' AND calendar_no = 1 AND title = '제안서 작성');

-- CONTRACT 일정
INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-10-22', 1, NOW(), NOW(), FLOOR(1 + (RAND() * 30)), '계약 검토 미팅', '11:00', '13:00', '계약 검토', 'CONTRACT'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-10-22' AND calendar_no = 1 AND title = '계약 검토');

-- ESTIMATE 일정
INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-10-29', 1, NOW(), NOW(), FLOOR(1 + (RAND() * 30)), '연말 견적서 준비', '10:30', '12:30', '견적 준비', 'ESTIMATE'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-10-29' AND calendar_no = 1 AND title = '견적 준비');

-- 1번 캘린더 2024년 11월
-- PERSONAL 일정
INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-11-03', 1, NOW(), NOW(), NULL, '개인 회고 정리', '09:00', '10:30', '회고 정리', 'PERSONAL'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-11-03' AND calendar_no = 1 AND title = '회고 정리');

-- PROPOSAL 일정
INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-11-12', 1, NOW(), NOW(), FLOOR(1 + (RAND() * 30)), '프로젝트 제안서 보완', '10:00', '12:00', '제안서 보완', 'PROPOSAL'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-11-12' AND calendar_no = 1 AND title = '제안서 보완');

-- CONTRACT 일정
INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-11-18', 1, NOW(), NOW(), FLOOR(1 + (RAND() * 30)), '연말 계약 검토', '14:00', '16:00', '계약 검토', 'CONTRACT'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-11-18' AND calendar_no = 1 AND title = '계약 검토');

-- SALES 일정
INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-11-25', 1, NOW(), NOW(), FLOOR(1 + (RAND() * 30)), '연말 매출 정산', '11:00', '13:00', '매출 정산', 'SALES'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-11-25' AND calendar_no = 1 AND title = '매출 정산');

-- 1번 캘린더 2024년 12월
-- PERSONAL 일정
INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-12-03', 1, NOW(), NOW(), NULL, '연말 개인 목표 리뷰', '09:00', '10:30', '개인 목표 리뷰', 'PERSONAL'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-12-03' AND calendar_no = 1 AND title = '개인 목표 리뷰');

-- PROPOSAL 일정
INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-12-08', 1, NOW(), NOW(), FLOOR(1 + (RAND() * 30)), '신규 제안서 제출', '13:00', '15:00', '제안서 제출', 'PROPOSAL'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-12-08' AND calendar_no = 1 AND title = '제안서 제출');

-- CONTRACT 일정
INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-12-15', 1, NOW(), NOW(), FLOOR(1 + (RAND() * 30)), '연말 계약서 보완', '10:00', '11:30', '계약서 보완', 'CONTRACT'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-12-15' AND calendar_no = 1 AND title = '계약서 보완');

-- SALES 일정
INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-12-20', 1, NOW(), NOW(), FLOOR(1 + (RAND() * 30)), '연말 매출 분석', '10:00', '12:00', '매출 분석', 'SALES'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-12-20' AND calendar_no = 1 AND title = '매출 분석');

-- ESTIMATE 일정
INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-12-27', 1, NOW(), NOW(), FLOOR(1 + (RAND() * 30)), '최종 견적서 작성', '13:00', '15:00', '견적서 작성', 'ESTIMATE'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-12-27' AND calendar_no = 1 AND title = '견적서 작성');

-- 15번 캘린더 2024년 10월
-- PERSONAL 일정
INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-10-06', 15, NOW(), NOW(), NULL, '개인 목표 점검', '09:30', '10:30', '목표 점검', 'PERSONAL'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-10-06' AND calendar_no = 15 AND title = '목표 점검');

-- PROPOSAL 일정
INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-10-14', 15, NOW(), NOW(), FLOOR(1 + (RAND() * 30)), '신규 프로젝트 제안 준비', '11:00', '13:00', '프로젝트 제안 준비', 'PROPOSAL'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-10-14' AND calendar_no = 15 AND title = '프로젝트 제안 준비');

-- CONTRACT 일정
INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'N', '2024-10-19', 15, NOW(), NOW(), FLOOR(1 + (RAND() * 30)), '연말 계약 검토 회의', '14:00', '16:00', '계약 검토 회의', 'CONTRACT'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-10-19' AND calendar_no = 15 AND title = '계약 검토 회의');

-- SALES 일정
INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-10-23', 15, NOW(), NOW(), FLOOR(1 + (RAND() * 30)), 'Q4 매출 보고 준비', '09:00', '11:30', '매출 보고 준비', 'SALES'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-10-23' AND calendar_no = 15 AND title = '매출 보고 준비');

-- ESTIMATE 일정
INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-10-28', 15, NOW(), NOW(), FLOOR(1 + (RAND() * 30)), '신규 견적서 초안 작성', '10:30', '12:30', '견적서 초안 작성', 'ESTIMATE'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-10-28' AND calendar_no = 15 AND title = '견적서 초안 작성');

-- 15번 캘린더 2024년 11월
-- PERSONAL 일정
INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-11-04', 15, NOW(), NOW(), NULL, '개인 프로젝트 계획 점검', '10:00', '11:00', '프로젝트 계획 점검', 'PERSONAL'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-11-04' AND calendar_no = 15 AND title = '프로젝트 계획 점검');

-- PROPOSAL 일정
INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-11-12', 15, NOW(), NOW(), FLOOR(1 + (RAND() * 30)), '프로젝트 제안서 보완 작업', '09:30', '11:30', '제안서 보완', 'PROPOSAL'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-11-12' AND calendar_no = 15 AND title = '제안서 보완');

-- CONTRACT 일정
INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'N', '2024-11-18', 15, NOW(), NOW(), FLOOR(1 + (RAND() * 30)), '계약 갱신 미팅', '13:00', '15:00', '계약 갱신', 'CONTRACT'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-11-18' AND calendar_no = 15 AND title = '계약 갱신');

-- SALES 일정
INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'N', '2024-11-22', 15, NOW(), NOW(), FLOOR(1 + (RAND() * 30)), '연말 매출 목표 설정', '11:00', '12:30', '매출 목표 설정', 'SALES'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-11-22' AND calendar_no = 15 AND title = '매출 목표 설정');

-- ESTIMATE 일정
INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-11-28', 15, NOW(), NOW(), FLOOR(1 + (RAND() * 30)), '연말 견적서 최종 검토', '10:00', '12:00', '견적서 검토', 'ESTIMATE'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-11-28' AND calendar_no = 15 AND title = '견적서 검토');

-- 15번 캘린더 2024년 12월
-- PERSONAL 일정
INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-12-04', 15, NOW(), NOW(), NULL, '연말 개인 목표 점검', '10:00', '11:00', '개인 목표 점검', 'PERSONAL'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-12-04' AND calendar_no = 15 AND title = '개인 목표 점검');

-- PROPOSAL 일정
INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-12-10', 15, NOW(), NOW(), FLOOR(1 + (RAND() * 30)), '내년도 제안서 초안 작성', '09:30', '11:00', '제안 초안 작성', 'PROPOSAL'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-12-10' AND calendar_no = 15 AND title = '제안 초안 작성');

-- CONTRACT 일정
INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-12-15', 15, NOW(), NOW(), FLOOR(1 + (RAND() * 30)), '계약서 최종 검토', '10:30', '12:00', '계약 검토', 'CONTRACT'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-12-15' AND calendar_no = 15 AND title = '계약 검토');

-- SALES 일정
INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'N', '2024-12-18', 15, NOW(), NOW(), FLOOR(1 + (RAND() * 30)), '연말 매출 보고서 작성', '09:00', '10:30', '매출 보고서 작성', 'SALES'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-12-18' AND calendar_no = 15 AND title = '매출 보고서 작성');

-- ESTIMATE 일정
INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, domain_no, content, start_time, end_time, title, plan_cls)
SELECT 'Y', '2024-12-27', 15, NOW(), NOW(), FLOOR(1 + (RAND() * 30)), '최종 견적서 제출', '13:30', '15:00', '견적서 제출', 'ESTIMATE'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-12-27' AND calendar_no = 15 AND title = '견적서 제출');



-- >>>>>>>>>>>> 영업활동 @uzz99 <<<<<<<<<<<<<<
#
# INSERT INTO `tb_act` (act_date, calendar_no, created_at, lead_no, updated_at, act_cont, complete_yn, end_time, name, plan_cont, purpose, start_time, cls) VALUES
# ('2024-11-11', 15, '2024-11-06 02:07:03', 44, '2024-11-06 02:07:03', '제품 문의', 'N', '10:25', '프로모션 상담', '발송 준비', '문의 응대', '15:53', 'ONLINE'),
# ('2024-11-18', 4, '2024-11-06 02:07:03', 7, '2024-11-06 02:07:03', '후속 연락', 'Y', '15:47', '커피 시음회', '제품 테스트', '구매 상담', '10:56', 'ONLINE'),
# ('2024-11-18', 4, '2024-11-06 02:07:03', 25, '2024-11-06 02:07:03', '일정 조정', 'N', '14:37', '샘플 요청', '발송 준비', '문의 응대', '13:40', 'ONLINE'),
# ('2024-11-07', 4, '2024-11-06 02:07:03', 29, '2024-11-06 02:07:03', '서비스 요청', 'N', '16:16', '프로모션 상담', '발송 준비', '문의 응대', '13:34', 'EMAIL'),
# ('2024-11-21', 15, '2024-11-06 02:07:03', 43, '2024-11-06 02:07:03', '후속 연락', 'Y', '14:08', '재구매 상담', '발송 준비', '구매 상담', '10:28', 'OTHER'),
# ('2024-11-20', 4, '2024-11-06 02:07:03', 38, '2024-11-06 02:07:03', '상담 요청', 'N', '14:11', '프로모션 상담', '추가 상담 예정', '기타', '9:54', 'EMAIL'),
# ('2024-11-28', 1, '2024-11-06 02:07:03', 8, '2024-11-06 02:07:03', '제품 문의', 'Y', '17:51', '커피 시음회', '발송 준비', '구매 상담', '14:45', 'ONLINE'),
# ('2024-11-19', 15, '2024-11-06 02:07:03', 37, '2024-11-06 02:07:03', '서비스 요청', 'Y', '13:06', '신제품 발표', '제품 테스트', '기타', '15:14', 'EMAIL'),
# ('2024-11-18', 1, '2024-11-06 02:07:03', 29, '2024-11-06 02:07:03', '일정 조정', 'Y', '17:55', '신제품 발표', '추가 상담 예정', '기타', '14:02', 'EMAIL'),
# ('2023-09-04', 9, '2024-11-06 02:07:03', 26, '2024-11-06 02:07:03', '제품 문의', 'Y', '11:09', '샘플 요청', '추가 상담 예정', '기타', '18:50', 'ONLINE'),
# ('2023-08-02', 15, '2024-11-06 02:07:03', 5, '2024-11-06 02:07:03', '서비스 요청', 'Y', '11:38', '재구매 상담', '발송 준비', '구매 상담', '12:34', 'OTHER'),
# ('2024-07-18', 1, '2024-11-06 02:07:03', 47, '2024-11-06 02:07:03', '서비스 요청', 'N', '17:06', '커피 시음회', '제품 테스트', '기타', '12:13', 'VISIT'),
# ('2023-01-31', 1, '2024-11-06 02:07:03', 44, '2024-11-06 02:07:03', '상담 요청', 'Y', '13:18', '신제품 발표', '발송 준비', '기타', '8:32', 'ONLINE'),
# ('2022-05-23', 1, '2024-11-06 02:07:03', 18, '2024-11-06 02:07:03', '제품 문의', 'N', '16:28', '프로모션 상담', '발송 준비', '구매 상담', '18:14', 'EMAIL'),
# ('2024-02-15', 14, '2024-11-06 02:07:03', 34, '2024-11-06 02:07:03', '후속 연락', 'Y', '8:48', '샘플 요청', '제품 테스트', '기타', '18:25', 'OTHER'),
# ('2023-10-25', 9, '2024-11-06 02:07:03', 29, '2024-11-06 02:07:03', '일정 조정', 'Y', '10:01', '신제품 발표', '발송 준비', '기타', '12:26', 'PHONE'),
# ('2023-01-07', 1, '2024-11-06 02:07:03', 15, '2024-11-06 02:07:03', '서비스 요청', 'Y', '10:58', '신제품 발표', '추가 상담 예정', '문의 응대', '14:34', 'OTHER'),
# ('2022-06-28', 10, '2024-11-06 02:07:03', 39, '2024-11-06 02:07:03', '서비스 요청', 'N', '12:55', '프로모션 상담', '추가 상담 예정', '구매 상담', '12:40', 'PHONE'),
# ('2023-11-13', 8, '2024-11-06 02:07:03', 29, '2024-11-06 02:07:03', '서비스 요청', 'Y', '14:05', '재구매 상담', '발송 준비', '기타', '10:12', 'OTHER'),
# ('2022-12-16', 8, '2024-11-06 02:07:03', 42, '2024-11-06 02:07:03', '후속 연락', 'Y', '14:05', '신제품 발표', '추가 상담 예정', '구매 상담', '17:57', 'VISIT'),
# ('2023-06-09', 14, '2024-11-06 02:07:03', 12, '2024-11-06 02:07:03', '상담 요청', 'N', '17:25', '샘플 요청', '제품 테스트', '구매 상담', '13:12', 'VISIT'),
# ('2023-04-25', 1, '2024-11-06 02:07:03', 4, '2024-11-06 02:07:03', '서비스 요청', 'N', '13:26', '샘플 요청', '발송 준비', '문의 응대', '12:37', 'OTHER'),
# ('2023-05-14', 1, '2024-11-06 02:07:03', 17, '2024-11-06 02:07:03', '후속 연락', 'N', '11:48', '프로모션 상담', '발송 준비', '문의 응대', '13:30', 'PHONE'),
# ('2023-01-13', 1, '2024-11-06 02:07:03', 18, '2024-11-06 02:07:03', '후속 연락', 'Y', '18:05', '신제품 발표', '제품 테스트', '기타', '10:32', 'ONLINE'),
# ('2022-06-28', 4, '2024-11-06 02:07:03', 34, '2024-11-06 02:07:03', '상담 요청', 'N', '8:24', '커피 시음회', '제품 테스트', '구매 상담', '18:41', 'PHONE'),
# ('2024-07-17', 12, '2024-11-06 02:07:03', 3, '2024-11-06 02:07:03', '제품 문의', 'Y', '8:01', '커피 시음회', '발송 준비', '기타', '13:46', 'PHONE'),
# ('2022-03-09', 13, '2024-11-06 02:07:03', 9, '2024-11-06 02:07:03', '후속 연락', 'N', '11:36', '신제품 발표', '발송 준비', '문의 응대', '9:22', 'VISIT'),
# ('2022-04-06', 1, '2024-11-06 02:07:03', 7, '2024-11-06 02:07:03', '제품 문의', 'N', '8:51', '신제품 발표', '추가 상담 예정', '문의 응대', '8:35', 'VISIT'),
# ('2024-11-20', 2, '2024-11-06 02:07:03', 24, '2024-11-06 02:07:03', '서비스 요청', 'Y', '17:30', '커피 시음회', '추가 상담 예정', '문의 응대', '15:45', 'VISIT'),
# ('2022-12-13', 14, '2024-11-06 02:07:03', 22, '2024-11-06 02:07:03', '후속 연락', 'Y', '16:54', '프로모션 상담', '제품 테스트', '구매 상담', '12:06', 'OTHER'),
# ('2023-10-08', 1, '2024-11-06 02:07:03', 29, '2024-11-06 02:07:03', '일정 조정', 'Y', '11:52', '신제품 발표', '제품 테스트', '기타', '15:44', 'VISIT'),
# ('2023-10-21', 8, '2024-11-06 02:07:03', 9, '2024-11-06 02:07:03', '서비스 요청', 'N', '15:35', '신제품 발표', '발송 준비', '구매 상담', '17:33', 'ONLINE'),
# ('2024-11-16', 2, '2024-11-06 02:07:03', 10, '2024-11-06 02:07:03', '제품 문의', 'N', '17:57', '프로모션 상담', '발송 준비', '구매 상담', '18:15', 'PHONE'),
# ('2023-08-11', 10, '2024-11-06 02:07:03', 25, '2024-11-06 02:07:03', '서비스 요청', 'Y', '16:27', '커피 시음회', '제품 테스트', '구매 상담', '11:46', 'PHONE'),
# ('2022-01-30', 1, '2024-11-06 02:07:03', 34, '2024-11-06 02:07:03', '제품 문의', 'Y', '11:49', '샘플 요청', '추가 상담 예정', '구매 상담', '17:14', 'PHONE'),
# ('2024-03-25', 14, '2024-11-06 02:07:03', 45, '2024-11-06 02:07:03', '상담 요청', 'N', '15:44', '신제품 발표', '발송 준비', '기타', '15:19', 'PHONE'),
# ('2024-01-04', 14, '2024-11-06 02:07:03', 3, '2024-11-06 02:07:03', '일정 조정', 'N', '16:44', '샘플 요청', '추가 상담 예정', '구매 상담', '15:47', 'OTHER'),
# ('2022-08-28', 14, '2024-11-06 02:07:03', 5, '2024-11-06 02:07:03', '후속 연락', 'Y', '14:31', '샘플 요청', '추가 상담 예정', '기타', '14:19', 'VISIT'),
# ('2022-10-16', 3, '2024-11-06 02:07:03', 1, '2024-11-06 02:07:03', '일정 조정', 'N', '16:32', '신제품 발표', '추가 상담 예정', '기타', '18:19', 'ONLINE'),
# ('2022-09-26', 1, '2024-11-06 02:07:03', 36, '2024-11-06 02:07:03', '일정 조정', 'Y', '11:06', '프로모션 상담', '발송 준비', '구매 상담', '10:53', 'ONLINE'),
# ('2022-07-05', 14, '2024-11-06 02:07:03', 41, '2024-11-06 02:07:03', '일정 조정', 'N', '14:56', '커피 시음회', '추가 상담 예정', '문의 응대', '9:27', 'ONLINE'),
# ('2023-02-28', 1, '2024-11-06 02:07:03', 32, '2024-11-06 02:07:03', '서비스 요청', 'N', '17:04', '커피 시음회', '발송 준비', '기타', '10:40', 'PHONE'),
# ('2023-12-20', 10, '2024-11-06 02:07:03', 35, '2024-11-06 02:07:03', '일정 조정', 'Y', '11:42', '프로모션 상담', '추가 상담 예정', '기타', '10:24', 'EMAIL'),
# ('2024-11-27', 14, '2024-11-06 02:07:03', 44, '2024-11-06 02:07:03', '서비스 요청', 'N', '18:03', '신제품 발표', '제품 테스트', '기타', '14:26', 'ONLINE'),
# ('2024-09-15', 10, '2024-11-06 02:07:03', 11, '2024-11-06 02:07:03', '제품 문의', 'Y', '17:53', '샘플 요청', '추가 상담 예정', '기타', '12:08', 'PHONE'),
# ('2022-10-05', 1, '2024-11-06 02:07:03', 42, '2024-11-06 02:07:03', '상담 요청', 'Y', '13:07', '재구매 상담', '추가 상담 예정', '문의 응대', '9:32', 'PHONE'),
# ('2022-11-24', 14, '2024-11-06 02:07:03', 40, '2024-11-06 02:07:03', '후속 연락', 'Y', '15:49', '프로모션 상담', '발송 준비', '문의 응대', '18:05', 'OTHER'),
# ('2024-09-12', 5, '2024-11-06 02:07:03', 47, '2024-11-06 02:07:03', '후속 연락', 'N', '12:09', '재구매 상담', '추가 상담 예정', '구매 상담', '18:28', 'EMAIL'),
# ('2023-11-24', 5, '2024-11-06 02:07:03', 49, '2024-11-06 02:07:03', '서비스 요청', 'N', '8:03', '신제품 발표', '추가 상담 예정', '문의 응대', '16:09', 'VISIT'),
# ('2023-02-19', 15, '2024-11-06 02:07:03', 26, '2024-11-06 02:07:03', '후속 연락', 'Y', '11:42', '프로모션 상담', '발송 준비', '구매 상담', '12:52', 'VISIT'),
# ('2024-02-06', 15, '2024-11-06 02:07:03', 38, '2024-11-06 02:07:03', '일정 조정', 'Y', '10:18', '신제품 발표', '제품 테스트', '기타', '16:57', 'ONLINE'),
# ('2022-03-11', 15, '2024-11-06 02:07:03', 25, '2024-11-06 02:07:03', '제품 문의', 'N', '11:33', '재구매 상담', '제품 테스트', '구매 상담', '14:17', 'PHONE'),
# ('2024-09-27', 15, '2024-11-06 02:07:03', 24, '2024-11-06 02:07:03', '제품 문의', 'N', '16:15', '신제품 발표', '발송 준비', '기타', '9:32', 'OTHER'),
# ('2023-04-20', 1, '2024-11-06 02:07:03', 46, '2024-11-06 02:07:03', '후속 연락', 'N', '8:25', '재구매 상담', '발송 준비', '문의 응대', '11:39', 'VISIT'),
# ('2022-02-20', 14, '2024-11-06 02:07:03', 18, '2024-11-06 02:07:03', '서비스 요청', 'Y', '13:15', '프로모션 상담', '발송 준비', '구매 상담', '9:47', 'PHONE'),
# ('2022-09-10', 1, '2024-11-06 02:07:03', 5, '2024-11-06 02:07:03', '서비스 요청', 'N', '14:04', '프로모션 상담', '추가 상담 예정', '문의 응대', '14:15', 'ONLINE'),
# ('2022-10-30', 1, '2024-11-06 02:07:03', 42, '2024-11-06 02:07:03', '제품 문의', 'Y', '16:13', '프로모션 상담', '제품 테스트', '구매 상담', '8:15', 'OTHER'),
# ('2022-09-04', 5, '2024-11-06 02:07:03', 43, '2024-11-06 02:07:03', '상담 요청', 'Y', '16:14', '프로모션 상담', '추가 상담 예정', '구매 상담', '12:00', 'EMAIL'),
# ('2024-04-25', 14, '2024-11-06 02:07:03', 18, '2024-11-06 02:07:03', '제품 문의', 'N', '12:47', '커피 시음회', '추가 상담 예정', '구매 상담', '16:35', 'EMAIL'),
# ('2023-05-16', 6, '2024-11-06 02:07:03', 16, '2024-11-06 02:07:03', '서비스 요청', 'N', '16:44', '재구매 상담', '제품 테스트', '문의 응대', '14:24', 'VISIT'),
# ('2023-08-31', 14, '2024-11-06 02:07:03', 8, '2024-11-06 02:07:03', '제품 문의', 'N', '15:24', '커피 시음회', '제품 테스트', '기타', '12:19', 'EMAIL'),
# ('2024-10-19', 3, '2024-11-06 02:07:03', 32, '2024-11-06 02:07:03', '일정 조정', 'N', '8:39', '샘플 요청', '제품 테스트', '문의 응대', '9:40', 'ONLINE'),
# ('2023-05-20', 11, '2024-11-06 02:07:03', 48, '2024-11-06 02:07:03', '후속 연락', 'Y', '13:32', '샘플 요청', '추가 상담 예정', '기타', '12:00', 'OTHER'),
# ('2023-10-07', 3, '2024-11-06 02:07:03', 47, '2024-11-06 02:07:03', '일정 조정', 'Y', '8:59', '신제품 발표', '발송 준비', '문의 응대', '12:53', 'PHONE'),
# ('2024-10-27', 15, '2024-11-06 02:07:03', 1, '2024-11-06 02:07:03', '상담 요청', 'Y', '15:26', '샘플 요청', '발송 준비', '구매 상담', '14:16', 'PHONE'),
# ('2023-07-14', 12, '2024-11-06 02:07:03', 32, '2024-11-06 02:07:03', '후속 연락', 'Y', '15:12', '신제품 발표', '제품 테스트', '문의 응대', '15:19', 'EMAIL'),
# ('2023-11-30', 14, '2024-11-06 02:07:03', 1, '2024-11-06 02:07:03', '서비스 요청', 'N', '14:45', '재구매 상담', '제품 테스트', '문의 응대', '12:27', 'OTHER'),
# ('2023-11-16', 14, '2024-11-06 02:07:03', 18, '2024-11-06 02:07:03', '제품 문의', 'N', '15:56', '신제품 발표', '제품 테스트', '구매 상담', '9:15', 'VISIT'),
# ('2024-11-21', 14, '2024-11-06 02:07:03', 24, '2024-11-06 02:07:03', '상담 요청', 'Y', '16:34', '재구매 상담', '추가 상담 예정', '구매 상담', '10:54', 'EMAIL'),
# ('2022-06-05', 1, '2024-11-06 02:07:03', 10, '2024-11-06 02:07:03', '제품 문의', 'N', '12:09', '샘플 요청', '추가 상담 예정', '문의 응대', '9:05', 'ONLINE'),
# ('2024-01-22', 1, '2024-11-06 02:07:03', 9, '2024-11-06 02:07:03', '후속 연락', 'Y', '18:24', '샘플 요청', '발송 준비', '구매 상담', '13:17', 'EMAIL'),
# ('2022-04-27', 14, '2024-11-06 02:07:03', 26, '2024-11-06 02:07:03', '서비스 요청', 'N', '16:33', '커피 시음회', '제품 테스트', '문의 응대', '9:37', 'ONLINE'),
# ('2023-11-10', 15, '2024-11-06 02:07:03', 32, '2024-11-06 02:07:03', '서비스 요청', 'N', '15:18', '샘플 요청', '추가 상담 예정', '기타', '14:15', 'ONLINE'),
# ('2022-11-13', 5, '2024-11-06 02:07:03', 28, '2024-11-06 02:07:03', '일정 조정', 'N', '13:04', '재구매 상담', '발송 준비', '기타', '9:47', 'PHONE'),
# ('2024-06-17', 4, '2024-11-06 02:07:03', 21, '2024-11-06 02:07:03', '상담 요청', 'N', '16:03', '커피 시음회', '제품 테스트', '구매 상담', '13:19', 'ONLINE'),
# ('2024-01-15', 6, '2024-11-06 02:07:03', 10, '2024-11-06 02:07:03', '서비스 요청', 'N', '9:06', '커피 시음회', '추가 상담 예정', '기타', '12:25', 'PHONE'),
# ('2024-07-08', 14, '2024-11-06 02:07:03', 18, '2024-11-06 02:07:03', '서비스 요청', 'Y', '17:22', '샘플 요청', '제품 테스트', '문의 응대', '9:10', 'PHONE'),
# ('2022-06-16', 4, '2024-11-06 02:07:03', 25, '2024-11-06 02:07:03', '상담 요청', 'Y', '15:46', '커피 시음회', '추가 상담 예정', '구매 상담', '10:17', 'EMAIL'),
# ('2022-09-19', 1, '2024-11-06 02:07:03', 38, '2024-11-06 02:07:03', '상담 요청', 'Y', '16:17', '신제품 발표', '발송 준비', '기타', '14:58', 'PHONE'),
# ('2022-12-13', 11, '2024-11-06 02:07:03', 48, '2024-11-06 02:07:03', '제품 문의', 'Y', '14:44', '신제품 발표', '발송 준비', '기타', '15:24', 'EMAIL'),
# ('2023-03-10', 14, '2024-11-06 02:07:03', 36, '2024-11-06 02:07:03', '일정 조정', 'Y', '13:51', '재구매 상담', '제품 테스트', '문의 응대', '14:09', 'VISIT'),
# ('2022-10-28', 3, '2024-11-06 02:07:03', 48, '2024-11-06 02:07:03', '제품 문의', 'N', '13:13', '재구매 상담', '제품 테스트', '기타', '12:53', 'ONLINE'),
# ('2022-06-03', 5, '2024-11-06 02:07:03', 12, '2024-11-06 02:07:03', '제품 문의', 'Y', '16:00', '프로모션 상담', '발송 준비', '문의 응대', '9:47', 'EMAIL'),
# ('2024-11-25', 14, '2024-11-06 02:07:03', 13, '2024-11-06 02:07:03', '상담 요청', 'N', '9:13', '커피 시음회', '추가 상담 예정', '구매 상담', '15:41', 'EMAIL'),
# ('2022-07-18', 1, '2024-11-06 02:07:03', 30, '2024-11-06 02:07:03', '상담 요청', 'Y', '13:48', '재구매 상담', '추가 상담 예정', '구매 상담', '17:55', 'EMAIL'),
# ('2023-09-10', 6, '2024-11-06 02:07:03', 48, '2024-11-06 02:07:03', '일정 조정', 'N', '9:47', '재구매 상담', '발송 준비', '기타', '14:09', 'VISIT'),
# ('2023-08-14', 12, '2024-11-06 02:07:03', 14, '2024-11-06 02:07:03', '일정 조정', 'N', '18:00', '커피 시음회', '추가 상담 예정', '기타', '9:15', 'ONLINE'),
# ('2023-02-24', 14, '2024-11-06 02:07:03', 38, '2024-11-06 02:07:03', '상담 요청', 'Y', '10:53', '신제품 발표', '제품 테스트', '구매 상담', '9:18', 'EMAIL'),
# ('2023-04-07', 9, '2024-11-06 02:07:03', 32, '2024-11-06 02:07:03', '상담 요청', 'N', '18:54', '샘플 요청', '제품 테스트', '기타', '13:25', 'VISIT'),
# ('2022-01-24', 7, '2024-11-06 02:07:03', 45, '2024-11-06 02:07:03', '서비스 요청', 'N', '11:07', '커피 시음회', '발송 준비', '기타', '13:13', 'ONLINE'),
# ('2023-04-24', 4, '2024-11-06 02:07:03', 30, '2024-11-06 02:07:03', '서비스 요청', 'Y', '18:14', '프로모션 상담', '발송 준비', '기타', '14:35', 'PHONE'),
# ('2024-06-02', 1, '2024-11-06 02:07:03', 37, '2024-11-06 02:07:03', '후속 연락', 'N', '13:18', '커피 시음회', '발송 준비', '구매 상담', '16:06', 'OTHER'),
# ('2024-02-18', 15, '2024-11-06 02:07:03', 39, '2024-11-06 02:07:03', '일정 조정', 'N', '14:51', '재구매 상담', '발송 준비', '기타', '8:58', 'VISIT'),
# ('2024-11-15', 14, '2024-11-06 02:07:03', 16, '2024-11-06 02:07:03', '제품 문의', 'Y', '11:32', '커피 시음회', '추가 상담 예정', '문의 응대', '9:38', 'ONLINE'),
# ('2024-04-02', 15, '2024-11-06 02:07:03', 4, '2024-11-06 02:07:03', '후속 연락', 'N', '14:26', '재구매 상담', '제품 테스트', '구매 상담', '18:52', 'EMAIL'),
# ('2022-03-04', 12, '2024-11-06 02:07:03', 22, '2024-11-06 02:07:03', '상담 요청', 'N', '10:00', '샘플 요청', '추가 상담 예정', '기타', '16:04', 'EMAIL'),
# ('2024-01-16', 1, '2024-11-06 02:07:03', 1, '2024-11-06 02:07:03', '제품 문의', 'N', '14:00', '신제품 발표', '제품 테스트', '기타', '12:22', 'ONLINE'),
# ('2023-10-04', 15, '2024-11-06 02:07:03', 18, '2024-11-06 02:07:03', '후속 연락', 'N', '14:08', '프로모션 상담', '제품 테스트', '기타', '13:20', 'PHONE'),
# ('2022-01-15', 12, '2024-11-06 02:07:03', 12, '2024-11-06 02:07:03', '서비스 요청', 'N', '15:31', '재구매 상담', '발송 준비', '구매 상담', '17:41', 'OTHER'),
# ('2022-03-19', 14, '2024-11-06 02:07:03', 15, '2024-11-06 02:07:03', '후속 연락', 'Y', '16:50', '프로모션 상담', '제품 테스트', '문의 응대', '8:56', 'ONLINE'),
# ('2022-09-30', 14, '2024-11-06 02:07:03', 36, '2024-11-06 02:07:03', '상담 요청', 'N', '14:00', '샘플 요청', '추가 상담 예정', '구매 상담', '8:57', 'PHONE'),
# ('2023-02-13', 14, '2024-11-06 02:07:03', 24, '2024-11-06 02:07:03', '일정 조정', 'N', '15:06', '프로모션 상담', '추가 상담 예정', '기타', '15:53', 'EMAIL'),
# ('2024-10-08', 11, '2024-11-06 02:07:03', 46, '2024-11-06 02:07:03', '후속 연락', 'N', '14:13', '프로모션 상담', '추가 상담 예정', '구매 상담', '9:58', 'OTHER'),
# ('2023-10-13', 15, '2024-11-06 02:07:03', 47, '2024-11-06 02:07:03', '상담 요청', 'Y', '9:17', '신제품 발표', '제품 테스트', '구매 상담', '9:18', 'PHONE'),
# ('2024-07-08', 1, '2024-11-06 02:07:03', 47, '2024-11-06 02:07:03', '서비스 요청', 'N', '10:50', '신제품 발표', '추가 상담 예정', '기타', '8:58', 'ONLINE'),
# ('2023-03-28', 8, '2024-11-06 02:07:03', 32, '2024-11-06 02:07:03', '일정 조정', 'Y', '9:50', '샘플 요청', '제품 테스트', '기타', '16:43', 'PHONE'),
# ('2023-05-12', 8, '2024-11-06 02:07:03', 48, '2024-11-06 02:07:03', '후속 연락', 'N', '17:01', '신제품 발표', '추가 상담 예정', '문의 응대', '11:19', 'OTHER'),
# ('2023-02-08', 12, '2024-11-06 02:07:03', 24, '2024-11-06 02:07:03', '서비스 요청', 'N', '9:16', '재구매 상담', '제품 테스트', '구매 상담', '16:01', 'VISIT'),
# ('2023-04-14', 7, '2024-11-06 02:07:03', 15, '2024-11-06 02:07:03', '일정 조정', 'N', '14:57', '샘플 요청', '제품 테스트', '문의 응대', '14:03', 'VISIT'),
# ('2022-12-09', 15, '2024-11-06 02:07:03', 4, '2024-11-06 02:07:03', '서비스 요청', 'N', '16:32', '신제품 발표', '제품 테스트', '기타', '17:41', 'VISIT'),
# ('2024-07-31', 15, '2024-11-06 02:07:03', 6, '2024-11-06 02:07:03', '상담 요청', 'N', '10:56', '커피 시음회', '제품 테스트', '문의 응대', '18:07', 'PHONE'),
# ('2022-12-12', 15, '2024-11-06 02:07:03', 39, '2024-11-06 02:07:03', '제품 문의', 'N', '12:51', '신제품 발표', '발송 준비', '문의 응대', '9:31', 'VISIT'),
# ('2023-07-11', 11, '2024-11-06 02:07:03', 12, '2024-11-06 02:07:03', '상담 요청', 'N', '14:08', '신제품 발표', '추가 상담 예정', '문의 응대', '12:32', 'ONLINE'),
# ('2022-12-20', 5, '2024-11-06 02:07:03', 24, '2024-11-06 02:07:03', '제품 문의', 'N', '18:30', '프로모션 상담', '추가 상담 예정', '구매 상담', '18:44', 'PHONE'),
# ('2023-04-05', 2, '2024-11-06 02:07:03', 49, '2024-11-06 02:07:03', '일정 조정', 'Y', '15:43', '커피 시음회', '발송 준비', '구매 상담', '16:11', 'EMAIL'),
# ('2023-07-09', 15, '2024-11-06 02:07:03', 20, '2024-11-06 02:07:03', '서비스 요청', 'Y', '18:09', '커피 시음회', '발송 준비', '구매 상담', '14:36', 'ONLINE'),
# ('2023-10-21', 1, '2024-11-06 02:07:03', 9, '2024-11-06 02:07:03', '서비스 요청', 'Y', '18:40', '신제품 발표', '발송 준비', '기타', '14:13', 'EMAIL'),
# ('2022-07-03', 1, '2024-11-06 02:07:03', 26, '2024-11-06 02:07:03', '제품 문의', 'N', '8:18', '커피 시음회', '발송 준비', '구매 상담', '13:50', 'EMAIL'),
# ('2022-10-12', 6, '2024-11-06 02:07:03', 38, '2024-11-06 02:07:03', '후속 연락', 'N', '12:16', '재구매 상담', '추가 상담 예정', '기타', '14:40', 'ONLINE'),
# ('2022-08-12', 1, '2024-11-06 02:07:03', 21, '2024-11-06 02:07:03', '일정 조정', 'N', '17:34', '신제품 발표', '발송 준비', '문의 응대', '12:08', 'ONLINE'),
# ('2022-02-15', 15, '2024-11-06 02:07:03', 25, '2024-11-06 02:07:03', '일정 조정', 'Y', '16:08', '재구매 상담', '제품 테스트', '기타', '13:13', 'OTHER'),
# ('2022-07-05', 1, '2024-11-06 02:07:03', 30, '2024-11-06 02:07:03', '서비스 요청', 'N', '16:23', '커피 시음회', '추가 상담 예정', '문의 응대', '8:55', 'EMAIL'),
# ('2024-07-02', 1, '2024-11-06 02:07:03', 42, '2024-11-06 02:07:03', '상담 요청', 'N', '12:49', '재구매 상담', '추가 상담 예정', '구매 상담', '18:08', 'ONLINE'),
# ('2023-08-30', 14, '2024-11-06 02:07:03', 17, '2024-11-06 02:07:03', '후속 연락', 'N', '13:33', '신제품 발표', '제품 테스트', '기타', '14:50', 'VISIT'),
# ('2022-04-30', 10, '2024-11-06 02:07:03', 14, '2024-11-06 02:07:03', '일정 조정', 'N', '8:38', '재구매 상담', '제품 테스트', '구매 상담', '13:15', 'ONLINE'),
# ('2024-10-28', 8, '2024-11-06 02:07:03', 34, '2024-11-06 02:07:03', '후속 연락', 'N', '10:15', '신제품 발표', '추가 상담 예정', '기타', '18:00', 'OTHER'),
# ('2022-06-02', 11, '2024-11-06 02:07:03', 10, '2024-11-06 02:07:03', '후속 연락', 'Y', '15:02', '샘플 요청', '발송 준비', '기타', '15:48', 'ONLINE'),
# ('2024-04-22', 14, '2024-11-06 02:07:03', 29, '2024-11-06 02:07:03', '서비스 요청', 'N', '18:40', '신제품 발표', '추가 상담 예정', '기타', '14:42', 'OTHER'),
# ('2024-07-16', 14, '2024-11-06 02:07:03', 48, '2024-11-06 02:07:03', '일정 조정', 'N', '18:24', '신제품 발표', '제품 테스트', '구매 상담', '17:01', 'VISIT'),
# ('2023-08-09', 1, '2024-11-06 02:07:03', 43, '2024-11-06 02:07:03', '서비스 요청', 'N', '13:27', '커피 시음회', '추가 상담 예정', '문의 응대', '15:32', 'VISIT'),
# ('2022-06-21', 15, '2024-11-06 02:07:03', 25, '2024-11-06 02:07:03', '제품 문의', 'Y', '13:03', '샘플 요청', '발송 준비', '구매 상담', '18:16', 'EMAIL'),
# ('2022-02-22', 14, '2024-11-06 02:07:03', 26, '2024-11-06 02:07:03', '서비스 요청', 'Y', '14:19', '신제품 발표', '제품 테스트', '기타', '14:14', 'PHONE'),
# ('2022-05-16', 10, '2024-11-06 02:07:03', 39, '2024-11-06 02:07:03', '후속 연락', 'Y', '9:55', '샘플 요청', '추가 상담 예정', '구매 상담', '12:35', 'EMAIL'),
# ('2024-04-25', 10, '2024-11-06 02:07:03', 34, '2024-11-06 02:07:03', '제품 문의', 'Y', '12:00', '샘플 요청', '발송 준비', '문의 응대', '18:49', 'ONLINE'),
# ('2022-01-05', 1, '2024-11-06 02:07:03', 8, '2024-11-06 02:07:03', '제품 문의', 'Y', '17:43', '샘플 요청', '제품 테스트', '구매 상담', '17:39', 'VISIT'),
# ('2022-09-21', 1, '2024-11-06 02:07:03', 3, '2024-11-06 02:07:03', '후속 연락', 'N', '15:10', '신제품 발표', '발송 준비', '구매 상담', '13:39', 'ONLINE'),
# ('2024-04-10', 14, '2024-11-06 02:07:03', 28, '2024-11-06 02:07:03', '후속 연락', 'Y', '13:11', '신제품 발표', '제품 테스트', '구매 상담', '11:10', 'ONLINE'),
# ('2022-03-23', 1, '2024-11-06 02:07:03', 26, '2024-11-06 02:07:03', '상담 요청', 'N', '8:31', '신제품 발표', '추가 상담 예정', '기타', '14:09', 'EMAIL'),
# ('2024-03-21', 1, '2024-11-06 02:07:03', 8, '2024-11-06 02:07:03', '제품 문의', 'Y', '14:35', '재구매 상담', '발송 준비', '구매 상담', '8:05', 'OTHER'),
# ('2024-03-11', 4, '2024-11-06 02:07:03', 14, '2024-11-06 02:07:03', '서비스 요청', 'Y', '17:18', '프로모션 상담', '발송 준비', '구매 상담', '18:41', 'ONLINE'),
# ('2022-09-07', 14, '2024-11-06 02:07:03', 27, '2024-11-06 02:07:03', '상담 요청', 'Y', '16:20', '프로모션 상담', '추가 상담 예정', '구매 상담', '12:46', 'OTHER'),
# ('2023-08-09', 14, '2024-11-06 02:07:03', 38, '2024-11-06 02:07:03', '서비스 요청', 'Y', '14:54', '프로모션 상담', '제품 테스트', '기타', '8:50', 'ONLINE'),
# ('2024-08-21', 15, '2024-11-06 02:07:03', 43, '2024-11-06 02:07:03', '제품 문의', 'Y', '12:10', '신제품 발표', '발송 준비', '구매 상담', '10:59', 'PHONE'),
# ('2024-01-15', 14, '2024-11-06 02:07:03', 26, '2024-11-06 02:07:03', '제품 문의', 'N', '15:30', '신제품 발표', '추가 상담 예정', '문의 응대', '13:05', 'PHONE'),
# ('2023-11-18', 1, '2024-11-06 02:07:03', 29, '2024-11-06 02:07:03', '상담 요청', 'N', '12:21', '프로모션 상담', '발송 준비', '문의 응대', '14:50', 'OTHER'),
# ('2023-09-12', 2, '2024-11-06 02:07:03', 12, '2024-11-06 02:07:03', '제품 문의', 'Y', '8:46', '재구매 상담', '제품 테스트', '구매 상담', '13:42', 'ONLINE'),
# ('2022-09-07', 12, '2024-11-06 02:07:03', 49, '2024-11-06 02:07:03', '제품 문의', 'Y', '16:24', '재구매 상담', '발송 준비', '기타', '12:01', 'EMAIL'),
# ('2023-06-26', 15, '2024-11-06 02:07:03', 43, '2024-11-06 02:07:03', '제품 문의', 'Y', '12:59', '커피 시음회', '발송 준비', '기타', '10:55', 'OTHER'),
# ('2023-07-13', 15, '2024-11-06 02:07:03', 8, '2024-11-06 02:07:03', '후속 연락', 'N', '15:12', '커피 시음회', '발송 준비', '문의 응대', '9:29', 'ONLINE'),
# ('2023-04-12', 1, '2024-11-06 02:07:03', 14, '2024-11-06 02:07:03', '서비스 요청', 'N', '12:54', '샘플 요청', '발송 준비', '문의 응대', '8:55', 'ONLINE');