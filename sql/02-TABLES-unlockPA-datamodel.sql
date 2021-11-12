CREATE TABLE bot (
id SERIAL PRIMARY KEY,
description text,
ts_creation timestamp,
bot_version integer,
is_lsa_sim boolean,
is_cluster boolean,
n_cluster integer,
n_topics integer,
confidence_tfidf real,
wordvec_path text ,
num_algo smallint,
confidence_lsa real,
confidence_wv real
);


CREATE TABLE stopwords (
id SERIAL PRIMARY KEY,
ts_creation timestamp,
stopword varchar(50),
to_keep boolean,
id_bot integer REFERENCES bot(id) ON DELETE CASCADE
);

CREATE TABLE compound_words (
id SERIAL PRIMARY KEY,
ts_creation timestamp,
compound_word varchar(50),
base_token varchar(50),
id_bot integer REFERENCES bot(id) ON DELETE CASCADE
);

CREATE TABLE synonym_words (
id SERIAL PRIMARY KEY,
ts_creation timestamp,
synonym_word varchar(50),
base_token varchar(50),
id_bot integer REFERENCES bot(id) ON DELETE CASCADE
);

CREATE TABLE bot_instance (
id SERIAL PRIMARY KEY,
description text,
ts_creation timestamp,
ts_stop timestamp,
host varchar(64),
port SMALLINT,
status SMALLINT,
id_bot integer REFERENCES bot(id) ON DELETE CASCADE
);

CREATE TABLE knowledge_base (
id SERIAL PRIMARY KEY,
ts_creation timestamp,
question_type varchar(50),
question_number varchar(10),
question text,
answer text,
note text,
id_bot integer REFERENCES bot(id) ON DELETE CASCADE
);

CREATE TABLE answer_log (
id SERIAL PRIMARY KEY,
ts_creation timestamp,
user_query text,
confidence real,
id_kb integer,
id_bot_instance integer REFERENCES bot_instance(id) ON DELETE NO ACTION, 
answer varchar,
id_tenant integer
);

CREATE TABLE algo_definition (
id SERIAL PRIMARY KEY,
num_algo smallint,
des_algo text);

insert into algo_definition(num_algo,des_algo) values (1,'Approccio similarity a livello di TF-IDF o LSA, con o senza Cluster k-mean'),
(2,'Approccio word2vec'),
(3,'Ensemble di algoritmi: similarity per tf-idf, similarity per LSA, word2vec');

commit;
