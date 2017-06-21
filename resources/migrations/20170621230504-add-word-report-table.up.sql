CREATE TYPE word_report_reason AS ENUM (
  'too specific' -- The word is not a general term but a specific instance, e.g. a single person, a well-known place, a famous building...
);

CREATE TABLE word_report (
  word_id int NOT NULL REFERENCES wn_word ON DELETE CASCADE,
  reason word_report_reason NOT NULL,
  date time NOT NULL
);
