/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

create table User (
    idUser int AUTO_INCREMENT not null,
    username varchar(12) not null unique,
    password varchar(20) not null,
    firstName varchar(50) not null,
    middleName varchar(50),
    lastName varchar(50) not null,
    height float not null,
    weight float not null,
    gender varchar(10) not null,
    age int not null,
    primary key (idUser)
);

create table BMI (
    idBMI int AUTO_INCREMENT not null,
    dateTake varchar(50) not null,
    rangeBMI float not null,
    height float not null,
    weight float not null,
    age int not null,
    idUser int,
    foreign key(idUser) references User(idUser),
    primary key(idBMI)
);
