-- CREATE and USE JOIN US DATABASE --
DROP DATABASE IF EXISTS join_us;
CREATE DATABASE join_us;
USE join_us;

-- USERS SCHEMA TABLE --
CREATE TABLE users
    (
        email VARCHAR(255) PRIMARY KEY,
        created_at TIMESTAMP DEFAULT NOW()
    );