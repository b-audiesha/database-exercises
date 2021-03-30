USE bank_db;
DROP TABLE IF EXIST transactions;

CREATE TABLE IF NOT EXIST transactions(
id INT  UNSIGNED NOT NULL AUTO_INCREMENT,
date DATE - format YYYY-MM-DD,
description VARCHAR(100),
memo TEXT,
amount DECIMAL (10,2),
 transaction_successful BOOLEAN,
PRIMARY KEY  (id)
    );

