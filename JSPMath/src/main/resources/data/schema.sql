/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  karmesi
 * Created: 29 jun 2020
 */

/* CREATE USER 'netbeans'@'%' IDENTIFIED BY 'NetBeans_4444'; */

create table users (
    user_id int AUTO_INCREMENT not null,
    user_name varchar(100) not null unique,
    user_pass varchar(100) not null,
    primary key(user_id)
);

create table math (
    record_id int AUTO_INCREMENT not null,
    base double not null,
    altura double not null,
    area double not null,
    perimetro double not null,
    user_id int,
    foreign key (user_id) references users(user_id),
    primary key(record_id)
);