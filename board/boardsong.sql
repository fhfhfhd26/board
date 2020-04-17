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
values (SBoard_seq.nextval, '����Ŭ���� ����..', 'sql developer���� ���� ù��° ���Դϴ�', '������', sysdate, 0, 1234);

insert into SBoard(no, title, content, writer, writeDate, hit, pw)
values (SBoard_seq.nextval, '����Ŭ���� ����..2', 'sql developer���� ���� �ι�° ���Դϴ�', '������', sysdate, 0, 1234);

commit;