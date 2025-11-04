create database ss3_bai_tap;

use ss3_bai_tap;
CREATE TABLE IF NOT EXISTS students (
  student_id   INT AUTO_INCREMENT PRIMARY KEY,
  full_name    VARCHAR(100) NOT NULL,
  gender       ENUM('M','F','O') DEFAULT NULL,
  dob          DATE DEFAULT NULL,
  phone        VARCHAR(20) UNIQUE,
  email        VARCHAR(100) UNIQUE,
  created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

CREATE TABLE IF NOT EXISTS class_types (
  class_type_id INT AUTO_INCREMENT PRIMARY KEY,
  type_name     VARCHAR(100) NOT NULL UNIQUE
)

CREATE TABLE IF NOT EXISTS classes (
  class_id      INT AUTO_INCREMENT PRIMARY KEY,
  class_name    VARCHAR(100) NOT NULL UNIQUE,
  class_type_id INT NOT NULL,
  start_date    DATE DEFAULT NULL,
  end_date      DATE DEFAULT NULL,
  CONSTRAINT fk_classes_type
    FOREIGN KEY (class_type_id) REFERENCES class_types(class_type_id)
    ON UPDATE CASCADE ON DELETE RESTRICT
)

CREATE TABLE IF NOT EXISTS enrollments (
  student_id  INT NOT NULL,
  class_id    INT NOT NULL,
  enroll_date DATE DEFAULT (CURRENT_DATE),
  status      ENUM('active','completed','dropped') DEFAULT 'active',
  PRIMARY KEY (student_id, class_id),
  CONSTRAINT fk_enroll_student
    FOREIGN KEY (student_id) REFERENCES students(student_id)
    ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_enroll_class
    FOREIGN KEY (class_id) REFERENCES classes(class_id)
    ON UPDATE CASCADE ON DELETE CASCADE
)

INSERT INTO class_types(type_name) VALUES ('Online'), ('Offline'), ('Hybrid');

INSERT INTO classes(class_name, class_type_id, start_date)
VALUES ('SQL Cơ bản', 1, '2025-09-01'),
       ('Phân tích Dữ liệu', 2, '2025-09-15'),
       ('Kinh doanh Quốc tế 1', 3, '2025-10-01');
       
INSERT INTO students(full_name, gender, dob, phone, email)
VALUES ('Nguyen Van Tien', 'M', '2004-01-10', '0900000001', 'tien@example.com'),
       ('Tran Quang Toan', 'M', '2003-05-12', '0900000002', 'toan@example.com'),
       ('Le Minh Anh',     'F', '2004-03-22', '0900000003', 'anh@example.com'),
       ('Pham Gia Bao',    'M', '2003-07-19', '0900000004', 'bao@example.com');
       
INSERT INTO enrollments(student_id, class_id, enroll_date, status)
VALUES (1, 1, '2025-09-01', 'active'),
       (1, 3, '2025-10-01', 'active'),
       (2, 2, '2025-09-15', 'completed'),
       (3, 1, '2025-09-01', 'active');
       

-- cau1:
SELECT
  s.student_id,
  s.full_name,
  c.class_id,
  c.class_name
FROM enrollments e
JOIN students   s ON s.student_id = e.student_id
JOIN classes    c ON c.class_id    = e.class_id
WHERE e.status = 'active';

-- cau2:
SELECT
  s.student_id,
  s.full_name,
  c.class_name,
  ct.type_name AS class_type
FROM enrollments e
JOIN students    s  ON s.student_id     = e.student_id
JOIN classes     c  ON c.class_id       = e.class_id
JOIN class_types ct ON ct.class_type_id = c.class_type_id
WHERE e.status = 'active';

-- cau3:
SELECT
  s.student_id,
  s.full_name,
  c.class_name,
  e.status
FROM students s
LEFT JOIN enrollments e ON e.student_id = s.student_id AND e.status = 'active'
LEFT JOIN classes     c ON c.class_id   = e.class_id
ORDER BY s.student_id; 

-- cau4:
SELECT *
FROM students
WHERE full_name LIKE '%Tien%' OR full_name LIKE '%Toan%';

-- cau5:
SELECT
  c.class_id,
  c.class_name,
  COUNT(e.student_id) AS so_hoc_vien
FROM classes c
LEFT JOIN enrollments e ON e.class_id = c.class_id
GROUP BY c.class_id, c.class_name
ORDER BY c.class_name;

-- cau6:
SELECT student_id, full_name
FROM students
ORDER BY full_name ASC;