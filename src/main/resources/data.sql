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
    (14, '2024-10-16', 'EMAIL', '견적서 이메일 발송', 2, 9, NOW(), now()),
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
SELECT '2024-11-02', 'Y', 1, NOW(), NOW(), '팀 회의 준비', '높음', '주간 팀 회의', '회의', 'TODO'
WHERE NOT EXISTS (SELECT 1 FROM tb_todo WHERE due_date = '2024-11-05' AND calendar_no = 1 AND title = '주간 팀 회의');

INSERT INTO `tb_todo` (due_date, private_yn, calendar_no, created_at, updated_at, content, priority, title, todo_cls, status)
SELECT '2024-11-27', 'Y', 1, NOW(), NOW(), '부서별 업무 계획 정리', '중간', '업무 계획 정리', '계획', 'INPROGRESS'
WHERE NOT EXISTS (SELECT 1 FROM tb_todo WHERE due_date = '2024-11-12' AND calendar_no = 1 AND title = '업무 계획 정리');

INSERT INTO `tb_todo` (due_date, private_yn, calendar_no, created_at, updated_at, content, priority, title, todo_cls, status)
SELECT '2024-11-20', 'Y', 1, NOW(), NOW(), '내년 목표 설정', '높음', '목표 설정 회의', '회의', 'DONE'
WHERE NOT EXISTS (SELECT 1 FROM tb_todo WHERE due_date = '2024-11-20' AND calendar_no = 1 AND title = '목표 설정 회의');
-- calendar_no: 11(user_no 9)
INSERT INTO `tb_todo` (due_date, private_yn, calendar_no, created_at, updated_at, content, priority, title, todo_cls, status)
SELECT '2024-01-10', 'Y', 11, NOW(), NOW(), '연간 목표 설정', '높음', '목표 설정', '목표', 'TODO'
WHERE NOT EXISTS (SELECT 1 FROM tb_todo WHERE due_date = '2024-01-10' AND calendar_no = 14 AND title = '목표 설정');

INSERT INTO `tb_todo` (due_date, private_yn, calendar_no, created_at, updated_at, content, priority, title, todo_cls, status)
SELECT '2024-02-15', 'Y', 11, NOW(), NOW(), '개인 개발 프로젝트 계획', '중간', '개발 계획', '개발', 'INPROGRESS'
WHERE NOT EXISTS (SELECT 1 FROM tb_todo WHERE due_date = '2024-02-15' AND calendar_no = 14 AND title = '개발 계획');

INSERT INTO `tb_todo` (due_date, private_yn, calendar_no, created_at, updated_at, content, priority, title, todo_cls, status)
SELECT '2024-03-22', 'Y', 11, NOW(), NOW(), '시스템 유지보수 계획 수립', '낮음', '유지보수 계획', '유지보수', 'DONE'
WHERE NOT EXISTS (SELECT 1 FROM tb_todo WHERE due_date = '2024-03-22' AND calendar_no = 14 AND title = '유지보수 계획');

-- calendar_no: 12(user_no 10)
INSERT INTO `tb_todo` (due_date, private_yn, calendar_no, created_at, updated_at, content, priority, title, todo_cls, status)
SELECT '2024-04-10', 'Y', 12, NOW(), NOW(), '회사 정책 검토 회의', '높음', '정책 회의', '회의', 'TODO'
WHERE NOT EXISTS (SELECT 1 FROM tb_todo WHERE due_date = '2024-04-10' AND calendar_no = 15 AND title = '정책 회의');

INSERT INTO `tb_todo` (due_date, private_yn, calendar_no, created_at, updated_at, content, priority, title, todo_cls, status)
SELECT '2024-05-12', 'Y', 12, NOW(), NOW(), '신규 프로젝트 조사', '중간', '프로젝트 조사', '조사', 'INPROGRESS'
WHERE NOT EXISTS (SELECT 1 FROM tb_todo WHERE due_date = '2024-05-12' AND calendar_no = 15 AND title = '프로젝트 조사');

INSERT INTO `tb_todo` (due_date, private_yn, calendar_no, created_at, updated_at, content, priority, title, todo_cls, status)
SELECT '2024-06-18', 'Y', 12, NOW(), NOW(), '외부 강사 초청 교육 준비', '높음', '교육 준비', '교육', 'DONE'
WHERE NOT EXISTS (SELECT 1 FROM tb_todo WHERE due_date = '2024-06-18' AND calendar_no = 15 AND title = '교육 준비');

INSERT INTO `tb_todo` (due_date, private_yn, calendar_no, created_at, updated_at, content, priority, title, todo_cls, status)
SELECT '2024-09-05', 'Y', 11, NOW(), NOW(), '하반기 영업 전략 수립', '높음', '영업 전략', '전략', 'TODO'
WHERE NOT EXISTS (SELECT 1 FROM tb_todo WHERE due_date = '2024-07-05' AND calendar_no = 2 AND title = '영업 전략');

INSERT INTO `tb_todo` (due_date, private_yn, calendar_no, created_at, updated_at, content, priority, title, todo_cls, status)
SELECT '2024-09-14', 'Y', 1, NOW(), NOW(), '고객 분석 및 관리 계획', '중간', '고객 관리 계획', '관리', 'INPROGRESS'
WHERE NOT EXISTS (SELECT 1 FROM tb_todo WHERE due_date = '2024-08-14' AND calendar_no = 2 AND title = '고객 관리 계획');

INSERT INTO `tb_todo` (due_date, private_yn, calendar_no, created_at, updated_at, content, priority, title, todo_cls, status)
SELECT '2024-11-20', 'Y', 12, NOW(), NOW(), '고객 초청 행사 준비', '높음', '행사 준비', '이벤트', 'DONE'
WHERE NOT EXISTS (SELECT 1 FROM tb_todo WHERE due_date = '2024-09-20' AND calendar_no = 2 AND title = '행사 준비');

INSERT INTO `tb_todo` (due_date, private_yn, calendar_no, created_at, updated_at, content, priority, title, todo_cls, status)
SELECT '2024-10-05', 'Y', 11, NOW(), NOW(), '고객 지원 계획 수립', '높음', '지원 계획', '계획', 'TODO'
WHERE NOT EXISTS (SELECT 1 FROM tb_todo WHERE due_date = '2024-10-05' AND calendar_no = 5 AND title = '지원 계획');

INSERT INTO `tb_todo` (due_date, private_yn, calendar_no, created_at, updated_at, content, priority, title, todo_cls, status)
SELECT '2024-11-10', 'Y', 11, NOW(), NOW(), '고객 만족도 조사 준비', '중간', '만족도 조사', '조사', 'INPROGRESS'
WHERE NOT EXISTS (SELECT 1 FROM tb_todo WHERE due_date = '2024-11-10' AND calendar_no = 5 AND title = '만족도 조사');

INSERT INTO `tb_todo` (due_date, private_yn, calendar_no, created_at, updated_at, content, priority, title, todo_cls, status)
SELECT '2024-12-15', 'Y', 1, NOW(), NOW(), '고객 피드백 분석', '높음', '피드백 분석', '분석', 'DONE'
WHERE NOT EXISTS (SELECT 1 FROM tb_todo WHERE due_date = '2024-12-15' AND calendar_no = 5 AND title = '피드백 분석');


-- >>>>>>>>>>>> 일정 @uzz99 <<<<<<<<<<<<<<
-- 전사 일정
INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, content, start_time, end_time, title, plan_cls)
SELECT 'N', '2024-10-15', 1, NOW(), NOW(), '전사 미팅', '09:00', '11:00', 'Q4 전사 미팅', 'COMPANY'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-10-15' AND calendar_no = 1 AND title = 'Q4 전사 미팅');

INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, content, start_time, end_time, title, plan_cls)
SELECT 'N', '2024-11-25', 11, NOW(), NOW(), '사업 전략 발표', '09:00', '11:00', '전략 발표', 'COMPANY'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-11-25' AND calendar_no = 14 AND title = '전략 발표');

INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, updated_at, content, start_time, end_time, title, plan_cls)
SELECT 'N', '2024-12-10', 12, NOW(), NOW(), '연말 결산 회의', '14:00', '17:00', '결산 회의', 'COMPANY'
WHERE NOT EXISTS (SELECT 1 FROM tb_plan WHERE plan_date = '2024-11-10' AND calendar_no = 15 AND title = '결산 회의');

INSERT INTO `tb_plan` (personal_yn, plan_date, calendar_no, created_at, domain_no, updated_at, content, end_time, start_time, title, plan_cls) VALUES
('Y', '2024-10-25', 1, '2024-11-06 15:35:33.627', 4, '2024-11-06 15:35:33.627', '개인 일정 조정', '04:30', '03:30', '개인 일정 조정', 'PERSONAL'),
('Y', '2024-10-11', 1, '2024-11-06 15:35:33.627', 18, '2024-11-06 15:35:33.627', '개인 프로젝트 작업', '15:30', '14:30', '개인 프로젝트 활동', 'PERSONAL'),
('Y', '2024-10-04', 1, '2024-11-06 15:35:33.627', 24, '2024-11-06 15:35:33.627', '제안서 초안 작성', '08:30', '06:30', '제안서 초안 작성', 'PROPOSAL'),
('Y', '2024-10-19', 1, '2024-11-06 15:35:33.627', 22, '2024-11-06 15:35:33.627', '제안서 검토 회의', '10:30', '09:00', '제안서 토론 미팅', 'PROPOSAL'),
('Y', '2024-10-03', 1, '2024-11-06 15:35:33.627', 26, '2024-11-06 15:35:33.627', '견적 작성 작업', '22:00', '20:00', '견적 작성 활동', 'ESTIMATE'),
('Y', '2024-10-11', 1, '2024-11-06 15:35:33.627', 12, '2024-11-06 15:35:33.627', '견적서 업데이트', '14:30', '13:00', '견적서 업데이트', 'ESTIMATE'),
('Y', '2024-10-04', 1, '2024-11-06 15:35:33.627', 15, '2024-11-06 15:35:33.627', '영업 전략 검토', '08:00', '06:30', '영업 전략 토론', 'SALES'),
('Y', '2024-10-10', 1, '2024-11-06 15:35:33.627', 12, '2024-11-06 15:35:33.627', '클라이언트 미팅 준비', '21:30', '20:30', '클라이언트 미팅 준비', 'SALES'),
('Y', '2024-10-01', 1, '2024-11-06 15:35:33.627', 21, '2024-11-06 15:35:33.627', '계약서 검토', '05:00', '03:00', '계약서 토론', 'CONTRACT'),
('Y', '2024-10-16', 1, '2024-11-06 15:35:33.627', 14, '2024-11-06 15:35:33.627', '계약 조건 조정', '04:30', '02:30', '계약 조건 조정', 'CONTRACT'),
('Y', '2024-10-05', 11, '2024-11-06 15:35:33.627', 12, '2024-11-06 15:35:33.627', '가족 모임 준비', '16:00', '14:30', '가족 모임 준비', 'PERSONAL'),
('Y', '2024-10-16', 11, '2024-11-06 15:35:33.627', 20, '2024-11-06 15:35:33.627', '개인 프로젝트 작업', '00:30', '22:30', '개인 프로젝트 활동', 'PERSONAL'),
('Y', '2024-10-23', 11, '2024-11-06 15:35:33.627', 16, '2024-11-06 15:35:33.627', '제안서 초안 작성', '03:00', '01:30', '제안서 초안 작성', 'PROPOSAL'),
('Y', '2024-10-28', 11, '2024-11-06 15:35:33.627', 12, '2024-11-06 15:35:33.627', '제안서 초안 작성', '08:00', '06:00', '제안서 초안 작성', 'PROPOSAL'),
('Y', '2024-10-14', 11, '2024-11-06 15:35:33.627', 15, '2024-11-06 15:35:33.627', '견적 작성 작업', '14:00', '13:00', '견적 작성 활동', 'ESTIMATE'),
('Y', '2024-10-11', 11, '2024-11-06 15:35:33.627', 8, '2024-11-06 15:35:33.627', '견적서 업데이트', '11:00', '09:30', '견적서 업데이트', 'ESTIMATE'),
('Y', '2024-10-23', 11, '2024-11-06 15:35:33.627', 15, '2024-11-06 15:35:33.627', '클라이언트 미팅 준비', '22:30', '21:00', '클라이언트 미팅 준비', 'SALES'),
('Y', '2024-10-07', 11, '2024-11-06 15:35:33.627', 27, '2024-11-06 15:35:33.627', '영업 전략 검토', '07:30', '06:30', '영업 전략 토론', 'SALES'),
('Y', '2024-10-17', 11, '2024-11-06 15:35:33.627', 16, '2024-11-06 15:35:33.627', '계약서 검토', '19:00', '17:30', '계약서 토론', 'CONTRACT'),
('Y', '2024-10-20', 11, '2024-11-06 15:35:33.627', 29, '2024-11-06 15:35:33.627', '계약서 검토', '11:00', '09:30', '계약서 토론', 'CONTRACT'),
('Y', '2024-10-06', 12, '2024-11-06 15:35:33.627', 2, '2024-11-06 15:35:33.627', '가족 모임 준비', '07:30', '06:00', '가족 모임 준비', 'PERSONAL'),
('Y', '2024-10-23', 12, '2024-11-06 15:35:33.627', 1, '2024-11-06 15:35:33.627', '개인 프로젝트 작업', '03:00', '01:00', '개인 프로젝트 활동', 'PERSONAL'),
('Y', '2024-10-22', 12, '2024-11-06 15:35:33.627', 21, '2024-11-06 15:35:33.627', '제안서 초안 작성', '10:30', '08:30', '제안서 초안 작성', 'PROPOSAL'),
('Y', '2024-10-06', 12, '2024-11-06 15:35:33.627', 5, '2024-11-06 15:35:33.627', '제안서 검토 회의', '11:00', '10:00', '제안서 토론 미팅', 'PROPOSAL'),
('Y', '2024-10-28', 12, '2024-11-06 15:35:33.627', 28, '2024-11-06 15:35:33.627', '견적서 업데이트', '15:30', '14:00', '견적서 업데이트', 'ESTIMATE'),
('Y', '2024-10-05', 12, '2024-11-06 15:35:33.627', 19, '2024-11-06 15:35:33.627', '견적 작성 작업', '21:00', '20:00', '견적 작성 활동', 'ESTIMATE'),
('Y', '2024-10-06', 12, '2024-11-06 15:35:33.627', 17, '2024-11-06 15:35:33.627', '영업 관련 미팅', '13:30', '12:30', '영업 관련 미팅', 'SALES'),
('Y', '2024-10-07', 12, '2024-11-06 15:35:33.627', 13, '2024-11-06 15:35:33.627', '영업 관련 미팅', '08:30', '06:30', '영업 관련 미팅', 'SALES'),
('Y', '2024-10-25', 12, '2024-11-06 15:35:33.627', 24, '2024-11-06 15:35:33.627', '계약 협상 회의', '07:00', '06:00', '계약 협상 미팅', 'CONTRACT'),
('Y', '2024-10-16', 12, '2024-11-06 15:35:33.627', 8, '2024-11-06 15:35:33.627', '계약 협상 회의', '08:00', '06:30', '계약 협상 미팅', 'CONTRACT'),
('Y', '2024-11-20', 1, '2024-11-06 15:35:33.628', 15, '2024-11-06 15:35:33.628', '개인 일정 조정', '13:00', '11:00', '개인 일정 조정', 'PERSONAL'),
('Y', '2024-11-23', 1, '2024-11-06 15:35:33.628', 18, '2024-11-06 15:35:33.628', '개인 프로젝트 작업', '16:00', '09:00', '개인 프로젝트 활동', 'PERSONAL'),
('Y', '2024-11-07', 1, '2024-11-06 15:35:33.628', 1, '2024-11-06 15:35:33.628', '제안서 초안 작성', '22:00', '20:00', '제안서 초안 작성', 'PROPOSAL'),
('Y', '2024-11-18', 1, '2024-11-06 15:35:33.628', 12, '2024-11-06 15:35:33.628', '제안서 초안 작성', '01:00', '23:00', '제안서 초안 작성', 'PROPOSAL'),
('Y', '2024-11-17', 1, '2024-11-06 15:35:33.628', 16, '2024-11-06 15:35:33.628', '예산 검토', '04:00', '02:00', '예산 토론', 'ESTIMATE'),
('Y', '2024-11-14', 1, '2024-11-06 15:35:33.628', 11, '2024-11-06 15:35:33.628', '예산 검토', '16:00', '14:00', '예산 토론', 'ESTIMATE'),
('Y', '2024-11-12', 1, '2024-11-06 15:35:33.628', 6, '2024-11-06 15:35:33.628', '클라이언트 미팅 준비', '23:30', '21:30', '클라이언트 미팅 준비', 'SALES'),
('Y', '2024-11-08', 1, '2024-11-06 15:35:33.628', 27, '2024-11-06 15:35:33.628', '클라이언트 미팅 준비', '14:00', '12:00', '클라이언트 미팅 준비', 'SALES'),
('Y', '2024-11-14', 1, '2024-11-06 15:35:33.628', 11, '2024-11-06 15:35:33.628', '계약 협상 회의', '18:00', '16:30', '계약 협상 미팅', 'CONTRACT'),
('Y', '2024-11-04', 1, '2024-11-06 15:35:33.628', 15, '2024-11-06 15:35:33.628', '계약서 검토', '07:00', '05:00', '계약서 토론', 'CONTRACT'),
('Y', '2024-11-12', 11, '2024-11-06 15:35:33.628', 21, '2024-11-06 15:35:33.628', '개인 일정 조정', '13:30', '12:00', '개인 일정 조정', 'PERSONAL'),
('Y', '2024-11-17', 11, '2024-11-06 15:35:33.628', 3, '2024-11-06 15:35:33.628', '개인 일정 조정', '04:00', '02:00', '개인 일정 조정', 'PERSONAL'),
('Y', '2024-11-18', 11, '2024-11-06 15:35:33.628', 16, '2024-11-06 15:35:33.628', '제안서 검토 회의', '15:00', '13:30', '제안서 토론 미팅', 'PROPOSAL'),
('Y', '2024-11-03', 11, '2024-11-06 15:35:33.628', 6, '2024-11-06 15:35:33.628', '제안서 초안 작성', '06:00', '04:00', '제안서 초안 작성', 'PROPOSAL'),
('Y', '2024-11-06', 11, '2024-11-06 15:35:33.628', 9, '2024-11-06 15:35:33.628', '견적 작성 작업', '10:00', '08:30', '견적 작성 활동', 'ESTIMATE'),
('Y', '2024-11-23', 11, '2024-11-06 15:35:33.628', 2, '2024-11-06 15:35:33.628', '견적서 업데이트', '08:30', '07:30', '견적서 업데이트', 'ESTIMATE'),
('Y', '2024-11-14', 11, '2024-11-06 15:35:33.628', 23, '2024-11-06 15:35:33.628', '클라이언트 미팅 준비', '14:00', '12:30', '클라이언트 미팅 준비', 'SALES'),
('Y', '2024-11-14', 11, '2024-11-06 15:35:33.628', 22, '2024-11-06 15:35:33.628', '클라이언트 미팅 준비', '14:00', '12:30', '클라이언트 미팅 준비', 'SALES'),
('Y', '2024-11-12', 11, '2024-11-06 15:35:33.628', 1, '2024-11-06 15:35:33.628', '계약 조건 조정', '22:00', '20:00', '계약 조건 조정', 'CONTRACT'),
('Y', '2024-11-20', 11, '2024-11-06 15:35:33.628', 1, '2024-11-06 15:35:33.628', '계약 협상 회의', '17:30', '16:30', '계약 협상 미팅', 'CONTRACT'),
('Y', '2024-11-25', 12, '2024-11-06 15:35:33.628', 13, '2024-11-06 15:35:33.628', '개인 프로젝트 작업', '18:00', '16:00', '개인 프로젝트 활동', 'PERSONAL'),
('Y', '2024-11-01', 12, '2024-11-06 15:35:33.628', 30, '2024-11-06 15:35:33.628', '가족 모임 준비', '06:30', '05:30', '가족 모임 준비', 'PERSONAL'),
('Y', '2024-11-24', 12, '2024-11-06 15:35:33.628', 4, '2024-11-06 15:35:33.628', '제안서 검토 회의', '22:30', '21:30', '제안서 토론 미팅', 'PROPOSAL'),
('Y', '2024-11-05', 12, '2024-11-06 15:35:33.628', 18, '2024-11-06 15:35:33.628', '제안서 검토 회의', '10:30', '08:30', '제안서 토론 미팅', 'PROPOSAL'),
('Y', '2024-11-09', 12, '2024-11-06 15:35:33.628', 15, '2024-11-06 15:35:33.628', '견적서 업데이트', '10:00', '08:00', '견적서 업데이트', 'ESTIMATE'),
('Y', '2024-11-13', 12, '2024-11-06 15:35:33.628', 17, '2024-11-06 15:35:33.628', '견적 작성 작업', '09:30', '08:30', '견적 작성 활동', 'ESTIMATE'),
('Y', '2024-11-02', 12, '2024-11-06 15:35:33.628', 16, '2024-11-06 15:35:33.628', '영업 관련 미팅', '03:00', '01:30', '영업 관련 미팅', 'SALES'),
('Y', '2024-11-08', 12, '2024-11-06 15:35:33.628', 29, '2024-11-06 15:35:33.628', '영업 관련 미팅', '01:00', '00:00', '영업 관련 미팅', 'SALES'),
('Y', '2024-11-10', 12, '2024-11-06 15:35:33.628', 15, '2024-11-06 15:35:33.628', '계약서 검토', '22:00', '21:00', '계약서 토론', 'CONTRACT'),
('Y', '2024-11-11', 12, '2024-11-06 15:35:33.628', 17, '2024-11-06 15:35:33.628', '계약서 검토', '02:30', '00:30', '계약서 토론', 'CONTRACT'),
('Y', '2024-12-26', 1, '2024-11-06 15:35:33.628', 19, '2024-11-06 15:35:33.628', '가족 모임 준비', '11:30', '10:30', '가족 모임 준비', 'PERSONAL'),
('Y', '2024-12-19', 1, '2024-11-06 15:35:33.628', 22, '2024-11-06 15:35:33.628', '개인 일정 조정', '02:00', '00:30', '개인 일정 조정', 'PERSONAL'),
('Y', '2024-12-09', 1, '2024-11-06 15:35:33.628', 1, '2024-11-06 15:35:33.628', '제안서 초안 작성', '00:00', '22:00', '제안서 초안 작성', 'PROPOSAL'),
('Y', '2024-12-22', 1, '2024-11-06 15:35:33.628', 15, '2024-11-06 15:35:33.628', '제안서 초안 작성', '01:30', '00:30', '제안서 초안 작성', 'PROPOSAL'),
('Y', '2024-12-08', 1, '2024-11-06 15:35:33.628', 17, '2024-11-06 15:35:33.628', '견적 작성 작업', '17:00', '15:00', '견적 작성 활동', 'ESTIMATE'),
('Y', '2024-12-13', 1, '2024-11-06 15:35:33.628', 17, '2024-11-06 15:35:33.628', '예산 검토', '16:30', '15:30', '예산 토론', 'ESTIMATE'),
('Y', '2024-12-05', 1, '2024-11-06 15:35:33.628', 16, '2024-11-06 15:35:33.628', '클라이언트 미팅 준비', '19:30', '18:30', '클라이언트 미팅 준비', 'SALES'),
('Y', '2024-12-17', 1, '2024-11-06 15:35:33.628', 1, '2024-11-06 15:35:33.628', '영업 관련 미팅', '05:00', '03:00', '영업 관련 미팅', 'SALES'),
('Y', '2024-12-19', 1, '2024-11-06 15:35:33.628', 15, '2024-11-06 15:35:33.628', '계약 조건 조정', '09:30', '08:30', '계약 조건 조정', 'CONTRACT'),
('Y', '2024-12-23', 1, '2024-11-06 15:35:33.628', 20, '2024-11-06 15:35:33.629', '계약서 검토', '20:30', '19:30', '계약서 토론', 'CONTRACT'),
('Y', '2024-12-22', 11, '2024-11-06 15:35:33.629', 25, '2024-11-06 15:35:33.629', '가족 모임 준비', '23:00', '21:00', '가족 모임 준비', 'PERSONAL'),
('Y', '2024-12-03', 11, '2024-11-06 15:35:33.629', 15, '2024-11-06 15:35:33.629', '개인 프로젝트 작업', '05:30', '03:30', '개인 프로젝트 활동', 'PERSONAL'),
('Y', '2024-12-12', 11, '2024-11-06 15:35:33.629', 12, '2024-11-06 15:35:33.629', '제안서 초안 작성', '05:00', '04:00', '제안서 초안 작성', 'PROPOSAL'),
('Y', '2024-12-08', 11, '2024-11-06 15:35:33.629', 19, '2024-11-06 15:35:33.629', '새로운 제안 논의', '06:30', '04:30', '새로운 제안 논의', 'PROPOSAL'),
('Y', '2024-12-15', 11, '2024-11-06 15:35:33.629', 23, '2024-11-06 15:35:33.629', '견적 작성 작업', '20:00', '18:00', '견적 작성 활동', 'ESTIMATE'),
('Y', '2024-12-08', 11, '2024-11-06 15:35:33.629', 30, '2024-11-06 15:35:33.629', '견적 작성 작업', '16:30', '14:30', '견적 작성 활동', 'ESTIMATE'),
('Y', '2024-12-03', 11, '2024-11-06 15:35:33.629', 6, '2024-11-06 15:35:33.629', '클라이언트 미팅 준비', '16:00', '14:30', '클라이언트 미팅 준비', 'SALES'),
('Y', '2024-12-02', 11, '2024-11-06 15:35:33.629', 14, '2024-11-06 15:35:33.629', '영업 전략 검토', '05:30', '04:30', '영업 전략 토론', 'SALES'),
('Y', '2024-12-15', 11, '2024-11-06 15:35:33.629', 25, '2024-11-06 15:35:33.629', '계약 조건 조정', '22:00', '20:00', '계약 조건 조정', 'CONTRACT'),
('Y', '2024-12-21', 11, '2024-11-06 15:35:33.629', 15, '2024-11-06 15:35:33.629', '계약서 검토', '10:00', '09:00', '계약서 토론', 'CONTRACT'),
('Y', '2024-12-17', 12, '2024-11-06 15:35:33.629', 10, '2024-11-06 15:35:33.629', '개인 일정 조정', '00:00', '22:30', '개인 일정 조정', 'PERSONAL'),
('Y', '2024-12-11', 12, '2024-11-06 15:35:33.629', 2, '2024-11-06 15:35:33.629', '가족 모임 준비', '01:30', '00:00', '가족 모임 준비', 'PERSONAL'),
('Y', '2024-12-02', 12, '2024-11-06 15:35:33.629', 23, '2024-11-06 15:35:33.629', '제안서 검토 회의', '23:30', '22:00', '제안서 토론 미팅', 'PROPOSAL'),
('Y', '2024-12-28', 12, '2024-11-06 15:35:33.629', 22, '2024-11-06 15:35:33.629', '제안서 검토 회의', '17:30', '16:00', '제안서 토론 미팅', 'PROPOSAL'),
('Y', '2024-12-16', 12, '2024-11-06 15:35:33.629', 23, '2024-11-06 15:35:33.629', '견적 작성 작업', '13:30', '12:30', '견적 작성 활동', 'ESTIMATE'),
('Y', '2024-12-11', 12, '2024-11-06 15:35:33.629', 7, '2024-11-06 15:35:33.629', '견적 작성 작업', '04:00', '02:30', '견적 작성 활동', 'ESTIMATE'),
('Y', '2024-12-26', 12, '2024-11-06 15:35:33.629', 8, '2024-11-06 15:35:33.629', '클라이언트 미팅 준비', '07:00', '06:00', '클라이언트 미팅 준비', 'SALES'),
('Y', '2024-12-13', 12, '2024-11-06 15:35:33.629', 17, '2024-11-06 15:35:33.629', '클라이언트 미팅 준비', '14:00', '13:00', '클라이언트 미팅 준비', 'SALES'),
('Y', '2024-12-12', 12, '2024-11-06 15:35:33.629', 2, '2024-11-06 15:35:33.629', '계약 조건 조정', '15:30', '14:30', '계약 조건 조정', 'CONTRACT'),
('Y', '2024-12-09', 12, '2024-11-06 15:35:33.629', 30, '2024-11-06 15:35:33.629', '계약 협상 회의', '03:30', '02:00', '계약 협상 미팅', 'CONTRACT');

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
('2024-01-26', 4, '2024-11-06 02:07:03', 39, '2024-11-06 02:07:03', '일정 조정', 'N', '11:00', '프로모션 상담', '추가 상담 예정', '구매 상담', '09:30', 'EMAIL'),
('2024-02-20', 5, '2024-11-06 02:07:03', 28, '2024-11-06 02:07:03', '상담 요청', 'N', '15:30', '샘플 요청', '추가 상담 예정', '문의 응대', '14:00', 'PHONE'),
('2024-09-13', 9, '2024-11-06 02:07:03', 38, '2024-11-06 02:07:03', '서비스 요청', 'N', '20:00', '샘플 요청', '제품 테스트', '구매 상담', '19:00', 'OTHER'),
('2024-06-12', 10, '2024-11-06 02:07:03', 29, '2024-11-06 02:07:03', '서비스 요청', 'Y', '16:30', '프로모션 상담', '발송 준비', '구매 상담', '14:30', 'EMAIL'),
('2024-01-22', 10, '2024-11-06 02:07:03', 2, '2024-11-06 02:07:03', '제품 문의', 'Y', '04:30', '프로모션 상담', '추가 상담 예정', '구매 상담', '02:30', 'PHONE'),
('2024-04-09', 9, '2024-11-06 02:07:03', 29, '2024-11-06 02:07:03', '상담 요청', 'N', '10:30', '프로모션 상담', '제품 테스트', '구매 상담', '09:30', 'ONLINE'),
('2024-11-06', 1, '2024-11-06 02:07:03', 50, '2024-11-06 02:07:03', '일정 조정', 'Y', '12:00', '샘플 요청', '제품 테스트', '기타', '10:30', 'EMAIL'),
('2024-10-19', 14, '2024-11-06 02:07:03', 18, '2024-11-06 02:07:03', '제품 문의', 'Y', '12:00', '샘플 요청', '추가 상담 예정', '기타', '10:00', 'ONLINE'),
('2024-09-14', 1, '2024-11-06 02:07:03', 15, '2024-11-06 02:07:03', '제품 문의', 'Y', '19:00', '프로모션 상담', '제품 테스트', '기타', '17:00', 'PHONE'),
('2024-12-18', 9, '2024-11-06 02:07:03', 15, '2024-11-06 02:07:03', '후속 연락', 'N', '09:00', '재구매 상담', '제품 테스트', '구매 상담', '07:00', 'VISIT'),
('2024-04-12', 10, '2024-11-06 02:07:03', 50, '2024-11-06 02:07:03', '후속 연락', 'Y', '04:30', '재구매 상담', '발송 준비', '기타', '02:30', 'ONLINE'),
('2024-02-24', 10, '2024-11-06 02:07:03', 11, '2024-11-06 02:07:03', '상담 요청', 'Y', '01:00', '재구매 상담', '추가 상담 예정', '기타', '23:30', 'ONLINE'),
('2024-04-04', 5, '2024-11-06 02:07:03', 14, '2024-11-06 02:07:03', '제품 문의', 'Y', '16:30', '재구매 상담', '발송 준비', '구매 상담', '14:30', 'EMAIL'),
('2024-11-15', 1, '2024-11-06 02:07:03', 49, '2024-11-06 02:07:03', '상담 요청', 'Y', '05:00', '재구매 상담', '제품 테스트', '문의 응대', '04:00', 'OTHER'),
('2024-04-06', 9, '2024-11-06 02:07:03', 22, '2024-11-06 02:07:03', '서비스 요청', 'Y', '19:00', '커피 시음회', '추가 상담 예정', '문의 응대', '18:00', 'OTHER'),
('2024-07-18', 1, '2024-11-06 02:07:03', 10, '2024-11-06 02:07:03', '상담 요청', 'Y', '05:00', '신제품 발표', '추가 상담 예정', '기타', '04:00', 'PHONE'),
('2024-01-09', 9, '2024-11-06 02:07:03', 24, '2024-11-06 02:07:03', '일정 조정', 'N', '01:30', '커피 시음회', '추가 상담 예정', '구매 상담', '23:30', 'EMAIL'),
('2024-10-20', 9, '2024-11-06 02:07:03', 23, '2024-11-06 02:07:03', '후속 연락', 'N', '11:00', '샘플 요청', '추가 상담 예정', '구매 상담', '10:00', 'ONLINE'),
('2024-10-28', 14, '2024-11-06 02:07:03', 23, '2024-11-06 02:07:03', '상담 요청', 'Y', '17:00', '샘플 요청', '제품 테스트', '기타', '16:00', 'VISIT'),
('2024-01-15', 10, '2024-11-06 02:07:03', 18, '2024-11-06 02:07:03', '제품 문의', 'Y', '15:30', '프로모션 상담', '추가 상담 예정', '문의 응대', '14:30', 'ONLINE'),
('2024-08-17', 9, '2024-11-06 02:07:03', 43, '2024-11-06 02:07:03', '상담 요청', 'Y', '00:00', '신제품 발표', '발송 준비', '구매 상담', '22:00', 'VISIT'),
('2024-02-05', 9, '2024-11-06 02:07:03', 4, '2024-11-06 02:07:03', '서비스 요청', 'Y', '16:30', '프로모션 상담', '제품 테스트', '문의 응대', '14:30', 'EMAIL'),
('2024-06-04', 4, '2024-11-06 02:07:03', 6, '2024-11-06 02:07:03', '서비스 요청', 'N', '22:00', '신제품 발표', '제품 테스트', '문의 응대', '20:30', 'PHONE'),
('2024-04-19', 1, '2024-11-06 02:07:03', 41, '2024-11-06 02:07:03', '제품 문의', 'Y', '05:00', '샘플 요청', '제품 테스트', '구매 상담', '04:00', 'PHONE'),
('2024-03-21', 9, '2024-11-06 02:07:03', 44, '2024-11-06 02:07:03', '제품 문의', 'Y', '06:00', '프로모션 상담', '추가 상담 예정', '기타', '05:00', 'OTHER'),
('2024-09-27', 1, '2024-11-06 02:07:03', 26, '2024-11-06 02:07:03', '일정 조정', 'N', '17:00', '프로모션 상담', '추가 상담 예정', '문의 응대', '16:00', 'VISIT'),
('2024-01-26', 11, '2024-11-06 02:07:03', 13, '2024-11-06 02:07:03', '상담 요청', 'N', '00:30', '재구매 상담', '발송 준비', '기타', '23:00', 'EMAIL'),
('2024-06-06', 1, '2024-11-06 02:07:03', 49, '2024-11-06 02:07:03', '제품 문의', 'N', '07:00', '샘플 요청', '제품 테스트', '기타', '05:00', 'ONLINE'),
('2024-06-28', 12, '2024-11-06 02:07:03', 35, '2024-11-06 02:07:03', '제품 문의', 'N', '18:00', '샘플 요청', '제품 테스트', '구매 상담', '16:00', 'PHONE'),
('2024-07-27', 9, '2024-11-06 02:07:03', 12, '2024-11-06 02:07:03', '서비스 요청', 'N', '04:30', '프로모션 상담', '추가 상담 예정', '구매 상담', '02:30', 'EMAIL'),
('2024-01-22', 10, '2024-11-06 02:07:03', 36, '2024-11-06 02:07:03', '서비스 요청', 'Y', '21:00', '프로모션 상담', '발송 준비', '문의 응대', '20:00', 'PHONE'),
('2024-02-19', 15, '2024-11-06 02:07:03', 41, '2024-11-06 02:07:03', '일정 조정', 'N', '02:30', '재구매 상담', '발송 준비', '기타', '01:30', 'VISIT'),
('2024-06-16', 4, '2024-11-06 02:07:03', 15, '2024-11-06 02:07:03', '후속 연락', 'N', '22:00', '프로모션 상담', '발송 준비', '문의 응대', '20:00', 'EMAIL'),
('2024-03-24', 10, '2024-11-06 02:07:03', 49, '2024-11-06 02:07:03', '서비스 요청', 'N', '10:00', '커피 시음회', '제품 테스트', '기타', '08:30', 'PHONE'),
('2024-06-14', 11, '2024-11-06 02:07:03', 18, '2024-11-06 02:07:03', '일정 조정', 'Y', '09:30', '신제품 발표', '제품 테스트', '기타', '08:00', 'VISIT'),
('2024-04-04', 10, '2024-11-06 02:07:03', 1, '2024-11-06 02:07:03', '서비스 요청', 'Y', '21:00', '프로모션 상담', '발송 준비', '기타', '20:00', 'PHONE'),
('2024-10-05', 9, '2024-11-06 02:07:03', 15, '2024-11-06 02:07:03', '제품 문의', 'Y', '12:30', '샘플 요청', '발송 준비', '기타', '10:30', 'ONLINE'),
('2024-06-07', 1, '2024-11-06 02:07:03', 36, '2024-11-06 02:07:03', '제품 문의', 'Y', '06:00', '재구매 상담', '발송 준비', '문의 응대', '04:00', 'ONLINE'),
('2024-07-06', 10, '2024-11-06 02:07:03', 28, '2024-11-06 02:07:03', '제품 문의', 'N', '11:30', '프로모션 상담', '발송 준비', '기타', '10:30', 'VISIT'),
('2024-09-23', 1, '2024-11-06 02:07:03', 47, '2024-11-06 02:07:03', '일정 조정', 'N', '23:30', '프로모션 상담', '추가 상담 예정', '문의 응대', '22:00', 'EMAIL'),
('2024-05-20', 4, '2024-11-06 02:07:03', 22, '2024-11-06 02:07:03', '후속 연락', 'N', '19:30', '커피 시음회', '제품 테스트', '구매 상담', '18:30', 'OTHER'),
('2024-07-27', 1, '2024-11-06 02:07:03', 26, '2024-11-06 02:07:03', '일정 조정', 'Y', '07:00', '프로모션 상담', '제품 테스트', '문의 응대', '06:00', 'OTHER'),
('2024-03-11', 1, '2024-11-06 02:07:03', 23, '2024-11-06 02:07:03', '일정 조정', 'N', '03:00', '신제품 발표', '발송 준비', '구매 상담', '01:00', 'ONLINE'),
('2024-01-03', 5, '2024-11-06 02:07:03', 22, '2024-11-06 02:07:03', '제품 문의', 'N', '00:00', '프로모션 상담', '발송 준비', '구매 상담', '23:00', 'VISIT'),
('2024-06-16', 1, '2024-11-06 02:07:03', 35, '2024-11-06 02:07:03', '제품 문의', 'Y', '01:30', '재구매 상담', '제품 테스트', '문의 응대', '00:30', 'PHONE'),
('2024-01-26', 10, '2024-11-06 02:07:03', 20, '2024-11-06 02:07:03', '제품 문의', 'N', '15:00', '신제품 발표', '발송 준비', '기타', '13:30', 'VISIT'),
('2024-08-08', 15, '2024-11-06 02:07:03', 12, '2024-11-06 02:07:03', '서비스 요청', 'Y', '04:30', '신제품 발표', '추가 상담 예정', '기타', '03:00', 'EMAIL'),
('2024-07-12', 9, '2024-11-06 02:07:03', 33, '2024-11-06 02:07:03', '서비스 요청', 'N', '10:00', '커피 시음회', '제품 테스트', '문의 응대', '09:00', 'PHONE'),
('2024-03-28', 1, '2024-11-06 02:07:03', 7, '2024-11-06 02:07:03', '일정 조정', 'N', '23:30', '재구매 상담', '제품 테스트', '기타', '22:00', 'ONLINE'),
('2024-12-14', 12, '2024-11-06 02:07:03', 33, '2024-11-06 02:07:03', '제품 문의', 'Y', '21:30', '커피 시음회', '추가 상담 예정', '문의 응대', '20:00', 'ONLINE'),
('2024-11-19', 9, '2024-11-06 02:07:03', 6, '2024-11-06 02:07:03', '후속 연락', 'N', '07:30', '커피 시음회', '발송 준비', '기타', '05:30', 'EMAIL'),
('2024-07-08', 9, '2024-11-06 02:07:03', 47, '2024-11-06 02:07:03', '후속 연락', 'Y', '10:30', '프로모션 상담', '발송 준비', '기타', '08:30', 'ONLINE'),
('2024-09-06', 1, '2024-11-06 02:07:03', 20, '2024-11-06 02:07:03', '후속 연락', 'N', '17:00', '재구매 상담', '제품 테스트', '기타', '15:30', 'VISIT'),
('2024-10-03', 4, '2024-11-06 02:07:03', 49, '2024-11-06 02:07:03', '일정 조정', 'N', '22:30', '커피 시음회', '제품 테스트', '문의 응대', '21:30', 'OTHER'),
('2024-11-20', 1, '2024-11-06 02:07:03', 42, '2024-11-06 02:07:03', '상담 요청', 'N', '12:30', '커피 시음회', '추가 상담 예정', '구매 상담', '11:30', 'VISIT'),
('2024-04-13', 9, '2024-11-06 02:07:03', 13, '2024-11-06 02:07:03', '제품 문의', 'N', '03:00', '재구매 상담', '제품 테스트', '기타', '01:00', 'OTHER'),
('2024-03-09', 10, '2024-11-06 02:07:03', 15, '2024-11-06 02:07:03', '제품 문의', 'N', '16:00', '샘플 요청', '발송 준비', '문의 응대', '15:00', 'EMAIL'),
('2024-02-28', 14, '2024-11-06 02:07:03', 5, '2024-11-06 02:07:03', '후속 연락', 'Y', '22:30', '커피 시음회', '추가 상담 예정', '문의 응대', '21:30', 'PHONE'),
('2024-09-11', 10, '2024-11-06 02:07:03', 50, '2024-11-06 02:07:03', '후속 연락', 'N', '04:00', '샘플 요청', '추가 상담 예정', '문의 응대', '02:30', 'OTHER'),
('2024-12-09', 1, '2024-11-06 02:07:03', 15, '2024-11-06 02:07:03', '상담 요청', 'Y', '10:30', '신제품 발표', '추가 상담 예정', '문의 응대', '09:30', 'EMAIL'),
('2024-12-25', 9, '2024-11-06 02:07:03', 29, '2024-11-06 02:07:03', '제품 문의', 'N', '09:30', '프로모션 상담', '제품 테스트', '기타', '08:00', 'OTHER'),
('2024-10-18', 10, '2024-11-06 02:07:03', 6, '2024-11-06 02:07:03', '제품 문의', 'N', '14:00', '커피 시음회', '추가 상담 예정', '기타', '13:00', 'PHONE'),
('2024-04-17', 5, '2024-11-06 02:07:03', 33, '2024-11-06 02:07:03', '서비스 요청', 'Y', '04:00', '샘플 요청', '제품 테스트', '기타', '02:00', 'VISIT'),
('2024-02-28', 15, '2024-11-06 02:07:03', 20, '2024-11-06 02:07:03', '서비스 요청', 'N', '17:00', '샘플 요청', '추가 상담 예정', '문의 응대', '15:30', 'ONLINE'),
('2024-09-27', 4, '2024-11-06 02:07:03', 19, '2024-11-06 02:07:03', '서비스 요청', 'N', '02:30', '신제품 발표', '발송 준비', '문의 응대', '00:30', 'PHONE'),
('2024-03-24', 14, '2024-11-06 02:07:03', 36, '2024-11-06 02:07:03', '서비스 요청', 'Y', '12:00', '재구매 상담', '추가 상담 예정', '문의 응대', '10:30', 'EMAIL'),
('2024-11-05', 10, '2024-11-06 02:07:03', 36, '2024-11-06 02:07:03', '후속 연락', 'N', '10:00', '신제품 발표', '추가 상담 예정', '문의 응대', '08:30', 'OTHER'),
('2024-05-05', 9, '2024-11-06 02:07:03', 1, '2024-11-06 02:07:03', '상담 요청', 'N', '05:00', '커피 시음회', '추가 상담 예정', '문의 응대', '03:00', 'VISIT'),
('2024-03-21', 11, '2024-11-06 02:07:03', 19, '2024-11-06 02:07:03', '상담 요청', 'Y', '22:00', '신제품 발표', '발송 준비', '구매 상담', '21:00', 'ONLINE'),
('2024-04-27', 4, '2024-11-06 02:07:03', 47, '2024-11-06 02:07:03', '서비스 요청', 'N', '20:00', '샘플 요청', '발송 준비', '기타', '19:00', 'PHONE'),
('2024-06-05', 1, '2024-11-06 02:07:03', 26, '2024-11-06 02:07:03', '일정 조정', 'N', '23:00', '프로모션 상담', '제품 테스트', '문의 응대', '21:30', 'EMAIL'),
('2024-06-14', 11, '2024-11-06 02:07:03', 15, '2024-11-06 02:07:03', '후속 연락', 'Y', '23:30', '프로모션 상담', '발송 준비', '문의 응대', '21:30', 'OTHER'),
('2024-02-07', 9, '2024-11-06 02:07:03', 44, '2024-11-06 02:07:03', '서비스 요청', 'Y', '08:00', '샘플 요청', '제품 테스트', '문의 응대', '06:30', 'VISIT'),
('2024-07-26', 11, '2024-11-06 02:07:03', 9, '2024-11-06 02:07:03', '후속 연락', 'Y', '12:30', '프로모션 상담', '제품 테스트', '문의 응대', '10:30', 'ONLINE'),
('2024-05-01', 14, '2024-11-06 02:07:03', 9, '2024-11-06 02:07:03', '제품 문의', 'Y', '17:30', '샘플 요청', '추가 상담 예정', '구매 상담', '15:30', 'ONLINE'),
('2024-01-27', 5, '2024-11-06 02:07:03', 4, '2024-11-06 02:07:03', '제품 문의', 'N', '22:30', '샘플 요청', '발송 준비', '구매 상담', '21:00', 'ONLINE'),
('2024-07-04', 5, '2024-11-06 02:07:03', 31, '2024-11-06 02:07:03', '서비스 요청', 'Y', '22:30', '커피 시음회', '제품 테스트', '문의 응대', '20:30', 'OTHER'),
('2024-03-02', 9, '2024-11-06 02:07:03', 13, '2024-11-06 02:07:03', '후속 연락', 'N', '02:30', '커피 시음회', '발송 준비', '구매 상담', '01:30', 'VISIT'),
('2024-12-26', 14, '2024-11-06 02:07:03', 14, '2024-11-06 02:07:03', '일정 조정', 'Y', '08:30', '커피 시음회', '제품 테스트', '기타', '07:30', 'VISIT'),
('2024-03-16', 9, '2024-11-06 02:07:03', 33, '2024-11-06 02:07:03', '제품 문의', 'N', '08:00', '샘플 요청', '추가 상담 예정', '기타', '06:30', 'PHONE'),
('2024-05-28', 9, '2024-11-06 02:07:03', 26, '2024-11-06 02:07:03', '일정 조정', 'N', '09:30', '재구매 상담', '발송 준비', '문의 응대', '07:30', 'OTHER'),
('2024-07-23', 10, '2024-11-06 02:07:03', 30, '2024-11-06 02:07:03', '후속 연락', 'Y', '23:00', '커피 시음회', '발송 준비', '문의 응대', '21:00', 'PHONE'),
('2024-03-03', 11, '2024-11-06 02:07:03', 43, '2024-11-06 02:07:03', '서비스 요청', 'N', '10:00', '프로모션 상담', '추가 상담 예정', '구매 상담', '08:30', 'ONLINE'),
('2024-12-10', 5, '2024-11-06 02:07:03', 31, '2024-11-06 02:07:03', '서비스 요청', 'Y', '04:00', '커피 시음회', '발송 준비', '기타', '02:00', 'EMAIL'),
('2024-01-04', 1, '2024-11-06 02:07:03', 47, '2024-11-06 02:07:03', '서비스 요청', 'N', '17:30', '커피 시음회', '제품 테스트', '기타', '15:30', 'OTHER'),
('2024-10-04', 1, '2024-11-06 02:07:03', 26, '2024-11-06 02:07:03', '서비스 요청', 'Y', '10:00', '커피 시음회', '제품 테스트', '구매 상담', '08:00', 'PHONE'),
('2024-03-09', 9, '2024-11-06 02:07:03', 24, '2024-11-06 02:07:03', '제품 문의', 'Y', '21:00', '재구매 상담', '발송 준비', '기타', '20:00', 'OTHER'),
('2024-10-25', 10, '2024-11-06 02:07:03', 20, '2024-11-06 02:07:03', '서비스 요청', 'N', '22:30', '프로모션 상담', '발송 준비', '구매 상담', '20:30', 'VISIT'),
('2024-08-07', 15, '2024-11-06 02:07:03', 5, '2024-11-06 02:07:03', '제품 문의', 'Y', '15:30', '신제품 발표', '제품 테스트', '문의 응대', '14:30', 'PHONE'),
('2024-11-10', 15, '2024-11-06 02:07:03', 23, '2024-11-06 02:07:03', '제품 문의', 'N', '23:00', '샘플 요청', '제품 테스트', '구매 상담', '21:00', 'EMAIL'),
('2024-06-22', 1, '2024-11-06 02:07:03', 41, '2024-11-06 02:07:03', '제품 문의', 'Y', '13:30', '신제품 발표', '제품 테스트', '기타', '11:30', 'PHONE'),
('2024-07-19', 1, '2024-11-06 02:07:03', 19, '2024-11-06 02:07:03', '제품 문의', 'Y', '04:30', '샘플 요청', '발송 준비', '구매 상담', '03:00', 'VISIT'),
('2024-01-06', 14, '2024-11-06 02:07:03', 30, '2024-11-06 02:07:03', '일정 조정', 'Y', '03:00', '커피 시음회', '발송 준비', '기타', '01:30', 'VISIT'),
('2024-02-03', 10, '2024-11-06 02:07:03', 25, '2024-11-06 02:07:03', '일정 조정', 'N', '19:00', '샘플 요청', '추가 상담 예정', '문의 응대', '17:30', 'ONLINE'),
('2024-03-04', 5, '2024-11-06 02:07:03', 8, '2024-11-06 02:07:03', '후속 연락', 'N', '21:00', '신제품 발표', '발송 준비', '문의 응대', '19:00', 'PHONE'),
('2024-06-13', 4, '2024-11-06 02:07:03', 35, '2024-11-06 02:07:03', '제품 문의', 'N', '05:30', '커피 시음회', '발송 준비', '기타', '04:30', 'PHONE'),
('2024-11-14', 4, '2024-11-06 02:07:03', 35, '2024-11-06 02:07:03', '상담 요청', 'Y', '13:30', '재구매 상담', '발송 준비', '구매 상담', '12:00', 'PHONE'),
('2024-09-26', 9, '2024-11-06 02:07:03', 42, '2024-11-06 02:07:03', '서비스 요청', 'N', '23:00', '커피 시음회', '추가 상담 예정', '문의 응대', '21:00', 'VISIT'),
('2024-05-25', 11, '2024-11-06 02:07:03', 50, '2024-11-06 02:07:03', '일정 조정', 'N', '07:30', '프로모션 상담', '제품 테스트', '기타', '06:00', 'OTHER'),
('2024-03-14', 9, '2024-11-06 02:07:03', 4, '2024-11-06 02:07:03', '상담 요청', 'N', '19:30', '커피 시음회', '제품 테스트', '구매 상담', '18:30', 'VISIT');