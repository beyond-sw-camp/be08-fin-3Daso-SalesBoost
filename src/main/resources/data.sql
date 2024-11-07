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

-- >>>>>>>>> 관리자
-- 프로세스
INSERT INTO tb_process(process_no, process_name, is_default, DESCRIPTION, created_at, updated_at, expected_duration)
VALUES (1, '기본영업프로세스', 1, '기회인지-상담-제안-협상-계약', CURDATE(), CURDATE(), 45),
       (2, '커피머신 영업 프로세스', 0, '제안-협상-계약', CURDATE(), CURDATE(), 30);

-- 서브프로세스
INSERT INTO tb_sub_process(sub_process_no, sub_process_name, progress_step, success_rate, ACTION, expected_duration, created_at, updated_at, process_no)
VALUES (1, '기회인지', '인지', 0, '인지', 5, CURDATE(), CURDATE(), 1),
       (2, '상담', '제안', 10, '제안', 10, CURDATE(), CURDATE(), 1),
       (3, '제안', '제안', 20, '제안', 5, CURDATE(), CURDATE(), 1),
       (4, '협상', '협상', 60, '견적', 5, CURDATE(), CURDATE(), 1),
       (5, '계약', '계약', 100, '계약', 20, CURDATE(), CURDATE(), 1),
       (6, '제안', '제안', 20, '제안', 5, CURDATE(), CURDATE(), 2),
       (7, '협상', '협상', 30, '견적', 5, CURDATE(), CURDATE(), 2),
       (8, '계약', '계약', 100, '계약', 20, CURDATE(), CURDATE(), 2);

-- 물품
INSERT INTO tb_product (prod_no, created_at, updated_at, abbr_name, dept_id, eng_name, field, name, price, prod_code, quantity, release_date, supply_price, tax_rate, unit, upp_group)
VALUES
    -- 커피 원두 제품
    (1, NOW(), NOW(), 'COFBRA001', 3, 'Rubia Dark Brown', '원두', '루비아 다크 브라운', 65000, 'BRA001', 100, '2024-05-01', 58670, 11, '봉지', '브라질 원두'),
    (2, NOW(), NOW(), 'COFCOL001', 3, 'Supremo Nariño', '원두', '수프레모 나리뇨', 46000, 'COL001', 90, '2024-07-01', 42779, 8, '봉지', '콜롬비아 원두'),
    (3, NOW(), NOW(), 'COFETH001', 3, 'Sidamo', '원두', '시다모', 45500, 'ETH001', 75, '2025-01-01', 40463, 	12, '봉지', '에티오피아 원두'),
    (4, NOW(), NOW(), 'COFETH001', 3, 'Yirgacheffe Abaya Geisha', '원두', '예가체프 아바야 게이샤', 65500, 'ETH001', 95, '2025-01-01', 57886, 13, '봉지', '에티오피아 원두'),
    (5, NOW(), NOW(), 'COFCOL001', 4, 'Melparai shouts', '원두', '멜파라이 소리치', 76000, 'COL001', 90, '2024-07-01', 71185, 7, '봉지', '콜롬비아 원두'),

    -- 커피 머신 제품
    (6, NOW(), NOW(), 'MCHESP001', 1, 'Espresso Groove Machine', '커피머신', '에스프레소 그루브 머신', 	1250000, 'ESP001', 20, '2024-06-01', 1181427, 6, '대', '에스프레소 머신'),
    (7, NOW(), NOW(), 'MCHDRP001', 1, 'Latte Twist Maker', '커피머신', '라떼 트위스트 메이커', 890000, 'DRP001', 15, '2024-07-01', 778981, 14, '대', '드립 커피 머신'),
    (8, NOW(), NOW(), 'MCHGRD001', 1, 'Divide Grinder', '그라인더', '갈려라 그라인더', 15000, 'GRD001', 30, '2024-08-01', 13566, 11, '대', '커피 그라인더'),

    -- 커피 관련 액세서리 제품
    (9, NOW(), NOW(), 'ACCFLT001', 4, 'Hang Coffee Filter', '액세서리', '걸려라 커피 필터', 12000, 'FLT001', 200, '2024-05-15', 10554, 14, '팩', '커피 필터'),
    (10, NOW(), NOW(), 'ACCTMB001', 4, 'Put It In Coffee Tumbler', '액세서리', '담아라 텀블러',	18000, 'TMB001', 50, '2024-09-01', 15754, 14, '개', '커피 텀블러');

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

-- >>>>>>>>>>>> 영업기회 <<<<<<<<<<<<<<
-- 영업기회
INSERT INTO tb_lead (created_at, updated_at, start_date, end_date, exp_sales, exp_profit, exp_margin, name, note, process, status, sub_process, success_per, aware_path, customer_no)
VALUES (NOW(), NOW(), '2023-12-01', '2024-01-15', 27900000, 13950000, 50, '커피왕 - 홍길동 원두 구매', '커피왕 - 홍길동 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'SUCCESS', 5, 100, 'NEWSPAPER', 1),
       (NOW(), NOW(), '2023-12-01', '2024-01-15', 26000000, 13000000, 50, '원두전문 - 김영희 원두 구매', '원두전문 - 김영희 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'SUCCESS', 5, 100, 'SEARCH', 2),
       (NOW(), NOW(), '2023-12-01', '2024-01-15', 25950000, 12975000, 50, '커피트레이드 - 박철수 원두 구매', '커피트레이드 - 박철수에게 제공되는 고급 원두와 커피머신 제안', 1, 'SUCCESS', 5, 100, 'EDUCATION', 3),
       (NOW(), NOW(), '2023-12-01', '2024-01-15', 27950000, 13975000, 50, '원두마켓 - 이승현 원두 구매', '원두마켓 - 이승현 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'SUCCESS', 5, 100, 'INTRODUCE', 4),
       (NOW(), NOW(), '2023-12-01', '2024-01-15', 29000000, 14500000, 50, '커피플랜트 - 정민수 원두 구매', '커피플랜트 - 정민수 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'SUCCESS', 5, 100, 'PARTNER', 5),
       (NOW(), NOW(), '2024-01-01', '2024-02-15', 27900000, 13950000, 50, '커피나무 - 서지수 원두 구매', '커피나무 - 서지수 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'SUCCESS', 5, 100,'ETC', 6),
       (NOW(), NOW(), '2024-01-01', '2024-02-15', 26000000, 13000000, 50, '원두가게 - 김도현 원두 구매', '원두가게 - 김도현 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'SUCCESS', 5, 100,'NEWSPAPER', 7),
       (NOW(), NOW(), '2024-01-01', '2024-02-15', 25950000, 12975000, 50, '커피스토어 - 최혜린 원두 구매', '커피스토어 - 최혜린 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'SUCCESS', 5, 100, 'SEARCH',8),
       (NOW(), NOW(), '2024-01-01', '2024-02-15', 27950000, 13975000, 50, '원두파머 - 한지원 원두 구매', '원두파머 - 한지원 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'SUCCESS', 5, 100, 'EDUCATION', 9),
       (NOW(), NOW(), '2024-02-01', '2024-03-17', 1410000, 987000, 70, '기존고객 원두 판매', '기존고객 다른 원두 판매', 1, 'SUCCESS', 5, 100, 'EXISTING', 2),
       (NOW(), NOW(), '2024-02-01', '2024-03-17', 1410000, 987000, 70, '기존고객 원두 판매', '기존고객 다른 원두 판매', 1, 'SUCCESS', 5, 100, 'EXISTING', 3),
       (NOW(), NOW(), '2024-02-01', '2024-03-17', 1410000, 987000, 70, '기존고객 원두 판매', '기존고객 다른 원두 판매', 1, 'SUCCESS', 5, 100, 'EXISTING', 5),
       (NOW(), NOW(), '2024-02-01', '2024-03-17', 29000000, 14500000, 50, '원두드림 - 장윤아 원두 구매', '원두드림 - 장윤아 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'SUCCESS', 5, 100, 'INTRODUCE', 10),
       (NOW(), NOW(), '2024-02-01', '2024-03-17', 27900000, 13950000, 50, '커피농장 - 고객11 원두 구매', '커피농장 - 고객11 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'SUCCESS', 5, 100, 'PARTNER', 11),
       (NOW(), NOW(), '2024-02-01', '2024-03-17', 26000000, 13000000, 50, '원두왕국 - 고객12 원두 구매', '원두왕국 - 고객12 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'SUCCESS', 5, 100, 'ETC',12),
       (NOW(), NOW(), '2024-02-01', '2024-03-17', 25950000, 12975000, 50, '바리스타 - 고객13 원두 구매', '바리스타 - 고객13 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'SUCCESS', 5, 100, 'NEWSPAPER',13),
       (NOW(), NOW(), '2024-03-01', '2024-04-15', 1410000, 987000, 70, '기존고객 원두 판매', '기존고객 다른 원두 판매', 1, 'FAIL', 2, 10, 'EXISTING', 6),
       (NOW(), NOW(), '2024-03-01', '2024-04-15', 1410000, 987000, 70, '기존고객 원두 판매', '기존고객 다른 원두 판매', 1, 'FAIL', 3, 20, 'EXISTING', 7),
       (NOW(), NOW(), '2024-03-01', '2024-04-15', 1410000, 987000, 70, '기존고객 원두 판매', '기존고객 다른 원두 판매', 1, 'HOLD', 4, 60, 'EXISTING', 9),
       (NOW(), NOW(), '2024-03-01', '2024-04-15', 27950000, 13975000, 50, '커피팜 - 고객14 원두 구매', '커피팜 - 고객14 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'SUCCESS', 5, 100, 'SEARCH',14),
       (NOW(), NOW(), '2024-03-01', '2024-04-15', 29000000, 14500000, 50, '원두해 - 고객15 원두 구매', '원두해 - 고객15 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'SUCCESS', 5, 100, 'SEARCH', 15),
       (NOW(), NOW(), '2024-03-01', '2024-04-15', 27900000, 13950000, 50, '커피향 - 고객16 원두 구매', '커피향 - 고객16 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'SUCCESS', 5, 100, 'INTRODUCE', 16),
       (NOW(), NOW(), '2024-03-01', '2024-04-15', 26000000, 13000000, 50, '원두콜렉션 - 고객17 원두 구매', '원두콜렉션 - 고객17 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'SUCCESS', 5, 100, 'PARTNER', 17),
       (NOW(), NOW(), '2024-04-01', '2024-05-16', 1410000, 987000, 70, '기존고객 원두 판매', '기존고객 다른 원두 판매', 1, 'SUCCESS', 5, 100, 'EXISTING', 10),
       (NOW(), NOW(), '2024-04-01', '2024-05-16', 1410000, 987000, 70, '기존고객 원두 판매', '기존고객 다른 원두 판매', 1, 'SUCCESS', 5, 100, 'EXISTING', 11),
       (NOW(), NOW(), '2024-04-01', '2024-05-16', 1410000, 987000, 70, '기존고객 원두 판매', '기존고객 다른 원두 판매', 1, 'SUCCESS', 5, 100, 'EXISTING', 13),
       (NOW(), NOW(), '2024-04-01', '2024-05-16', 25950000, 12975000, 50, '커피로드 - 고객18 원두 구매', '커피로드 - 고객18 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'SUCCESS', 5, 100, 'PARTNER', 18),
       (NOW(), NOW(), '2024-04-01', '2024-05-16', 27950000, 13975000, 50, '커피필드 - 고객19 원두 구매', '커피필드 - 고객19 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'SUCCESS', 5, 100, 'NEWSPAPER', 19),
       (NOW(), NOW(), '2024-04-01', '2024-05-16', 29000000, 14500000, 50, '원두농장 - 고객20 원두 구매', '원두농장 - 고객20 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'SUCCESS', 5, 100, 'PARTNER', 20),
       (NOW(), NOW(), '2024-04-01', '2024-05-16', 27900000, 13950000, 50, '커피의정원 - 고객21 원두 구매', '커피의정원 - 고객21 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'SUCCESS', 5, 100,'SEARCH',21),
       (NOW(), NOW(), '2024-05-01', '2024-06-15', 1410000, 987000, 70, '기존고객 원두 판매', '기존고객 다른 원두 판매', 1, 'HOLD', 2, 10, 'EXISTING', 18),
       (NOW(), NOW(), '2024-05-01', '2024-06-15', 1410000, 987000, 70, '기존고객 원두 판매', '기존고객 다른 원두 판매', 1, 'FAIL', 3, 20, 'EXISTING', 19),
       (NOW(), NOW(), '2024-05-01', '2024-06-15', 1410000, 987000, 70, '기존고객 원두 판매', '기존고객 다른 원두 판매', 1, 'HOLD', 4, 60, 'EXISTING', 20),
       (NOW(), NOW(), '2024-05-01', '2024-06-15', 26000000, 13000000, 50, '커피월드 - 고객22 원두 구매', '커피월드 - 고객22 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'SUCCESS', 5, 100,'EDUCATION',22),
       (NOW(), NOW(), '2024-05-01', '2024-06-15', 25950000, 12975000, 50, '원두유통 - 고객23 원두 구매', '원두유통 - 고객23 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'SUCCESS', 5, 100,'SEARCH',23),
       (NOW(), NOW(), '2024-05-01', '2024-06-15', 27950000, 13975000, 50, '커피와행복 - 고객24 원두 구매', '커피와행복 - 고객24 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'SUCCESS', 5, 100,'EDUCATION',24),
       (NOW(), NOW(), '2024-05-01', '2024-06-15', 29000000, 14500000, 50, '커피사랑 - 고객25 원두 구매', '커피사랑 - 고객25 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'SUCCESS', 5, 100,'EDUCATION',25),
       (NOW(), NOW(), '2024-06-01', '2024-07-16', 1410000, 987000, 70, '기존고객 원두 판매', '기존고객 다른 원두 판매', 1, 'SUCCESS', 5, 100, 'EXISTING', 22),
       (NOW(), NOW(), '2024-06-01', '2024-07-16', 1410000, 987000, 70, '기존고객 원두 판매', '기존고객 다른 원두 판매', 1, 'SUCCESS', 5, 100, 'EXISTING', 24),
       (NOW(), NOW(), '2024-06-01', '2024-07-16', 1410000, 987000, 70, '기존고객 원두 판매', '기존고객 다른 원두 판매', 1, 'SUCCESS', 5, 100, 'EXISTING', 25),
       (NOW(), NOW(), '2024-06-01', '2024-07-16', 27900000, 13950000, 50, '원두의고수 - 고객26 원두 구매', '원두의고수 - 고객26 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'SUCCESS', 5, 100,'EDUCATION',26),
       (NOW(), NOW(), '2024-06-01', '2024-07-16', 26000000, 13000000, 50, '커피도시 - 고객27 원두 구매', '커피도시 - 고객27 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'SUCCESS', 5, 100,'SEARCH',27),
       (NOW(), NOW(), '2024-06-01', '2024-07-16', 25950000, 12975000, 50, '원두의세계 - 고객28 원두 구매', '원두의세계 - 고객28 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'SUCCESS', 5, 100,'SEARCH',28),
       (NOW(), NOW(), '2024-06-01', '2024-07-16', 27950000, 13975000, 50, '커피에세이 - 고객29 원두 구매', '커피에세이 - 고객29 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'SUCCESS', 5, 100,'INTRODUCE',29),
       (NOW(), NOW(), '2024-07-01', '2024-08-15', 1410000, 987000, 70, '기존고객 원두 판매', '기존고객 다른 원두 판매', 1, 'FAIL', 2, 10, 'EXISTING', 27),
       (NOW(), NOW(), '2024-07-01', '2024-08-15', 1410000, 987000, 70, '기존고객 원두 판매', '기존고객 다른 원두 판매', 1, 'FAIL', 3, 20, 'EXISTING', 28),
       (NOW(), NOW(), '2024-07-01', '2024-08-15', 1410000, 987000, 70, '기존고객 원두 판매', '기존고객 다른 원두 판매', 1, 'FAIL', 4, 60, 'EXISTING', 29),
       (NOW(), NOW(), '2024-07-01', '2024-08-15', 29000000, 14500000, 50, '커피히어로 - 고객30 원두 구매', '커피히어로 - 고객30 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'SUCCESS', 5, 100,'SEARCH',30),
       (NOW(), NOW(), '2024-07-01', '2024-08-15', 27900000, 13950000, 50, '커피플랜트 - 고객31 원두 구매', '커피플랜트 - 고객31 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'SUCCESS', 5, 100,'INTRODUCE',31),
       (NOW(), NOW(), '2024-07-01', '2024-08-15', 26000000, 13000000, 50, '원두장터 - 고객32 원두 구매', '원두장터 - 고객32 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'SUCCESS', 5, 100,'PARTNER',32),
       (NOW(), NOW(), '2024-07-01', '2024-08-15', 25950000, 12975000, 50, '커피챔피언 - 고객33 원두 구매', '커피챔피언 - 고객33 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'SUCCESS', 5, 100,'PARTNER',33),
       (NOW(), NOW(), '2024-08-01', '2024-09-15', 1410000, 987000, 70, '기존고객 원두 판매', '기존고객 다른 원두 판매', 1, 'HOLD', 3, 20, 'EXISTING', 1),
       (NOW(), NOW(), '2024-08-01', '2024-09-15', 1410000, 987000, 70, '기존고객 원두 판매', '기존고객 다른 원두 판매', 1, 'SUCCESS', 5, 100, 'EXISTING', 1),
       (NOW(), NOW(), '2024-08-01', '2024-09-15', 1410000, 987000, 70, '기존고객 원두 판매', '기존고객 다른 원두 판매', 1, 'HOLD', 3, 20, 'EXISTING', 1),
       (NOW(), NOW(), '2024-08-01', '2024-09-15', 27950000, 13975000, 50, '커피스토어 - 고객34 원두 구매', '커피스토어 - 고객34 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'SUCCESS', 5, 100,'INTRODUCE',34),
       (NOW(), NOW(), '2024-08-01', '2024-09-15', 29000000, 14500000, 50, '원두박사 - 고객35 원두 구매', '원두박사 - 고객35 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'SUCCESS', 5, 100,'PARTNER',35),
       (NOW(), NOW(), '2024-08-01', '2024-09-15', 27900000, 13950000, 50, '커피로드 - 고객36 원두 구매', '커피로드 - 고객36 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'SUCCESS', 5, 100,'SEARCH',36),
       (NOW(), NOW(), '2024-08-01', '2024-09-15', 26000000, 13000000, 50, '커피유통 - 고객37 원두 구매', '커피유통 - 고객37 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'SUCCESS', 5, 100,'PARTNER',37),
       (NOW(), NOW(), '2024-09-01', '2024-10-16', 1410000, 987000, 70, '기존고객 원두 판매', '기존고객 다른 원두 판매', 1, 'FAIL', 2, 10, 'EXISTING', 34),
       (NOW(), NOW(), '2024-09-01', '2024-10-16', 1410000, 987000, 70, '기존고객 원두 판매', '기존고객 다른 원두 판매', 1, 'FAIL', 3, 20, 'EXISTING', 35),
       (NOW(), NOW(), '2024-09-01', '2024-10-16', 1410000, 987000, 70, '기존고객 원두 판매', '기존고객 다른 원두 판매', 1, 'FAIL', 4, 60, 'EXISTING', 36),
       (NOW(), NOW(), '2024-09-01', '2024-10-16', 25950000, 12975000, 50, '원두하우스 - 고객38 원두 구매', '원두하우스 - 고객38 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'SUCCESS', 5, 100,'SEARCH',38),
       (NOW(), NOW(), '2024-09-01', '2024-10-16', 27950000, 13975000, 50, '커피존 - 고객39 원두 구매', '커피존 - 고객39 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'SUCCESS', 5, 100,'INTRODUCE',39),
       (NOW(), NOW(), '2024-09-01', '2024-10-16', 29000000, 14500000, 50, '커피네이션 - 고객40 원두 구매', '커피네이션 - 고객40 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'SUCCESS', 5, 100,'PARTNER',40),
       (NOW(), NOW(), '2024-09-01', '2024-10-16', 27900000, 13950000, 50, '커피월드 - 고객41 원두 구매', '커피월드 - 고객41 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'SUCCESS', 5, 100,'INTRODUCE',41),
       (NOW(), NOW(), '2024-10-01', '2024-11-15', 1410000, 987000, 70, '기존고객 원두 판매', '기존고객 다른 원두 판매', 1, 'SUCCESS', 5, 100, 'EXISTING', 38),
       (NOW(), NOW(), '2024-10-01', '2024-11-15', 1410000, 987000, 70, '기존고객 원두 판매', '기존고객 다른 원두 판매', 1, 'SUCCESS', 5, 100, 'EXISTING', 40),
       (NOW(), NOW(), '2024-10-01', '2024-11-15', 1410000, 987000, 70, '기존고객 원두 판매', '기존고객 다른 원두 판매', 1, 'SUCCESS', 5, 100, 'EXISTING', 41),
       (NOW(), NOW(), '2024-10-01', '2024-11-15', 26000000, 13000000, 50, '원두사랑 - 고객42 원두 구매', '원두사랑 - 고객42 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'SUCCESS', 5, 100,'PARTNER',42),
       (NOW(), NOW(), '2024-10-01', '2024-11-15', 25950000, 12975000, 50, '커피천국 - 고객43 원두 구매', '커피천국 - 고객43 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'SUCCESS', 5, 100,'EDUCATION',43),
       (NOW(), NOW(), '2024-10-01', '2024-11-15', 27950000, 13975000, 50, '원두마을 - 고객44 원두 구매', '원두마을 - 고객44 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'SUCCESS', 5, 100,'SEARCH',44),
       (NOW(), NOW(), '2024-10-01', '2024-11-15', 29000000, 14500000, 50, '커피마켓 - 고객45 원두 구매', '커피마켓 - 고객45 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'SUCCESS', 5, 100,'PARTNER',45),
       (NOW(), NOW(), '2024-11-01', '2024-12-16', 1410000, 987000, 70, '기존고객 원두 판매', '기존고객 다른 원두 판매', 1, 'PROGRESS', 1, 0, 'EXISTING', 42),
       (NOW(), NOW(), '2024-11-01', '2024-12-16', 1410000, 987000, 70, '기존고객 원두 판매', '기존고객 다른 원두 판매', 1, 'PROGRESS', 1, 0, 'EXISTING', 43),
       (NOW(), NOW(), '2024-11-01', '2024-12-16', 1410000, 987000, 70, '기존고객 원두 판매', '기존고객 다른 원두 판매', 1, 'PROGRESS', 1, 0, 'EXISTING', 44),
       (NOW(), NOW(), '2024-11-01', '2024-12-16', 27900000, 13950000, 50, '커피천사 - 고객46 원두 구매', '커피천사 - 고객46 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'PROGRESS', 1, 0,'PARTNER',46),
       (NOW(), NOW(), '2024-11-01', '2024-12-16', 26000000, 13000000, 50, '원두천국 - 고객47 원두 구매', '원두천국 - 고객47 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'PROGRESS', 1, 0,'PARTNER',47),
       (NOW(), NOW(), '2024-11-01', '2024-12-16', 25950000, 12975000, 50, '커피존 - 고객48 원두 구매', '커피존 - 고객48 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'PROGRESS', 1, 0,'EDUCATION',48),
       (NOW(), NOW(), '2024-11-01', '2024-12-16', 27950000, 13975000, 50, '커피장인 - 고객49 원두 구매', '커피장인 - 고객49 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'PROGRESS', 1, 0,'SEARCH',49),
       (NOW(), NOW(), '2024-11-01', '2024-12-16', 29000000, 14500000, 50, '커피와함께 - 고객50 원두 구매', '커피와함께 - 고객50 고객에게 제공되는 고급 원두와 커피머신 제안', 1, 'PROGRESS', 1, 0,'EDUCATION',50) ;

-- 영업단계
INSERT INTO tb_step(complete_yn, complete_date, LEVEL, lead_no, sub_process_no)
VALUES ('Y', '2023-12-05', 0, 1, 1),
       ('Y', '2024-12-15', 1, 1, 2),
       ('Y', '2024-12-20', 2, 1, 3),
       ('Y', '2024-12-25', 3, 1, 4),
       ('Y', '2024-01-15', 4, 1, 5),
       ('Y', '2023-12-05', 0, 2, 1),
       ('Y', '2024-12-15', 1, 2, 2),
       ('Y', '2024-12-20', 2, 2, 3),
       ('Y', '2024-12-25', 3, 2, 4),
       ('Y', '2024-01-15', 4, 2, 5),
       ('Y', '2023-12-05', 0, 3, 1),
       ('Y', '2024-12-15', 1, 3, 2),
       ('Y', '2024-12-20', 2, 3, 3),
       ('Y', '2024-12-25', 3, 3, 4),
       ('Y', '2024-01-15', 4, 3, 5),
       ('Y', '2023-12-05', 0, 4, 1),
       ('Y', '2024-12-15', 1, 4, 2),
       ('Y', '2024-12-20', 2, 4, 3),
       ('Y', '2024-12-25', 3, 4, 4),
       ('Y', '2024-01-15', 4, 4, 5),
       ('Y', '2023-12-05', 0, 5, 1),
       ('Y', '2024-12-15', 1, 5, 2),
       ('Y', '2024-12-20', 2, 5, 3),
       ('Y', '2024-12-25', 3, 5, 4),
       ('Y', '2024-01-15', 4, 5, 5),
       ('Y', '2024-01-05', 0, 6, 1),
       ('Y', '2024-01-15', 1, 6, 2),
       ('Y', '2024-01-20', 2, 6, 3),
       ('Y', '2024-01-25', 3, 6, 4),
       ('Y', '2024-02-15', 4, 6, 5),
       ('Y', '2024-01-05', 0, 7, 1),
       ('Y', '2024-01-15', 1, 7, 2),
       ('Y', '2024-01-20', 2, 7, 3),
       ('Y', '2024-01-25', 3, 7, 4),
       ('Y', '2024-02-15', 4, 7, 5),
       ('Y', '2024-01-05', 0, 8, 1),
       ('Y', '2024-01-15', 1, 8, 2),
       ('Y', '2024-01-20', 2, 8, 3),
       ('Y', '2024-01-25', 3, 8, 4),
       ('Y', '2024-02-15', 4, 8, 5),
       ('Y', '2024-01-05', 0, 9, 1),
       ('Y', '2024-01-15', 1, 9, 2),
       ('Y', '2024-01-20', 2, 9, 3),
       ('Y', '2024-01-25', 3, 9, 4),
       ('Y', '2024-02-15', 4, 9, 5),
       ('Y', '2024-02-05', 0, 10, 1),
       ('Y', '2024-02-15', 1, 10, 2),
       ('Y', '2024-02-20', 2, 10, 3),
       ('Y', '2024-02-25', 3, 10, 4),
       ('Y', '2024-03-17', 4, 10, 5),
       ('Y', '2024-02-05', 0, 11, 1),
       ('Y', '2024-02-15', 1, 11, 2),
       ('Y', '2024-02-20', 2, 11, 3),
       ('Y', '2024-02-25', 3, 11, 4),
       ('Y', '2024-03-17', 4, 11, 5),
       ('Y', '2024-02-05', 0, 12, 1),
       ('Y', '2024-02-15', 1, 12, 2),
       ('Y', '2024-02-20', 2, 12, 3),
       ('Y', '2024-02-25', 3, 12, 4),
       ('Y', '2024-03-17', 4, 12, 5),
       ('Y', '2024-02-05', 0, 13, 1),
       ('Y', '2024-02-15', 1, 13, 2),
       ('Y', '2024-02-20', 2, 13, 3),
       ('Y', '2024-02-25', 3, 13, 4),
       ('Y', '2024-03-17', 4, 13, 5),
       ('Y', '2024-02-05', 0, 14, 1),
       ('Y', '2024-02-15', 1, 14, 2),
       ('Y', '2024-02-20', 2, 14, 3),
       ('Y', '2024-02-25', 3, 14, 4),
       ('Y', '2024-03-17', 4, 14, 5),
       ('Y', '2024-02-05', 0, 15, 1),
       ('Y', '2024-02-15', 1, 15, 2),
       ('Y', '2024-02-20', 2, 15, 3),
       ('Y', '2024-02-25', 3, 15, 4),
       ('Y', '2024-03-17', 4, 15, 5),
       ('Y', '2024-02-05', 0, 16, 1),
       ('Y', '2024-02-15', 1, 16, 2),
       ('Y', '2024-02-20', 2, 16, 3),
       ('Y', '2024-02-25', 3, 16, 4),
       ('Y', '2024-03-17', 4, 16, 5),
       ('Y', '2024-03-05', 0, 17, 1),
       ('Y', '2024-03-15', 1, 17, 2),
       ('N', NULL, 2, 17, 3),
       ('N', NULL, 3, 17, 4),
       ('N', NULL, 4, 17, 5),
       ('Y', '2024-03-05', 0, 18, 1),
       ('Y', '2024-03-15', 1, 18, 2),
       ('Y', '2024-03-20', 2, 18, 3),
       ('N', NULL, 3, 18, 4),
       ('N', NULL, 4, 18, 5),
       ('Y', '2024-03-05', 0, 19, 1),
       ('Y', '2024-03-15', 1, 19, 2),
       ('Y', '2024-03-20', 2, 19, 3),
       ('Y', '2024-03-25', 3, 19, 4),
       ('N', NULL, 4, 19, 5),
       ('Y', '2024-03-05', 0, 20, 1),
       ('Y', '2024-03-15', 1, 20, 2),
       ('Y', '2024-03-20', 2, 20, 3),
       ('Y', '2024-03-25', 3, 20, 4),
       ('Y', '2024-04-15', 4, 20, 5),
       ('Y', '2024-03-05', 0, 21, 1),
       ('Y', '2024-03-15', 1, 21, 2),
       ('Y', '2024-03-20', 2, 21, 3),
       ('Y', '2024-03-25', 3, 21, 4),
       ('Y', '2024-04-15', 4, 21, 5),
       ('Y', '2024-03-05', 0, 22, 1),
       ('Y', '2024-03-15', 1, 22, 2),
       ('Y', '2024-03-20', 2, 22, 3),
       ('Y', '2024-03-25', 3, 22, 4),
       ('Y', '2024-04-15', 4, 22, 5),
       ('Y', '2024-03-05', 0, 23, 1),
       ('Y', '2024-03-15', 1, 23, 2),
       ('Y', '2024-03-20', 2, 23, 3),
       ('Y', '2024-03-25', 3, 23, 4),
       ('Y', '2024-04-15', 4, 23, 5),
       ('Y', '2024-04-05', 0, 24, 1),
       ('Y', '2024-04-15', 1, 24, 2),
       ('Y', '2024-04-20', 2, 24, 3),
       ('Y', '2024-04-25', 3, 24, 4),
       ('Y', '2024-05-16', 4, 24, 5),
       ('Y', '2024-04-05', 0, 25, 1),
       ('Y', '2024-04-15', 1, 25, 2),
       ('Y', '2024-04-20', 2, 25, 3),
       ('Y', '2024-04-25', 3, 25, 4),
       ('Y', '2024-05-16', 4, 25, 5),
       ('Y', '2024-04-05', 0, 26, 1),
       ('Y', '2024-04-15', 1, 26, 2),
       ('Y', '2024-04-20', 2, 26, 3),
       ('Y', '2024-04-25', 3, 26, 4),
       ('Y', '2024-05-16', 4, 26, 5),
       ('Y', '2024-04-05', 0, 27, 1),
       ('Y', '2024-04-15', 1, 27, 2),
       ('Y', '2024-04-20', 2, 27, 3),
       ('Y', '2024-04-25', 3, 27, 4),
       ('Y', '2024-05-16', 4, 27, 5),
       ('Y', '2024-04-05', 0, 28, 1),
       ('Y', '2024-04-15', 1, 28, 2),
       ('Y', '2024-04-20', 2, 28, 3),
       ('Y', '2024-04-25', 3, 28, 4),
       ('Y', '2024-05-16', 4, 28, 5),
       ('Y', '2024-04-05', 0, 29, 1),
       ('Y', '2024-04-15', 1, 29, 2),
       ('Y', '2024-04-20', 2, 29, 3),
       ('Y', '2024-04-25', 3, 29, 4),
       ('Y', '2024-05-16', 4, 29, 5),
       ('Y', '2024-04-05', 0, 30, 1),
       ('Y', '2024-04-15', 1, 30, 2),
       ('Y', '2024-04-20', 2, 30, 3),
       ('Y', '2024-04-25', 3, 30, 4),
       ('Y', '2024-05-16', 4, 30, 5),
       ('Y', '2024-05-05', 0, 31, 1),
       ('Y', '2024-05-15', 1, 31, 2),
       ('N', NULL, 2, 31, 3),
       ('N', NULL, 3, 31, 4),
       ('N', NULL, 4, 31, 5),
       ('Y', '2024-05-05', 0, 32, 1),
       ('Y', '2024-05-15', 1, 32, 2),
       ('Y', '2024-05-20', 2, 32, 3),
       ('N', NULL, 3, 32, 4),
       ('N', NULL, 4, 32, 5),
       ('Y', '2024-05-05', 0, 33, 1),
       ('Y', '2024-05-15', 1, 33, 2),
       ('Y', '2024-05-20', 2, 33, 3),
       ('Y', '2024-05-25', 3, 33, 4),
       ('N', NULL, 4, 33, 5),
       ('Y', '2024-05-05', 0, 34, 1),
       ('Y', '2024-05-15', 1, 34, 2),
       ('Y', '2024-05-20', 2, 34, 3),
       ('Y', '2024-05-25', 3, 34, 4),
       ('Y', '2024-06-15', 4, 34, 5),
       ('Y', '2024-05-05', 0, 35, 1),
       ('Y', '2024-05-15', 1, 35, 2),
       ('Y', '2024-05-20', 2, 35, 3),
       ('Y', '2024-05-25', 3, 35, 4),
       ('Y', '2024-06-15', 4, 35, 5),
       ('Y', '2024-05-05', 0, 36, 1),
       ('Y', '2024-05-15', 1, 36, 2),
       ('Y', '2024-05-20', 2, 36, 3),
       ('Y', '2024-05-25', 3, 36, 4),
       ('Y', '2024-06-15', 4, 36, 5),
       ('Y', '2024-05-05', 0, 37, 1),
       ('Y', '2024-05-15', 1, 37, 2),
       ('Y', '2024-05-20', 2, 37, 3),
       ('Y', '2024-05-25', 3, 37, 4),
       ('Y', '2024-06-15', 4, 37, 5),
       ('Y', '2024-06-05', 0, 38, 1),
       ('Y', '2024-06-15', 1, 38, 2),
       ('Y', '2024-06-20', 2, 38, 3),
       ('Y', '2024-06-25', 3, 38, 4),
       ('Y', '2024-07-16', 4, 38, 5),
       ('Y', '2024-06-05', 0, 39, 1),
       ('Y', '2024-06-15', 1, 39, 2),
       ('Y', '2024-06-20', 2, 39, 3),
       ('Y', '2024-06-25', 3, 39, 4),
       ('Y', '2024-07-16', 4, 39, 5),
       ('Y', '2024-06-05', 0, 40, 1),
       ('Y', '2024-06-15', 1, 40, 2),
       ('Y', '2024-06-20', 2, 40, 3),
       ('Y', '2024-06-25', 3, 40, 4),
       ('Y', '2024-07-16', 4, 40, 5),
       ('Y', '2024-06-05', 0, 41, 1),
       ('Y', '2024-06-15', 1, 41, 2),
       ('Y', '2024-06-20', 2, 41, 3),
       ('Y', '2024-06-25', 3, 41, 4),
       ('Y', '2024-07-16', 4, 41, 5),
       ('Y', '2024-06-05', 0, 42, 1),
       ('Y', '2024-06-15', 1, 42, 2),
       ('Y', '2024-06-20', 2, 42, 3),
       ('Y', '2024-06-25', 3, 42, 4),
       ('Y', '2024-07-16', 4, 42, 5),
       ('Y', '2024-06-05', 0, 43, 1),
       ('Y', '2024-06-15', 1, 43, 2),
       ('Y', '2024-06-20', 2, 43, 3),
       ('Y', '2024-06-25', 3, 43, 4),
       ('Y', '2024-07-16', 4, 43, 5),
       ('Y', '2024-06-05', 0, 44, 1),
       ('Y', '2024-06-15', 1, 44, 2),
       ('Y', '2024-06-20', 2, 44, 3),
       ('Y', '2024-06-25', 3, 44, 4),
       ('Y', '2024-07-16', 4, 44, 5),
       ('Y', '2024-07-05', 0, 45, 1),
       ('Y', '2024-07-15', 1, 45, 2),
       ('N', NULL, 2, 45, 3),
       ('N', NULL, 3, 45, 4),
       ('N', NULL, 4, 45, 5),
       ('Y', '2024-07-05', 0, 46, 1),
       ('Y', '2024-07-15', 1, 46, 2),
       ('Y', '2024-07-20', 2, 46, 3),
       ('N', NULL, 3, 46, 4),
       ('N', NULL, 4, 46, 5),
       ('Y', '2024-07-05', 0, 47, 1),
       ('Y', '2024-07-15', 1, 47, 2),
       ('Y', '2024-07-20', 2, 47, 3),
       ('Y', '2024-07-25', 3, 47, 4),
       ('N', NULL, 4, 47, 5),
       ('Y', '2024-07-05', 0, 48, 1),
       ('Y', '2024-07-15', 1, 48, 2),
       ('Y', '2024-07-20', 2, 48, 3),
       ('Y', '2024-07-25', 3, 48, 4),
       ('Y', '2024-08-15', 4, 48, 5),
       ('Y', '2024-07-05', 0, 49, 1),
       ('Y', '2024-07-15', 1, 49, 2),
       ('Y', '2024-07-20', 2, 49, 3),
       ('Y', '2024-07-25', 3, 49, 4),
       ('Y', '2024-08-15', 4, 49, 5),
       ('Y', '2024-07-05', 0, 50, 1),
       ('Y', '2024-07-15', 1, 50, 2),
       ('Y', '2024-07-20', 2, 50, 3),
       ('Y', '2024-07-25', 3, 50, 4),
       ('Y', '2024-08-15', 4, 50, 5),
       ('Y', '2024-07-05', 0, 51, 1),
       ('Y', '2024-07-15', 1, 51, 2),
       ('Y', '2024-07-20', 2, 51, 3),
       ('Y', '2024-07-25', 3, 51, 4),
       ('Y', '2024-08-15', 4, 51, 5),
       ('Y', '2024-08-05', 0, 52, 1),
       ('Y', '2024-08-15', 1, 52, 2),
       ('Y', '2024-08-20', 2, 52, 3),
       ('N', NULL, 3, 52, 4),
       ('N', NULL, 4, 52, 5),
       ('Y', '2024-08-05', 0, 53, 1),
       ('Y', '2024-08-15', 1, 53, 2),
       ('Y', '2024-08-20', 2, 53, 3),
       ('Y', '2024-08-25', 3, 53, 4),
       ('Y', '2024-09-15', 4, 53, 5),
       ('Y', '2024-08-05', 0, 54, 1),
       ('Y', '2024-08-15', 1, 54, 2),
       ('Y', '2024-08-20', 2, 54, 3),
       ('N', NULL, 3, 54, 4),
       ('N', NULL, 4, 54, 5),
       ('Y', '2024-08-05', 0, 55, 1),
       ('Y', '2024-08-15', 1, 55, 2),
       ('Y', '2024-08-20', 2, 55, 3),
       ('Y', '2024-08-25', 3, 55, 4),
       ('Y', '2024-09-15', 4, 55, 5),
       ('Y', '2024-08-05', 0, 56, 1),
       ('Y', '2024-08-15', 1, 56, 2),
       ('Y', '2024-08-20', 2, 56, 3),
       ('Y', '2024-08-25', 3, 56, 4),
       ('Y', '2024-09-15', 4, 56, 5),
       ('Y', '2024-08-05', 0, 57, 1),
       ('Y', '2024-08-15', 1, 57, 2),
       ('Y', '2024-08-20', 2, 57, 3),
       ('Y', '2024-08-25', 3, 57, 4),
       ('Y', '2024-09-15', 4, 57, 5),
       ('Y', '2024-08-05', 0, 58, 1),
       ('Y', '2024-08-15', 1, 58, 2),
       ('Y', '2024-08-20', 2, 58, 3),
       ('Y', '2024-08-25', 3, 58, 4),
       ('Y', '2024-09-15', 4, 58, 5),
       ('Y', '2024-09-05', 0, 59, 1),
       ('Y', '2024-09-15', 1, 59, 2),
       ('N', NULL, 2, 59, 3),
       ('N', NULL, 3, 59, 4),
       ('N', NULL, 4, 59, 5),
       ('Y', '2024-09-05', 0, 60, 1),
       ('Y', '2024-09-15', 1, 60, 2),
       ('Y', '2024-09-20', 2, 60, 3),
       ('N', NULL, 3, 60, 4),
       ('N', NULL, 4, 60, 5),
       ('Y', '2024-09-05', 0, 61, 1),
       ('Y', '2024-09-15', 1, 61, 2),
       ('Y', '2024-09-20', 2, 61, 3),
       ('Y', '2024-09-25', 3, 61, 4),
       ('N', NULL, 4, 61, 5),
       ('Y', '2024-09-05', 0, 62, 1),
       ('Y', '2024-09-15', 1, 62, 2),
       ('Y', '2024-09-20', 2, 62, 3),
       ('Y', '2024-09-25', 3, 62, 4),
       ('Y', '2024-10-16', 4, 62, 5),
       ('Y', '2024-09-05', 0, 63, 1),
       ('Y', '2024-09-15', 1, 63, 2),
       ('Y', '2024-09-20', 2, 63, 3),
       ('Y', '2024-09-25', 3, 63, 4),
       ('Y', '2024-10-16', 4, 63, 5),
       ('Y', '2024-09-05', 0, 64, 1),
       ('Y', '2024-09-15', 1, 64, 2),
       ('Y', '2024-09-20', 2, 64, 3),
       ('Y', '2024-09-25', 3, 64, 4),
       ('Y', '2024-10-16', 4, 64, 5),
       ('Y', '2024-09-05', 0, 65, 1),
       ('Y', '2024-09-15', 1, 65, 2),
       ('Y', '2024-09-20', 2, 65, 3),
       ('Y', '2024-09-25', 3, 65, 4),
       ('Y', '2024-10-16', 4, 65, 5),
       ('Y', '2024-10-05', 0, 66, 1),
       ('Y', '2024-10-15', 1, 66, 2),
       ('Y', '2024-10-20', 2, 66, 3),
       ('Y', '2024-10-25', 3, 66, 4),
       ('Y', '2024-11-15', 4, 66, 5),
       ('Y', '2024-10-05', 0, 67, 1),
       ('Y', '2024-10-15', 1, 67, 2),
       ('Y', '2024-10-20', 2, 67, 3),
       ('Y', '2024-10-25', 3, 67, 4),
       ('Y', '2024-11-15', 4, 67, 5),
       ('Y', '2024-10-05', 0, 68, 1),
       ('Y', '2024-10-15', 1, 68, 2),
       ('Y', '2024-10-20', 2, 68, 3),
       ('Y', '2024-10-25', 3, 68, 4),
       ('Y', '2024-11-15', 4, 68, 5),
       ('Y', '2024-10-05', 0, 69, 1),
       ('Y', '2024-10-15', 1, 69, 2),
       ('Y', '2024-10-20', 2, 69, 3),
       ('Y', '2024-10-25', 3, 69, 4),
       ('Y', '2024-11-15', 4, 69, 5),
       ('Y', '2024-10-05', 0, 70, 1),
       ('Y', '2024-10-15', 1, 70, 2),
       ('Y', '2024-10-20', 2, 70, 3),
       ('Y', '2024-10-25', 3, 70, 4),
       ('Y', '2024-11-15', 4, 70, 5),
       ('Y', '2024-10-05', 0, 71, 1),
       ('Y', '2024-10-15', 1, 71, 2),
       ('Y', '2024-10-20', 2, 71, 3),
       ('Y', '2024-10-25', 3, 71, 4),
       ('Y', '2024-11-15', 4, 71, 5),
       ('Y', '2024-10-05', 0, 72, 1),
       ('Y', '2024-10-15', 1, 72, 2),
       ('Y', '2024-10-20', 2, 72, 3),
       ('Y', '2024-10-25', 3, 72, 4),
       ('Y', '2024-11-15', 4, 72, 5),
       ('Y', '2024-11-05', 0, 73, 1),
       ('N', NULL, 1, 73, 2),
       ('N', NULL, 2, 73, 3),
       ('N', NULL, 3, 73, 4),
       ('N', NULL, 4, 73, 5),
       ('Y', '2024-11-05', 0, 74, 1),
       ('N', NULL, 1, 74, 2),
       ('N', NULL, 2, 74, 3),
       ('N', NULL, 3, 74, 4),
       ('N', NULL, 4, 74, 5),
       ('Y', '2024-11-05', 0, 75, 1),
       ('N', NULL, 1, 75, 2),
       ('N', NULL, 2, 75, 3),
       ('N', NULL, 3, 75, 4),
       ('N', NULL, 4, 75, 5),
       ('Y', '2024-11-05', 0, 76, 1),
       ('N', NULL, 1, 76, 2),
       ('N', NULL, 2, 76, 3),
       ('N', NULL, 3, 76, 4),
       ('N', NULL, 4, 76, 5),
       ('Y', '2024-11-05', 0, 77, 1),
       ('N', NULL, 1, 77, 2),
       ('N', NULL, 2, 77, 3),
       ('N', NULL, 3, 77, 4),
       ('N', NULL, 4, 77, 5),
       ('Y', '2024-11-05', 0, 78, 1),
       ('N', NULL, 1, 78, 2),
       ('N', NULL, 2, 78, 3),
       ('N', NULL, 3, 78, 4),
       ('N', NULL, 4, 78, 5),
       ('Y', '2024-11-05', 0, 79, 1),
       ('N', NULL, 1, 79, 2),
       ('N', NULL, 2, 79, 3),
       ('N', NULL, 3, 79, 4),
       ('N', NULL, 4, 79, 5),
       ('Y', '2024-11-05', 0, 80, 1),
       ('N', NULL, 1, 80, 2),
       ('N', NULL, 2, 80, 3),
       ('N', NULL, 3, 80, 4),
       ('N', NULL, 4, 80, 5) ;

-- >>>>>>>>>>>> 영업활동 @uzz99 <<<<<<<<<<<<<<

INSERT INTO `tb_act` (act_date, calendar_no, created_at, lead_no, updated_at, act_cont, complete_yn, end_time, name, plan_cont, purpose, start_time, cls) VALUES
 ('2024-11-11', 15, '2024-11-06 02:07:03', 44, '2024-11-06 02:07:03', '제품 문의', 'N', '10:25', '프로모션 상담', '발송 준비', '문의 응대', '15:53', 'ONLINE'),
 ('2024-11-18', 4, '2024-11-06 02:07:03', 7, '2024-11-06 02:07:03', '후속 연락', 'Y', '15:47', '커피 시음회', '제품 테스트', '구매 상담', '10:56', 'ONLINE'),
 ('2024-11-18', 4, '2024-11-06 02:07:03', 25, '2024-11-06 02:07:03', '일정 조정', 'N', '14:37', '샘플 요청', '발송 준비', '문의 응대', '13:40', 'ONLINE'),
 ('2024-11-07', 4, '2024-11-06 02:07:03', 29, '2024-11-06 02:07:03', '서비스 요청', 'N', '16:16', '프로모션 상담', '발송 준비', '문의 응대', '13:34', 'EMAIL'),
 ('2024-11-21', 15, '2024-11-06 02:07:03', 43, '2024-11-06 02:07:03', '후속 연락', 'Y', '14:08', '재구매 상담', '발송 준비', '구매 상담', '10:28', 'OTHER'),
 ('2024-11-20', 4, '2024-11-06 02:07:03', 38, '2024-11-06 02:07:03', '상담 요청', 'N', '14:11', '프로모션 상담', '추가 상담 예정', '기타', '9:54', 'EMAIL'),
 ('2024-11-28', 1, '2024-11-06 02:07:03', 8, '2024-11-06 02:07:03', '제품 문의', 'Y', '17:51', '커피 시음회', '발송 준비', '구매 상담', '14:45', 'ONLINE'),
 ('2024-11-19', 15, '2024-11-06 02:07:03', 37, '2024-11-06 02:07:03', '서비스 요청', 'Y', '13:06', '신제품 발표', '제품 테스트', '기타', '15:14', 'EMAIL'),
 ('2024-11-18', 1, '2024-11-06 02:07:03', 29, '2024-11-06 02:07:03', '일정 조정', 'Y', '17:55', '신제품 발표', '추가 상담 예정', '기타', '14:02', 'EMAIL'),
 ('2023-09-04', 9, '2024-11-06 02:07:03', 26, '2024-11-06 02:07:03', '제품 문의', 'Y', '11:09', '샘플 요청', '추가 상담 예정', '기타', '18:50', 'ONLINE'),
 ('2023-08-02', 15, '2024-11-06 02:07:03', 5, '2024-11-06 02:07:03', '서비스 요청', 'Y', '11:38', '재구매 상담', '발송 준비', '구매 상담', '12:34', 'OTHER'),
 ('2024-07-18', 1, '2024-11-06 02:07:03', 47, '2024-11-06 02:07:03', '서비스 요청', 'N', '17:06', '커피 시음회', '제품 테스트', '기타', '12:13', 'VISIT'),
 ('2023-01-31', 1, '2024-11-06 02:07:03', 44, '2024-11-06 02:07:03', '상담 요청', 'Y', '13:18', '신제품 발표', '발송 준비', '기타', '8:32', 'ONLINE'),
 ('2022-05-23', 1, '2024-11-06 02:07:03', 18, '2024-11-06 02:07:03', '제품 문의', 'N', '16:28', '프로모션 상담', '발송 준비', '구매 상담', '18:14', 'EMAIL'),
 ('2024-02-15', 14, '2024-11-06 02:07:03', 34, '2024-11-06 02:07:03', '후속 연락', 'Y', '8:48', '샘플 요청', '제품 테스트', '기타', '18:25', 'OTHER'),
 ('2023-10-25', 9, '2024-11-06 02:07:03', 29, '2024-11-06 02:07:03', '일정 조정', 'Y', '10:01', '신제품 발표', '발송 준비', '기타', '12:26', 'PHONE'),
 ('2023-01-07', 1, '2024-11-06 02:07:03', 15, '2024-11-06 02:07:03', '서비스 요청', 'Y', '10:58', '신제품 발표', '추가 상담 예정', '문의 응대', '14:34', 'OTHER'),
 ('2022-06-28', 10, '2024-11-06 02:07:03', 39, '2024-11-06 02:07:03', '서비스 요청', 'N', '12:55', '프로모션 상담', '추가 상담 예정', '구매 상담', '12:40', 'PHONE'),
 ('2023-11-13', 8, '2024-11-06 02:07:03', 29, '2024-11-06 02:07:03', '서비스 요청', 'Y', '14:05', '재구매 상담', '발송 준비', '기타', '10:12', 'OTHER'),
 ('2022-12-16', 8, '2024-11-06 02:07:03', 42, '2024-11-06 02:07:03', '후속 연락', 'Y', '14:05', '신제품 발표', '추가 상담 예정', '구매 상담', '17:57', 'VISIT'),
 ('2023-06-09', 14, '2024-11-06 02:07:03', 12, '2024-11-06 02:07:03', '상담 요청', 'N', '17:25', '샘플 요청', '제품 테스트', '구매 상담', '13:12', 'VISIT'),
 ('2023-04-25', 1, '2024-11-06 02:07:03', 4, '2024-11-06 02:07:03', '서비스 요청', 'N', '13:26', '샘플 요청', '발송 준비', '문의 응대', '12:37', 'OTHER'),
 ('2023-05-14', 1, '2024-11-06 02:07:03', 17, '2024-11-06 02:07:03', '후속 연락', 'N', '11:48', '프로모션 상담', '발송 준비', '문의 응대', '13:30', 'PHONE'),
 ('2023-01-13', 1, '2024-11-06 02:07:03', 18, '2024-11-06 02:07:03', '후속 연락', 'Y', '18:05', '신제품 발표', '제품 테스트', '기타', '10:32', 'ONLINE'),
 ('2022-06-28', 4, '2024-11-06 02:07:03', 34, '2024-11-06 02:07:03', '상담 요청', 'N', '8:24', '커피 시음회', '제품 테스트', '구매 상담', '18:41', 'PHONE'),
 ('2024-07-17', 12, '2024-11-06 02:07:03', 3, '2024-11-06 02:07:03', '제품 문의', 'Y', '8:01', '커피 시음회', '발송 준비', '기타', '13:46', 'PHONE'),
 ('2022-03-09', 13, '2024-11-06 02:07:03', 9, '2024-11-06 02:07:03', '후속 연락', 'N', '11:36', '신제품 발표', '발송 준비', '문의 응대', '9:22', 'VISIT'),
 ('2022-04-06', 1, '2024-11-06 02:07:03', 7, '2024-11-06 02:07:03', '제품 문의', 'N', '8:51', '신제품 발표', '추가 상담 예정', '문의 응대', '8:35', 'VISIT'),
 ('2024-11-20', 2, '2024-11-06 02:07:03', 24, '2024-11-06 02:07:03', '서비스 요청', 'Y', '17:30', '커피 시음회', '추가 상담 예정', '문의 응대', '15:45', 'VISIT'),
 ('2022-12-13', 14, '2024-11-06 02:07:03', 22, '2024-11-06 02:07:03', '후속 연락', 'Y', '16:54', '프로모션 상담', '제품 테스트', '구매 상담', '12:06', 'OTHER'),
 ('2023-10-08', 1, '2024-11-06 02:07:03', 29, '2024-11-06 02:07:03', '일정 조정', 'Y', '11:52', '신제품 발표', '제품 테스트', '기타', '15:44', 'VISIT'),
 ('2023-10-21', 8, '2024-11-06 02:07:03', 9, '2024-11-06 02:07:03', '서비스 요청', 'N', '15:35', '신제품 발표', '발송 준비', '구매 상담', '17:33', 'ONLINE'),
 ('2024-11-16', 2, '2024-11-06 02:07:03', 10, '2024-11-06 02:07:03', '제품 문의', 'N', '17:57', '프로모션 상담', '발송 준비', '구매 상담', '18:15', 'PHONE'),
 ('2023-08-11', 10, '2024-11-06 02:07:03', 25, '2024-11-06 02:07:03', '서비스 요청', 'Y', '16:27', '커피 시음회', '제품 테스트', '구매 상담', '11:46', 'PHONE'),
 ('2022-01-30', 1, '2024-11-06 02:07:03', 34, '2024-11-06 02:07:03', '제품 문의', 'Y', '11:49', '샘플 요청', '추가 상담 예정', '구매 상담', '17:14', 'PHONE'),
 ('2024-03-25', 14, '2024-11-06 02:07:03', 45, '2024-11-06 02:07:03', '상담 요청', 'N', '15:44', '신제품 발표', '발송 준비', '기타', '15:19', 'PHONE'),
 ('2024-01-04', 14, '2024-11-06 02:07:03', 3, '2024-11-06 02:07:03', '일정 조정', 'N', '16:44', '샘플 요청', '추가 상담 예정', '구매 상담', '15:47', 'OTHER'),
 ('2022-08-28', 14, '2024-11-06 02:07:03', 5, '2024-11-06 02:07:03', '후속 연락', 'Y', '14:31', '샘플 요청', '추가 상담 예정', '기타', '14:19', 'VISIT'),
 ('2022-10-16', 3, '2024-11-06 02:07:03', 1, '2024-11-06 02:07:03', '일정 조정', 'N', '16:32', '신제품 발표', '추가 상담 예정', '기타', '18:19', 'ONLINE'),
 ('2022-09-26', 1, '2024-11-06 02:07:03', 36, '2024-11-06 02:07:03', '일정 조정', 'Y', '11:06', '프로모션 상담', '발송 준비', '구매 상담', '10:53', 'ONLINE'),
 ('2022-07-05', 14, '2024-11-06 02:07:03', 41, '2024-11-06 02:07:03', '일정 조정', 'N', '14:56', '커피 시음회', '추가 상담 예정', '문의 응대', '9:27', 'ONLINE'),
 ('2023-02-28', 1, '2024-11-06 02:07:03', 32, '2024-11-06 02:07:03', '서비스 요청', 'N', '17:04', '커피 시음회', '발송 준비', '기타', '10:40', 'PHONE'),
 ('2023-12-20', 10, '2024-11-06 02:07:03', 35, '2024-11-06 02:07:03', '일정 조정', 'Y', '11:42', '프로모션 상담', '추가 상담 예정', '기타', '10:24', 'EMAIL'),
 ('2024-11-27', 14, '2024-11-06 02:07:03', 44, '2024-11-06 02:07:03', '서비스 요청', 'N', '18:03', '신제품 발표', '제품 테스트', '기타', '14:26', 'ONLINE'),
 ('2024-09-15', 10, '2024-11-06 02:07:03', 11, '2024-11-06 02:07:03', '제품 문의', 'Y', '17:53', '샘플 요청', '추가 상담 예정', '기타', '12:08', 'PHONE'),
 ('2022-10-05', 1, '2024-11-06 02:07:03', 42, '2024-11-06 02:07:03', '상담 요청', 'Y', '13:07', '재구매 상담', '추가 상담 예정', '문의 응대', '9:32', 'PHONE'),
 ('2022-11-24', 14, '2024-11-06 02:07:03', 40, '2024-11-06 02:07:03', '후속 연락', 'Y', '15:49', '프로모션 상담', '발송 준비', '문의 응대', '18:05', 'OTHER'),
 ('2024-09-12', 5, '2024-11-06 02:07:03', 47, '2024-11-06 02:07:03', '후속 연락', 'N', '12:09', '재구매 상담', '추가 상담 예정', '구매 상담', '18:28', 'EMAIL'),
 ('2023-11-24', 5, '2024-11-06 02:07:03', 49, '2024-11-06 02:07:03', '서비스 요청', 'N', '8:03', '신제품 발표', '추가 상담 예정', '문의 응대', '16:09', 'VISIT'),
 ('2023-02-19', 15, '2024-11-06 02:07:03', 26, '2024-11-06 02:07:03', '후속 연락', 'Y', '11:42', '프로모션 상담', '발송 준비', '구매 상담', '12:52', 'VISIT'),
 ('2024-02-06', 15, '2024-11-06 02:07:03', 38, '2024-11-06 02:07:03', '일정 조정', 'Y', '10:18', '신제품 발표', '제품 테스트', '기타', '16:57', 'ONLINE'),
 ('2022-03-11', 15, '2024-11-06 02:07:03', 25, '2024-11-06 02:07:03', '제품 문의', 'N', '11:33', '재구매 상담', '제품 테스트', '구매 상담', '14:17', 'PHONE'),
 ('2024-09-27', 15, '2024-11-06 02:07:03', 24, '2024-11-06 02:07:03', '제품 문의', 'N', '16:15', '신제품 발표', '발송 준비', '기타', '9:32', 'OTHER'),
 ('2023-04-20', 1, '2024-11-06 02:07:03', 46, '2024-11-06 02:07:03', '후속 연락', 'N', '8:25', '재구매 상담', '발송 준비', '문의 응대', '11:39', 'VISIT'),
 ('2022-02-20', 14, '2024-11-06 02:07:03', 18, '2024-11-06 02:07:03', '서비스 요청', 'Y', '13:15', '프로모션 상담', '발송 준비', '구매 상담', '9:47', 'PHONE'),
 ('2022-09-10', 1, '2024-11-06 02:07:03', 5, '2024-11-06 02:07:03', '서비스 요청', 'N', '14:04', '프로모션 상담', '추가 상담 예정', '문의 응대', '14:15', 'ONLINE'),
 ('2022-10-30', 1, '2024-11-06 02:07:03', 42, '2024-11-06 02:07:03', '제품 문의', 'Y', '16:13', '프로모션 상담', '제품 테스트', '구매 상담', '8:15', 'OTHER'),
 ('2022-09-04', 5, '2024-11-06 02:07:03', 43, '2024-11-06 02:07:03', '상담 요청', 'Y', '16:14', '프로모션 상담', '추가 상담 예정', '구매 상담', '12:00', 'EMAIL'),
 ('2024-04-25', 14, '2024-11-06 02:07:03', 18, '2024-11-06 02:07:03', '제품 문의', 'N', '12:47', '커피 시음회', '추가 상담 예정', '구매 상담', '16:35', 'EMAIL'),
 ('2023-05-16', 6, '2024-11-06 02:07:03', 16, '2024-11-06 02:07:03', '서비스 요청', 'N', '16:44', '재구매 상담', '제품 테스트', '문의 응대', '14:24', 'VISIT'),
 ('2023-08-31', 14, '2024-11-06 02:07:03', 8, '2024-11-06 02:07:03', '제품 문의', 'N', '15:24', '커피 시음회', '제품 테스트', '기타', '12:19', 'EMAIL'),
 ('2024-10-19', 3, '2024-11-06 02:07:03', 32, '2024-11-06 02:07:03', '일정 조정', 'N', '8:39', '샘플 요청', '제품 테스트', '문의 응대', '9:40', 'ONLINE'),
 ('2023-05-20', 11, '2024-11-06 02:07:03', 48, '2024-11-06 02:07:03', '후속 연락', 'Y', '13:32', '샘플 요청', '추가 상담 예정', '기타', '12:00', 'OTHER'),
 ('2023-10-07', 3, '2024-11-06 02:07:03', 47, '2024-11-06 02:07:03', '일정 조정', 'Y', '8:59', '신제품 발표', '발송 준비', '문의 응대', '12:53', 'PHONE'),
 ('2024-10-27', 15, '2024-11-06 02:07:03', 1, '2024-11-06 02:07:03', '상담 요청', 'Y', '15:26', '샘플 요청', '발송 준비', '구매 상담', '14:16', 'PHONE'),
 ('2023-07-14', 12, '2024-11-06 02:07:03', 32, '2024-11-06 02:07:03', '후속 연락', 'Y', '15:12', '신제품 발표', '제품 테스트', '문의 응대', '15:19', 'EMAIL'),
 ('2023-11-30', 14, '2024-11-06 02:07:03', 1, '2024-11-06 02:07:03', '서비스 요청', 'N', '14:45', '재구매 상담', '제품 테스트', '문의 응대', '12:27', 'OTHER'),
 ('2023-11-16', 14, '2024-11-06 02:07:03', 18, '2024-11-06 02:07:03', '제품 문의', 'N', '15:56', '신제품 발표', '제품 테스트', '구매 상담', '9:15', 'VISIT'),
 ('2024-11-21', 14, '2024-11-06 02:07:03', 24, '2024-11-06 02:07:03', '상담 요청', 'Y', '16:34', '재구매 상담', '추가 상담 예정', '구매 상담', '10:54', 'EMAIL'),
 ('2022-06-05', 1, '2024-11-06 02:07:03', 10, '2024-11-06 02:07:03', '제품 문의', 'N', '12:09', '샘플 요청', '추가 상담 예정', '문의 응대', '9:05', 'ONLINE'),
 ('2024-01-22', 1, '2024-11-06 02:07:03', 9, '2024-11-06 02:07:03', '후속 연락', 'Y', '18:24', '샘플 요청', '발송 준비', '구매 상담', '13:17', 'EMAIL'),
 ('2022-04-27', 14, '2024-11-06 02:07:03', 26, '2024-11-06 02:07:03', '서비스 요청', 'N', '16:33', '커피 시음회', '제품 테스트', '문의 응대', '9:37', 'ONLINE'),
 ('2023-11-10', 15, '2024-11-06 02:07:03', 32, '2024-11-06 02:07:03', '서비스 요청', 'N', '15:18', '샘플 요청', '추가 상담 예정', '기타', '14:15', 'ONLINE'),
 ('2022-11-13', 5, '2024-11-06 02:07:03', 28, '2024-11-06 02:07:03', '일정 조정', 'N', '13:04', '재구매 상담', '발송 준비', '기타', '9:47', 'PHONE'),
 ('2024-06-17', 4, '2024-11-06 02:07:03', 21, '2024-11-06 02:07:03', '상담 요청', 'N', '16:03', '커피 시음회', '제품 테스트', '구매 상담', '13:19', 'ONLINE'),
 ('2024-01-15', 6, '2024-11-06 02:07:03', 10, '2024-11-06 02:07:03', '서비스 요청', 'N', '9:06', '커피 시음회', '추가 상담 예정', '기타', '12:25', 'PHONE'),
 ('2024-07-08', 14, '2024-11-06 02:07:03', 18, '2024-11-06 02:07:03', '서비스 요청', 'Y', '17:22', '샘플 요청', '제품 테스트', '문의 응대', '9:10', 'PHONE'),
 ('2022-06-16', 4, '2024-11-06 02:07:03', 25, '2024-11-06 02:07:03', '상담 요청', 'Y', '15:46', '커피 시음회', '추가 상담 예정', '구매 상담', '10:17', 'EMAIL'),
 ('2022-09-19', 1, '2024-11-06 02:07:03', 38, '2024-11-06 02:07:03', '상담 요청', 'Y', '16:17', '신제품 발표', '발송 준비', '기타', '14:58', 'PHONE'),
 ('2022-12-13', 11, '2024-11-06 02:07:03', 48, '2024-11-06 02:07:03', '제품 문의', 'Y', '14:44', '신제품 발표', '발송 준비', '기타', '15:24', 'EMAIL'),
 ('2023-03-10', 14, '2024-11-06 02:07:03', 36, '2024-11-06 02:07:03', '일정 조정', 'Y', '13:51', '재구매 상담', '제품 테스트', '문의 응대', '14:09', 'VISIT'),
 ('2022-10-28', 3, '2024-11-06 02:07:03', 48, '2024-11-06 02:07:03', '제품 문의', 'N', '13:13', '재구매 상담', '제품 테스트', '기타', '12:53', 'ONLINE'),
 ('2022-06-03', 5, '2024-11-06 02:07:03', 12, '2024-11-06 02:07:03', '제품 문의', 'Y', '16:00', '프로모션 상담', '발송 준비', '문의 응대', '9:47', 'EMAIL'),
 ('2024-11-25', 14, '2024-11-06 02:07:03', 13, '2024-11-06 02:07:03', '상담 요청', 'N', '9:13', '커피 시음회', '추가 상담 예정', '구매 상담', '15:41', 'EMAIL'),
 ('2022-07-18', 1, '2024-11-06 02:07:03', 30, '2024-11-06 02:07:03', '상담 요청', 'Y', '13:48', '재구매 상담', '추가 상담 예정', '구매 상담', '17:55', 'EMAIL'),
 ('2023-09-10', 6, '2024-11-06 02:07:03', 48, '2024-11-06 02:07:03', '일정 조정', 'N', '9:47', '재구매 상담', '발송 준비', '기타', '14:09', 'VISIT'),
 ('2023-08-14', 12, '2024-11-06 02:07:03', 14, '2024-11-06 02:07:03', '일정 조정', 'N', '18:00', '커피 시음회', '추가 상담 예정', '기타', '9:15', 'ONLINE'),
 ('2023-02-24', 14, '2024-11-06 02:07:03', 38, '2024-11-06 02:07:03', '상담 요청', 'Y', '10:53', '신제품 발표', '제품 테스트', '구매 상담', '9:18', 'EMAIL'),
 ('2023-04-07', 9, '2024-11-06 02:07:03', 32, '2024-11-06 02:07:03', '상담 요청', 'N', '18:54', '샘플 요청', '제품 테스트', '기타', '13:25', 'VISIT'),
 ('2022-01-24', 7, '2024-11-06 02:07:03', 45, '2024-11-06 02:07:03', '서비스 요청', 'N', '11:07', '커피 시음회', '발송 준비', '기타', '13:13', 'ONLINE'),
 ('2023-04-24', 4, '2024-11-06 02:07:03', 30, '2024-11-06 02:07:03', '서비스 요청', 'Y', '18:14', '프로모션 상담', '발송 준비', '기타', '14:35', 'PHONE'),
 ('2024-06-02', 1, '2024-11-06 02:07:03', 37, '2024-11-06 02:07:03', '후속 연락', 'N', '13:18', '커피 시음회', '발송 준비', '구매 상담', '16:06', 'OTHER'),
 ('2024-02-18', 15, '2024-11-06 02:07:03', 39, '2024-11-06 02:07:03', '일정 조정', 'N', '14:51', '재구매 상담', '발송 준비', '기타', '8:58', 'VISIT'),
 ('2024-11-15', 14, '2024-11-06 02:07:03', 16, '2024-11-06 02:07:03', '제품 문의', 'Y', '11:32', '커피 시음회', '추가 상담 예정', '문의 응대', '9:38', 'ONLINE'),
 ('2024-04-02', 15, '2024-11-06 02:07:03', 4, '2024-11-06 02:07:03', '후속 연락', 'N', '14:26', '재구매 상담', '제품 테스트', '구매 상담', '18:52', 'EMAIL'),
 ('2022-03-04', 12, '2024-11-06 02:07:03', 22, '2024-11-06 02:07:03', '상담 요청', 'N', '10:00', '샘플 요청', '추가 상담 예정', '기타', '16:04', 'EMAIL'),
 ('2024-01-16', 1, '2024-11-06 02:07:03', 1, '2024-11-06 02:07:03', '제품 문의', 'N', '14:00', '신제품 발표', '제품 테스트', '기타', '12:22', 'ONLINE'),
 ('2023-10-04', 15, '2024-11-06 02:07:03', 18, '2024-11-06 02:07:03', '후속 연락', 'N', '14:08', '프로모션 상담', '제품 테스트', '기타', '13:20', 'PHONE'),
 ('2022-01-15', 12, '2024-11-06 02:07:03', 12, '2024-11-06 02:07:03', '서비스 요청', 'N', '15:31', '재구매 상담', '발송 준비', '구매 상담', '17:41', 'OTHER'),
 ('2022-03-19', 14, '2024-11-06 02:07:03', 15, '2024-11-06 02:07:03', '후속 연락', 'Y', '16:50', '프로모션 상담', '제품 테스트', '문의 응대', '8:56', 'ONLINE'),
 ('2022-09-30', 14, '2024-11-06 02:07:03', 36, '2024-11-06 02:07:03', '상담 요청', 'N', '14:00', '샘플 요청', '추가 상담 예정', '구매 상담', '8:57', 'PHONE'),
 ('2023-02-13', 14, '2024-11-06 02:07:03', 24, '2024-11-06 02:07:03', '일정 조정', 'N', '15:06', '프로모션 상담', '추가 상담 예정', '기타', '15:53', 'EMAIL'),
 ('2024-10-08', 11, '2024-11-06 02:07:03', 46, '2024-11-06 02:07:03', '후속 연락', 'N', '14:13', '프로모션 상담', '추가 상담 예정', '구매 상담', '9:58', 'OTHER'),
 ('2023-10-13', 15, '2024-11-06 02:07:03', 47, '2024-11-06 02:07:03', '상담 요청', 'Y', '9:17', '신제품 발표', '제품 테스트', '구매 상담', '9:18', 'PHONE'),
 ('2024-07-08', 1, '2024-11-06 02:07:03', 47, '2024-11-06 02:07:03', '서비스 요청', 'N', '10:50', '신제품 발표', '추가 상담 예정', '기타', '8:58', 'ONLINE'),
 ('2023-03-28', 8, '2024-11-06 02:07:03', 32, '2024-11-06 02:07:03', '일정 조정', 'Y', '9:50', '샘플 요청', '제품 테스트', '기타', '16:43', 'PHONE'),
 ('2023-05-12', 8, '2024-11-06 02:07:03', 48, '2024-11-06 02:07:03', '후속 연락', 'N', '17:01', '신제품 발표', '추가 상담 예정', '문의 응대', '11:19', 'OTHER'),
 ('2023-02-08', 12, '2024-11-06 02:07:03', 24, '2024-11-06 02:07:03', '서비스 요청', 'N', '9:16', '재구매 상담', '제품 테스트', '구매 상담', '16:01', 'VISIT'),
 ('2023-04-14', 7, '2024-11-06 02:07:03', 15, '2024-11-06 02:07:03', '일정 조정', 'N', '14:57', '샘플 요청', '제품 테스트', '문의 응대', '14:03', 'VISIT'),
 ('2022-12-09', 15, '2024-11-06 02:07:03', 4, '2024-11-06 02:07:03', '서비스 요청', 'N', '16:32', '신제품 발표', '제품 테스트', '기타', '17:41', 'VISIT'),
 ('2024-07-31', 15, '2024-11-06 02:07:03', 6, '2024-11-06 02:07:03', '상담 요청', 'N', '10:56', '커피 시음회', '제품 테스트', '문의 응대', '18:07', 'PHONE'),
 ('2022-12-12', 15, '2024-11-06 02:07:03', 39, '2024-11-06 02:07:03', '제품 문의', 'N', '12:51', '신제품 발표', '발송 준비', '문의 응대', '9:31', 'VISIT'),
 ('2023-07-11', 11, '2024-11-06 02:07:03', 12, '2024-11-06 02:07:03', '상담 요청', 'N', '14:08', '신제품 발표', '추가 상담 예정', '문의 응대', '12:32', 'ONLINE'),
 ('2022-12-20', 5, '2024-11-06 02:07:03', 24, '2024-11-06 02:07:03', '제품 문의', 'N', '18:30', '프로모션 상담', '추가 상담 예정', '구매 상담', '18:44', 'PHONE'),
 ('2023-04-05', 2, '2024-11-06 02:07:03', 49, '2024-11-06 02:07:03', '일정 조정', 'Y', '15:43', '커피 시음회', '발송 준비', '구매 상담', '16:11', 'EMAIL'),
 ('2023-07-09', 15, '2024-11-06 02:07:03', 20, '2024-11-06 02:07:03', '서비스 요청', 'Y', '18:09', '커피 시음회', '발송 준비', '구매 상담', '14:36', 'ONLINE'),
 ('2023-10-21', 1, '2024-11-06 02:07:03', 9, '2024-11-06 02:07:03', '서비스 요청', 'Y', '18:40', '신제품 발표', '발송 준비', '기타', '14:13', 'EMAIL'),
 ('2022-07-03', 1, '2024-11-06 02:07:03', 26, '2024-11-06 02:07:03', '제품 문의', 'N', '8:18', '커피 시음회', '발송 준비', '구매 상담', '13:50', 'EMAIL'),
 ('2022-10-12', 6, '2024-11-06 02:07:03', 38, '2024-11-06 02:07:03', '후속 연락', 'N', '12:16', '재구매 상담', '추가 상담 예정', '기타', '14:40', 'ONLINE'),
 ('2022-08-12', 1, '2024-11-06 02:07:03', 21, '2024-11-06 02:07:03', '일정 조정', 'N', '17:34', '신제품 발표', '발송 준비', '문의 응대', '12:08', 'ONLINE'),
 ('2022-02-15', 15, '2024-11-06 02:07:03', 25, '2024-11-06 02:07:03', '일정 조정', 'Y', '16:08', '재구매 상담', '제품 테스트', '기타', '13:13', 'OTHER'),
 ('2022-07-05', 1, '2024-11-06 02:07:03', 30, '2024-11-06 02:07:03', '서비스 요청', 'N', '16:23', '커피 시음회', '추가 상담 예정', '문의 응대', '8:55', 'EMAIL'),
 ('2024-07-02', 1, '2024-11-06 02:07:03', 42, '2024-11-06 02:07:03', '상담 요청', 'N', '12:49', '재구매 상담', '추가 상담 예정', '구매 상담', '18:08', 'ONLINE'),
 ('2023-08-30', 14, '2024-11-06 02:07:03', 17, '2024-11-06 02:07:03', '후속 연락', 'N', '13:33', '신제품 발표', '제품 테스트', '기타', '14:50', 'VISIT'),
 ('2022-04-30', 10, '2024-11-06 02:07:03', 14, '2024-11-06 02:07:03', '일정 조정', 'N', '8:38', '재구매 상담', '제품 테스트', '구매 상담', '13:15', 'ONLINE'),
 ('2024-10-28', 8, '2024-11-06 02:07:03', 34, '2024-11-06 02:07:03', '후속 연락', 'N', '10:15', '신제품 발표', '추가 상담 예정', '기타', '18:00', 'OTHER'),
 ('2022-06-02', 11, '2024-11-06 02:07:03', 10, '2024-11-06 02:07:03', '후속 연락', 'Y', '15:02', '샘플 요청', '발송 준비', '기타', '15:48', 'ONLINE'),
 ('2024-04-22', 14, '2024-11-06 02:07:03', 29, '2024-11-06 02:07:03', '서비스 요청', 'N', '18:40', '신제품 발표', '추가 상담 예정', '기타', '14:42', 'OTHER'),
 ('2024-07-16', 14, '2024-11-06 02:07:03', 48, '2024-11-06 02:07:03', '일정 조정', 'N', '18:24', '신제품 발표', '제품 테스트', '구매 상담', '17:01', 'VISIT'),
 ('2023-08-09', 1, '2024-11-06 02:07:03', 43, '2024-11-06 02:07:03', '서비스 요청', 'N', '13:27', '커피 시음회', '추가 상담 예정', '문의 응대', '15:32', 'VISIT'),
 ('2022-06-21', 15, '2024-11-06 02:07:03', 25, '2024-11-06 02:07:03', '제품 문의', 'Y', '13:03', '샘플 요청', '발송 준비', '구매 상담', '18:16', 'EMAIL'),
 ('2022-02-22', 14, '2024-11-06 02:07:03', 26, '2024-11-06 02:07:03', '서비스 요청', 'Y', '14:19', '신제품 발표', '제품 테스트', '기타', '14:14', 'PHONE'),
 ('2022-05-16', 10, '2024-11-06 02:07:03', 39, '2024-11-06 02:07:03', '후속 연락', 'Y', '9:55', '샘플 요청', '추가 상담 예정', '구매 상담', '12:35', 'EMAIL'),
 ('2024-04-25', 10, '2024-11-06 02:07:03', 34, '2024-11-06 02:07:03', '제품 문의', 'Y', '12:00', '샘플 요청', '발송 준비', '문의 응대', '18:49', 'ONLINE'),
 ('2022-01-05', 1, '2024-11-06 02:07:03', 8, '2024-11-06 02:07:03', '제품 문의', 'Y', '17:43', '샘플 요청', '제품 테스트', '구매 상담', '17:39', 'VISIT'),
 ('2022-09-21', 1, '2024-11-06 02:07:03', 3, '2024-11-06 02:07:03', '후속 연락', 'N', '15:10', '신제품 발표', '발송 준비', '구매 상담', '13:39', 'ONLINE'),
 ('2024-04-10', 14, '2024-11-06 02:07:03', 28, '2024-11-06 02:07:03', '후속 연락', 'Y', '13:11', '신제품 발표', '제품 테스트', '구매 상담', '11:10', 'ONLINE'),
 ('2022-03-23', 1, '2024-11-06 02:07:03', 26, '2024-11-06 02:07:03', '상담 요청', 'N', '8:31', '신제품 발표', '추가 상담 예정', '기타', '14:09', 'EMAIL'),
 ('2024-03-21', 1, '2024-11-06 02:07:03', 8, '2024-11-06 02:07:03', '제품 문의', 'Y', '14:35', '재구매 상담', '발송 준비', '구매 상담', '8:05', 'OTHER'),
 ('2024-03-11', 4, '2024-11-06 02:07:03', 14, '2024-11-06 02:07:03', '서비스 요청', 'Y', '17:18', '프로모션 상담', '발송 준비', '구매 상담', '18:41', 'ONLINE'),
 ('2022-09-07', 14, '2024-11-06 02:07:03', 27, '2024-11-06 02:07:03', '상담 요청', 'Y', '16:20', '프로모션 상담', '추가 상담 예정', '구매 상담', '12:46', 'OTHER'),
 ('2023-08-09', 14, '2024-11-06 02:07:03', 38, '2024-11-06 02:07:03', '서비스 요청', 'Y', '14:54', '프로모션 상담', '제품 테스트', '기타', '8:50', 'ONLINE'),
 ('2024-08-21', 15, '2024-11-06 02:07:03', 43, '2024-11-06 02:07:03', '제품 문의', 'Y', '12:10', '신제품 발표', '발송 준비', '구매 상담', '10:59', 'PHONE'),
 ('2024-01-15', 14, '2024-11-06 02:07:03', 26, '2024-11-06 02:07:03', '제품 문의', 'N', '15:30', '신제품 발표', '추가 상담 예정', '문의 응대', '13:05', 'PHONE'),
 ('2023-11-18', 1, '2024-11-06 02:07:03', 29, '2024-11-06 02:07:03', '상담 요청', 'N', '12:21', '프로모션 상담', '발송 준비', '문의 응대', '14:50', 'OTHER'),
 ('2023-09-12', 2, '2024-11-06 02:07:03', 12, '2024-11-06 02:07:03', '제품 문의', 'Y', '8:46', '재구매 상담', '제품 테스트', '구매 상담', '13:42', 'ONLINE'),
 ('2022-09-07', 12, '2024-11-06 02:07:03', 49, '2024-11-06 02:07:03', '제품 문의', 'Y', '16:24', '재구매 상담', '발송 준비', '기타', '12:01', 'EMAIL'),
 ('2023-06-26', 15, '2024-11-06 02:07:03', 43, '2024-11-06 02:07:03', '제품 문의', 'Y', '12:59', '커피 시음회', '발송 준비', '기타', '10:55', 'OTHER'),
 ('2023-07-13', 15, '2024-11-06 02:07:03', 8, '2024-11-06 02:07:03', '후속 연락', 'N', '15:12', '커피 시음회', '발송 준비', '문의 응대', '9:29', 'ONLINE'),
 ('2023-04-12', 1, '2024-11-06 02:07:03', 14, '2024-11-06 02:07:03', '서비스 요청', 'N', '12:54', '샘플 요청', '발송 준비', '문의 응대', '8:55', 'ONLINE');

-- >>>>>>>>>>>> 제안 <<<<<<<<<<<<<<

-- 제안 데이터 생성 (총 200개)

INSERT INTO tb_proposal (prop_no, created_at, updated_at, name, pr_date, req_date, start_date, end_date, submit_date, cont, note, lead_no)
VALUES
    (1, NOW(), NOW(), '커피왕 - 홍길동 원두 구매 제안', '2024-01-01', '2024-01-05', '2024-01-10', '2024-01-15', '2024-01-12', '고급 원두 및 커피머신 제공 제안', '커피왕 - 홍길동 고객에게 제공되는 고급 원두와 커피머신 제안', 1),
    (2, NOW(), NOW(), '원두전문 - 김영희 원두 구매 제안', '2024-01-02', '2024-01-06', '2024-01-11', '2024-01-16', '2024-01-13', '고급 원두 및 커피머신 제공 제안', '원두전문 - 김영희 고객에게 제공되는 고급 원두와 커피머신 제안', 2),
    (3, NOW(), NOW(), '커피트레이드 - 박철수 원두 구매 제안', '2024-01-03', '2024-01-07', '2024-01-12', '2024-01-17', '2024-01-14', '고급 원두 및 커피머신 제공 제안', '커피트레이드 - 박철수 고객에게 제공되는 고급 원두와 커피머신 제안', 3),
    (4, NOW(), NOW(), '원두마켓 - 이승현 원두 구매 제안', '2024-01-04', '2024-01-08', '2024-01-13', '2024-01-18', '2024-01-15', '고급 원두 및 커피머신 제공 제안', '원두마켓 - 이승현 고객에게 제공되는 고급 원두와 커피머신 제안', 4),
    (5, NOW(), NOW(), '커피플랜트 - 정민수 원두 구매 제안', '2024-01-05', '2024-01-09', '2024-01-14', '2024-01-19', '2024-01-16', '고급 원두 및 커피머신 제공 제안', '커피플랜트 - 정민수 고객에게 제공되는 고급 원두와 커피머신 제안', 5),
    (6, NOW(), NOW(), '커피나무 - 서지수 원두 구매 제안', '2024-01-06', '2024-01-10', '2024-01-15', '2024-01-20', '2024-01-17', '고급 원두 및 커피머신 제공 제안', '커피나무 - 서지수 고객에게 제공되는 고급 원두와 커피머신 제안', 6),
    (7, NOW(), NOW(), '원두가게 - 김도현 원두 구매 제안', '2024-01-07', '2024-01-11', '2024-01-16', '2024-01-21', '2024-01-18', '고급 원두 및 커피머신 제공 제안', '원두가게 - 김도현 고객에게 제공되는 고급 원두와 커피머신 제안', 7),
    (8, NOW(), NOW(), '커피스토어 - 최혜린 원두 구매 제안', '2024-01-08', '2024-01-12', '2024-01-17', '2024-01-22', '2024-01-19', '고급 원두 및 커피머신 제공 제안', '커피스토어 - 최혜린 고객에게 제공되는 고급 원두와 커피머신 제안', 8),
    (9, NOW(), NOW(), '원두파머 - 한지원 원두 구매 제안', '2024-01-09', '2024-01-13', '2024-01-18', '2024-01-23', '2024-01-20', '고급 원두 및 커피머신 제공 제안', '원두파머 - 한지원 고객에게 제공되는 고급 원두와 커피머신 제안', 9),
    (10, NOW(), NOW(), '원두드림 - 장윤아 원두 구매 제안', '2024-01-10', '2024-01-14', '2024-01-19', '2024-01-24', '2024-01-21', '고급 원두 및 커피머신 제공 제안', '원두드림 - 장윤아 고객에게 제공되는 고급 원두와 커피머신 제안', 10),
    (11, NOW(), NOW(), '커피농장 - 고객11 원두 구매 제안', '2024-02-01', '2024-02-05', '2024-02-10', '2024-02-15', '2024-02-12', '고급 원두 및 커피머신 제공 제안', '커피농장 - 고객11 고객에게 제공되는 고급 원두와 커피머신 제안', 11),
    (12, NOW(), NOW(), '원두왕국 - 고객12 원두 구매 제안', '2024-02-02', '2024-02-06', '2024-02-11', '2024-02-16', '2024-02-13', '고급 원두 및 커피머신 제공 제안', '원두왕국 - 고객12 고객에게 제공되는 고급 원두와 커피머신 제안', 12),
    (13, NOW(), NOW(), '바리스타 - 고객13 원두 구매 제안', '2024-02-03', '2024-02-07', '2024-02-12', '2024-02-17', '2024-02-14', '고급 원두 및 커피머신 제공 제안', '바리스타 - 고객13 고객에게 제공되는 고급 원두와 커피머신 제안', 13),
    (14, NOW(), NOW(), '커피마스터 - 고객14 원두 구매 제안', '2024-02-04', '2024-02-08', '2024-02-13', '2024-02-18', '2024-02-15', '고급 원두 및 커피머신 제공 제안', '커피마스터 - 고객14 고객에게 제공되는 고급 원두와 커피머신 제안', 14),
    (15, NOW(), NOW(), '커피블렌드 - 고객15 원두 구매 제안', '2024-02-05', '2024-02-09', '2024-02-14', '2024-02-19', '2024-02-16', '고급 원두 및 커피머신 제공 제안', '커피블렌드 - 고객15 고객에게 제공되는 고급 원두와 커피머신 제안', 15),
    (16, NOW(), NOW(), '커피프로 - 고객16 원두 구매 제안', '2024-02-06', '2024-02-10', '2024-02-15', '2024-02-20', '2024-02-17', '고급 원두 및 커피머신 제공 제안', '커피프로 - 고객16 고객에게 제공되는 고급 원두와 커피머신 제안', 16),
    (17, NOW(), NOW(), '커피존 - 고객17 원두 구매 제안', '2024-02-07', '2024-02-11', '2024-02-16', '2024-02-21', '2024-02-18', '고급 원두 및 커피머신 제공 제안', '커피존 - 고객17 고객에게 제공되는 고급 원두와 커피머신 제안', 17),
    (18, NOW(), NOW(), '원두카페 - 고객18 원두 구매 제안', '2024-02-08', '2024-02-12', '2024-02-17', '2024-02-22', '2024-02-19', '고급 원두 및 커피머신 제공 제안', '원두카페 - 고객18 고객에게 제공되는 고급 원두와 커피머신 제안', 18),
    (19, NOW(), NOW(), '커피샵 - 고객19 원두 구매 제안', '2024-02-09', '2024-02-13', '2024-02-18', '2024-02-23', '2024-02-20', '고급 원두 및 커피머신 제공 제안', '커피샵 - 고객19 고객에게 제공되는 고급 원두와 커피머신 제안', 19),
    (20, NOW(), NOW(), '원두월드 - 고객20 원두 구매 제안', '2024-02-10', '2024-02-14', '2024-02-19', '2024-02-24', '2024-02-21', '고급 원두 및 커피머신 제공 제안', '원두월드 - 고객20 고객에게 제공되는 고급 원두와 커피머신 제안', 20),
    (21, NOW(), NOW(), '커피카페 - 고객21 원두 구매 제안', '2024-02-06', '2024-02-10', '2024-02-15', '2024-02-20', '2024-02-18', '고급 원두 및 커피머신 제공 제안', '커피카페 - 고객21 고객에게 제공되는 고급 원두와 커피머신 제안', 21),
    (22, NOW(), NOW(), '프리미엄커피 - 고객22 원두 구매 제안', '2024-02-07', '2024-02-11', '2024-02-16', '2024-02-21', '2024-02-19', '고급 원두 및 커피머신 제공 제안', '프리미엄커피 - 고객22 고객에게 제공되는 고급 원두와 커피머신 제안', 22),
    (23, NOW(), NOW(), '카페미니 - 고객23 원두 구매 제안', '2024-02-08', '2024-02-12', '2024-02-17', '2024-02-22', '2024-02-20', '고급 원두 및 커피머신 제공 제안', '카페미니 - 고객23 고객에게 제공되는 고급 원두와 커피머신 제안', 23),
    (24, NOW(), NOW(), '커피비즈 - 고객24 원두 구매 제안', '2024-02-09', '2024-02-13', '2024-02-18', '2024-02-23', '2024-02-21', '고급 원두 및 커피머신 제공 제안', '커피비즈 - 고객24 고객에게 제공되는 고급 원두와 커피머신 제안', 24),
    (25, NOW(), NOW(), '모닝커피 - 고객25 원두 구매 제안', '2024-02-10', '2024-02-14', '2024-02-19', '2024-02-24', '2024-02-22', '고급 원두 및 커피머신 제공 제안', '모닝커피 - 고객25 고객에게 제공되는 고급 원두와 커피머신 제안', 25),
    (26, NOW(), NOW(), '커피하우스 - 고객26 원두 구매 제안', '2024-02-11', '2024-02-15', '2024-02-20', '2024-02-25', '2024-02-23', '고급 원두 및 커피머신 제공 제안', '커피하우스 - 고객26 고객에게 제공되는 고급 원두와 커피머신 제안', 26),
    (27, NOW(), NOW(), '그랜드커피 - 고객27 원두 구매 제안', '2024-02-12', '2024-02-16', '2024-02-21', '2024-02-26', '2024-02-24', '고급 원두 및 커피머신 제공 제안', '그랜드커피 - 고객27 고객에게 제공되는 고급 원두와 커피머신 제안', 27),
    (28, NOW(), NOW(), '커피팝 - 고객28 원두 구매 제안', '2024-02-13', '2024-02-17', '2024-02-22', '2024-02-27', '2024-02-25', '고급 원두 및 커피머신 제공 제안', '커피팝 - 고객28 고객에게 제공되는 고급 원두와 커피머신 제안', 28),
    (29, NOW(), NOW(), '라떼타임 - 고객29 원두 구매 제안', '2024-02-14', '2024-02-18', '2024-02-23', '2024-02-28', '2024-02-26', '고급 원두 및 커피머신 제공 제안', '라떼타임 - 고객29 고객에게 제공되는 고급 원두와 커피머신 제안', 29),
    (30, NOW(), NOW(), '브라운커피 - 고객30 원두 구매 제안', '2024-02-15', '2024-02-19', '2024-02-24', '2024-03-01', '2024-02-28', '고급 원두 및 커피머신 제공 제안', '브라운커피 - 고객30 고객에게 제공되는 고급 원두와 커피머신 제안', 30),
    (31, NOW(), NOW(), '카페리치 - 고객31 원두 구매 제안', '2024-02-16', '2024-02-20', '2024-02-25', '2024-03-02', '2024-03-01', '고급 원두 및 커피머신 제공 제안', '카페리치 - 고객31 고객에게 제공되는 고급 원두와 커피머신 제안', 31),
    (32, NOW(), NOW(), '모카커피 - 고객32 원두 구매 제안', '2024-02-17', '2024-02-21', '2024-02-26', '2024-03-03', '2024-03-02', '고급 원두 및 커피머신 제공 제안', '모카커피 - 고객32 고객에게 제공되는 고급 원두와 커피머신 제안', 32),
    (33, NOW(), NOW(), '커피로드 - 고객33 원두 구매 제안', '2024-02-18', '2024-02-22', '2024-02-27', '2024-03-04', '2024-03-03', '고급 원두 및 커피머신 제공 제안', '커피로드 - 고객33 고객에게 제공되는 고급 원두와 커피머신 제안', 33),
    (34, NOW(), NOW(), '카페로맨스 - 고객34 원두 구매 제안', '2024-02-19', '2024-02-23', '2024-02-28', '2024-03-05', '2024-03-04', '고급 원두 및 커피머신 제공 제안', '카페로맨스 - 고객34 고객에게 제공되는 고급 원두와 커피머신 제안', 34),
    (35, NOW(), NOW(), '스위트커피 - 고객35 원두 구매 제안', '2024-02-20', '2024-02-24', '2024-03-01', '2024-03-06', '2024-03-05', '고급 원두 및 커피머신 제공 제안', '스위트커피 - 고객35 고객에게 제공되는 고급 원두와 커피머신 제안', 35),
    (36, NOW(), NOW(), '프렌치커피 - 고객36 원두 구매 제안', '2024-02-21', '2024-02-25', '2024-03-02', '2024-03-07', '2024-03-06', '고급 원두 및 커피머신 제공 제안', '프렌치커피 - 고객36 고객에게 제공되는 고급 원두와 커피머신 제안', 36),
    (37, NOW(), NOW(), '카페플랜 - 고객37 원두 구매 제안', '2024-02-22', '2024-02-26', '2024-03-03', '2024-03-08', '2024-03-07', '고급 원두 및 커피머신 제공 제안', '카페플랜 - 고객37 고객에게 제공되는 고급 원두와 커피머신 제안', 37),
    (38, NOW(), NOW(), '커피팰리스 - 고객38 원두 구매 제안', '2024-02-23', '2024-02-27', '2024-03-04', '2024-03-09', '2024-03-08', '고급 원두 및 커피머신 제공 제안', '커피팰리스 - 고객38 고객에게 제공되는 고급 원두와 커피머신 제안', 38),
    (39, NOW(), NOW(), '에코커피 - 고객39 원두 구매 제안', '2024-02-24', '2024-02-28', '2024-03-05', '2024-03-10', '2024-03-09', '고급 원두 및 커피머신 제공 제안', '에코커피 - 고객39 고객에게 제공되는 고급 원두와 커피머신 제안', 39),
    (40, NOW(), NOW(), '로얄커피 - 고객40 원두 구매 제안', '2024-02-25', '2024-03-01', '2024-03-06', '2024-03-11', '2024-03-10', '고급 원두 및 커피머신 제공 제안', '로얄커피 - 고객40 고객에게 제공되는 고급 원두와 커피머신 제안', 40),
    (41, NOW(), NOW(), '커피카페 - 고객41 원두 구매 후속 제안', '2024-03-01', '2024-03-05', '2024-03-10', '2024-03-15', '2024-03-14', '원두 품질 개선 및 추가 주문 제안', '커피카페 - 고객41에게 품질 개선 및 추가 원두 구매 제안', 41),
    (42, NOW(), NOW(), '프리미엄커피 - 고객42 원두 구매 후속 제안', '2024-03-02', '2024-03-06', '2024-03-11', '2024-03-16', '2024-03-15', '고급 원두 리필 및 머신 서비스 연장 제안', '프리미엄커피 - 고객42 고급 원두 리필 및 머신 서비스 연장 제안', 42),
    (43, NOW(), NOW(), '카페미니 - 고객43 원두 구매 후속 제안', '2024-03-03', '2024-03-07', '2024-03-12', '2024-03-17', '2024-03-16', '고급 원두 추가 공급 및 머신 업그레이드 제안', '카페미니 - 고객43 고급 원두 추가 공급 및 머신 업그레이드 제안', 43),
    (44, NOW(), NOW(), '커피비즈 - 고객44 원두 구매 후속 제안', '2024-03-04', '2024-03-08', '2024-03-13', '2024-03-18', '2024-03-17', '기존 원두 품질 향상 및 새로운 메뉴 제안', '커피비즈 - 고객44 원두 품질 향상 및 새로운 메뉴 제안', 44),
    (45, NOW(), NOW(), '모닝커피 - 고객45 원두 구매 후속 제안', '2024-03-05', '2024-03-09', '2024-03-14', '2024-03-19', '2024-03-18', '프리미엄 원두 재구매 및 추가 옵션 제안', '모닝커피 - 고객45 프리미엄 원두 재구매 및 추가 옵션 제안', 45),
    (46, NOW(), NOW(), '커피하우스 - 고객46 원두 구매 후속 제안', '2024-03-06', '2024-03-10', '2024-03-15', '2024-03-20', '2024-03-19', '신제품 커피 및 추가 서비스 제공 제안', '커피하우스 - 고객46 신제품 커피 및 서비스 제공 제안', 46),
    (47, NOW(), NOW(), '그랜드커피 - 고객47 원두 구매 후속 제안', '2024-03-07', '2024-03-11', '2024-03-16', '2024-03-21', '2024-03-20', '품질 향상 및 신규 제품 라인 제안', '그랜드커피 - 고객47 품질 향상 및 신규 제품 라인 제안', 47),
    (48, NOW(), NOW(), '커피팝 - 고객48 원두 구매 후속 제안', '2024-03-08', '2024-03-12', '2024-03-17', '2024-03-22', '2024-03-21', '신규 머신 도입 및 원두 품질 개선 제안', '커피팝 - 고객48 신규 머신 도입 및 원두 품질 개선 제안', 48),
    (49, NOW(), NOW(), '라떼타임 - 고객49 원두 구매 후속 제안', '2024-03-09', '2024-03-13', '2024-03-18', '2024-03-23', '2024-03-22', '후속 원두 공급 및 머신 관리 서비스 제안', '라떼타임 - 고객49 후속 원두 공급 및 머신 관리 서비스 제안', 49),
    (50, NOW(), NOW(), '브라운커피 - 고객50 원두 구매 후속 제안', '2024-03-10', '2024-03-14', '2024-03-19', '2024-03-24', '2024-03-23', '기존 커피 머신 업그레이드 및 신규 제품 제안', '브라운커피 - 고객50 커피 머신 업그레이드 및 신규 제품 제안', 50),
    (51, NOW(), NOW(), '카페리치 - 고객51 원두 구매 후속 제안', '2024-03-11', '2024-03-15', '2024-03-20', '2024-03-25', '2024-03-24', '프리미엄 원두 재구매 및 신규 제품 추가 제안', '카페리치 - 고객51 프리미엄 원두 재구매 및 제품 추가 제안', 51),
    (52, NOW(), NOW(), '모카커피 - 고객52 원두 구매 후속 제안', '2024-03-12', '2024-03-16', '2024-03-21', '2024-03-26', '2024-03-25', '커피 머신 업그레이드 및 원두 리필 제안', '모카커피 - 고객52 커피 머신 업그레이드 및 원두 리필 제안', 52),
    (53, NOW(), NOW(), '커피로드 - 고객53 원두 구매 후속 제안', '2024-03-13', '2024-03-17', '2024-03-22', '2024-03-27', '2024-03-26', '후속 제품 공급 및 서비스 연장 제안', '커피로드 - 고객53 후속 제품 공급 및 서비스 연장 제안', 53),
    (54, NOW(), NOW(), '카페로맨스 - 고객54 원두 구매 후속 제안', '2024-03-14', '2024-03-18', '2024-03-23', '2024-03-28', '2024-03-27', '기존 원두 재공급 및 커피 머신 지원 제안', '카페로맨스 - 고객54 원두 재공급 및 커피 머신 지원 제안', 54),
    (55, NOW(), NOW(), '스위트커피 - 고객55 원두 구매 후속 제안', '2024-03-15', '2024-03-19', '2024-03-24', '2024-03-29', '2024-03-28', '고급 원두 추가 공급 및 커피 머신 관리 서비스 제안', '스위트커피 - 고객55 고급 원두 추가 공급 및 커피 머신 관리 서비스 제안', 55),
    (56, NOW(), NOW(), '프렌치커피 - 고객56 원두 구매 후속 제안', '2024-03-16', '2024-03-20', '2024-03-25', '2024-03-30', '2024-03-29', '기존 제품 리필 및 업그레이드 제안', '프렌치커피 - 고객56 기존 제품 리필 및 업그레이드 제안', 56),
    (57, NOW(), NOW(), '카페플랜 - 고객57 원두 구매 후속 제안', '2024-03-17', '2024-03-21', '2024-03-26', '2024-03-31', '2024-03-30', '추가 원두 공급 및 서비스 개선 제안', '카페플랜 - 고객57 추가 원두 공급 및 서비스 개선 제안', 57),
    (58, NOW(), NOW(), '커피팰리스 - 고객58 원두 구매 후속 제안', '2024-03-18', '2024-03-22', '2024-03-27', '2024-04-01', '2024-03-31', '후속 커피 공급 및 고객 맞춤 서비스 제안', '커피팰리스 - 고객58 후속 커피 공급 및 맞춤 서비스 제안', 58),
    (59, NOW(), NOW(), '에코커피 - 고객59 원두 구매 후속 제안', '2024-03-19', '2024-03-23', '2024-03-28', '2024-04-02', '2024-04-01', '신제품 공급 및 서비스 연장 제안', '에코커피 - 고객59 신제품 공급 및 서비스 연장 제안', 59),
    (60, NOW(), NOW(), '로얄커피 - 고객60 원두 구매 후속 제안', '2024-03-20', '2024-03-24', '2024-03-29', '2024-04-03', '2024-04-02', '기존 원두 공급 연장 및 새로운 머신 제안', '로얄커피 - 고객60 기존 원두 공급 연장 및 새로운 머신 제안', 60),
    (61, NOW(), NOW(), '카페서울 - 고객61 원두 구매 후속 제안', '2024-04-01', '2024-04-05', '2024-04-10', '2024-04-15', '2024-04-14', '원두 품질 개선 및 서비스 연장 제안', '카페서울 - 고객61 원두 품질 개선 및 서비스 연장 제안', 61),
    (62, NOW(), NOW(), '블랙커피 - 고객62 원두 구매 후속 제안', '2024-04-02', '2024-04-06', '2024-04-11', '2024-04-16', '2024-04-15', '고급 원두 리필 및 원두 추가 주문 제안', '블랙커피 - 고객62 고급 원두 리필 및 원두 추가 주문 제안', 62),
    (63, NOW(), NOW(), '프렌치카페 - 고객63 원두 구매 후속 제안', '2024-04-03', '2024-04-07', '2024-04-12', '2024-04-17', '2024-04-16', '기존 원두 품질 개선 및 새로운 옵션 제안', '프렌치카페 - 고객63 기존 원두 품질 개선 및 새로운 옵션 제안', 63),
    (64, NOW(), NOW(), '카페유니크 - 고객64 원두 구매 후속 제안', '2024-04-04', '2024-04-08', '2024-04-13', '2024-04-18', '2024-04-17', '신규 원두 공급 및 커피 머신 업그레이드 제안', '카페유니크 - 고객64 신규 원두 공급 및 커피 머신 업그레이드 제안', 64),
    (65, NOW(), NOW(), '모닝브루 - 고객65 원두 구매 후속 제안', '2024-04-05', '2024-04-09', '2024-04-14', '2024-04-19', '2024-04-18', '기존 원두 재구매 및 서비스 연장 제안', '모닝브루 - 고객65 기존 원두 재구매 및 서비스 연장 제안', 65),
    (66, NOW(), NOW(), '커피샵 - 고객66 원두 구매 후속 제안', '2024-04-06', '2024-04-10', '2024-04-15', '2024-04-20', '2024-04-19', '고급 원두 리필 및 새로운 메뉴 추가 제안', '커피샵 - 고객66 고급 원두 리필 및 새로운 메뉴 추가 제안', 66),
    (67, NOW(), NOW(), '카페드림 - 고객67 원두 구매 후속 제안', '2024-04-07', '2024-04-11', '2024-04-16', '2024-04-21', '2024-04-20', '기존 원두 리필 및 추가 서비스 제안', '카페드림 - 고객67 기존 원두 리필 및 추가 서비스 제안', 67),
    (68, NOW(), NOW(), '프리미엄커피 - 고객68 원두 구매 후속 제안', '2024-04-08', '2024-04-12', '2024-04-17', '2024-04-22', '2024-04-21', '원두 품질 향상 및 서비스 연장 제안', '프리미엄커피 - 고객68 원두 품질 향상 및 서비스 연장 제안', 68),
    (69, NOW(), NOW(), '커피월드 - 고객69 원두 구매 후속 제안', '2024-04-09', '2024-04-13', '2024-04-18', '2024-04-23', '2024-04-22', '고급 원두 리필 및 머신 업그레이드 제안', '커피월드 - 고객69 고급 원두 리필 및 머신 업그레이드 제안', 69),
    (70, NOW(), NOW(), '커피로맨스 - 고객70 원두 구매 후속 제안', '2024-04-10', '2024-04-14', '2024-04-19', '2024-04-24', '2024-04-23', '신규 원두 공급 및 서비스 연장 제안', '커피로맨스 - 고객70 신규 원두 공급 및 서비스 연장 제안', 70),
    (71, NOW(), NOW(), '카페시크릿 - 고객71 원두 구매 후속 제안', '2024-04-11', '2024-04-15', '2024-04-20', '2024-04-25', '2024-04-24', '기존 원두 재공급 및 커피 머신 업그레이드 제안', '카페시크릿 - 고객71 기존 원두 재공급 및 커피 머신 업그레이드 제안', 71),
    (72, NOW(), NOW(), '그린커피 - 고객72 원두 구매 후속 제안', '2024-04-12', '2024-04-16', '2024-04-21', '2024-04-26', '2024-04-25', '고급 원두 리필 및 추가 메뉴 제안', '그린커피 - 고객72 고급 원두 리필 및 추가 메뉴 제안', 72),
    (73, NOW(), NOW(), '카페퀸즈 - 고객73 원두 구매 후속 제안', '2024-04-13', '2024-04-17', '2024-04-22', '2024-04-27', '2024-04-26', '커피 머신 업그레이드 및 서비스 연장 제안', '카페퀸즈 - 고객73 커피 머신 업그레이드 및 서비스 연장 제안', 73),
    (74, NOW(), NOW(), '커피비즈 - 고객74 원두 구매 후속 제안', '2024-04-14', '2024-04-18', '2024-04-23', '2024-04-28', '2024-04-27', '후속 제품 공급 및 커피 머신 개선 제안', '커피비즈 - 고객74 후속 제품 공급 및 커피 머신 개선 제안', 74),
    (75, NOW(), NOW(), '리치커피 - 고객75 원두 구매 후속 제안', '2024-04-15', '2024-04-19', '2024-04-24', '2024-04-29', '2024-04-28', '기존 원두 리필 및 서비스 추가 제안', '리치커피 - 고객75 기존 원두 리필 및 서비스 추가 제안', 75),
    (76, NOW(), NOW(), '커피포인트 - 고객76 원두 구매 후속 제안', '2024-04-16', '2024-04-20', '2024-04-25', '2024-04-30', '2024-04-29', '원두 품질 향상 및 새로운 서비스 제안', '커피포인트 - 고객76 원두 품질 향상 및 새로운 서비스 제안', 76),
    (77, NOW(), NOW(), '카페베이커리 - 고객77 원두 구매 후속 제안', '2024-04-17', '2024-04-21', '2024-04-26', '2024-05-01', '2024-04-30', '후속 원두 공급 및 서비스 연장 제안', '카페베이커리 - 고객77 후속 원두 공급 및 서비스 연장 제안', 77),
    (78, NOW(), NOW(), '커피마스터 - 고객78 원두 구매 후속 제안', '2024-04-18', '2024-04-22', '2024-04-27', '2024-05-02', '2024-05-01', '기존 원두 품질 향상 및 새로운 제품 제안', '커피마스터 - 고객78 기존 원두 품질 향상 및 새로운 제품 제안', 78),
    (79, NOW(), NOW(), '브라운커피 - 고객79 원두 구매 후속 제안', '2024-04-19', '2024-04-23', '2024-04-28', '2024-05-03', '2024-05-02', '고급 원두 리필 및 커피 머신 개선 제안', '브라운커피 - 고객79 고급 원두 리필 및 커피 머신 개선 제안', 79),
    (80, NOW(), NOW(), '그랜드카페 - 고객80 원두 구매 후속 제안', '2024-04-20', '2024-04-24', '2024-04-29', '2024-05-04', '2024-05-03', '기존 원두 재공급 및 추가 서비스 제안', '그랜드카페 - 고객80 기존 원두 재공급 및 추가 서비스 제안', 80),
    (81, NOW(), NOW(), '커피팜 - 고객14 원두 구매 제안', '2024-03-01', '2024-03-05', '2024-03-10', '2024-03-15', '2024-03-12', '고급 원두 및 커피머신 제공 제안', '커피팜 - 고객14 고객에게 제공되는 고급 원두와 커피머신 제안', 14),
    (82, NOW(), NOW(), '원두해 - 고객15 원두 구매 제안', '2024-03-02', '2024-03-06', '2024-03-11', '2024-03-16', '2024-03-13', '고급 원두 및 커피머신 제공 제안', '원두해 - 고객15 고객에게 제공되는 고급 원두와 커피머신 제안', 15),
    (83, NOW(), NOW(), '커피향 - 고객16 원두 구매 제안', '2024-03-03', '2024-03-07', '2024-03-12', '2024-03-17', '2024-03-14', '고급 원두 및 커피머신 제공 제안', '커피향 - 고객16 고객에게 제공되는 고급 원두와 커피머신 제안', 16),
    (84, NOW(), NOW(), '원두콜렉션 - 고객17 원두 구매 제안', '2024-03-04', '2024-03-08', '2024-03-13', '2024-03-18', '2024-03-15', '고급 원두 및 커피머신 제공 제안', '원두콜렉션 - 고객17 고객에게 제공되는 고급 원두와 커피머신 제안', 17),
    (85, NOW(), NOW(), '커피왕 - 고객18 원두 구매 제안', '2024-03-05', '2024-03-09', '2024-03-14', '2024-03-19', '2024-03-16', '고급 원두 및 커피머신 제공 제안', '커피왕 - 고객18 고객에게 제공되는 고급 원두와 커피머신 제안', 18),
    (86, NOW(), NOW(), '원두전문 - 고객19 원두 구매 제안', '2024-03-06', '2024-03-10', '2024-03-15', '2024-03-20', '2024-03-17', '고급 원두 및 커피머신 제공 제안', '원두전문 - 고객19 고객에게 제공되는 고급 원두와 커피머신 제안', 19),
    (87, NOW(), NOW(), '커피트레이드 - 고객20 원두 구매 제안', '2024-03-07', '2024-03-11', '2024-03-16', '2024-03-21', '2024-03-18', '고급 원두 및 커피머신 제공 제안', '커피트레이드 - 고객20 고객에게 제공되는 고급 원두와 커피머신 제안', 20),
    (88, NOW(), NOW(), '원두마켓 - 고객21 원두 구매 제안', '2024-03-08', '2024-03-12', '2024-03-17', '2024-03-22', '2024-03-19', '고급 원두 및 커피머신 제공 제안', '원두마켓 - 고객21 고객에게 제공되는 고급 원두와 커피머신 제안', 21),
    (89, NOW(), NOW(), '커피플랜트 - 고객22 원두 구매 제안', '2024-03-09', '2024-03-13', '2024-03-18', '2024-03-23', '2024-03-20', '고급 원두 및 커피머신 제공 제안', '커피플랜트 - 고객22 고객에게 제공되는 고급 원두와 커피머신 제안', 22),
    (90, NOW(), NOW(), '커피나무 - 고객23 원두 구매 제안', '2024-03-10', '2024-03-14', '2024-03-19', '2024-03-24', '2024-03-21', '고급 원두 및 커피머신 제공 제안', '커피나무 - 고객23 고객에게 제공되는 고급 원두와 커피머신 제안', 23),
    (91, NOW(), NOW(), '커피팜 - 고객24 원두 구매 제안', '2024-03-11', '2024-03-15', '2024-03-20', '2024-03-25', '2024-03-22', '고급 원두 및 커피머신 제공 제안', '커피팜 - 고객24 고객에게 제공되는 고급 원두와 커피머신 제안', 24),
    (92, NOW(), NOW(), '원두해 - 고객25 원두 구매 제안', '2024-03-12', '2024-03-16', '2024-03-21', '2024-03-26', '2024-03-23', '고급 원두 및 커피머신 제공 제안', '원두해 - 고객25 고객에게 제공되는 고급 원두와 커피머신 제안', 25),
    (93, NOW(), NOW(), '커피향 - 고객26 원두 구매 제안', '2024-03-13', '2024-03-17', '2024-03-22', '2024-03-27', '2024-03-24', '고급 원두 및 커피머신 제공 제안', '커피향 - 고객26 고객에게 제공되는 고급 원두와 커피머신 제안', 26),
    (94, NOW(), NOW(), '원두콜렉션 - 고객27 원두 구매 제안', '2024-03-14', '2024-03-18', '2024-03-23', '2024-03-28', '2024-03-25', '고급 원두 및 커피머신 제공 제안', '원두콜렉션 - 고객27 고객에게 제공되는 고급 원두와 커피머신 제안', 27),
    (95, NOW(), NOW(), '커피왕 - 고객28 원두 구매 제안', '2024-03-15', '2024-03-19', '2024-03-24', '2024-03-29', '2024-03-26', '고급 원두 및 커피머신 제공 제안', '커피왕 - 고객28 고객에게 제공되는 고급 원두와 커피머신 제안', 28),
    (96, NOW(), NOW(), '원두전문 - 고객29 원두 구매 제안', '2024-03-16', '2024-03-20', '2024-03-25', '2024-03-30', '2024-03-27', '고급 원두 및 커피머신 제공 제안', '원두전문 - 고객29 고객에게 제공되는 고급 원두와 커피머신 제안', 29),
    (97, NOW(), NOW(), '커피트레이드 - 고객30 원두 구매 제안', '2024-03-17', '2024-03-21', '2024-03-26', '2024-03-31', '2024-03-28', '고급 원두 및 커피머신 제공 제안', '커피트레이드 - 고객30 고객에게 제공되는 고급 원두와 커피머신 제안', 30),
    (98, NOW(), NOW(), '원두마켓 - 고객31 원두 구매 제안', '2024-03-18', '2024-03-22', '2024-03-27', '2024-04-01', '2024-03-29', '고급 원두 및 커피머신 제공 제안', '원두마켓 - 고객31 고객에게 제공되는 고급 원두와 커피머신 제안', 31),
    (99, NOW(), NOW(), '커피플랜트 - 고객32 원두 구매 제안', '2024-03-19', '2024-03-23', '2024-03-28', '2024-04-02', '2024-03-30', '고급 원두 및 커피머신 제공 제안', '커피플랜트 - 고객32 고객에게 제공되는 고급 원두와 커피머신 제안', 32),
    (100, NOW(), NOW(), '커피나무 - 고객33 원두 구매 제안', '2024-03-20', '2024-03-24', '2024-03-29', '2024-04-03', '2024-04-01', '고급 원두 및 커피머신 제공 제안', '커피나무 - 고객33 고객에게 제공되는 고급 원두와 커피머신 제안', 33),
    (101, NOW(), NOW(), '기존고객 원두 판매 - 고객10 원두 구매 제안', '2024-04-01', '2024-04-05', '2024-04-10', '2024-04-15', '2024-04-12', '기존 고객에게 고급 원두 제공 제안', '기존 고객에게 제공되는 고급 원두와 커피머신 제안', 10),
    (102, NOW(), NOW(), '기존고객 원두 판매 - 고객11 원두 구매 제안', '2024-04-02', '2024-04-06', '2024-04-11', '2024-04-16', '2024-04-13', '기존 고객에게 고급 원두 제공 제안', '기존 고객에게 제공되는 고급 원두와 커피머신 제안', 11),
    (103, NOW(), NOW(), '기존고객 원두 판매 - 고객13 원두 구매 제안', '2024-04-03', '2024-04-07', '2024-04-12', '2024-04-17', '2024-04-14', '기존 고객에게 고급 원두 제공 제안', '기존 고객에게 제공되는 고급 원두와 커피머신 제안', 13),
    (104, NOW(), NOW(), '커피로드 - 고객18 원두 구매 제안', '2024-04-04', '2024-04-08', '2024-04-13', '2024-04-18', '2024-04-15', '고급 원두 및 커피머신 제공 제안', '커피로드 - 고객18 고객에게 제공되는 고급 원두와 커피머신 제안', 18),
    (105, NOW(), NOW(), '커피필드 - 고객19 원두 구매 제안', '2024-04-05', '2024-04-09', '2024-04-14', '2024-04-19', '2024-04-16', '고급 원두 및 커피머신 제공 제안', '커피필드 - 고객19 고객에게 제공되는 고급 원두와 커피머신 제안', 19),
    (106, NOW(), NOW(), '원두농장 - 고객20 원두 구매 제안', '2024-04-06', '2024-04-10', '2024-04-15', '2024-04-20', '2024-04-17', '고급 원두 및 커피머신 제공 제안', '원두농장 - 고객20 고객에게 제공되는 고급 원두와 커피머신 제안', 20),
    (107, NOW(), NOW(), '커피의정원 - 고객21 원두 구매 제안', '2024-04-07', '2024-04-11', '2024-04-16', '2024-04-21', '2024-04-18', '고급 원두 및 커피머신 제공 제안', '커피의정원 - 고객21 고객에게 제공되는 고급 원두와 커피머신 제안', 21),
    (108, NOW(), NOW(), '기존고객 원두 판매 - 고객18 원두 구매 제안', '2024-05-01', '2024-05-05', '2024-05-10', '2024-05-15', '2024-05-12', '기존 고객에게 고급 원두 제공 제안', '기존 고객에게 제공되는 고급 원두와 커피머신 제안', 18),
    (109, NOW(), NOW(), '기존고객 원두 판매 - 고객19 원두 구매 제안', '2024-05-02', '2024-05-06', '2024-05-11', '2024-05-16', '2024-05-13', '기존 고객에게 고급 원두 제공 제안', '기존 고객에게 제공되는 고급 원두와 커피머신 제안', 19),
    (110, NOW(), NOW(), '기존고객 원두 판매 - 고객20 원두 구매 제안', '2024-05-03', '2024-05-07', '2024-05-12', '2024-05-17', '2024-05-14', '기존 고객에게 고급 원두 제공 제안', '기존 고객에게 제공되는 고급 원두와 커피머신 제안', 20),
    (111, NOW(), NOW(), '커피월드 - 고객22 원두 구매 제안', '2024-05-04', '2024-05-08', '2024-05-13', '2024-05-18', '2024-05-15', '고급 원두 및 커피머신 제공 제안', '커피월드 - 고객22 고객에게 제공되는 고급 원두와 커피머신 제안', 22),
    (112, NOW(), NOW(), '원두유통 - 고객23 원두 구매 제안', '2024-05-05', '2024-05-09', '2024-05-14', '2024-05-19', '2024-05-16', '고급 원두 및 커피머신 제공 제안', '원두유통 - 고객23 고객에게 제공되는 고급 원두와 커피머신 제안', 23),
    (113, NOW(), NOW(), '커피와행복 - 고객24 원두 구매 제안', '2024-05-06', '2024-05-10', '2024-05-15', '2024-05-20', '2024-05-17', '고급 원두 및 커피머신 제공 제안', '커피와행복 - 고객24 고객에게 제공되는 고급 원두와 커피머신 제안', 24),
    (114, NOW(), NOW(), '커피사랑 - 고객25 원두 구매 제안', '2024-05-07', '2024-05-11', '2024-05-16', '2024-05-21', '2024-05-18', '고급 원두 및 커피머신 제공 제안', '커피사랑 - 고객25 고객에게 제공되는 고급 원두와 커피머신 제안', 25),
    (115, NOW(), NOW(), '커피아카데미 - 고객10 원두 구매 제안', '2024-06-01', '2024-06-05', '2024-06-10', '2024-06-15', '2024-06-12', '고급 원두 및 커피머신 제공 제안', '커피아카데미 - 고객10에게 제공되는 고급 원두와 커피머신 제안', 10),
    (116, NOW(), NOW(), '커피밸리 - 고객11 원두 구매 제안', '2024-06-02', '2024-06-06', '2024-06-11', '2024-06-16', '2024-06-13', '고급 원두 및 커피머신 제공 제안', '커피밸리 - 고객11에게 제공되는 고급 원두와 커피머신 제안', 11),
    (117, NOW(), NOW(), '커피원 - 고객12 원두 구매 제안', '2024-06-03', '2024-06-07', '2024-06-12', '2024-06-17', '2024-06-14', '고급 원두 및 커피머신 제공 제안', '커피원 - 고객12에게 제공되는 고급 원두와 커피머신 제안', 12),
    (118, NOW(), NOW(), '커피마스터 - 고객13 원두 구매 제안', '2024-06-04', '2024-06-08', '2024-06-13', '2024-06-18', '2024-06-15', '고급 원두 및 커피머신 제공 제안', '커피마스터 - 고객13에게 제공되는 고급 원두와 커피머신 제안', 13),
    (119, NOW(), NOW(), '커피팡 - 고객14 원두 구매 제안', '2024-06-05', '2024-06-09', '2024-06-14', '2024-06-19', '2024-06-16', '고급 원두 및 커피머신 제공 제안', '커피팡 - 고객14에게 제공되는 고급 원두와 커피머신 제안', 14),
    (120, NOW(), NOW(), '커피헬퍼 - 고객15 원두 구매 제안', '2024-06-06', '2024-06-10', '2024-06-15', '2024-06-20', '2024-06-17', '고급 원두 및 커피머신 제공 제안', '커피헬퍼 - 고객15에게 제공되는 고급 원두와 커피머신 제안', 15),
    (121, NOW(), NOW(), '커피월드 - 고객16 원두 구매 제안', '2024-06-07', '2024-06-11', '2024-06-16', '2024-06-21', '2024-06-18', '고급 원두 및 커피머신 제공 제안', '커피월드 - 고객16에게 제공되는 고급 원두와 커피머신 제안', 16),
    (122, NOW(), NOW(), '커피존 - 고객17 원두 구매 제안', '2024-06-08', '2024-06-12', '2024-06-17', '2024-06-22', '2024-06-19', '고급 원두 및 커피머신 제공 제안', '커피존 - 고객17에게 제공되는 고급 원두와 커피머신 제안', 17),
    (123, NOW(), NOW(), '커피소울 - 고객18 원두 구매 제안', '2024-06-09', '2024-06-13', '2024-06-18', '2024-06-23', '2024-06-20', '고급 원두 및 커피머신 제공 제안', '커피소울 - 고객18에게 제공되는 고급 원두와 커피머신 제안', 18),
    (124, NOW(), NOW(), '커피피크 - 고객19 원두 구매 제안', '2024-06-10', '2024-06-14', '2024-06-19', '2024-06-24', '2024-06-21', '고급 원두 및 커피머신 제공 제안', '커피피크 - 고객19에게 제공되는 고급 원두와 커피머신 제안', 19),
    (125, NOW(), NOW(), '기존고객 원두 판매 - 고객22 원두 구매 제안', '2024-06-10', '2024-06-15', '2024-06-16', '2024-06-25', '2024-06-20', '기존고객에게 고급 원두 및 커피머신 제공', '기존고객 원두 판매 - 고객22 원두 구매 및 서비스 제공', 22),
    (126, NOW(), NOW(), '기존고객 원두 판매 - 고객24 원두 구매 제안', '2024-06-10', '2024-06-15', '2024-06-16', '2024-06-25', '2024-06-20', '기존고객에게 고급 원두 및 커피머신 제공', '기존고객 원두 판매 - 고객24 원두 구매 및 서비스 제공', 24),
    (127, NOW(), NOW(), '기존고객 원두 판매 - 고객25 원두 구매 제안', '2024-06-10', '2024-06-15', '2024-06-16', '2024-06-25', '2024-06-20', '기존고객에게 고급 원두 및 커피머신 제공', '기존고객 원두 판매 - 고객25 원두 구매 및 서비스 제공', 25),
    (128, NOW(), NOW(), '원두의고수 - 고객26 원두 구매 제안', '2024-06-10', '2024-06-15', '2024-06-16', '2024-06-25', '2024-06-20', '고급 원두 및 커피머신 제공', '원두의고수 - 고객26 고급 원두와 커피머신 제공 제안', 26),
    (129, NOW(), NOW(), '커피도시 - 고객27 원두 구매 제안', '2024-06-10', '2024-06-15', '2024-06-16', '2024-06-25', '2024-06-20', '고급 원두 및 커피머신 제공', '커피도시 - 고객27 고급 원두와 커피머신 제공 제안', 27),
    (130, NOW(), NOW(), '원두의세계 - 고객28 원두 구매 제안', '2024-06-10', '2024-06-15', '2024-06-16', '2024-06-25', '2024-06-20', '고급 원두 및 커피머신 제공', '원두의세계 - 고객28 고급 원두와 커피머신 제공 제안', 28),
    (131, NOW(), NOW(), '커피에세이 - 고객29 원두 구매 제안', '2024-06-10', '2024-06-15', '2024-06-16', '2024-06-25', '2024-06-20', '고급 원두 및 커피머신 제공', '커피에세이 - 고객29 고급 원두와 커피머신 제공 제안', 29),
    (132, NOW(), NOW(), '기존고객 원두 판매 - 고객22 원두 구매 제안', '2024-06-11', '2024-06-16', '2024-06-17', '2024-06-26', '2024-06-21', '기존고객에게 고급 원두 및 커피머신 제공', '기존고객 원두 판매 - 고객22 원두 구매 제안', 22),
    (133, NOW(), NOW(), '기존고객 원두 판매 - 고객22 원두 구매 제안', '2024-06-12', '2024-06-17', '2024-06-18', '2024-06-27', '2024-06-22', '기존고객에게 고급 원두 및 커피머신 제공', '기존고객 원두 판매 - 고객22 원두 구매 제안', 22),
    (134, NOW(), NOW(), '기존고객 원두 판매 - 고객24 원두 구매 제안', '2024-06-11', '2024-06-16', '2024-06-17', '2024-06-26', '2024-06-21', '기존고객에게 고급 원두 및 커피머신 제공', '기존고객 원두 판매 - 고객24 원두 구매 제안', 24),
    (135, NOW(), NOW(), '기존고객 원두 판매 - 고객24 원두 구매 제안', '2024-06-12', '2024-06-17', '2024-06-18', '2024-06-27', '2024-06-22', '기존고객에게 고급 원두 및 커피머신 제공', '기존고객 원두 판매 - 고객24 원두 구매 제안', 24),
    (136, NOW(), NOW(), '기존고객 원두 판매 - 고객25 원두 구매 제안', '2024-06-11', '2024-06-16', '2024-06-17', '2024-06-26', '2024-06-21', '기존고객에게 고급 원두 및 커피머신 제공', '기존고객 원두 판매 - 고객25 원두 구매 제안', 25),
    (137, NOW(), NOW(), '기존고객 원두 판매 - 고객25 원두 구매 제안', '2024-06-12', '2024-06-17', '2024-06-18', '2024-06-27', '2024-06-22', '기존고객에게 고급 원두 및 커피머신 제공', '기존고객 원두 판매 - 고객25 원두 구매 제안', 25),
    (138, NOW(), NOW(), '원두의고수 - 고객26 원두 구매 제안', '2024-06-11', '2024-06-16', '2024-06-17', '2024-06-26', '2024-06-21', '고급 원두 및 커피머신 제공', '원두의고수 - 고객26 고급 원두와 커피머신 제공 제안', 26),
    (139, NOW(), NOW(), '원두의고수 - 고객26 원두 구매 제안', '2024-06-12', '2024-06-17', '2024-06-18', '2024-06-27', '2024-06-22', '고급 원두 및 커피머신 제공', '원두의고수 - 고객26 고급 원두와 커피머신 제공 제안', 26),
    (140, NOW(), NOW(), '커피도시 - 고객27 원두 구매 제안', '2024-06-11', '2024-06-16', '2024-06-17', '2024-06-26', '2024-06-21', '고급 원두 및 커피머신 제공', '커피도시 - 고객27 고급 원두와 커피머신 제공 제안', 27),
    (141, NOW(), NOW(), '커피도시 - 고객27 원두 구매 제안', '2024-06-12', '2024-06-17', '2024-06-18', '2024-06-27', '2024-06-22', '고급 원두 및 커피머신 제공', '커피도시 - 고객27 고급 원두와 커피머신 제공 제안', 27),
    (142, NOW(), NOW(), '원두의세계 - 고객28 원두 구매 제안', '2024-06-11', '2024-06-16', '2024-06-17', '2024-06-26', '2024-06-21', '고급 원두 및 커피머신 제공', '원두의세계 - 고객28 고급 원두와 커피머신 제공 제안', 28),
    (143, NOW(), NOW(), '원두의세계 - 고객28 원두 구매 제안', '2024-06-12', '2024-06-17', '2024-06-18', '2024-06-27', '2024-06-22', '고급 원두 및 커피머신 제공', '원두의세계 - 고객28 고급 원두와 커피머신 제공 제안', 28),
    (144, NOW(), NOW(), '커피에세이 - 고객29 원두 구매 제안', '2024-06-11', '2024-06-16', '2024-06-17', '2024-06-26', '2024-06-21', '고급 원두 및 커피머신 제공', '커피에세이 - 고객29 고급 원두와 커피머신 제공 제안', 29),
    (145, NOW(), NOW(), '커피에세이 - 고객29 원두 구매 제안', '2024-06-12', '2024-06-17', '2024-06-18', '2024-06-27', '2024-06-22', '고급 원두 및 커피머신 제공', '커피에세이 - 고객29 고급 원두와 커피머신 제공 제안', 29),
    (146, NOW(), NOW(), '기존고객 원두 판매 - 제안1', '2024-07-03', '2024-07-05', '2024-07-01', '2024-08-15', '2024-07-12', '기존 고객에게 제공되는 원두 판매 제안', '기존 고객에게 제공되는 원두 및 서비스 제안', 27),
    (147, NOW(), NOW(), '기존고객 원두 판매 - 제안2', '2024-07-04', '2024-07-06', '2024-07-01', '2024-08-15', '2024-07-13', '기존 고객에게 제공되는 원두 판매 제안', '기존 고객에게 제공되는 원두 및 서비스 제안', 27),
    (148, NOW(), NOW(), '기존고객 원두 판매 - 제안3', '2024-07-05', '2024-07-07', '2024-07-01', '2024-08-15', '2024-07-14', '기존 고객에게 제공되는 원두 판매 제안', '기존 고객에게 제공되는 원두 및 서비스 제안', 27),
    (149, NOW(), NOW(), '기존고객 원두 판매 - 제안4', '2024-07-06', '2024-07-08', '2024-07-01', '2024-08-15', '2024-07-15', '기존 고객에게 제공되는 원두 판매 제안', '기존 고객에게 제공되는 원두 및 서비스 제안', 28),
    (150, NOW(), NOW(), '기존고객 원두 판매 - 제안5', '2024-07-07', '2024-07-09', '2024-07-01', '2024-08-15', '2024-07-16', '기존 고객에게 제공되는 원두 판매 제안', '기존 고객에게 제공되는 원두 및 서비스 제안', 28),
    (151, NOW(), NOW(), '기존고객 원두 판매 - 제안6', '2024-07-08', '2024-07-10', '2024-07-01', '2024-08-15', '2024-07-17', '기존 고객에게 제공되는 원두 판매 제안', '기존 고객에게 제공되는 원두 및 서비스 제안', 28),
    (152, NOW(), NOW(), '기존고객 원두 판매 - 제안7', '2024-07-09', '2024-07-11', '2024-07-01', '2024-08-15', '2024-07-18', '기존 고객에게 제공되는 원두 판매 제안', '기존 고객에게 제공되는 원두 및 서비스 제안', 29),
    (153, NOW(), NOW(), '기존고객 원두 판매 - 제안8', '2024-07-10', '2024-07-12', '2024-07-01', '2024-08-15', '2024-07-19', '기존 고객에게 제공되는 원두 판매 제안', '기존 고객에게 제공되는 원두 및 서비스 제안', 29),
    (154, NOW(), NOW(), '커피히어로 원두 구매 제안 - 제안1', '2024-07-03', '2024-07-05', '2024-07-01', '2024-08-15', '2024-07-12', '고급 원두 및 커피머신 제공 제안', '커피히어로 - 고객30에게 제공되는 고급 원두 및 커피머신 제안', 30),
    (155, NOW(), NOW(), '커피히어로 원두 구매 제안 - 제안2', '2024-07-04', '2024-07-06', '2024-07-01', '2024-08-15', '2024-07-13', '고급 원두 및 커피머신 제공 제안', '커피히어로 - 고객30에게 제공되는 고급 원두 및 커피머신 제안', 30),
    (156, NOW(), NOW(), '커피플랜트 원두 구매 제안 - 제안1', '2024-07-05', '2024-07-07', '2024-07-01', '2024-08-15', '2024-07-14', '고급 원두 및 커피머신 제공 제안', '커피플랜트 - 고객31에게 제공되는 고급 원두 및 커피머신 제안', 31),
    (157, NOW(), NOW(), '커피플랜트 원두 구매 제안 - 제안2', '2024-07-06', '2024-07-08', '2024-07-01', '2024-08-15', '2024-07-15', '고급 원두 및 커피머신 제공 제안', '커피플랜트 - 고객31에게 제공되는 고급 원두 및 커피머신 제안', 31),
    (158, NOW(), NOW(), '원두장터 원두 구매 제안 - 제안1', '2024-07-07', '2024-07-09', '2024-07-01', '2024-08-15', '2024-07-16', '고급 원두 및 커피머신 제공 제안', '원두장터 - 고객32에게 제공되는 고급 원두 및 커피머신 제안', 32),
    (159, NOW(), NOW(), '원두장터 원두 구매 제안 - 제안2', '2024-07-08', '2024-07-10', '2024-07-01', '2024-08-15', '2024-07-17', '고급 원두 및 커피머신 제공 제안', '원두장터 - 고객32에게 제공되는 고급 원두 및 커피머신 제안', 32),
    (160, NOW(), NOW(), '커피챔피언 원두 구매 제안 - 제안1', '2024-07-09', '2024-07-11', '2024-07-01', '2024-08-15', '2024-07-18', '고급 원두 및 커피머신 제공 제안', '커피챔피언 - 고객33에게 제공되는 고급 원두 및 커피머신 제안', 33),
    (161, NOW(), NOW(), '커피챔피언 원두 구매 제안 - 제안2', '2024-07-10', '2024-07-12', '2024-07-01', '2024-08-15', '2024-07-19', '고급 원두 및 커피머신 제공 제안', '커피챔피언 - 고객33에게 제공되는 고급 원두 및 커피머신 제안', 33),
    (162, NOW(), NOW(), '기존고객 원두 판매 - 제안 1', '2024-08-02', '2024-08-06', '2024-08-10', '2024-08-15', '2024-08-12', '기존 고객에게 제공되는 다른 원두 및 서비스 제안', '기존고객에게 다른 원두 및 커피 관련 서비스 제안', 1),
    (163, NOW(), NOW(), '기존고객 원두 판매 - 제안 2', '2024-08-03', '2024-08-07', '2024-08-11', '2024-08-16', '2024-08-13', '기존 고객에게 제공되는 고급 원두 및 서비스 제안', '기존고객에게 고급 원두 및 서비스 제공', 1),
    (164, NOW(), NOW(), '기존고객 원두 판매 - 제안 3', '2024-08-04', '2024-08-08', '2024-08-12', '2024-08-17', '2024-08-14', '기존 고객에게 제공되는 새로운 원두 및 서비스를 포함한 제안', '기존고객에게 새로운 원두 및 서비스 제공', 1),
    (165, NOW(), NOW(), '커피스토어 - 고객34 원두 구매 제안 1', '2024-08-05', '2024-08-09', '2024-08-13', '2024-08-18', '2024-08-15', '고급 원두 및 커피머신 제공 제안', '커피스토어 - 고객34에게 제공되는 고급 원두와 커피머신 제안', 34),
    (166, NOW(), NOW(), '커피스토어 - 고객34 원두 구매 제안 2', '2024-08-06', '2024-08-10', '2024-08-14', '2024-08-19', '2024-08-16', '고급 원두 및 커피머신 제공 제안', '커피스토어 - 고객34에게 제공되는 고급 원두와 커피머신 제안', 34),
    (167, NOW(), NOW(), '원두박사 - 고객35 원두 구매 제안 1', '2024-08-07', '2024-08-11', '2024-08-15', '2024-08-20', '2024-08-17', '고급 원두 및 커피머신 제공 제안', '원두박사 - 고객35에게 제공되는 고급 원두와 커피머신 제안', 35),
    (168, NOW(), NOW(), '원두박사 - 고객35 원두 구매 제안 2', '2024-08-08', '2024-08-12', '2024-08-16', '2024-08-21', '2024-08-18', '고급 원두 및 커피머신 제공 제안', '원두박사 - 고객35에게 제공되는 고급 원두와 커피머신 제안', 35),
    (169, NOW(), NOW(), '커피로드 - 고객36 원두 구매 제안 1', '2024-08-09', '2024-08-13', '2024-08-17', '2024-08-22', '2024-08-19', '고급 원두 및 커피머신 제공 제안', '커피로드 - 고객36에게 제공되는 고급 원두와 커피머신 제안', 36),
    (170, NOW(), NOW(), '커피로드 - 고객36 원두 구매 제안 2', '2024-08-10', '2024-08-14', '2024-08-18', '2024-08-23', '2024-08-20', '고급 원두 및 커피머신 제공 제안', '커피로드 - 고객36에게 제공되는 고급 원두와 커피머신 제안', 36),
    (171, NOW(), NOW(), '커피유통 - 고객37 원두 구매 제안 1', '2024-08-11', '2024-08-15', '2024-08-19', '2024-08-24', '2024-08-21', '고급 원두 및 커피머신 제공 제안', '커피유통 - 고객37에게 제공되는 고급 원두와 커피머신 제안', 37),
    (172, NOW(), NOW(), '커피유통 - 고객37 원두 구매 제안 2', '2024-08-12', '2024-08-16', '2024-08-20', '2024-08-25', '2024-08-22', '고급 원두 및 커피머신 제공 제안', '커피유통 - 고객37에게 제공되는 고급 원두와 커피머신 제안', 37),
    (173, NOW(), NOW(), '기존고객 원두 판매 - 제안 4', '2024-09-02', '2024-09-06', '2024-09-10', '2024-09-15', '2024-09-12', '기존 고객에게 제공되는 새로운 원두 및 서비스 제안', '기존고객에게 제공되는 새로운 원두 및 커피 관련 서비스 제안', 34),
    (174, NOW(), NOW(), '기존고객 원두 판매 - 제안 5', '2024-09-03', '2024-09-07', '2024-09-11', '2024-09-16', '2024-09-13', '기존 고객에게 제공되는 새로운 원두 및 서비스 제안', '기존고객에게 제공되는 고급 원두 및 서비스 제안', 35),
    (175, NOW(), NOW(), '기존고객 원두 판매 - 제안 6', '2024-09-04', '2024-09-08', '2024-09-12', '2024-09-17', '2024-09-14', '기존 고객에게 제공되는 다른 원두 및 커피 관련 서비스 제안', '기존고객에게 다른 원두 및 커피 서비스 제안', 36),
    (176, NOW(), NOW(), '커피존 - 고객39 원두 구매 제안 1', '2024-09-05', '2024-09-09', '2024-09-13', '2024-09-18', '2024-09-15', '고급 원두 및 커피머신 제공 제안', '커피존 - 고객39에게 제공되는 고급 원두와 커피머신 제안', 39),
    (177, NOW(), NOW(), '커피존 - 고객39 원두 구매 제안 2', '2024-09-06', '2024-09-10', '2024-09-14', '2024-09-19', '2024-09-16', '고급 원두 및 커피머신 제공 제안', '커피존 - 고객39에게 제공되는 고급 원두와 커피머신 제안', 39),
    (178, NOW(), NOW(), '커피네이션 - 고객40 원두 구매 제안 1', '2024-09-07', '2024-09-11', '2024-09-15', '2024-09-20', '2024-09-17', '고급 원두 및 커피머신 제공 제안', '커피네이션 - 고객40에게 제공되는 고급 원두와 커피머신 제안', 40),
    (179, NOW(), NOW(), '커피네이션 - 고객40 원두 구매 제안 2', '2024-09-08', '2024-09-12', '2024-09-16', '2024-09-21', '2024-09-18', '고급 원두 및 커피머신 제공 제안', '커피네이션 - 고객40에게 제공되는 고급 원두와 커피머신 제안', 40),
    (180, NOW(), NOW(), '기존고객 원두 판매 - 고객38 원두 구매 제안', '2024-10-01', '2024-10-05', '2024-10-10', '2024-10-15', '2024-10-12', '기존 고객에게 고급 원두 제공 제안', '기존고객 원두 판매 - 고객38 고객에게 제공되는 고급 원두 판매 제안', 38),
    (181, NOW(), NOW(), '기존고객 원두 판매 - 고객40 원두 구매 제안', '2024-10-01', '2024-10-05', '2024-10-10', '2024-10-15', '2024-10-12', '기존 고객에게 고급 원두 제공 제안', '기존고객 원두 판매 - 고객40 고객에게 제공되는 고급 원두 판매 제안', 40),
    (182, NOW(), NOW(), '기존고객 원두 판매 - 고객41 원두 구매 제안', '2024-10-01', '2024-10-05', '2024-10-10', '2024-10-15', '2024-10-12', '기존 고객에게 고급 원두 제공 제안', '기존고객 원두 판매 - 고객41 고객에게 제공되는 고급 원두 판매 제안', 41),
    (183, NOW(), NOW(), '원두사랑 - 고객42 원두 구매 제안', '2024-10-01', '2024-10-05', '2024-10-10', '2024-10-15', '2024-10-12', '고급 원두와 커피머신 제공 제안', '원두사랑 - 고객42 고객에게 제공되는 고급 원두와 커피머신 제안', 42),
    (184, NOW(), NOW(), '커피천국 - 고객43 원두 구매 제안', '2024-10-01', '2024-10-05', '2024-10-10', '2024-10-15', '2024-10-12', '고급 원두와 커피머신 제공 제안', '커피천국 - 고객43 고객에게 제공되는 고급 원두와 커피머신 제안', 43),
    (185, NOW(), NOW(), '원두마을 - 고객44 원두 구매 제안', '2024-10-01', '2024-10-05', '2024-10-10', '2024-10-15', '2024-10-12', '고급 원두와 커피머신 제공 제안', '원두마을 - 고객44 고객에게 제공되는 고급 원두와 커피머신 제안', 44),
    (186, NOW(), NOW(), '커피마켓 - 고객45 원두 구매 제안', '2024-10-01', '2024-10-05', '2024-10-10', '2024-10-15', '2024-10-12', '고급 원두와 커피머신 제공 제안', '커피마켓 - 고객45 고객에게 제공되는 고급 원두와 커피머신 제안', 45),
    (187, NOW(), NOW(), '기존고객 원두 판매 - 고객42 원두 구매 제안', '2024-11-01', '2024-11-05', '2024-11-10', '2024-11-15', '2024-11-12', '기존 고객에게 고급 원두 제공 제안', '기존고객 원두 판매 - 고객42 고객에게 제공되는 고급 원두 판매 제안', 42),
    (188, NOW(), NOW(), '기존고객 원두 판매 - 고객43 원두 구매 제안', '2024-11-01', '2024-11-05', '2024-11-10', '2024-11-15', '2024-11-12', '기존 고객에게 고급 원두 제공 제안', '기존고객 원두 판매 - 고객43 고객에게 제공되는 고급 원두 판매 제안', 43),
    (189, NOW(), NOW(), '기존고객 원두 판매 - 고객44 원두 구매 제안', '2024-11-01', '2024-11-05', '2024-11-10', '2024-11-15', '2024-11-12', '기존 고객에게 고급 원두 제공 제안', '기존고객 원두 판매 - 고객44 고객에게 제공되는 고급 원두 판매 제안', 44),
    (190, NOW(), NOW(), '커피천사 - 고객46 원두 구매 제안', '2024-11-01', '2024-11-05', '2024-11-10', '2024-11-15', '2024-11-12', '고급 원두와 커피머신 제공 제안', '커피천사 - 고객46 고객에게 제공되는 고급 원두와 커피머신 제안', 46),
    (191, NOW(), NOW(), '원두천국 - 고객47 원두 구매 제안', '2024-11-01', '2024-11-05', '2024-11-10', '2024-11-15', '2024-11-12', '고급 원두와 커피머신 제공 제안', '원두천국 - 고객47 고객에게 제공되는 고급 원두와 커피머신 제안', 47),
    (192, NOW(), NOW(), '커피존 - 고객48 원두 구매 제안', '2024-11-01', '2024-11-05', '2024-11-10', '2024-11-15', '2024-11-12', '고급 원두와 커피머신 제공 제안', '커피존 - 고객48 고객에게 제공되는 고급 원두와 커피머신 제안', 48),
    (193, NOW(), NOW(), '커피장인 - 고객49 원두 구매 제안', '2024-11-01', '2024-11-05', '2024-11-10', '2024-11-15', '2024-11-12', '고급 원두와 커피머신 제공 제안', '커피장인 - 고객49 고객에게 제공되는 고급 원두와 커피머신 제안', 49),
    (194, NOW(), NOW(), '커피와함께 - 고객50 원두 구매 제안', '2024-11-01', '2024-11-05', '2024-11-10', '2024-11-15', '2024-11-12', '고급 원두와 커피머신 제공 제안', '커피와함께 - 고객50 고객에게 제공되는 고급 원두와 커피머신 제안', 50),
    (195, NOW(), NOW(), '기존고객 원두 판매 제안 - 고객40', '2024-10-02', '2024-10-05', '2024-10-10', '2024-10-30', '2024-10-12', '고급 원두 및 커피머신 제안', '기존고객 원두 판매 - 고객40 제안', 40),
    (196, NOW(), NOW(), '기존고객 원두 판매 제안 - 고객41', '2024-10-03', '2024-10-06', '2024-10-11', '2024-10-28', '2024-10-13', '고급 원두 및 커피머신 제안', '기존고객 원두 판매 - 고객41 제안', 41),
    (197, NOW(), NOW(), '원두사랑 - 고객42 원두 구매 제안', '2024-10-04', '2024-10-07', '2024-10-12', '2024-10-27', '2024-10-14', '고급 원두 및 커피머신 제안', '원두사랑 - 고객42 제안', 42),
    (198, NOW(), NOW(), '커피천국 - 고객43 원두 구매 제안', '2024-10-05', '2024-10-08', '2024-10-13', '2024-10-29', '2024-10-15', '고급 원두 및 커피머신 제안', '커피천국 - 고객43 제안', 43),
    (199, NOW(), NOW(), '원두마을 - 고객44 원두 구매 제안', '2024-10-06', '2024-10-09', '2024-10-14', '2024-10-29', '2024-10-16', '고급 원두 및 커피머신 제안', '원두마을 - 고객44 제안', 44),
    (200, NOW(), NOW(), '커피마켓 - 고객45 원두 구매 제안', '2024-10-07', '2024-10-10', '2024-10-15', '2024-10-30', '2024-10-17', '고급 원두 및 커피머신 제안', '커피마켓 - 고객45 제안', 45);

-- >>>>>>>>>>>> 견적 <<<<<<<<<<<<<<

-- 견적 데이터 생성 (총 100개)

INSERT INTO tb_estimate (est_no, created_at, updated_at, est_date, name, note, prod_cnt, supply_price, surtax_yn, tax, tax_cls, total_price, prop_no)
VALUES
    (1, NOW(), NOW(), '2024-01-20', '사무실용 커피 머신 및 원두 견적', '고급 원두 구매에 대한 견적', 3, 1950000, 'Y', 195000, '매출과세', 2145000, 1),
    (2, NOW(), NOW(), '2024-01-20', '고객 맞춤형 커피 머신 및 원두 견적', '수프레모 나리뇨 원두에 대한 견적', 2, 1300000, 'N', 130000, '매출면세', 1430000, 2),
    (3, NOW(), NOW(), '2024-01-22', '커피 머신 & 원두 패키지 견적', '시다모 원두 및 예가체프 아바야 게이샤 원두에 대한 견적', 3, 1900000, 'N', 190000, '수출영세', 2090000, 3),
    (4, NOW(), NOW(), '2024-01-23', '카페 창업용 커피 머신 및 원두 견적', '멜파라이 소리치 원두에 대한 견적', 2, 1520000, 'N', 152000, '매출면세', 1672000, 4),
    (5, NOW(), NOW(), '2024-01-25', '직원용 커피 머신 및 원두 견적', '루비아 다크 브라운 원두에 대한 견적', 3, 1950000, 'N', 195000, '매출과세', 2145000, 5),
    (6, NOW(), NOW(), '2024-01-26', '전문 커피 머신 및 원두 공급 견적', '수프레모 나리뇨 원두 및 예가체프 아바야 게이샤 원두에 대한 견적', 2, 1400000, 'N', 140000, '매출면세', 1540000, 6),
    (7, NOW(), NOW(), '2024-01-27', '커피 머신 및 원두 견적서', '시다모 원두 및 멜파라이 소리치 원두에 대한 견적', 3, 1800000, 'N', 180000, '수출영세', 1980000, 7),
    (8, NOW(), NOW(), '2024-01-29', '휴게실용 커피 머신 및 원두 공급 견적', '루비아 다크 브라운 원두 및 수프레모 나리뇨 원두에 대한 견적', 2, 1300000, 'N', 130000, '매출면세', 1430000, 8),
    (9, NOW(), NOW(), '2024-01-30', '원두 구매 견적', '예가체프 아바야 게이샤 원두에 대한 견적', 2, 1300000, 'N', 130000, '매출과세', 1430000, 9),
    (10, NOW(), NOW(), '2024-02-01', '커피 기계 및 원두 공급 견적', '루비아 다크 브라운 원두 및 수프레모 나리뇨 원두에 대한 견적', 3, 1950000, 'N', 195000, '매출면세', 2145000, 10),
    (11, NOW(), NOW(), '2024-02-06', '원두 구매 견적', '시다모 원두 및 멜파라이 소리치 원두에 대한 견적', 3, 1800000, 'Y', 180000, '매출과세', 1980000, 11),
    (12, NOW(), NOW(), '2024-02-07', '매장 운영을 위한 원두 및 커피 머신 견적', '수프레모 나리뇨 원두에 대한 견적', 2, 1400000, 'N', 140000, '수출영세', 1540000, 12),
    (13, NOW(), NOW(), '2024-02-10', '원두 구매 견적', '루비아 다크 브라운 원두 및 예가체프 아바야 게이샤 원두에 대한 견적', 3, 1950000, 'Y', 195000, '매출과세', 2145000, 13),
    (14, NOW(), NOW(), '2024-02-12', '원두 구매 견적', '시다모 원두 및 멜파라이 소리치 원두에 대한 견적', 2, 1300000, 'N', 130000, '매출면세', 1430000, 14),
    (15, NOW(), NOW(), '2024-02-14', '사무실용 커피 머신 및 원두 견적', '수프레모 나리뇨 원두에 대한 견적', 2, 1400000, 'Y', 140000, '수출영세', 1540000, 15),
    (16, NOW(), NOW(), '2024-02-24', '카페 개업을 위한 원두 및 머신 견적', '고급 원두 및 커피머신 견적', 3, 9000000, 'Y', 900000, '매출과세', 9900000, 15),
    (17, NOW(), NOW(), '2024-02-25', '커피 기계 및 원두 공급 견적', '커피머신 및 원두 견적', 2, 8500000, 'N', 850000, '매출면세', 9350000, 16),
    (18, NOW(), NOW(), '2024-02-26', '비즈니스용 커피 머신 및 원두 견적', '고급 원두, 커피머신 포함 견적', 3, 9500000, 'N', 950000, '매출과세', 10450000, 17),
    (19, NOW(), NOW(), '2024-02-27', '사무실용 커피 머신 및 원두 견적', '원두 및 커피 액세서리 견적', 2, 7200000, 'N', 720000, '매출면세', 7920000, 18),
    (20, NOW(), NOW(), '2024-03-28', '커피 머신 및 원두 패키지 견적서', '커피머신 및 원두 견적', 3, 9800000, 'Y', 980000, '매출과세', 10780000, 19),
    (21, NOW(), NOW(), '2024-03-21', '고급 원두 및 커피 머신 견적', '고급 원두 및 커피머신 제공 견적', 2, 8250000, 'N', 825000, '매출면세', 9075000, 20),
    (22, NOW(), NOW(), '2024-03-22', '고급 원두 및 커피 머신 견적', '고급 원두 및 커피머신 제공 견적', 3, 8400000, 'Y', 840000, '매출과세', 9240000, 21),
    (23, NOW(), NOW(), '2024-03-23', '사무용 커피 머신 및 원두 견적', '고급 원두 및 커피머신 제공 견적', 2, 8550000, 'N', 855000, '매출면세', 9427500, 22),
    (24, NOW(), NOW(), '2024-03-24', '카페 디자인 및 커피 머신/원두 공급 견적', '고급 원두 및 커피머신 제공 견적', 4, 8700000, 'Y', 870000, '매출과세', 9573000, 23),
    (25, NOW(), NOW(), '2024-03-25', '고객 맞춤형 커피 머신 및 원두 견적', '고급 원두 및 커피머신 제공 견적', 3, 8850000, 'N', 885000, '수출영세', 9742500, 24),
    (26, NOW(), NOW(), '2024-03-26', '사무실용 원두 및 커피 머신 세트 견적', '고급 원두 및 커피머신 제공 견적', 2, 9000000, 'Y', 900000, '매출과세', 9900000, 25),
    (27, NOW(), NOW(), '2024-03-27', '고객 맞춤형 커피 머신 및 원두 견적', '고급 원두 및 커피머신 제공 견적', 3, 9150000, 'N', 915000, '매출면세', 10009250, 26),
    (28, NOW(), NOW(), '2024-03-28', '친환경 원두 및 커피 머신 견적', '고급 원두 및 커피머신 제공 견적', 4, 9300000, 'Y', 930000, '매출과세', 10138800, 27),
    (29, NOW(), NOW(), '2024-03-29', '카페 창업용 커피 머신 및 원두 견적', '고급 원두 및 커피머신 제공 견적', 3, 9450000, 'N', 945000, '수출영세', 10268250, 28),
    (30, NOW(), NOW(), '2024-03-30', '사무용 커피 머신 및 원두 견적 ', '고급 원두 및 커피머신 제공 견적', 2, 9600000, 'Y', 960000, '매출과세', 10397700, 29),
    (31, NOW(), NOW(), '2024-04-01', '친환경 원두 및 커피 머신 견적', '고급 원두 및 커피머신 제공 견적', 3, 9750000, 'N', 975000, '매출면세', 10725000, 30),
    (32, NOW(), NOW(), '2024-04-02', '이벤트용 커피 머신 및 원두 렌탈 견적', '고급 원두 및 커피머신 제공 견적', 4, 9900000, 'Y', 990000, '매출과세', 10980000, 31),
    (33, NOW(), NOW(), '2024-04-03', '카페용 커피 머신 및 원두 공급 견적', '고급 원두 및 커피머신 제공 견적', 3, 10050000, '부가세 미포함', 1005000, '수출영세', 11155000, 32),
    (34, NOW(), NOW(), '2024-04-04', '카페 디자인 및 커피 머신/원두 공급 견적', '고급 원두 및 커피머신 제공 견적', 2, 10200000, '부가세 포함', 1020000, '매출과세', 11340000, 33),
    (35, NOW(), NOW(), '2024-04-05', '커피마스터 - 원두 구매 견적', '고급 원두 및 커피머신 제공 견적', 4, 10350000, 'N', 1035000, '매출면세', 11535000, 34),
    (36, NOW(), NOW(), '2024-04-06', '친환경 원두 및 커피 머신 견적', '고급 원두 및 커피머신 제공 견적', 3, 10500000, 'Y', 1050000, '매출과세', 11650000, 35),
    (37, NOW(), NOW(), '2024-04-07', '이벤트용 커피 머신 및 원두 렌탈 견적', '고급 원두 및 커피머신 제공 견적', 2, 10650000, 'N', 1065000, '수출영세', 11835000, 36),
    (38, NOW(), NOW(), '2024-04-08', '고객 맞춤형 커피 머신 및 원두 견적', '고급 원두 및 커피머신 제공 견적', 3, 10800000, 'Y', 1080000, '매출과세', 11960000, 37),
    (39, NOW(), NOW(), '2024-04-09', '정기적인 커피 머신 및 원두 공급 서비스 견적', '고급 원두 및 커피머신 제공 견적', 4, 10950000, 'N', 1095000, '매출면세', 12135000, 38),
    (40, NOW(), NOW(), '2024-04-06', '직원 휴게실 커피 머신 및 원두 세트 견적', '고급 원두 및 커피머신 제공 견적', 3, 3150000, 'N', 315000, '수출영세', 3465000, 39),
    (41, NOW(), NOW(), '2024-04-07', '친환경 원두 및 커피 머신 견적', '고급 원두 및 커피머신 제공 견적', 2, 3450000, 'N', 345000, '매출과세', 3795000, 40),
    (42, NOW(), NOW(), '2024-04-08', '고객 맞춤형 커피 머신 및 원두 견적', '고급 원두 및 커피머신 제공 견적', 3, 3300000, 'N', 330000, '매출면세', 3630000, 41),
    (43, NOW(), NOW(), '2024-05-09', '이벤트용 커피 머신 및 원두 렌탈 견적', '고급 원두 및 커피머신 제공 견적', 4, 3600000, 'N', 360000, '매출과세', 3960000, 42),
    (44, NOW(), NOW(), '2024-05-10', '사무용 커피 머신 및 원두 견적 ', '고급 원두 및 커피머신 제공 견적', 3, 3750000, 'N', 375000, '매출면세', 4125000, 43),
    (45, NOW(), NOW(), '2024-05-11', '이벤트용 커피 머신 및 원두 렌탈 견적', '고급 원두 및 커피머신 제공 견적', 2, 3900000, 'N', 390000, '매출과세', 4290000, 44),
    (46, NOW(), NOW(), '2024-05-12', '정기적인 커피 머신 및 원두 공급 서비스 견적', '고급 원두 및 커피머신 제공 견적', 3, 4050000, 'N', 405000, '수출영세', 4455000, 45),
    (47, NOW(), NOW(), '2024-05-13', '친환경 원두 및 커피 머신 견적적', '고급 원두 및 커피머신 제공 견적', 2, 4200000, 'Y', 420000, '매출과세', 4620000, 46),
    (48, NOW(), NOW(), '2024-05-14', '고객 맞춤형 커피 머신 및 원두 견적', '고급 원두 및 커피머신 제공 견적', 3, 4350000, 'N', 435000, '매출면세', 4702500, 47),
    (49, NOW(), NOW(), '2024-05-15', '사무실 커피 머신 설치 및 원두 공급 견적', '고급 원두 및 커피머신 제공 견적', 4, 4500000, 'Y', 450000, '매출과세', 4950000, 48),
    (50, NOW(), NOW(), '2024-05-16', '카페 및 레스토랑용 원두 및 커피 머신 견적', '고급 원두 및 커피머신 제공 견적', 3, 4650000, 'N', 465000, '매출면세', 5085000, 49),
    (51, NOW(), NOW(), '2024-05-17', '직원 휴게실 커피 머신 및 원두 세트 견적', '고급 원두 및 커피머신 제공 견적', 2, 320000, 'Y', 32000, '매출과세', 352000, 50),
    (52, NOW(), NOW(), '2024-05-18', '고급 원두 및 커피 머신 견적', '고급 원두 및 커피머신 제공 견적', 3, 330000, 'N', 33000, '수출영세', 363000, 51),
    (53, NOW(), NOW(), '2024-05-19', '직원 휴게실 커피 머신 및 원두 세트 견적', '고급 원두 및 커피머신 제공 견적', 2, 340000, 'Y', 34000, '매출과세', 374000, 52),
    (54, NOW(), NOW(), '2024-05-20', '사무용 커피 머신 및 원두 견적 ', '고급 원두 및 커피머신 제공 견적', 3, 350000, 'N', 35000, '매출면세', 385000, 53),
    (55, NOW(), NOW(), '2024-05-21', '자동화된 커피 머신 및 원두 패키지 견적', '고급 원두 및 커피머신 제공 견적', 4, 360000, 'Y', 36000, '매출과세', 396000, 54),
    (56, NOW(), NOW(), '2024-05-22', '고급 원두 및 커피 머신 견적', '고급 원두 및 커피머신 제공 견적', 2, 370000, 'N', 37000, '수출영세', 407000, 55),
    (57, NOW(), NOW(), '2024-06-23', '카페 디자인 및 커피 머신/원두 공급 견적', '고급 원두 및 커피머신 제공 견적', 3, 380000, 'Y', 38000, '매출과세', 418000, 56),
    (58, NOW(), NOW(), '2024-06-24', '직원 휴게실 커피 머신 및 원두 세트 견적', '고급 원두 및 커피머신 제공 견적', 2, 390000, 'N', 39000, '매출면세', 429000, 57),
    (59, NOW(), NOW(), '2024-06-25', '고급 원두 및 커피 머신 견적', '고급 원두 및 커피머신 제공 견적', 3, 400000, 'Y', 40000, '매출과세', 440000, 58),
    (60, NOW(), NOW(), '2024-06-26', '직원 휴게실 커피 머신 및 원두 세트 견적', '고급 원두 및 커피머신 제공 견적', 2, 410000, 'Y', 41000, '수출영세', 451000, 59),
    (61, NOW(), NOW(), '2024-06-27', '이벤트용 커피 머신 및 원두 렌탈 견적', '고급 원두 및 커피머신 제공 견적', 3, 420000, 'Y', 42000, '매출과세', 462000, 60),
    (62, NOW(), NOW(), '2024-06-28', '이벤트용 커피 머신 및 원두 렌탈 견적', '고급 원두 및 커피머신 제공 견적', 4, 430000, 'Y', 43000, '매출면세', 473000, 61),
    (63, NOW(), NOW(), '2024-06-29', '카페 디자인 및 커피 머신/원두 공급 견적', '고급 원두 및 커피머신 제공 견적', 2, 440000, 'Y', 44000, '매출과세', 484000, 62),
    (64, NOW(), NOW(), '2024-06-30', '사무실용 커피 머신 및 원두 견적', '고급 원두 및 커피머신 제공 견적', 3, 450000, 'N', 45000, '매출면세', 495000, 63),
    (65, NOW(), NOW(), '2024-06-01', '직원용 커피 머신 및 원두 견적', '고급 원두 및 커피머신 제공 견적', 2, 460000, 'N', 46000, '매출과세', 506000, 64),
    (66, NOW(), NOW(), '2024-06-02', '고객 맞춤형 커피 머신 및 원두 견적', '고급 원두 및 커피머신 제공 견적', 3, 470000, 'N', 47000, '수출영세', 517000, 65),
    (67, NOW(), NOW(), '2024-06-03', '스마트 커피 머신 및 원두 패키지 견적', '고급 원두 및 커피머신 제공 견적', 4, 480000, 'N', 48000, '매출과세', 528000, 66),
    (68, NOW(), NOW(), '2024-06-04', '고객 맞춤형 커피 머신 및 원두 견적', '고급 원두 및 커피머신 제공 견적', 2, 490000, 'N', 49000, '매출면세', 539000, 67),
    (69, NOW(), NOW(), '2024-07-05', '새로운 커피 머신 및 원두 패키지 견적', '고급 원두 및 커피머신 제공 견적', 3, 500000, 'Y', 50000, '매출과세', 550000, 68),
    (70, NOW(), NOW(), '2024-07-06', '카페 디자인 및 커피 머신/원두 공급 견적', '고급 원두 및 커피머신 제공 견적', 4, 510000, 'Y', 51000, '매출면세', 561000, 69),
    (71, NOW(), NOW(), '2024-07-07', '카페 창업용 커피 머신 및 원두 견적', '고급 원두 및 커피머신 제공 견적', 3, 520000, 'Y', 52000, '매출과세', 572000, 70),
    (72, NOW(), NOW(), '2024-07-08', '고급 원두 및 커피 머신 견적', '고급 원두 및 커피머신 제공 견적', 2, 530000, 'N', 53000, '매출면세', 583000, 71),
    (73, NOW(), NOW(), '2024-07-09', '정기적인 커피 머신 및 원두 공급 서비스 견적', '고급 원두 및 커피머신 제공 견적', 4, 540000, 'Y', 54000, '매출과세', 594000, 72),
    (74, NOW(), NOW(), '2024-07-10', '자동화된 커피 머신 및 원두 패키지 견적', '고급 원두 및 커피머신 제공 견적', 3, 550000, 'N', 55000, '수출영세', 605000, 73),
    (75, NOW(), NOW(), '2024-07-11', '카페 디자인 및 커피 머신/원두 공급 견적', '고급 원두 및 커피머신 제공 견적', 2, 560000, 'Y', 56000, '매출과세', 616000, 74),
    (76, NOW(), NOW(), '2024-07-12', '고급 원두 및 커피 머신 견적 ', '고급 원두 및 커피머신 제공 견적', 3, 570000, 'N', 57000, '매출면세', 627000, 75),
    (77, NOW(), NOW(), '2024-08-13', '소형 커피 머신과 원두 견적', '고급 원두 및 커피머신 제공 견적', 4, 580000, 'Y', 58000, '매출과세', 638000, 76),
    (78, NOW(), NOW(), '2024-08-14', '이벤트용 커피 머신 및 원두 렌탈 견적', '고급 원두 및 커피머신 제공 견적', 3, 590000, 'N', 59000, '매출면세', 649000, 77),
    (79, NOW(), NOW(), '2024-08-15', '커피마스터 - 원두 구매 견적', '고급 원두 및 커피머신 제공 견적', 2, 600000, 'N', 60000, '매출과세', 660000, 78),
    (80, NOW(), NOW(), '2024-08-16', '커피팝 - 원두 구매 견적', '고급 원두 및 커피머신 제공 견적', 4, 610000, 'Y', 61000, '수출영세', 671000, 79),
    (81, NOW(), NOW(), '2024-08-17', '소형 커피 머신과 원두 견적', '고급 원두 및 커피머신 제공 견적', 3, 620000, 'Y', 62000, '매출과세', 684000, 80),
    (82, NOW(), NOW(), '2024-08-18', '직원용 커피 머신 및 원두 견적', '고급 원두 및 커피머신 제공 견적', 2, 630000, 'Y', 63000, '매출면세', 693000, 81),
    (83, NOW(), NOW(), '2024-08-19', '카페 창업용 커피 머신 및 원두 견적', '고급 원두 및 커피머신 제공 견적', 4, 640000, 'Y', 64000, '매출과세', 704000, 82),
    (84, NOW(), NOW(), '2024-09-20', '고객 대기실용 커피 머신 및 원두 견적', '고급 원두 및 커피머신 제공 견적', 3, 650000, 'N', 65000, '수출영세', 715000, 83),
    (85, NOW(), NOW(), '2024-09-21', '사무실 커피 머신 설치 및 원두 공급 견적', '고급 원두 및 커피머신 제공 견적', 4, 660000, 'N', 66000, '매출과세', 726000, 84),
    (86, NOW(), NOW(), '2024-09-22', '사무용 커피 머신 및 원두 견적 ', '고급 원두 및 커피머신 제공 견적', 2, 670000, 'N', 67000, '매출면세', 737000, 85),
    (87, NOW(), NOW(), '2024-09-23', '카페용 커피 머신 및 원두 공급 견적', '고급 원두 및 커피머신 제공 견적', 3, 680000, 'Y', 68000, '매출과세', 748000, 86),
    (88, NOW(), NOW(), '2024-09-24', '카페 창업용 커피 머신 및 원두 견적', '고급 원두 및 커피머신 제공 견적', 4, 690000, 'N', 69000, '수출영세', 759000, 87),
    (89, NOW(), NOW(), '2024-09-25', '사무용 커피 머신 및 원두 견적 ', '고급 원두 및 커피머신 제공 견적', 2, 700000, 'Y', 70000, '매출과세', 770000, 88),
    (90, NOW(), NOW(), '2024-09-26', '비즈니스용 커피 머신과 원두 패키지 견적', '고급 원두 및 커피머신 제공 견적', 3, 710000, 'N', 71000, '매출면세', 781000, 89),
    (91, NOW(), NOW(), '2024-09-27', '고객 맞춤형 커피 머신 및 원두 견적', '고급 원두 및 커피머신 제공 견적', 2, 720000, 'Y', 72000, '매출과세', 792000, 90),
    (92, NOW(), NOW(), '2024-10-28', '카페용 커피 머신 및 원두 공급 견적', '고급 원두 및 커피머신 제공 견적', 3, 730000, 'N', 73000, '수출영세', 803000, 91),
    (93, NOW(), NOW(), '2024-10-29', '사무실 커피 머신 설치 및 원두 공급 견적', '고급 원두 및 커피머신 제공 견적', 4, 740000, 'Y', 74000, '매출과세', 814000, 92),
    (94, NOW(), NOW(), '2024-10-30', '카페 창업용 커피 머신 및 원두 견적', '고급 원두 및 커피머신 제공 견적', 2, 750000, 'N', 75000, '매출면세', 825000, 93),
    (95, NOW(), NOW(), '2024-10-31', '비즈니스용 커피 머신과 원두 패키지 견적 ', '고급 원두 및 커피머신 제공 견적', 3, 760000, 'Y', 76000, '매출과세', 836000, 94),
    (96, NOW(), NOW(), '2024-11-01', '이벤트용 커피 머신 및 원두 렌탈 견적', '고급 원두 및 커피머신 제공 견적', 4, 770000, 'N', 77000, '수출영세', 847000, 95),
    (97, NOW(), NOW(), '2024-11-02', '카페용 커피 머신 및 원두 공급 견적', '고급 원두 및 커피머신 제공 견적', 3, 780000, 'Y', 78000, '매출과세', 858000, 96),
    (98, NOW(), NOW(), '2024-11-03', '자동화된 커피 머신 및 원두 패키지 견적', '고급 원두 및 커피머신 제공 견적', 2, 790000, 'N', 79000, '매출면세', 869000, 97),
    (99, NOW(), NOW(), '2024-11-04', '직원용 커피 머신 및 원두 견적', '고급 원두 및 커피머신 제공 견적', 3, 800000, 'Y', 80000, '매출과세', 880000, 98),
    (100, NOW(), NOW(), '2024-11-05', '정기적인 커피 머신 및 원두 공급 서비스 견적', '고급 원두 및 커피머신 제공 견적', 4, 810000, 'N', 81000, '수출영세', 891000, 99);

-- >>>>>>>>>>>> 견적별 물품 <<<<<<<<<<<<<<

-- 견적별 물품 데이터 생성 (총 200개)
INSERT INTO tb_est_prod (est_prod_no, created_at, updated_at, discount, qty, supply_price, tax_rate, tax, total_amt, unit_amt, unit_prop_amt, est_no, prod_no)
VALUES
    (1, NOW(), NOW(), 5, 200, 150000, 11, 3300000, 33000000, 150000, 135000, 1, 1),
    (2, NOW(), NOW(), 10, 150, 120000, 8, 1440000, 18000000, 120000, 108000, 1, 2),
    (3, NOW(), NOW(), 7, 180, 100000, 12, 2160000, 18000000, 100000, 90000, 1, 3),
    (4, NOW(), NOW(), 15, 100, 300000, 13, 3900000, 30000000, 300000, 270000, 2, 4),
    (5, NOW(), NOW(), 20, 90, 400000, 7, 2520000, 36000000, 400000, 360000, 2, 5),
    (6, NOW(), NOW(), 12, 250, 200000, 6, 3000000, 50000000, 200000, 180000, 3, 6),
    (7, NOW(), NOW(), 10, 300, 180000, 14, 5040000, 54000000, 180000, 162000, 3, 7),
    (8, NOW(), NOW(), 5, 220, 60000, 11, 1452000, 13200000, 60000, 54000, 3, 8),
    (9, NOW(), NOW(), 8, 175, 70000, 14, 1715000, 12250000, 70000, 63000, 4, 9),
    (10, NOW(), NOW(), 10, 190, 95000, 14, 2660000, 18050000, 95000, 85500, 4, 10),
    (11, NOW(), NOW(), 12, 200, 150000, 11, 3300000, 33000000, 150000, 135000, 5, 1),
    (12, NOW(), NOW(), 5, 150, 120000, 8, 1440000, 18000000, 120000, 108000, 5, 2),
    (13, NOW(), NOW(), 10, 180, 100000, 12, 2160000, 18000000, 100000, 90000, 5, 3),
    (14, NOW(), NOW(), 8, 100, 300000, 13, 3900000, 30000000, 300000, 270000, 6, 4),
    (15, NOW(), NOW(), 15, 90, 400000, 7, 2520000, 36000000, 400000, 360000, 6, 5),
    (16, NOW(), NOW(), 10, 250, 200000, 6, 3000000, 50000000, 200000, 180000, 7, 6),
    (17, NOW(), NOW(), 12, 300, 180000, 14, 5040000, 54000000, 180000, 162000, 7, 7),
    (18, NOW(), NOW(), 7, 220, 60000, 11, 1452000, 13200000, 60000, 54000, 7, 8),
    (19, NOW(), NOW(), 10, 175, 70000, 14, 1715000, 12250000, 70000, 63000, 8, 9),
    (20, NOW(), NOW(), 5, 190, 95000, 14, 2660000, 18050000, 95000, 85500, 8, 10),
    (21, NOW(), NOW(), 5, 200, 150000, 11, 3300000, 33000000, 150000, 135000, 9, 1),
    (22, NOW(), NOW(), 10, 150, 120000, 8, 1440000, 18000000, 120000, 108000, 10, 2),
    (23, NOW(), NOW(), 7, 180, 100000, 12, 2160000, 18000000, 100000, 90000, 11, 3),
    (24, NOW(), NOW(), 15, 100, 300000, 13, 3900000, 30000000, 300000, 270000, 12, 4),
    (25, NOW(), NOW(), 20, 90, 400000, 7, 2520000, 36000000, 400000, 360000, 13, 5),
    (26, NOW(), NOW(), 12, 250, 200000, 6, 3000000, 50000000, 200000, 180000, 13, 6),
    (27, NOW(), NOW(), 10, 300, 180000, 14, 5040000, 54000000, 180000, 162000, 14, 7),
    (28, NOW(), NOW(), 5, 220, 60000, 11, 1452000, 13200000, 60000, 54000, 15, 8),
    (29, NOW(), NOW(), 8, 175, 70000, 14, 1715000, 12250000, 70000, 63000, 16, 9),
    (30, NOW(), NOW(), 10, 190, 95000, 14, 2660000, 18050000, 95000, 85500, 17, 10),
    (31, NOW(), NOW(), 5, 210, 140000, 11, 3234000, 29400000, 140000, 126000, 18, 1),
    (32, NOW(), NOW(), 12, 160, 130000, 12, 2496000, 20800000, 130000, 117000, 18, 2),
    (33, NOW(), NOW(), 8, 190, 150000, 10, 2850000, 28500000, 150000, 135000, 19, 3),
    (34, NOW(), NOW(), 6, 230, 90000, 13, 2691000, 20700000, 90000, 81000, 19, 4),
    (35, NOW(), NOW(), 14, 250, 200000, 8, 4000000, 50000000, 200000, 180000, 20, 5),
    (36, NOW(), NOW(), 10, 280, 175000, 7, 3430000, 49000000, 175000, 157500, 20, 6),
    (37, NOW(), NOW(), 7, 220, 160000, 9, 3168000, 35200000, 160000, 144000, 21, 7),
    (38, NOW(), NOW(), 15, 300, 110000, 15, 4950000, 33000000, 110000, 99000, 21, 8),
    (39, NOW(), NOW(), 5, 275, 125000, 12, 4125000, 34375000, 125000, 112500, 22, 9),
    (40, NOW(), NOW(), 10, 195, 145000, 14, 3963000, 28275000, 145000, 130500, 22, 10),
    (41, NOW(), NOW(), 8, 260, 155000, 10, 4030000, 40300000, 155000, 139500, 23, 1),
    (42, NOW(), NOW(), 9, 215, 170000, 7, 2572500, 36550000, 170000, 153000, 23, 2),
    (43, NOW(), NOW(), 10, 290, 130000, 9, 3387000, 37700000, 130000, 117000, 24, 3),
    (44, NOW(), NOW(), 6, 240, 125000, 11, 3300000, 30000000, 125000, 112500, 24, 4),
    (45, NOW(), NOW(), 14, 210, 140000, 12, 3528000, 29400000, 140000, 126000, 25, 5),
    (46, NOW(), NOW(), 5, 250, 120000, 13, 3900000, 30000000, 120000, 108000, 25, 6),
    (47, NOW(), NOW(), 10, 270, 100000, 8, 2160000, 27000000, 100000, 90000, 26, 7),
    (48, NOW(), NOW(), 8, 310, 80000, 12, 2976000, 24800000, 80000, 72000, 26, 8),
    (49, NOW(), NOW(), 15, 200, 150000, 14, 3150000, 30000000, 150000, 135000, 27, 9),
    (50, NOW(), NOW(), 10, 180, 170000, 7, 2142000, 30600000, 170000, 153000, 27, 10),
    (51, NOW(), NOW(), 7, 270, 90000, 13, 3159000, 24300000, 90000, 81000, 28, 1),
    (52, NOW(), NOW(), 10, 240, 140000, 15, 5040000, 33600000, 140000, 126000, 28, 2),
    (53, NOW(), NOW(), 5, 200, 160000, 11, 3520000, 32000000, 160000, 144000, 29, 3),
    (54, NOW(), NOW(), 12, 230, 130000, 8, 2990000, 29900000, 130000, 117000, 29, 4),
    (55, NOW(), NOW(), 8, 290, 125000, 10, 3625000, 36250000, 125000, 112500, 30, 5),
    (56, NOW(), NOW(), 10, 210, 150000, 12, 3780000, 31500000, 150000, 135000, 30, 6),
    (57, NOW(), NOW(), 7, 250, 110000, 9, 2475000, 27500000, 110000, 99000, 31, 7),
    (58, NOW(), NOW(), 9, 220, 120000, 13, 3432000, 26400000, 120000, 108000, 31, 8),
    (59, NOW(), NOW(), 10, 280, 95000, 11, 2937000, 26600000, 95000, 85500, 32, 9),
    (60, NOW(), NOW(), 12, 250, 105000, 14, 3675000, 26250000, 105000, 94500, 32, 10),
    (61, NOW(), NOW(), 5, 250, 135000, 12, 4050000, 33750000, 135000, 121500, 33, 1),
    (62, NOW(), NOW(), 7, 200, 180000, 10, 3600000, 36000000, 180000, 162000, 33, 2),
    (63, NOW(), NOW(), 10, 175, 160000, 11, 3080000, 28000000, 160000, 144000, 34, 3),
    (64, NOW(), NOW(), 6, 300, 110000, 13, 4290000, 33000000, 110000, 99000, 34, 4),
    (65, NOW(), NOW(), 8, 215, 140000, 14, 4214000, 30100000, 140000, 126000, 35, 5),
    (66, NOW(), NOW(), 12, 180, 125000, 9, 2025000, 22500000, 125000, 112500, 35, 6),
    (67, NOW(), NOW(), 10, 195, 155000, 7, 2122000, 30225000, 155000, 139500, 36, 7),
    (68, NOW(), NOW(), 5, 250, 150000, 15, 5625000, 37500000, 150000, 135000, 36, 8),
    (69, NOW(), NOW(), 7, 210, 115000, 10, 2415000, 24150000, 115000, 103500, 37, 9),
    (70, NOW(), NOW(), 9, 220, 95000, 12, 2508000, 20900000, 95000, 85500, 37, 10),
    (71, NOW(), NOW(), 15, 240, 90000, 11, 2376000, 21600000, 90000, 81000, 38, 1),
    (72, NOW(), NOW(), 8, 275, 135000, 8, 2970000, 37125000, 135000, 121500, 38, 2),
    (73, NOW(), NOW(), 10, 260, 170000, 9, 3969000, 44200000, 170000, 153000, 39, 3),
    (74, NOW(), NOW(), 6, 285, 120000, 13, 4452000, 34200000, 120000, 108000, 39, 4),
    (75, NOW(), NOW(), 8, 230, 160000, 10, 3680000, 36800000, 160000, 144000, 40, 5),
    (76, NOW(), NOW(), 5, 300, 110000, 12, 3960000, 33000000, 110000, 99000, 40, 6),
    (77, NOW(), NOW(), 10, 275, 105000, 14, 4042500, 28875000, 105000, 94500, 41, 7),
    (78, NOW(), NOW(), 9, 210, 145000, 8, 3045000, 30450000, 145000, 130500, 41, 8),
    (79, NOW(), NOW(), 7, 225, 130000, 11, 3217500, 29250000, 130000, 117000, 42, 9),
    (80, NOW(), NOW(), 15, 240, 125000, 10, 3375000, 30000000, 125000, 112500, 42, 10),
    (81, NOW(), NOW(), 5, 250, 115000, 13, 3737500, 28750000, 115000, 103500, 43, 1),
    (82, NOW(), NOW(), 12, 200, 175000, 9, 3150000, 35000000, 175000, 157500, 43, 2),
    (83, NOW(), NOW(), 8, 270, 155000, 11, 4594500, 41850000, 155000, 139500, 44, 3),
    (84, NOW(), NOW(), 10, 280, 145000, 7, 2842000, 40600000, 145000, 130500, 44, 4),
    (85, NOW(), NOW(), 6, 290, 100000, 15, 4350000, 29000000, 100000, 90000, 45, 5),
    (86, NOW(), NOW(), 10, 225, 125000, 12, 3375000, 28125000, 125000, 112500, 45, 6),
    (87, NOW(), NOW(), 5, 250, 140000, 8, 2800000, 35000000, 140000, 126000, 46, 7),
    (88, NOW(), NOW(), 7, 275, 115000, 9, 2846250, 31625000, 115000, 103500, 46, 8),
    (89, NOW(), NOW(), 12, 240, 135000, 13, 4212000, 32400000, 135000, 121500, 47, 9),
    (90, NOW(), NOW(), 10, 210, 150000, 11, 3465000, 31500000, 150000, 135000, 47, 10),
    (91, NOW(), NOW(), 7, 250, 130000, 10, 3250000, 32500000, 130000, 117000, 48, 1),
    (92, NOW(), NOW(), 10, 225, 140000, 9, 2835000, 31500000, 140000, 126000, 48, 2),
    (93, NOW(), NOW(), 5, 280, 120000, 11, 3696000, 33600000, 120000, 108000, 49, 3),
    (94, NOW(), NOW(), 8, 270, 150000, 8, 3240000, 40500000, 150000, 135000, 49, 4),
    (95, NOW(), NOW(), 6, 300, 110000, 13, 4290000, 33000000, 110000, 99000, 50, 5),
    (96, NOW(), NOW(), 12, 210, 145000, 12, 3654000, 30450000, 145000, 130500, 50, 6),
    (97, NOW(), NOW(), 9, 260, 100000, 10, 2340000, 26000000, 100000, 90000, 51, 7),
    (98, NOW(), NOW(), 11, 235, 135000, 15, 4767750, 31725000, 135000, 121500, 51, 8),
    (99, NOW(), NOW(), 7, 240, 125000, 10, 3000000, 30000000, 125000, 112500, 52, 9),
    (100, NOW(), NOW(), 10, 275, 105000, 8, 2310000, 28875000, 105000, 94500, 52, 10),
    (101, NOW(), NOW(), 6, 230, 110000, 12, 3036000, 25300000, 110000, 99000, 53, 1),
    (102, NOW(), NOW(), 8, 250, 120000, 9, 2700000, 30000000, 120000, 108000, 53, 2),
    (103, NOW(), NOW(), 10, 275, 130000, 10, 3575000, 35750000, 130000, 117000, 54, 3),
    (104, NOW(), NOW(), 9, 260, 125000, 11, 3575000, 32500000, 125000, 112500, 54, 4),
    (105, NOW(), NOW(), 5, 240, 140000, 13, 4368000, 33600000, 140000, 126000, 55, 5),
    (106, NOW(), NOW(), 7, 245, 115000, 15, 4228750, 28175000, 115000, 103500, 55, 6),
    (107, NOW(), NOW(), 11, 215, 135000, 12, 3483000, 29025000, 135000, 121500, 56, 7),
    (108, NOW(), NOW(), 6, 285, 150000, 8, 3420000, 42750000, 150000, 135000, 56, 8),
    (109, NOW(), NOW(), 10, 250, 145000, 11, 3987500, 36250000, 145000, 130500, 57, 9),
    (110, NOW(), NOW(), 9, 290, 100000, 10, 2900000, 29000000, 100000, 90000, 57, 10),
    (111, NOW(), NOW(), 8, 275, 125000, 9, 3093750, 34375000, 125000, 112500, 58, 1),
    (112, NOW(), NOW(), 12, 230, 105000, 13, 3147000, 24150000, 105000, 94500, 58, 2),
    (113, NOW(), NOW(), 5, 200, 140000, 15, 4200000, 28000000, 140000, 126000, 59, 3),
    (114, NOW(), NOW(), 10, 220, 130000, 8, 2288000, 28600000, 130000, 117000, 59, 4),
    (115, NOW(), NOW(), 7, 260, 125000, 10, 3250000, 32500000, 125000, 112500, 60, 5),
    (116, NOW(), NOW(), 11, 280, 120000, 12, 4032000, 33600000, 120000, 108000, 60, 6),
    (117, NOW(), NOW(), 9, 250, 115000, 15, 4312500, 28750000, 115000, 103500, 61, 7),
    (118, NOW(), NOW(), 6, 235, 135000, 9, 2857500, 31725000, 135000, 121500, 61, 8),
    (119, NOW(), NOW(), 8, 295, 140000, 10, 4130000, 41300000, 140000, 126000, 62, 9),
    (120, NOW(), NOW(), 7, 225, 150000, 12, 4050000, 33750000, 150000, 135000, 62, 10),
    (121, NOW(), NOW(), 5, 245, 105000, 11, 2825250, 25725000, 105000, 94500, 63, 1),
    (122, NOW(), NOW(), 10, 260, 110000, 13, 3718000, 28600000, 110000, 99000, 63, 2),
    (123, NOW(), NOW(), 8, 270, 125000, 8, 2700000, 33750000, 125000, 112500, 64, 3),
    (124, NOW(), NOW(), 6, 285, 130000, 10, 3712500, 37050000, 130000, 117000, 64, 4),
    (125, NOW(), NOW(), 9, 255, 140000, 12, 4284000, 35700000, 140000, 126000, 65, 5),
    (126, NOW(), NOW(), 11, 290, 115000, 15, 5008500, 33350000, 115000, 103500, 65, 6),
    (127, NOW(), NOW(), 7, 225, 120000, 11, 2970000, 27000000, 120000, 108000, 66, 7),
    (128, NOW(), NOW(), 6, 240, 145000, 8, 3480000, 34800000, 145000, 130500, 66, 8),
    (129, NOW(), NOW(), 12, 275, 135000, 10, 3712500, 37125000, 135000, 121500, 67, 9),
    (130, NOW(), NOW(), 8, 200, 150000, 9, 2700000, 30000000, 150000, 135000, 67, 10),
    (131, NOW(), NOW(), 7, 210, 105000, 9, 1984500, 22050000, 105000, 94500, 68, 1),
    (132, NOW(), NOW(), 10, 260, 110000, 12, 3432000, 28600000, 110000, 99000, 68, 2),
    (133, NOW(), NOW(), 8, 240, 125000, 11, 3300000, 30000000, 125000, 112500, 69, 3),
    (134, NOW(), NOW(), 12, 220, 130000, 8, 2288000, 28600000, 130000, 117000, 69, 4),
    (135, NOW(), NOW(), 9, 250, 135000, 10, 3375000, 33750000, 135000, 121500, 70, 5),
    (136, NOW(), NOW(), 5, 265, 120000, 12, 3816000, 31800000, 120000, 108000, 70, 6),
    (137, NOW(), NOW(), 11, 230, 145000, 15, 4347000, 33350000, 145000, 130500, 71, 7),
    (138, NOW(), NOW(), 6, 275, 150000, 9, 3712500, 41250000, 150000, 135000, 71, 8),
    (139, NOW(), NOW(), 10, 215, 140000, 10, 3010000, 30100000, 140000, 126000, 72, 9),
    (140, NOW(), NOW(), 9, 245, 115000, 13, 3665250, 28175000, 115000, 103500, 72, 10),
    (141, NOW(), NOW(), 8, 295, 105000, 15, 3708750, 30975000, 105000, 94500, 73, 1),
    (142, NOW(), NOW(), 12, 265, 120000, 8, 2544000, 31800000, 120000, 108000, 73, 2),
    (143, NOW(), NOW(), 7, 290, 130000, 11, 4147000, 37700000, 130000, 117000, 74, 3),
    (144, NOW(), NOW(), 11, 210, 115000, 12, 2898000, 24150000, 115000, 103500, 74, 4),
    (145, NOW(), NOW(), 5, 225, 145000, 9, 2936250, 32625000, 145000, 130500, 75, 5),
    (146, NOW(), NOW(), 10, 240, 135000, 10, 3240000, 32400000, 135000, 121500, 75, 6),
    (147, NOW(), NOW(), 9, 270, 140000, 12, 4536000, 37800000, 140000, 126000, 76, 7),
    (148, NOW(), NOW(), 6, 280, 100000, 15, 4200000, 28000000, 100000, 90000, 76, 8),
    (149, NOW(), NOW(), 8, 235, 110000, 9, 2326500, 25850000, 110000, 99000, 77, 9),
    (150, NOW(), NOW(), 7, 250, 125000, 13, 4062500, 31250000, 125000, 112500, 77, 10),
    (151, NOW(), NOW(), 12, 260, 120000, 11, 3432000, 31200000, 120000, 108000, 78, 1),
    (152, NOW(), NOW(), 5, 220, 130000, 10, 2860000, 28600000, 130000, 117000, 78, 2),
    (153, NOW(), NOW(), 10, 225, 115000, 8, 2070000, 25875000, 115000, 103500, 79, 3),
    (154, NOW(), NOW(), 9, 280, 105000, 12, 3024000, 29400000, 105000, 94500, 79, 4),
    (155, NOW(), NOW(), 6, 235, 140000, 15, 4935000, 32900000, 140000, 126000, 80, 5),
    (156, NOW(), NOW(), 8, 215, 145000, 9, 2803500, 31175000, 145000, 130500, 80, 6),
    (157, NOW(), NOW(), 10, 250, 150000, 11, 4125000, 37500000, 150000, 135000, 81, 7),
    (158, NOW(), NOW(), 11, 255, 120000, 13, 3978000, 30600000, 120000, 108000, 81, 8),
    (159, NOW(), NOW(), 7, 285, 115000, 8, 2622000, 32775000, 115000, 103500, 82, 9),
    (160, NOW(), NOW(), 9, 245, 125000, 10, 3062500, 30625000, 125000, 112500, 82, 10),
    (161, NOW(), NOW(), 7, 260, 125000, 9, 2925000, 32500000, 125000, 112500, 83, 1),
    (162, NOW(), NOW(), 5, 245, 130000, 11, 3509000, 31850000, 130000, 117000, 83, 2),
    (163, NOW(), NOW(), 10, 210, 135000, 10, 2835000, 28350000, 135000, 121500, 84, 3),
    (164, NOW(), NOW(), 6, 280, 140000, 12, 4704000, 39200000, 140000, 126000, 84, 4),
    (165, NOW(), NOW(), 11, 275, 145000, 15, 5973750, 39875000, 145000, 130500, 85, 5),
    (166, NOW(), NOW(), 9, 255, 150000, 8, 3060000, 38250000, 150000, 135000, 85, 6),
    (167, NOW(), NOW(), 12, 240, 100000, 10, 2160000, 24000000, 100000, 90000, 86, 7),
    (168, NOW(), NOW(), 8, 265, 105000, 13, 3612750, 27825000, 105000, 94500, 86, 8),
    (169, NOW(), NOW(), 10, 225, 115000, 9, 2328750, 25875000, 115000, 103500, 87, 9),
    (170, NOW(), NOW(), 6, 235, 120000, 12, 3384000, 28200000, 120000, 108000, 87, 10),
    (171, NOW(), NOW(), 9, 245, 130000, 11, 3509000, 31850000, 130000, 117000, 88, 1),
    (172, NOW(), NOW(), 7, 270, 125000, 15, 5062500, 33750000, 125000, 112500, 88, 2),
    (173, NOW(), NOW(), 6, 295, 135000, 8, 3198000, 39825000, 135000, 121500, 89, 3),
    (174, NOW(), NOW(), 5, 285, 140000, 10, 3990000, 39900000, 140000, 126000, 89, 4),
    (175, NOW(), NOW(), 11, 250, 145000, 12, 4350000, 36250000, 145000, 130500, 90, 5),
    (176, NOW(), NOW(), 8, 225, 150000, 9, 3060000, 33750000, 150000, 135000, 90, 6),
    (177, NOW(), NOW(), 10, 265, 120000, 13, 4134000, 31800000, 120000, 108000, 91, 7),
    (178, NOW(), NOW(), 12, 210, 125000, 15, 3937500, 26250000, 125000, 112500, 91, 8),
    (179, NOW(), NOW(), 9, 240, 130000, 11, 3432000, 31200000, 130000, 117000, 92, 9),
    (180, NOW(), NOW(), 7, 275, 115000, 8, 2530000, 31625000, 115000, 103500, 92, 10),
    (181, NOW(), NOW(), 8, 285, 105000, 9, 2693250, 29925000, 105000, 94500, 93, 1),
    (182, NOW(), NOW(), 6, 295, 110000, 12, 3894000, 32450000, 110000, 99000, 93, 2),
    (183, NOW(), NOW(), 5, 225, 115000, 10, 2587500, 25875000, 115000, 103500, 94, 3),
    (184, NOW(), NOW(), 7, 255, 125000, 11, 3135000, 31875000, 125000, 112500, 94, 4),
    (185, NOW(), NOW(), 12, 235, 130000, 9, 2763000, 30550000, 130000, 117000, 95, 5),
    (186, NOW(), NOW(), 9, 260, 135000, 13, 4563000, 35100000, 135000, 121500, 95, 6),
    (187, NOW(), NOW(), 6, 250, 140000, 12, 4200000, 35000000, 140000, 126000, 96, 7),
    (188, NOW(), NOW(), 10, 270, 145000, 8, 3132000, 39150000, 145000, 130500, 96, 8),
    (189, NOW(), NOW(), 8, 280, 150000, 10, 4200000, 42000000, 150000, 135000, 97, 9),
    (190, NOW(), NOW(), 11, 245, 100000, 15, 3675000, 24500000, 100000, 90000, 97, 10),
    (191, NOW(), NOW(), 5, 235, 105000, 13, 3200250, 24675000, 105000, 94500, 98, 1),
    (192, NOW(), NOW(), 9, 220, 110000, 12, 2904000, 24200000, 110000, 99000, 98, 2),
    (193, NOW(), NOW(), 7, 225, 115000, 11, 2835000, 25875000, 115000, 103500, 99, 3),
    (194, NOW(), NOW(), 6, 240, 125000, 8, 2760000, 30000000, 125000, 112500, 99, 4),
    (195, NOW(), NOW(), 10, 245, 130000, 9, 2871000, 31850000, 130000, 117000, 100, 5),
    (196, NOW(), NOW(), 8, 210, 135000, 13, 3694500, 28350000, 135000, 121500, 100, 6),
    (197, NOW(), NOW(), 12, 265, 140000, 10, 3976000, 37100000, 140000, 126000, 100, 7),
    (198, NOW(), NOW(), 5, 250, 145000, 12, 4350000, 36250000, 145000, 130500, 8, 8),
    (199, NOW(), NOW(), 7, 270, 120000, 9, 2916000, 32400000, 120000, 108000, 10, 9),
    (200, NOW(), NOW(), 6, 280, 125000, 15, 4425000, 35000000, 125000, 112500, 11, 10);

-- Contract 데이터 60개
INSERT INTO tb_contract (contract_no, created_at, updated_at, arrival_noti_day, arrival_noti_yn, cls, cont_date, end_date, exp_arrival_date, name, note, payment_terms, prod_cnt, renewal_noti_day, renewal_noti_yn, start_date, supply_price, surtax_yn, tax, tax_cls, price, warrenty, est_no)
VALUES
(1, NOW(), NOW(), '30', 'N', 'SALES', '2024-10-08', '2025-01-11', '2024-10-20', '기존 매장 계약', '배송 일정 조율 필요', '후불', 26, '10', 'Y', '2024-10-13', 254700, 'N', 0, '매출 과세', 283000, 2, 1),
(2, NOW(), NOW(), '20', 'Y', 'ESTIMATE', '2024-11-21', '2025-02-24', '2024-12-03', '기존 매장 계약', '배송 일정 조율 필요', '후불', 15, '20', 'Y', '2024-11-26', 194400, 'N', 0, '매출 과세', 216000, 2, 2),
(3, NOW(), NOW(), '30', 'N', 'ESTIMATE', '2024-01-20', '2024-04-24', '2024-02-01', '신규 업체 계약 체결', '고객 요청 사항 반영 필요', '후불', 16, '20', 'Y', '2024-01-25', 720000, 'Y', 80000, '매출 면세', 800000, 11, 3),
(4, NOW(), NOW(), '30', 'N', 'ESTIMATE', '2024-11-06', '2025-02-09', '2024-11-18', '신규 업체 계약 체결', '고급 원두, 커피머신 포함 견적', '선불', 46, '10', 'N', '2024-11-11', 372600, 'N', 0, '매출 과세', 414000, 6, 4),
(5, NOW(), NOW(), '10', 'Y', 'ESTIMATE', '2024-02-07', '2024-05-12', '2024-02-19', '기존 매장 계약', '고객 요청 사항 반영 필요', '후불', 23, '30', 'N', '2024-02-12', 894600, 'N', 0, '매출 과세', 994000, 7, 5),
(6, NOW(), NOW(), '20', 'N', 'SALES', '2024-11-23', '2025-02-26', '2024-12-05', '기존 매장 계약', '배송 일정 조율 필요', '후불', 19, '20', 'Y', '2024-11-28', 789300, 'N', 0, '매출 과세', 877000, 12, 6),
(7, NOW(), NOW(), '20', 'Y', 'ESTIMATE', '2024-11-24', '2025-02-27', '2024-12-06', '신규 업체 계약 체결', '고급 원두 구매에 대한 견적', '선불', 45, '20', 'Y', '2024-11-29', 819900, 'Y', 91100, '수출 영세', 911000, 22, 7),
(8, NOW(), NOW(), '20', 'Y', 'SALES', '2024-05-19', '2024-08-22', '2024-05-31', '신규 업체 계약 체결', '고급 원두, 커피머신 포함 견적', '후불', 4, '10', 'Y', '2024-05-24', 661500, 'Y', 73500, '수출 영세', 735000, 10, 8),
(9, NOW(), NOW(), '10', 'Y', 'SALES', '2024-11-26', '2025-03-01', '2024-12-08', '신규 기기 계약 체결', '계약 세부 내용 확인 필요', '후불', 49, '20', 'N', '2024-12-01', 147600, 'Y', 16400, '수출 영세', 164000, 23, 9),
(10, NOW(), NOW(), '20', 'Y', 'SALES', '2024-03-02', '2024-06-05', '2024-03-14', '신규 기기 계약 체결', '배송 일정 조율 필요', '분할 납부', 24, '30', 'N', '2024-03-07', 545400, 'Y', 60600, '수출 영세', 606000, 8, 10),
(11, NOW(), NOW(), '10', 'N', 'ESTIMATE', '2024-07-13', '2024-10-16', '2024-07-25', '신규 업체 계약 체결', '배송 일정 조율 필요', '분할 납부', 17, '30', 'N', '2024-07-18', 678600, 'Y', 75400, '수출 영세', 754000, 13, 11),
(12, NOW(), NOW(), '10', 'Y', 'ESTIMATE', '2024-02-14', '2024-05-19', '2024-02-26', '신규 기기 계약 체결', '계약 세부 내용 확인 필요', '선불', 9, '20', 'Y', '2024-02-19', 771300, 'Y', 85700, '수출 영세', 857000, 1, 12),
(13, NOW(), NOW(), '10', 'Y', 'CONTRACT', '2024-04-20', '2024-07-24', '2024-05-02', '신규 업체 계약 체결', '계약 세부 내용 확인 필요', '분할 납부', 38, '20', 'N', '2024-04-25', 500400, 'Y', 55600, '수출 영세', 556000, 2, 13),
(14, NOW(), NOW(), '30', 'Y', 'SALES', '2024-09-02', '2024-12-06', '2024-09-14', '신규 업체 계약 체결', '배송 일정 조율 필요', '후불', 43, '30', 'N', '2024-09-07', 840600, 'N', 0, '매출 과세', 934000, 19, 14),
(15, NOW(), NOW(), '30', 'Y', 'SALES', '2024-05-10', '2024-08-13', '2024-05-22', '기존 매장 계약', '계약 세부 내용 확인 필요', '선불', 33, '30', 'N', '2024-05-15', 378900, 'N', 0, '매출 과세', 421000, 24, 15),
(16, NOW(), NOW(), '30', 'N', 'ESTIMATE', '2024-09-19', '2024-12-23', '2024-10-01', '신규 업체 계약 체결', '원두에 대한 견적', '분할 납부', 16, '20', 'N', '2024-09-24', 845100, 'N', 0, '매출 과세', 939000, 18, 16),
(17, NOW(), NOW(), '10', 'Y', 'SALES', '2024-07-17', '2024-10-20', '2024-07-29', '신규 업체 계약 체결', '계약 세부 내용 확인 필요', '후불', 7, '10', 'Y', '2024-07-22', 115200, 'N', 0, '매출 과세', 128000, 4, 17),
(18, NOW(), NOW(), '30', 'Y', 'SALES', '2024-03-19', '2024-06-22', '2024-03-31', '신규 업체 계약 체결', '고객 요청 사항 반영 필요', '후불', 34, '10', 'N', '2024-03-24', 505800, 'N', 0, '매출 과세', 562000, 20, 18),
(19, NOW(), NOW(), '20', 'N', 'ESTIMATE', '2024-11-02', '2025-02-05', '2024-11-14', '신규 기기 계약 체결', '배송 일정 조율 필요', '후불', 41, '10', 'Y', '2024-11-07', 599400, 'N', 0, '매출 과세', 666000, 1, 19),
(20, NOW(), NOW(), '20', 'N', 'SALES', '2024-09-24', '2024-12-28', '2024-10-06', '기존 매장 계약', '고급 원두 구매에 대한 견적', '후불', 39, '30', 'Y', '2024-09-29', 851400, 'Y', 94600, '매출 면세', 946000, 22, 20),
(21, NOW(), NOW(), '30', 'Y', 'SALES', '2024-10-09', '2025-01-12', '2024-10-21', '신규 기기 계약 체결', '배송 일정 조율 필요', '선불', 40, '10', 'N', '2024-10-14', 115200, 'N', 0, '매출 과세', 128000, 11, 21),
(22, NOW(), NOW(), '10', 'Y', 'CONTRACT', '2024-02-24', '2024-05-29', '2024-03-07', '신규 업체 계약 체결', '원두에 대한 견적', '후불', 23, '20', 'N', '2024-02-29', 831600, 'Y', 92400, '수출 영세', 924000, 15, 22),
(23, NOW(), NOW(), '20', 'N', 'SALES', '2024-12-28', '2025-04-02', '2025-01-09', '신규 업체 계약 체결', '배송 일정 조율 필요', '후불', 49, '20', 'N', '2025-01-02', 747000, 'N', 0, '매출 과세', 830000, 10, 23),
(24, NOW(), NOW(), '10', 'N', 'SALES', '2024-06-25', '2024-09-28', '2024-07-07', '신규 업체 계약 체결', '고급 원두, 커피머신 포함 견적', '후불', 16, '10', 'Y', '2024-06-30', 757800, 'N', 0, '매출 과세', 842000, 8, 24),
(25, NOW(), NOW(), '20', 'N', 'SALES', '2024-04-04', '2024-07-08', '2024-04-16', '신규 기기 계약 체결', '계약 세부 내용 확인 필요', '후불', 19, '20', 'Y', '2024-04-09', 491400, 'N', 0, '매출 과세', 546000, 9, 25),
(26, NOW(), NOW(), '10', 'N', 'ESTIMATE', '2024-10-25', '2025-01-28', '2024-11-06', '신규 기기 계약 체결', '고급 원두 구매에 대한 견적', '분할 납부', 27, '30', 'N', '2024-10-30', 791100, 'N', 0, '매출 과세', 879000, 15, 26),
(27, NOW(), NOW(), '20', 'Y', 'CONTRACT', '2024-07-09', '2024-10-12', '2024-07-21', '신규 업체 계약 체결', '고급 원두 구매에 대한 견적', '분할 납부', 24, '10', 'Y', '2024-07-14', 440100, 'Y', 48900, '매출 면세', 489000, 20, 27),
(28, NOW(), NOW(), '30', 'Y', 'ESTIMATE', '2024-01-04', '2024-04-08', '2024-01-16', '신규 기기 계약 체결', '계약 세부 내용 확인 필요', '선불', 24, '20', 'Y', '2024-01-09', 722700, 'Y', 80300, '매출 면세', 803000, 20, 28),
(29, NOW(), NOW(), '30', 'Y', 'SALES', '2024-04-23', '2024-07-27', '2024-05-05', '신규 업체 계약 체결', '원두에 대한 견적', '분할 납부', 24, '10', 'N', '2024-04-28', 792000, 'Y', 88000, '매출 면세', 880000, 3, 29),
(30, NOW(), NOW(), '30', 'N', 'CONTRACT', '2024-10-17', '2025-01-20', '2024-10-29', '신규 업체 계약 체결', '고객 요청 사항 반영 필요', '분할 납부', 23, '30', 'Y', '2024-10-22', 573300, 'Y', 63700, '수출 영세', 637000, 11, 30),
(31, NOW(), NOW(), '20', 'Y', 'ESTIMATE', '2024-06-09', '2024-09-12', '2024-06-21', '신규 업체 계약 체결', '고급 원두 구매에 대한 견적', '분할 납부', 44, '20', 'N', '2024-06-14', 265500, 'N', 0, '매출 과세', 295000, 14, 31),
(32, NOW(), NOW(), '30', 'Y', 'SALES', '2024-01-10', '2024-04-14', '2024-01-22', '기존 매장 계약', '원두에 대한 견적', '선불', 35, '10', 'Y', '2024-01-15', 216900, 'N', 0, '매출 과세', 241000, 9, 32),
(33, NOW(), NOW(), '30', 'N', 'SALES', '2024-09-13', '2024-12-17', '2024-09-25', '기존 매장 계약', '고객 요청 사항 반영 필요', '분할 납부', 49, '20', 'Y', '2024-09-18', 420300, 'Y', 46700, '수출 영세', 467000, 16, 33),
(34, NOW(), NOW(), '30', 'N', 'SALES', '2024-05-17', '2024-08-20', '2024-05-29', '신규 업체 계약 체결', '고객 요청 사항 반영 필요', '선불', 50, '20', 'Y', '2024-05-22', 112500, 'Y', 12500, '매출 면세', 125000, 1, 34),
(35, NOW(), NOW(), '20', 'Y', 'SALES', '2024-11-13', '2025-02-16', '2024-11-25', '신규 기기 계약 체결', '고급 원두, 커피머신 포함 견적', '후불', 5, '30', 'Y', '2024-11-18', 295200, 'N', 0, '매출 과세', 328000, 18, 35),
(36, NOW(), NOW(), '30', 'N', 'SALES', '2024-10-05', '2025-01-08', '2024-10-17', '신규 기기 계약 체결', '고급 원두, 커피머신 포함 견적', '후불', 19, '20', 'N', '2024-10-10', 320400, 'N', 0, '매출 과세', 356000, 18, 36),
(37, NOW(), NOW(), '10', 'Y', 'CONTRACT', '2024-05-16', '2024-08-19', '2024-05-28', '신규 업체 계약 체결', '고급 원두, 커피머신 포함 견적', '후불', 45, '30', 'N', '2024-05-21', 778500, 'N', 0, '매출 과세', 865000, 9, 37),
(38, NOW(), NOW(), '10', 'Y', 'SALES', '2024-07-08', '2024-10-11', '2024-07-20', '신규 업체 계약 체결', '고급 원두, 커피머신 포함 견적', '후불', 11, '30', 'Y', '2024-07-13', 264600, 'N', 0, '매출 과세', 294000, 24, 38),
(39, NOW(), NOW(), '20', 'N', 'CONTRACT', '2024-06-07', '2024-09-10', '2024-06-19', '신규 기기 계약 체결', '계약 세부 내용 확인 필요', '분할 납부', 13, '10', 'Y', '2024-06-12', 688500, 'N', 0, '매출 과세', 765000, 10, 39),
(40, NOW(), NOW(), '10', 'N', 'SALES', '2024-12-04', '2025-03-09', '2024-12-16', '신규 업체 계약 체결', '고객 요청 사항 반영 필요', '분할 납부', 3, '30', 'Y', '2024-12-09', 185400, 'N', 0, '매출 과세', 206000, 24, 40),
(41, NOW(), NOW(), '20', 'N', 'CONTRACT', '2024-12-04', '2025-03-09', '2024-12-16', '신규 업체 계약 체결', '고급 원두, 커피머신 포함 견적', '후불', 35, '30', 'N', '2024-12-09', 712800, 'N', 0, '매출 과세', 792000, 12, 41),
(42, NOW(), NOW(), '10', 'N', 'ESTIMATE', '2024-08-25', '2024-11-28', '2024-09-06', '기존 매장 계약', '배송 일정 조율 필요', '후불', 50, '30', 'Y', '2024-08-30', 198900, 'Y', 22100, '수출 영세', 221000, 18, 42),
(43, NOW(), NOW(), '30', 'Y', 'CONTRACT', '2024-11-01', '2025-02-04', '2024-11-13', '신규 기기 계약 체결', '고급 원두, 커피머신 포함 견적', '후불', 28, '10', 'Y', '2024-11-06', 102600, 'N', 0, '매출 과세', 114000, 10, 43),
(44, NOW(), NOW(), '20', 'Y', 'ESTIMATE', '2024-12-21', '2025-03-26', '2025-01-02', '기존 매장 계약', '배송 일정 조율 필요', '후불', 6, '30', 'Y', '2024-12-26', 172800, 'N', 0, '매출 과세', 192000, 15, 44),
(45, NOW(), NOW(), '10', 'Y', 'CONTRACT', '2024-12-13', '2025-03-18', '2024-12-25', '신규 업체 계약 체결', '고급 원두 구매에 대한 견적', '분할 납부', 37, '30', 'N', '2024-12-18', 535500, 'Y', 59500, '매출 면세', 595000, 6, 45),
(46, NOW(), NOW(), '30', 'Y', 'CONTRACT', '2024-12-06', '2025-03-11', '2024-12-18', '신규 업체 계약 체결', '계약 세부 내용 확인 필요', '선불', 33, '10', 'N', '2024-12-11', 827100, 'Y', 91900, '매출 면세', 919000, 4, 46),
(47, NOW(), NOW(), '30', 'N', 'SALES', '2024-10-10', '2025-01-13', '2024-10-22', '기존 매장 계약', '원두에 대한 견적', '분할 납부', 1, '20', 'Y', '2024-10-15', 848700, 'N', 0, '매출 과세', 943000, 17, 47),
(48, NOW(), NOW(), '30', 'Y', 'ESTIMATE', '2024-09-17', '2024-12-21', '2024-09-29', '기존 매장 계약', '고급 원두, 커피머신 포함 견적', '분할 납부', 15, '20', 'N', '2024-09-22', 214200, 'Y', 23800, '매출 면세', 238000, 21, 48),
(49, NOW(), NOW(), '30', 'N', 'CONTRACT', '2024-05-10', '2024-08-13', '2024-05-22', '신규 업체 계약 체결', '고급 원두 구매에 대한 견적', '분할 납부', 31, '20', 'Y', '2024-05-15', 662400, 'N', 0, '매출 과세', 736000, 20, 49),
(50, NOW(), NOW(), '20', 'Y', 'SALES', '2024-06-02', '2024-09-05', '2024-06-14', '기존 매장 계약', '계약 세부 내용 확인 필요', '선불', 18, '30', 'Y', '2024-06-07', 364500, 'N', 0, '매출 과세', 405000, 23, 50),
(51, NOW(), NOW(), '30', 'N', 'CONTRACT', '2024-10-15', '2025-01-18', '2024-10-27', '기존 매장 계약', '배송 일정 조율 필요', '후불', 7, '20', 'N', '2024-10-20', 347400, 'N', 0, '매출 과세', 386000, 22, 51),
(52, NOW(), NOW(), '10', 'N', 'ESTIMATE', '2024-10-04', '2025-01-07', '2024-10-16', '기존 매장 계약', '고급 원두 구매에 대한 견적', '선불', 4, '30', 'Y', '2024-10-09', 849600, 'Y', 94400, '매출 면세', 944000, 22, 52),
(53, NOW(), NOW(), '20', 'Y', 'ESTIMATE', '2024-04-09', '2024-07-13', '2024-04-21', '신규 업체 계약 체결', '고급 원두 구매에 대한 견적', '선불', 26, '20', 'N', '2024-04-14', 601200, 'Y', 66800, '수출 영세', 668000, 10, 53),
(54, NOW(), NOW(), '10', 'Y', 'CONTRACT', '2024-02-10', '2024-05-15', '2024-02-22', '기존 매장 계약', '고급 원두, 커피머신 포함 견적', '분할 납부', 31, '30', 'N', '2024-02-15', 403200, 'Y', 44800, '매출 면세', 448000, 7, 54),
(55, NOW(), NOW(), '20', 'N', 'ESTIMATE', '2024-01-15', '2024-04-19', '2024-01-27', '신규 기기 계약 체결', '고객 요청 사항 반영 필요', '후불', 44, '20', 'Y', '2024-01-20', 801000, 'Y', 89000, '수출 영세', 890000, 1, 55),
(56, NOW(), NOW(), '10', 'N', 'CONTRACT', '2024-12-10', '2025-03-15', '2024-12-22', '기존 매장 계약', '고객 요청 사항 반영 필요', '분할 납부', 31, '30', 'Y', '2024-12-15', 757800, 'N', 0, '매출 과세', 842000, 21, 56),
(57, NOW(), NOW(), '20', 'N', 'SALES', '2024-04-17', '2024-07-21', '2024-04-29', '신규 업체 계약 체결', '고객 요청 사항 반영 필요', '선불', 2, '20', 'Y', '2024-04-22', 215100, 'Y', 23900, '매출 면세', 239000, 21, 57),
(58, NOW(), NOW(), '30', 'Y', 'ESTIMATE', '2024-07-09', '2024-10-12', '2024-07-21', '신규 기기 계약 체결', '고급 원두 구매에 대한 견적', '선불', 14, '30', 'Y', '2024-07-14', 160200, 'N', 0, '매출 과세', 178000, 15, 58),
(59, NOW(), NOW(), '10', 'N', 'ESTIMATE', '2024-01-21', '2024-04-25', '2024-02-02', '신규 업체 계약 체결', '배송 일정 조율 필요', '분할 납부', 45, '20', 'N', '2024-01-26', 517500, 'Y', 57500, '매출 면세', 575000, 15, 59),
(60, NOW(), NOW(), '20', 'Y', 'ESTIMATE', '2024-10-19', '2025-01-22', '2024-10-31', '기존 매장 계약', '원두에 대한 견적', '분할 납부', 26, '10', 'N', '2024-10-24', 728100, 'Y', 80900, '매출 면세', 809000, 11, 60);


-- Sales 데이터 50개
INSERT INTO tb_sales ( created_at, updated_at, busi_type, busi_type_detail, exp_arrival_date, note, price, prod_cnt, sales_name, sales_date, supply_price, surtax_yn, tax, tax_cls, contract_no)
VALUES
( NOW(), NOW(), '해외', '정기 주문', '2024-11-06', '정기 배송 필요', 176000, 31, 'C001S1-241020', '2024-10-20', 158400, 'N', 0, '매출 과세', 1),
( NOW(), NOW(), '공공', '대량 주문', '2024-12-18', '특별 가격 협상 완료', 554000, 41, 'C002S2-241128', '2024-11-28', 498600, 'N', 0, '매출 과세', 2),
( NOW(), NOW(), '해외', '정기 주문', '2024-09-28', '배송 일정 조율 필요', 634000, 8, 'C003S3-24916', '2024-09-16', 570600, 'N', 0, '매출 과세', 3),
( NOW(), NOW(), '해외', '정기 주문', '2024-12-08', '정기 배송 필요', 627000, 46, 'C003S4-241125', '2024-11-25', 564300, 'N', 0, '매출 과세', 3),
( NOW(), NOW(), '기업', '대량 주문', '2024-09-23', '정기 배송 필요', 906000, 10, 'C003S5-24827', '2024-08-27', 815400, 'Y', 90600, '매출 면세', 3),
( NOW(), NOW(), '공공', '정기 주문', '2024-09-01', '배송 일정 조율 필요', 463000, 33, 'C004S6-24827', '2024-08-27', 416700, 'Y', 46300, '매출 면세', 4),
( NOW(), NOW(), '기업', '정기 주문', '2024-03-02', '고객 요청 사항 반영', 241000, 39, 'C004S7-24214', '2024-02-14', 216900, 'N', 0, '매출 과세', 4),
( NOW(), NOW(), '기업', '소량 주문', '2024-01-12', '고객 요청 사항 반영', 350000, 2, 'C001S8-2411', '2024-01-01', 315000, 'N', 0, '매출 과세', 1),
( NOW(), NOW(), '기업', '소량 주문', '2024-12-20', '정기 배송 필요', 582000, 24, 'C001S9-24121', '2024-12-01', 523800, 'N', 0, '매출 과세', 1),
( NOW(), NOW(), '공공', '정기 주문', '2024-10-20', '배송 일정 조율 필요', 286000, 46, 'C004S10-241013', '2024-10-13', 257400, 'N', 0, '매출 과세', 4),
( NOW(), NOW(), '공공', '소량 주문', '2024-05-17', '고객 피드백 반영 필요', 101000, 19, 'C003S11-24424', '2024-04-24', 90900, 'N', 0, '매출 과세', 3),
( NOW(), NOW(), '공공', '정기 주문', '2024-12-27', '고객 요청 사항 반영', 187000, 21, 'C004S12-24127', '2024-12-07', 168300, 'N', 0, '매출 과세', 4),
( NOW(), NOW(), '민간', '일반 판매', '2024-02-20', '고객 요청 사항 반영', 274000, 2, 'C002S13-24127', '2024-01-27', 246600, 'Y', 27400, '매출 면세', 2),
( NOW(), NOW(), '공공', '정기 주문', '2024-12-09', '정기 배송 필요', 607000, 20, 'C005S14-241127', '2024-11-27', 546300, 'N', 0, '매출 과세', 5),
( NOW(), NOW(), '민간', '대량 주문', '2024-01-21', '고객 피드백 반영 필요', 811000, 46, 'C002S15-24112', '2024-01-12', 729900, 'N', 0, '매출 과세', 2),
( NOW(), NOW(), '기업', '정기 주문', '2024-06-17', '배송 일정 조율 필요', 586000, 20, 'C002S16-2462', '2024-06-02', 527400, 'Y', 58600, '매출 면세', 2),
( NOW(), NOW(), '공공', '대량 주문', '2024-05-12', '특별 가격 협상 완료', 515000, 39, 'C002S17-24421', '2024-04-21', 463500, 'N', 0, '매출 과세', 2),
( NOW(), NOW(), '기업', '대량 주문', '2024-04-30', '정기 배송 필요', 246000, 6, 'C005S18-24415', '2024-04-15', 221400, 'Y', 24600, '수출 영세', 5),
( NOW(), NOW(), '공공', '대량 주문', '2024-04-08', '고객 요청 사항 반영', 385000, 3, 'C003S19-2439', '2024-03-09', 346500, 'Y', 38500, '매출 면세', 3),
( NOW(), NOW(), '공공', '정기 주문', '2024-11-11', '배송 일정 조율 필요', 857000, 34, 'C003S20-241016', '2024-10-16', 771300, 'Y', 85700, '수출 영세', 3),
( NOW(), NOW(), '공공', '대량 주문', '2024-03-25', '고객 피드백 반영 필요', 272000, 29, 'C004S21-2431', '2024-03-01', 244800, 'N', 0, '매출 과세', 4),
( NOW(), NOW(), '공공', '소량 주문', '2024-07-01', '정기 배송 필요', 767000, 45, 'C002S22-24622', '2024-06-22', 690300, 'N', 0, '매출 과세', 2),
( NOW(), NOW(), '해외', '소량 주문', '2024-02-23', '배송 일정 조율 필요', 734000, 32, 'C002S23-24213', '2024-02-13', 660600, 'Y', 73400, '수출 영세', 2),
( NOW(), NOW(), '해외', '정기 주문', '2024-11-22', '고객 요청 사항 반영', 170000, 39, 'C004S24-241114', '2024-11-14', 153000, 'N', 0, '매출 과세', 4),
( NOW(), NOW(), '공공', '정기 주문', '2024-06-07', '정기 배송 필요', 401000, 32, 'C004S25-24527', '2024-05-27', 360900, 'Y', 40100, '매출 면세', 4),
( NOW(), NOW(), '기업', '대량 주문', '2024-07-28', '고객 요청 사항 반영', 876000, 11, 'C003S26-24720', '2024-07-20', 788400, 'N', 0, '매출 과세', 3),
( NOW(), NOW(), '민간', '정기 주문', '2024-06-22', '특별 가격 협상 완료', 436000, 1, 'C003S27-2463', '2024-06-03', 392400, 'Y', 43600, '수출 영세', 3),
( NOW(), NOW(), '공공', '일반 판매', '2024-11-22', '정기 배송 필요', 690000, 37, 'C003S28-241111', '2024-11-11', 621000, 'Y', 69000, '수출 영세', 3),
( NOW(), NOW(), '해외', '정기 주문', '2025-01-01', '배송 일정 조율 필요', 897000, 25, 'C004S29-241226', '2024-12-26', 807300, 'Y', 89700, '수출 영세', 4),
( NOW(), NOW(), '민간', '대량 주문', '2024-12-18', '정기 배송 필요', 322000, 46, 'C003S30-241212', '2024-12-12', 289800, 'Y', 32200, '매출 면세', 3),
( NOW(), NOW(), '민간', '정기 주문', '2024-12-24', '고객 요청 사항 반영', 381000, 48, 'C005S31-24126', '2024-12-06', 342900, 'Y', 38100, '수출 영세', 5),
( NOW(), NOW(), '기업', '소량 주문', '2024-09-19', '고객 요청 사항 반영', 892000, 16, 'C003S32-2498', '2024-09-08', 802800, 'N', 0, '매출 과세', 3),
( NOW(), NOW(), '기업', '소량 주문', '2024-12-20', '배송 일정 조율 필요', 370000, 49, 'C001S33-241123', '2024-11-23', 333000, 'Y', 37000, '매출 면세', 1),
( NOW(), NOW(), '해외', '대량 주문', '2024-09-29', '고객 요청 사항 반영', 663000, 27, 'C001S34-24912', '2024-09-12', 596700, 'N', 0, '매출 과세', 1),
( NOW(), NOW(), '해외', '정기 주문', '2024-06-21', '배송 일정 조율 필요', 601000, 34, 'C002S35-24612', '2024-06-12', 540900, 'N', 0, '매출 과세', 2),
( NOW(), NOW(), '민간', '대량 주문', '2024-09-20', '특별 가격 협상 완료', 365000, 33, 'C003S36-2494', '2024-09-04', 328500, 'Y', 36500, '수출 영세', 3),
( NOW(), NOW(), '해외', '소량 주문', '2024-05-26', '배송 일정 조율 필요', 982000, 13, 'C002S37-24513', '2024-05-13', 883800, 'N', 0, '매출 과세', 2),
( NOW(), NOW(), '기업', '일반 판매', '2024-12-31', '고객 피드백 반영 필요', 253000, 43, 'C001S38-241218', '2024-12-18', 227700, 'Y', 25300, '매출 면세', 1),
( NOW(), NOW(), '해외', '소량 주문', '2024-07-31', '고객 피드백 반영 필요', 218000, 13, 'C003S39-24714', '2024-07-14', 196200, 'N', 0, '매출 과세', 3),
( NOW(), NOW(), '민간', '일반 판매', '2024-10-24', '정기 배송 필요', 841000, 14, 'C002S40-241019', '2024-10-19', 756900, 'N', 0, '매출 과세', 2),
( NOW(), NOW(), '공공', '대량 주문', '2024-11-08', '배송 일정 조율 필요', 226000, 45, 'C001S41-241011', '2024-10-11', 203400, 'N', 0, '매출 과세', 1),
( NOW(), NOW(), '민간', '소량 주문', '2024-12-30', '고객 피드백 반영 필요', 918000, 42, 'C001S42-24123', '2024-12-03', 826200, 'Y', 91800, '수출 영세', 1),
( NOW(), NOW(), '기업', '대량 주문', '2024-08-16', '고객 요청 사항 반영', 230000, 29, 'C004S43-24723', '2024-07-23', 207000, 'N', 0, '매출 과세', 4),
( NOW(), NOW(), '민간', '일반 판매', '2024-05-07', '배송 일정 조율 필요', 109000, 45, 'C002S44-24411', '2024-04-11', 98100, 'N', 0, '매출 과세', 2),
( NOW(), NOW(), '해외', '정기 주문', '2024-11-16', '고객 피드백 반영 필요', 147000, 6, 'C003S45-24118', '2024-11-08', 132300, 'Y', 14700, '매출 면세', 3),
( NOW(), NOW(), '해외', '소량 주문', '2025-01-18', '배송 일정 조율 필요', 991000, 44, 'C004S46-241221', '2024-12-21', 891900, 'N', 0, '매출 과세', 4),
( NOW(), NOW(), '해외', '소량 주문', '2024-05-24', '고객 피드백 반영 필요', 876000, 40, 'C004S47-24519', '2024-05-19', 788400, 'Y', 87600, '매출 면세', 4),
( NOW(), NOW(), '해외', '일반 판매', '2024-05-17', '고객 요청 사항 반영', 966000, 30, 'C005S48-2453', '2024-05-03', 869400, 'Y', 96600, '수출 영세', 5),
( NOW(), NOW(), '해외', '대량 주문', '2024-11-20', '배송 일정 조율 필요', 599000, 22, 'C004S49-24111', '2024-11-01', 539100, 'N', 0, '매출 과세', 4),
( NOW(), NOW(), '기업', '대량 주문', '2024-11-10', '고객 피드백 반영 필요', 534000, 37, 'C001S50-241023', '2024-10-23', 480600, 'Y', 53400, '매출 면세', 1)