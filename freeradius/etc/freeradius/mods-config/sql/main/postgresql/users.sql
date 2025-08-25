-- Юзер по умолчанию
INSERT INTO radcheck (username, attribute, op, value) VALUES ('demo','Cleartext-Password',':=','123');
INSERT INTO radcheck (username, attribute, op, value) VALUES ('demo','Simultaneous-Use',':=','2');

-- Юзер для теста
INSERT INTO radcheck (username, attribute, op, value) VALUES ('test','Cleartext-Password',':=','test');
INSERT INTO radcheck (username, attribute, op, value) VALUES ('test','Simultaneous-Use',':=','2');
