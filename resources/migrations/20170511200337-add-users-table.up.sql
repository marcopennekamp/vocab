CREATE TABLE users (
  id bigserial PRIMARY KEY,
  name varchar(100),
  email varchar(100),
  password varchar(300),
  last_login time
);
