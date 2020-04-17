drop table SBoard cascade constraints;
drop sequence SBoard_seq;

create sequence SBoard_seq;

create table SBoard(
  no number not null primary key,
  title varchar2(500),
  content varchar2(2000),
  writer varchar2(50),
  writeDate Date default sysdate,
  hit number default 0,
  pw number
 );

commit;

insert into SBoard(no, title, content, writer, writeDate, hit, pw)
values (SBoard_seq.nextval, '오라클에서 넣은..', 'sql developer에서 넣은 첫번째 글입니다', '송인준', sysdate, 0, 1234);

insert into SBoard(no, title, content, writer, writeDate, hit, pw)
values (SBoard_seq.nextval, '오라클에서 넣은..2', 'sql developer에서 넣은 두번째 글입니다', '송인준', sysdate, 0, 1234);

commit;