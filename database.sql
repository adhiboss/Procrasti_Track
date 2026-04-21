CREATE DATABASE IF NOT EXISTS procrastitrack;
USE procrastitrack;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    pw_hash VARCHAR(255) NOT NULL,
    school VARCHAR(100) DEFAULT '',
    xp INT DEFAULT 0,
    level INT DEFAULT 1,
    streak INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS tasks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    subject VARCHAR(100) DEFAULT 'General',
    due_date DATE NULL,
    status VARCHAR(50) DEFAULT 'upcoming',
    done TINYINT(1) DEFAULT 0,
    xp INT DEFAULT 30,
    source VARCHAR(50) DEFAULT 'manual',
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- No dummy data initially
