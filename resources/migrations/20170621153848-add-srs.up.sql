CREATE TYPE srs_level AS ENUM ('seed', 'sapling', 'youth', 'mature');

CREATE TABLE learn_word (
  account_id int NOT NULL REFERENCES account ON DELETE CASCADE,
  word_id int NOT NULL REFERENCES wn_word ON DELETE CASCADE,
  level srs_level NOT NULL,
  due time, -- The due date may be null if the word has been mastered.
  PRIMARY KEY (account_id, word_id)
);

CREATE TABLE community_example (
  account_id int NOT NULL REFERENCES account ON DELETE CASCADE,
  word_id int NOT NULL REFERENCES wn_word ON DELETE CASCADE,
  synset_id int NOT NULL REFERENCES wn_synset ON DELETE CASCADE,
  example text NOT NULL,
  votes int NOT NULL, -- Community examples are voted up or down by the community.
  PRIMARY KEY (account_id, word_id, synset_id)
);
