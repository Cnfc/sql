CREATE TABLE users(
  email VARCHAR(191) PRIMARY KEY,
  created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO users(email) VALUES
('katia@ya.com'), ('HAH.gmail.ru');