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

INSERT INTO tb_calendar (no, user_no,created_at, updated_at) VALUES (1, 3, now(), now()),(2, 2, now(), now()),(3, 1, now(), now());

INSERT INTO tb_lead (created_at, updated_at, start_date, end_date, exp_margin, exp_profit, exp_sales, name, note, process, status, sub_process, sucess_per, customer_no)
VALUES (CURDATE(), CURDATE(), '2024-03-01', '2024-04-11', 20, 2000, 10000, '고객 A 영업', 'A에 대한 활동 메모', 1, 'SUCCESS', 5, 100, 1),
       (CURDATE(), CURDATE(), '2024-05-01', '2024-06-11', 10, 800, 8000, '고객 B 영업', 'B에 대한 활동 메모', 1, 'SUCCESS', 5, 100,2),
       (CURDATE(), CURDATE(), '2024-07-01', '2024-08-11', 20, 1000, 5000, '고객 C 영업', 'C에 대한 활동 메모', 1, 'SUCCESS', 5, 100, 3),
       (CURDATE(), CURDATE(), '2024-09-01', '2024-10-11', 30, 1800, 6000, '고객 D 영업', 'D에 대한 활동 메모', 1, 'SUCCESS', 5, 100, 4),
       (CURDATE(), CURDATE(), '2024-10-01', '2024-11-11', 30, 1800, 6000, '고객 E 영업', 'E에 대한 활동 메모', 1, 'SUCCESS', 3, 100, 5);

INSERT INTO tb_act (created_at, updated_at, no, act_cont, act_date, cls, complete_yn, end_time, name, plan_cont, purpose, start_time, calendar_no, lead_no)
VALUES
    (NOW(), NOW(), 1, '화상 회의 플랫폼 논의', '2024-11-11', 'ONLINE', 'N', '15:00', '프로젝트 회의 준비', '신규 회의 준비', '프로젝트 논의', '13:00', 1, 1),
    (NOW(), NOW(), 2, '거래처 방문', '2024-10-20', 'VISIT', 'Y', '17:00', '거래처 미팅', '계약 관련 회의', '상담 및 계약 체결', '15:00', 1, 2),
    (NOW(), NOW(), 3, '전화 문의 응대', '2024-11-15', 'PHONE', 'N', '11:30', '문의사항 해결', '고객 문의 사항 응대', '고객 응대', '10:00', 1, 3),
    (NOW(), NOW(), 4, '이메일 발송', '2024-11-07', 'EMAIL', 'Y', '14:00', '정보 이메일 발송', '상품 정보 제공', '상품 홍보 및 고객 안내', '13:00', 1, 4),
    (NOW(), NOW(), 5, '온라인 미팅 준비', '2024-10-21', 'OTHER', 'N', '16:00', '프로젝트 미팅', '프로젝트 논의', '프로젝트 진행 상황 점검', '14:00', 1, 5);


INSERT INTO tb_act (created_at, updated_at, act_cont, act_date, cls, complete_yn, end_time, name, plan_cont, purpose, start_time, calendar_no, lead_no)
VALUES (NOW(), NOW(),'고객 상담', '2024-01-15', 'VISIT', 'Y', '12:30', '방문 상담', '계획된 고객 방문', '고객 요구 분석', '10:00', 1, 1),
       (NOW(), NOW(),'전화 문의 응대', '2024-01-20', 'PHONE', 'N', '16:00', '전화 상담', '문의 응대 준비', '상품 설명', '15:00', 1, 2),
       (NOW(), NOW(),'이메일 전송', '2024-03-05', 'EMAIL', 'Y', '11:30', '이메일 발송', '상품 정보 전송', '세부 정보 제공', '11:00', 1, 3),
       (NOW(), NOW(),'온라인 미팅', '2024-04-12', 'ONLINE', 'Y', '14:00', '온라인 회의', '클라이언트 요구 분석', '서비스 논의', '13:00', 1, 4),
       (NOW(), NOW(),'온라인 미팅', '2024-04-15', 'ONLINE', 'Y', '14:00', '온라인 회의', '클라이언트 요구 분석', '서비스 논의', '13:00', 1, 4),
       (NOW(), NOW(),'온라인 미팅', '2024-04-16', 'ONLINE', 'Y', '14:00', '온라인 회의', '클라이언트 요구 분석', '서비스 논의', '13:00', 1, 4),
       (NOW(), NOW(),'온라인 미팅', '2024-04-17', 'ONLINE', 'Y', '14:00', '온라인 회의', '클라이언트 요구 분석', '서비스 논의', '13:00', 1, 4),
       (NOW(), NOW(),'현장 방문', '2024-07-18', 'VISIT', 'N', '13:00', '현장 점검', '시설 점검 및 회의', '프로젝트 관리', '10:30', 1, 5),
       (NOW(), NOW(),'고객 방문', '2024-07-22', 'VISIT', 'Y', '17:00', '고객 미팅', '계약 논의', '제품 설명', '15:00', 1, 1),
       (NOW(), NOW(),'전화 상담', '2024-07-10', 'PHONE', 'Y', '11:00', '전화 응대', '고객 불만 처리', '해결 방안 제시', '10:30', 1, 2),
       (NOW(), NOW(),'이메일 회신', '2024-09-19', 'EMAIL', 'Y', '15:30', '이메일 답변', '기술 지원 제공', '제품 사용법 안내', '15:00', 1, 3),
       (NOW(), NOW(),'온라인 회의', '2024-09-03', 'ONLINE', 'N', '16:00', '줌 미팅', '프로젝트 진행 상황 점검', '향후 일정 논의', '15:00', 1, 4),
       (NOW(), NOW(),'고객 방문', '2024-10-11', 'VISIT', 'Y', '12:30', '고객 상담', '서비스 업그레이드 제안', '상세 요구 분석', '10:30', 1, 5),
       (NOW(), NOW(),'고객 방문', '2024-10-12', 'VISIT', 'Y', '12:30', '고객 상담', '서비스 업그레이드 제안', '상세 요구 분석', '10:30', 1, 5),
       (NOW(), NOW(),'전화 응대', '2024-10-23', 'PHONE', 'N', '10:00', '고객 전화 응대', '문제 해결 방안 제공', '이슈 처리', '09:30', 1, 1),
       (NOW(), NOW(),'이메일 발송', '2024-12-30', 'EMAIL', 'Y', '13:00', '프로모션 이메일', '할인 행사 안내', '홍보 전략 수립', '12:30', 1, 2),
       (NOW(), NOW(),'온라인 상담', '2022-01-18', 'ONLINE', 'Y', '17:30', '온라인 고객 상담', '기술 지원', '제품 문제 해결', '16:30', 1, 3),
       (NOW(), NOW(),'고객 미팅', '2022-02-27', 'VISIT', 'N', '11:00', '고객 방문 회의', '계약 협상', '비용 산정', '10:00', 1, 4),
       (NOW(), NOW(),'전화 상담', '2022-03-15', 'PHONE', 'Y', '15:30', '전화 고객 상담', '서비스 안내', '상품 설명', '15:00', 1, 5),
       (NOW(), NOW(),'전화 응대', '2024-11-23', 'PHONE', 'N', '10:00', '고객 전화 응대', '문제 해결 방안 제공', '이슈 처리', '09:30', 2, 1),
       (NOW(), NOW(),'이메일 발송', '2024-12-30', 'EMAIL', 'Y', '13:00', '프로모션 이메일', '할인 행사 안내', '홍보 전략 수립', '12:30', 2, 2),
       (NOW(), NOW(),'온라인 상담', '2022-01-18', 'ONLINE', 'Y', '17:30', '온라인 고객 상담', '기술 지원', '제품 문제 해결', '16:30', 2, 3),
       (NOW(), NOW(),'고객 미팅', '2022-02-27', 'VISIT', 'N', '11:00', '고객 방문 회의', '계약 협상', '비용 산정', '10:00', 2, 4),
       (NOW(), NOW(),'전화 상담', '2022-03-15', 'PHONE', 'Y', '15:30', '전화 고객 상담', '서비스 안내', '상품 설명', '15:00', 2, 5),
       (NOW(), NOW(),'이메일 발송', '2024-12-30', 'EMAIL', 'Y', '13:00', '프로모션 이메일', '할인 행사 안내', '홍보 전략 수립', '12:30', 3, 2),
       (NOW(), NOW(),'온라인 상담', '2022-01-18', 'ONLINE', 'Y', '17:30', '온라인 고객 상담', '기술 지원', '제품 문제 해결', '16:30', 3, 3),
       (NOW(), NOW(),'고객 미팅', '2022-02-27', 'VISIT', 'N', '11:00', '고객 방문 회의', '계약 협상', '비용 산정', '10:00', 3, 4),
       (NOW(), NOW(),'전화 상담', '2022-03-15', 'PHONE', 'Y', '15:30', '전화 고객 상담', '서비스 안내', '상품 설명', '15:00', 3, 5),
       (NOW(), NOW(),'전화 상담', '2022-03-15', 'PHONE', 'Y', '15:30', '전화 고객 상담', '서비스 안내', '상품 설명', '15:00', 3, 5);

INSERT INTO tb_plan (no, created_at, updated_at, content, end_time, personal_yn, plan_cls, plan_date, start_time, title, calendar_no)
VALUES
    (1, NOW(), NOW(), '팀원 전체 회의', '10:00', 'N', 'COMPANY', '2024-11-02', '09:00', '회의 일정', 1),
    (2, NOW(), NOW(), '신규 계약 검토', '15:00', 'Y', 'CONTRACT', '2024-11-17', '13:00', '계약 검토', 1),
    (3, NOW(), NOW(), '개인 개발 공부', '22:00', 'Y', 'PERSONAL', '2024-11-21', '20:00', '개인 학습', 1),
    (4, NOW(), NOW(), '견적서 작성', '17:00', 'N', 'ESTIMATE', '2024-11-11', '15:00', '견적서 작업', 1),
    (5, NOW(), NOW(), '영업 전략 회의', '16:00', 'N', 'SALES', '2024-11-03', '14:00', '영업 전략 논의', 1),
    (6, NOW(), NOW(), '제안서 서식 정리', '22:00', 'Y', 'PROPOSAL', '2024-11-24', '10:00', '제안서 서식', 1),
    (7, NOW(), NOW(), 'OJT', '17:00', 'N', 'COMPANY', '2024-11-27', '15:00', '신입사원 OJT', 1),
    (8, NOW(), NOW(), '주간 업무 리뷰', '11:00', 'N', 'COMPANY', '2024-11-05', '10:00', '업무 리뷰', 2),
    (9, NOW(), NOW(), '부서별 프로젝트 검토', '17:00', 'Y', 'COMPANY', '2024-11-07', '15:00', '프로젝트 검토', 2),
    (10, NOW(), NOW(), '팀 빌딩 워크샵 준비 회의', '16:00', 'N', 'COMPANY', '2024-11-09', '14:00', '워크샵 준비 회의', 2),
    (11, NOW(), NOW(), '제품 개선 사항 검토', '12:00', 'Y', 'COMPANY', '2024-11-10', '10:00', '제품 검토', 3),
    (12, NOW(), NOW(), '연말 보고서 작성 회의', '11:00', 'N', 'COMPANY', '2024-11-12', '09:00', '보고서 작성 회의', 3),
    (13, NOW(), NOW(), 'PT', '17:00', 'N', 'PERSONAL', '2024-10-31', '15:00', 'PT 연습', 1),
    (14, NOW(), NOW(), '제안서 작성', '22:00', 'Y', 'PROPOSAL', '2024-11-13', '10:00', '제안 작성', 1);


INSERT INTO tb_todo (todo_no, created_at, updated_at, content, due_date, priority, private_yn, status, title, todo_cls, calendar_no)
VALUES
    (1, NOW(), NOW(), '고객사 자료 준비', '2024-11-10', 'HIGH', 'N', 'TODO', '자료 준비', 'SALES', 1),
    (2, NOW(), NOW(), '팀 회의 참석', '2024-11-23', 'MEDIUM', 'N', 'INPROGRESS', '회의 참여', 'COMPANY', 1),
    (3, NOW(), NOW(), '개인 일정 조율', '2024-11-29', 'LOW', 'Y', 'DONE', '일정 조율', 'PERSONAL', 1),
    (4, NOW(), NOW(), '계약서 내용 확인', '2024-11-25', 'HIGH', 'N', 'TODO', '계약서 검토', 'CONTRACT', 1),
    (5, NOW(), NOW(), '이메일 답변 작성', '2024-11-30', 'MEDIUM', 'N', 'TODO', '이메일 답변', 'EMAIL', 1);
