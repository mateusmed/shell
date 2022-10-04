
example:
```
use teste_db;

create table usuarios(
	id int NOT NULL AUTO_INCREMENT primary key,
	key_reference varchar(255) NOT NULL,
	value json);

show tables;

insert into usuarios values(1, 'med', '{"usuario": "med", "password": 123}');

select * from usuarios;
```
