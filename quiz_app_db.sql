USE quiz_app_db;

CREATE TABLE users (
                       id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                       first_name VARCHAR(50),
                       last_name VARCHAR(100),
                       user_name VARCHAR(20),
                       user_email VARCHAR(50),
                       PRIMARY KEY (id)
);

CREATE TABLE user_categories (
                                 id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                                 name VARCHAR(255),
                                 PRIMARY KEY (id)
);

CREATE TABLE quizzes (
                         id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                         title VARCHAR(255),
                         PRIMARY KEY (id)
);

CREATE TABLE questions (
                           id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                           question TEXT NOT NULL,
                           answer_a TEXT NOT NULL,
                           answer_b TEXT NOT NULL,
                           answer_c TEXT NOT NULL,
                           answer_d TEXT NOT NULL,
                           correct_ans VARCHAR(1),
                           PRIMARY KEY (id)
);

CREATE TABLE quiz_categories (
                                 id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                                 name VARCHAR(255),
                                 PRIMARY KEY (id)
);

CREATE TABLE user_category(
                              user_id INTEGER UNSIGNED NOT NULL,
                              category_id INTEGER UNSIGNED NOT NULL,
                              FOREIGN KEY (user_id) REFERENCES users(id),
                              FOREIGN KEY (category_id) REFERENCES user_categories(id)
);

CREATE TABLE quiz_category(
                              quiz_id INTEGER UNSIGNED NOT NULL,
                              category_id INTEGER UNSIGNED NOT NULL,
                              FOREIGN KEY (quiz_id) REFERENCES quizzes(id),
                              FOREIGN KEY (category_id) REFERENCES quiz_categories(id)
);
