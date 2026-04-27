-- IELTS Beta - Full Database Schema
-- MySQL 8.0+

CREATE DATABASE IF NOT EXISTS ielts_beta CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE ielts_beta;

-- Users
CREATE TABLE users (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(100) NOT NULL,
    email       VARCHAR(150) UNIQUE NOT NULL,
    password    VARCHAR(255) NOT NULL,
    avatar      VARCHAR(255) DEFAULT NULL,
    target_band DECIMAL(2,1) DEFAULT 7.0,
    current_band DECIMAL(2,1) DEFAULT 0.0,
    test_date   DATE DEFAULT NULL,
    theme       ENUM('light','dark') DEFAULT 'light',
    streak      INT DEFAULT 0,
    last_active DATE DEFAULT NULL,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Skill progress per user
CREATE TABLE skill_progress (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    user_id     INT NOT NULL,
    skill       ENUM('listening','reading','writing','speaking') NOT NULL,
    band_score  DECIMAL(2,1) DEFAULT 0.0,
    sessions    INT DEFAULT 0,
    updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    UNIQUE KEY uq_user_skill (user_id, skill)
);

-- Vocabulary flashcards (global word bank)
CREATE TABLE flashcards (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    word        VARCHAR(100) NOT NULL,
    definition  TEXT NOT NULL,
    example     TEXT,
    category    VARCHAR(50) DEFAULT 'academic',
    difficulty  ENUM('easy','medium','hard') DEFAULT 'medium'
);

-- User flashcard review history
CREATE TABLE flashcard_reviews (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    user_id     INT NOT NULL,
    card_id     INT NOT NULL,
    result      ENUM('again','hard','good') NOT NULL,
    next_review DATE,
    reviewed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (card_id) REFERENCES flashcards(id) ON DELETE CASCADE
);

-- Mock tests
CREATE TABLE mock_tests (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    title       VARCHAR(200) NOT NULL,
    type        ENUM('academic','general') DEFAULT 'academic',
    duration    INT DEFAULT 170,
    description TEXT,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Mock test attempts
CREATE TABLE test_attempts (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    user_id     INT NOT NULL,
    test_id     INT NOT NULL,
    score_l     DECIMAL(2,1),
    score_r     DECIMAL(2,1),
    score_w     DECIMAL(2,1),
    score_s     DECIMAL(2,1),
    overall     DECIMAL(2,1),
    time_taken  INT,
    completed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (test_id) REFERENCES mock_tests(id)
);

-- Cambridge resources
CREATE TABLE cambridge_resources (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    title       VARCHAR(200) NOT NULL,
    type        ENUM('book','audio','pdf','video') DEFAULT 'pdf',
    edition     VARCHAR(50),
    description TEXT,
    file_url    VARCHAR(500),
    skill       ENUM('listening','reading','writing','speaking','all') DEFAULT 'all',
    is_premium  TINYINT(1) DEFAULT 0
);

-- Daily streaks log
CREATE TABLE streak_log (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    user_id     INT NOT NULL,
    log_date    DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    UNIQUE KEY uq_user_date (user_id, log_date)
);

-- Chat messages (AI tutor)
CREATE TABLE chat_messages (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    user_id     INT NOT NULL,
    role        ENUM('user','assistant') NOT NULL,
    content     TEXT NOT NULL,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- ===================== SAMPLE DATA =====================

INSERT INTO users (name, email, password, target_band, current_band, streak) VALUES
('Nafisa Tasnim', 'nafisa@demo.com', '$2y$12$demohashedpassword', 7.0, 6.5, 14),
('Demo User',    'demo@ielts.com', '$2y$12$demohashedpassword', 6.5, 5.5, 3);

INSERT INTO skill_progress (user_id, skill, band_score, sessions) VALUES
(1,'listening',7.0,24),(1,'reading',6.5,18),(1,'writing',6.0,11),(1,'speaking',6.5,9),
(2,'listening',5.5,5),(2,'reading',5.0,4),(2,'writing',5.0,2),(2,'speaking',5.5,3);

INSERT INTO flashcards (word, definition, example, category) VALUES
('Ubiquitous','Present everywhere','Smartphones have become ubiquitous in modern society.','academic'),
('Ambiguous','Open to multiple interpretations','The policy was ambiguous and caused confusion.','academic'),
('Concede','Admit something is true','He conceded that the evidence was convincing.','academic'),
('Prolific','Producing a large amount','She is a prolific writer, publishing three books a year.','academic'),
('Meticulous','Showing great attention to detail','She was meticulous in her research methodology.','academic'),
('Exacerbate','Make a problem worse','Pollution can exacerbate respiratory conditions.','environment'),
('Mitigate','Make less severe','Trees help mitigate the effects of climate change.','environment'),
('Sustainable','Able to continue without damage','We need sustainable energy solutions.','environment'),
('Proliferate','Increase rapidly','Social media platforms have proliferated in recent years.','technology'),
('Detrimental','Harmful or damaging','Excessive screen time can be detrimental to health.','health');

INSERT INTO mock_tests (title, type, duration, description) VALUES
('Cambridge IELTS 18 – Test 1','academic',170,'Full academic mock test based on Cambridge 18 style'),
('Cambridge IELTS 18 – Test 2','academic',170,'Second practice test with authentic question types'),
('General Training – Test 1','general',170,'General Training module for immigration/work purposes'),
('Academic Mini Mock – Listening Only','academic',40,'Focused 40-minute listening practice test');

INSERT INTO cambridge_resources (title, type, edition, description, skill, is_premium) VALUES
('Cambridge IELTS 18 Academic','book','18th Edition','Official Cambridge practice tests with audio','all',1),
('Cambridge IELTS 17 Academic','book','17th Edition','Previous year official tests','all',1),
('Academic Word List – Master PDF','pdf',NULL,'2000 most common academic vocabulary words','reading',0),
('IELTS Writing Task 2 – Model Answers','pdf',NULL,'50 band 8+ model essays with analysis','writing',0),
('Listening Practice – Section 3 & 4','audio',NULL,'Advanced listening passages with transcripts','listening',1),
('Speaking Part 2 Topics Bank','pdf',NULL,'200+ cue card topics with sample answers','speaking',0);
