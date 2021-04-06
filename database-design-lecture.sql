CREATE DATABASE IF NOT EXISTS design_test_db;
USE design_test_db;
DROP TABLE IF EXISTS quote_topic;
DROP TABLE IF EXISTS quotes;
DROP TABLE IF EXISTS topics;
DROP TABLE IF EXISTS authors;
CREATE TABLE quotes (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  author_first_name VARCHAR(50) DEFAULT 'NONE',
  author_last_name  VARCHAR(100) NOT NULL,
  content TEXT NOT NULL,
  PRIMARY KEY (id)
);
CREATE TABLE authors (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(50),
  last_name  VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);

  ALTER TABLE quotes DROP COLUMN author_first_name;
ALTER TABLE quotes DROP COLUMN author_last_name;
ALTER TABLE quotes ADD COLUMN author_id INT UNSIGNED NOT NULL;
ALTER TABLE quotes ADD FOREIGN KEY (author_id) REFERENCES authors(id) ON DELETE NO ACTION ON UPDATE CASCADE;
SELECT * FROM quotes;
SELECT * FROM authors;
INSERT INTO authors(first_name, last_name)
VALUES ('Leslie', 'Knope'),
  ('April', 'Ludgate'),
  ('Donna','Meagle'),
  ('Ann', 'Perkins');
INSERT INTO quotes(author_id, content)
VALUES ((SELECT id FROM authors where first_name = 'Leslie' AND last_name = 'Knope'),
'Everything hurts and I''m dying.');
INSERT INTO quotes(author_id, content)
VALUES ((SELECT id FROM authors where first_name = 'April' AND last_name = 'Ludgate'),
'Time is money; Money is power; Power is pizza; Pizza is knowledge. Let’s go!');
INSERT INTO quotes(author_id, content)
VALUES ((SELECT id FROM authors where first_name = 'Donna' AND last_name = 'Meagle'),
'Do I look like I drink water?');
INSERT INTO quotes(author_id, content)
VALUES ((SELECT id FROM authors where first_name = 'Ann' AND last_name = 'Perkins'),
'Jogging is the worst. I know it keeps you healthy, but God, at what cost?');
SELECT CONCAT(authors.first_name, ' ', authors.last_name) AS Author, content AS Famous_Quote
from quotes
join authors ON quotes.author_id = authors.id;
CREATE TABLE topics (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(255),
  PRIMARY KEY (id)
);
INSERT INTO topics(name) VALUES
('Adulting'),
('Food'),
('Adulting'),
('Humor');
CREATE TABLE quote_topic (
                             quote_id INTEGER UNSIGNED NOT NULL,
                             topic_id INTEGER UNSIGNED NOT NULL,
                             FOREIGN KEY (quote_id) REFERENCES quotes(id),
                             FOREIGN KEY (topic_id) REFERENCES topics(id)
);
INSERT INTO quote_topic(quote_id, topic_id)
VALUES (1, 2), (1, 3), (2, 4), (3, 1),
       (3, 2), (3, 3), (3, 4), (4, 2), (5, 1);
SELECT q.content AS 'Quote',
       CONCAT(a.first_name, ' ', a.last_name) AS 'Full Name',
       t.name AS 'Topic'
FROM quotes q
         INNER JOIN quote_topic qt ON q.id = qt.quote_id
         INNER JOIN topics t ON qt.topic_id = t.id
         INNER JOIN authors a ON q.author_id = a.id
WHERE qt.topic_id IN
      (
          SELECT t.id
          FROM topics t
          WHERE t.name = 'Humor'
      );
