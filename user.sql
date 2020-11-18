-- util1 util2 util13
GRANT ALL PRIVILEGES ON  hotel.* TO 'util1'@'%' IDENTIFIED BY 'util1';
GRANT select  ON TABLE `hotel`.* TO 'util2'@'%' IDENTIFIED BY 'util2';
GRANT SHOW VIEW ON TABLE `hotel`.`station` TO 'util3'@'%' IDENTIFIED BY 'util3';


