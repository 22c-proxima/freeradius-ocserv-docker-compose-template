-- Группа advanced, каждому её члену позволено две сессии максимум
INSERT INTO radgroupcheck (groupname, attribute, op, value)
VALUES ('advanced','Simultaneous-Use',':=','2');

-- ... и скорость: 50 килоБАЙТ/с в обе стороны
INSERT INTO radgroupreply (groupname, attribute, op, value)
VALUES ('advanced','RP-Upstream-Speed-Limit',':=','50'),
       ('advanced','RP-Downstream-Speed-Limit',':=','50');

-- Юзер по умолчанию, принадлежит группе advanced
INSERT INTO radcheck (username, attribute, op, value)
VALUES ('demo','Cleartext-Password',':=','123');
INSERT INTO radusergroup (username, groupname, priority)
VALUES ('demo','advanced',1);

-- Юзер для теста, он имеет собственные ограничения: 1 сессия и 100 килоБАЙТ/с
INSERT INTO radcheck (username, attribute, op, value)
VALUES ('test','Cleartext-Password',':=','test'),
       ('test','Simultaneous-Use',':=','1');
INSERT INTO radreply (username, attribute, op, value)
VALUES ('test','RP-Upstream-Speed-Limit',':=','100'),
       ('test','RP-Downstream-Speed-Limit',':=','100');
