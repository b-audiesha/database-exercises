USE bank_db;
DROP TABLE IF EXIST transactions;

CREATE TABLE IF NOT EXIST transactions(
id INT ,
date DATE - format YYYY-MM-DD,
description VARCHAR(128),
memo LONGTEXT,
amount MONEY,
 transaction_successful BOOLEAN,
    PRIMARY KEY  (id)
    );

