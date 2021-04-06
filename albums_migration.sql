USE codeup_test_db;
DROP TABLE  IF EXISTs albums;

CREATE TABLE IF NOT EXISTs albums(
id INT unsigned auto_increment not null,
artist varchar (128),
name varchar (128),
release_date SMALLINT  UNSIGNED,
    genre VARCHAR(128),
    sales FLOAT(6,2),
PRIMARY KEY  (id)
);
