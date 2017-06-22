CREATE TABLE account (
  id bigserial PRIMARY KEY,
  name varchar(100) UNIQUE NOT NULL,
  email varchar(100) UNIQUE NOT NULL,
  password varchar(300) NOT NULL,
  last_login time
);
