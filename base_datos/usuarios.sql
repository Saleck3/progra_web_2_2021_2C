CREATE TABLE IF NOT EXISTS usuario(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(50),
    mail varchar(50) unique,
    password varchar(32),
    rol varchar(10)
);

insert into usuario 
	(nombre, mail,password,rol) values
    ("admin", "admin@example.com", MD5("admin"),"admin")
;
    
select * from usuario;