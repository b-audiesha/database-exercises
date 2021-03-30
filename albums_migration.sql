USE codeup_test_db;
DROP TABLE IF EXIST albums;
CREATE TABLE IF NOT EXIST albums(
id INT unsigned auto_increment not null,
artist varchar (128),
name varchar (128),
release_date SMALLINT  UNSIGNED,
sales FLOAT(6,2),
genre VARCHAR(128),,
PRIMARY KEY  (id)
);
