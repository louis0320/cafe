/*
    실제 사용 TABLE 설계 연습
*/
create table new_user (
    id          varchar2(30) primary key,
    password    varchar2(8)  not null,
    name        varchar2(30) not null,
    role        varchar2(5)  default 'user'
);
create table new_guest (
    id          varchar2(30) primary key,
    password    varchar2(8)  
                    constraint n_guest_password_nn not null
                    constraint n_guest_password_chk check(length(password)<15),
    pwd         varchar2(8)  
                    constraint n_guest_pwd_nn not null
                    constraint n_guest_pwd_chk check(length(pwd)<15),
    name        varchar2(30) not null,
    role        varchar2(5)  default 'user'
);
select * from new_guest;
create table pwChk (
    password    varchar2(8)  
                    constraint n_guest_password_nn not null
                    constraint n_guest_password_chk check(length(password)<15),
    pwd         varchar2(8)
                     constraint n_guest_pwd_chk check(password==pwd)
);

create table user_board (
   seq         number(5)       primary key,
   title       varchar2(200)   not null,
   nickname    varchar2(30)    not null,
   content     varchar2(2000)  not null,
   regdate     date            default sysdate,
   cnt         number(5)       default 0,
   userid      varchar2(8)
);
select * from board_user;
select * from new_guest;
select * from user_board;
drop table new_guest;
commit;





















