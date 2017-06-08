-- https://sourceforge.net/projects/wnsql/

-- Formerly: n = noun, v = verb, a = adjective, r = adverb, s = adjective satellite
CREATE TYPE word_type AS ENUM ('noun','verb','adjective','adverb','adjective satellite');

-- Formerly: a = attributive, p = predicate, ip = immediately postnominal
CREATE TYPE adjective_position AS ENUM ('attributive','predicate','immediately postnominal');

-- Formerly: words
CREATE TABLE wn_word (
  id int PRIMARY KEY, -- Formerly: wordid
  lemma varchar(80) UNIQUE NOT NULL
);

-- Formerly: casedwords
CREATE TABLE wn_cased_word (
  id int PRIMARY KEY, -- Formerly: casedwordid
  word_id int NOT NULL REFERENCES wn_word ON DELETE CASCADE, -- Formerly: wordid
  cased varchar(80) UNIQUE NOT NULL
);

-- Formerly: lexdomains
CREATE TABLE wn_lexical_domain (
  id smallint PRIMARY KEY, -- Formerly: lexdomainid
  name varchar(32), -- Formerly: lexdomainname
  domain varchar(32), -- Formerly: lexdomain
  word_type word_type -- Formerly: pos
);

-- Formerly: synsets
CREATE TABLE wn_synset (
  id int PRIMARY KEY, -- Formerly: synsetid
  word_type word_type NOT NULL, -- Formerly: pos
  lexical_domain_id smallint NOT NULL REFERENCES wn_lexical_domain, -- Formerly: lexdomainid
  definition text
);

-- Formerly: senses
CREATE TABLE wn_sense (
  word_id int NOT NULL REFERENCES wn_word ON DELETE CASCADE, -- Formerly: wordid
  cased_word_id int REFERENCES wn_cased_word, -- Formerly: casedwordid
  synset_id int NOT NULL REFERENCES wn_synset ON DELETE CASCADE, -- Formerly: synsetid
  -- Removed: senseid
  sense_order smallint NOT NULL, -- Formerly: sensenum
  -- Removed: lexid
  -- Removed: tagcount
  -- Keep the sense key for updating purposes. Having the sense key will make it easier to find word senses in the
  -- updated WordNet database!
  sense_key varchar(100) UNIQUE, -- Formerly: sensekey
  PRIMARY KEY (word_id, synset_id)
);

-- Added: wn_type_of
CREATE TABLE wn_type_of (
  hypernym int NOT NULL REFERENCES wn_synset ON DELETE CASCADE,
  hyponym int NOT NULL REFERENCES wn_synset ON DELETE CASCADE,
  PRIMARY KEY (hypernym, hyponym)
);

-- Added: wn_antonym
CREATE TABLE wn_antonym (
  synset_id_1 int NOT NULL REFERENCES wn_synset ON DELETE CASCADE,
  word_id_1 int NOT NULL REFERENCES wn_word ON DELETE CASCADE,
  synset_id_2 int NOT NULL REFERENCES wn_synset ON DELETE CASCADE,
  word_id_2 int NOT NULL REFERENCES wn_word ON DELETE CASCADE,
  PRIMARY KEY (synset_id_1, word_id_1, synset_id_2, word_id_2),
  FOREIGN KEY (synset_id_1, word_id_1) REFERENCES wn_sense (word_id, synset_id),
  FOREIGN KEY (synset_id_2, word_id_2) REFERENCES wn_sense (word_id, synset_id)
);

-- Removed: linktypes
-- Removed: semlinks
-- Removed: lexlinks
-- Removed: postypes

-- Removed: morphs
-- Removed: morphmaps

-- Formerly: samples
CREATE TABLE wn_sample (
  synset_id int NOT NULL REFERENCES wn_synset ON DELETE CASCADE, -- Formerly: synsetid
  sample_num smallint NOT NULL, -- Formerly: sampleid
  sample text NOT NULL,
  PRIMARY KEY (synset_id, sample_num)
);

-- Removed: vframes
-- Removed: vframesentences
-- Removed: vframemaps
-- Removed: vframesentencemaps

-- Formerly: adjpositions
CREATE TABLE wn_adjective_position (
  synset_id int NOT NULL REFERENCES wn_synset ON DELETE CASCADE, -- Formerly: synsetid
  word_id int NOT NULL REFERENCES wn_word ON DELETE CASCADE, -- Formerly: wordid
  position adjective_position NOT NULL,
  PRIMARY KEY (synset_id, word_id)
);

-- Removed: adjpositiontypes
