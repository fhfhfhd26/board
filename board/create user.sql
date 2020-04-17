CREATE USER c##song IDENTIFIED BY song;

GRANT CONNECT, RESOURCE TO c##song;

alter user c##song quota 48m on users;

commit;