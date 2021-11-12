INSERT INTO unlockpa.userlevels(
	userlevelid, userlevelname)
	VALUES (0, 'Default');
INSERT INTO unlockpa.userlevels(
	userlevelid, userlevelname)
	VALUES (-1, 'Administrator');
INSERT INTO unlockpa.userlevels(
	userlevelid, userlevelname)
	VALUES (-2, 'Anonymous');
INSERT INTO unlockpa.userlevels(
	userlevelid, userlevelname)
	VALUES (5, 'operatorecsi');

	
INSERT INTO unlockpa.zone(
	id, zona)
	VALUES (0, 'n.a.');
INSERT INTO unlockpa.zone(
	id, zona)
	VALUES (1, 'gialla');
INSERT INTO unlockpa.zone(
	id, zona)
	VALUES (2, 'arancione');
INSERT INTO unlockpa.zone(
	id, zona)
	VALUES (3, 'rossa');

INSERT INTO userlevelpermissions (userlevelid, tablename, "permission") VALUES(-2, '{57176BE7-E34A-4670-90BB-0D0A95C03E4D}questionario', 0);
INSERT INTO userlevelpermissions (userlevelid, tablename, "permission") VALUES(-2, '{57176BE7-E34A-4670-90BB-0D0A95C03E4D}utenti', 0);
INSERT INTO userlevelpermissions (userlevelid, tablename, "permission") VALUES(-2, '{57176BE7-E34A-4670-90BB-0D0A95C03E4D}userlevelpermissions', 0);
INSERT INTO userlevelpermissions (userlevelid, tablename, "permission") VALUES(-2, '{57176BE7-E34A-4670-90BB-0D0A95C03E4D}userlevels', 0);
INSERT INTO userlevelpermissions (userlevelid, tablename, "permission") VALUES(0, '{57176BE7-E34A-4670-90BB-0D0A95C03E4D}questionario', 44);
INSERT INTO userlevelpermissions (userlevelid, tablename, "permission") VALUES(0, '{57176BE7-E34A-4670-90BB-0D0A95C03E4D}utenti', 0);
INSERT INTO userlevelpermissions (userlevelid, tablename, "permission") VALUES(0, '{57176BE7-E34A-4670-90BB-0D0A95C03E4D}userlevelpermissions', 0);
INSERT INTO userlevelpermissions (userlevelid, tablename, "permission") VALUES(0, '{57176BE7-E34A-4670-90BB-0D0A95C03E4D}userlevels', 0);
INSERT INTO userlevelpermissions (userlevelid, tablename, "permission") VALUES(-2, '{1B294467-F675-48C8-9632-26D78A5119EB}questionario', 0);
INSERT INTO userlevelpermissions (userlevelid, tablename, "permission") VALUES(-2, '{1B294467-F675-48C8-9632-26D78A5119EB}utenti', 0);
INSERT INTO userlevelpermissions (userlevelid, tablename, "permission") VALUES(-2, '{1B294467-F675-48C8-9632-26D78A5119EB}userlevelpermissions', 0);
INSERT INTO userlevelpermissions (userlevelid, tablename, "permission") VALUES(-2, '{1B294467-F675-48C8-9632-26D78A5119EB}userlevels', 0);
INSERT INTO userlevelpermissions (userlevelid, tablename, "permission") VALUES(-2, '{1B294467-F675-48C8-9632-26D78A5119EB}questionario2', 0);
INSERT INTO userlevelpermissions (userlevelid, tablename, "permission") VALUES(-2, '{1B294467-F675-48C8-9632-26D78A5119EB}domande', 0);
INSERT INTO userlevelpermissions (userlevelid, tablename, "permission") VALUES(-2, '{1B294467-F675-48C8-9632-26D78A5119EB}comuni', 0);
INSERT INTO userlevelpermissions (userlevelid, tablename, "permission") VALUES(-2, '{1B294467-F675-48C8-9632-26D78A5119EB}risposte', 0);
INSERT INTO userlevelpermissions (userlevelid, tablename, "permission") VALUES(0, '{1B294467-F675-48C8-9632-26D78A5119EB}questionario', 0);
INSERT INTO userlevelpermissions (userlevelid, tablename, "permission") VALUES(0, '{1B294467-F675-48C8-9632-26D78A5119EB}questionario2', 0);
INSERT INTO userlevelpermissions (userlevelid, tablename, "permission") VALUES(0, '{1B294467-F675-48C8-9632-26D78A5119EB}utenti', 0);
INSERT INTO userlevelpermissions (userlevelid, tablename, "permission") VALUES(0, '{1B294467-F675-48C8-9632-26D78A5119EB}userlevelpermissions', 0);
INSERT INTO userlevelpermissions (userlevelid, tablename, "permission") VALUES(0, '{1B294467-F675-48C8-9632-26D78A5119EB}userlevels', 0);
INSERT INTO userlevelpermissions (userlevelid, tablename, "permission") VALUES(0, '{1B294467-F675-48C8-9632-26D78A5119EB}domande', 0);
INSERT INTO userlevelpermissions (userlevelid, tablename, "permission") VALUES(0, '{1B294467-F675-48C8-9632-26D78A5119EB}comuni', 44);
INSERT INTO userlevelpermissions (userlevelid, tablename, "permission") VALUES(0, '{1B294467-F675-48C8-9632-26D78A5119EB}risposte', 108);
INSERT INTO userlevelpermissions (userlevelid, tablename, "permission") VALUES(0, '{1B294467-F675-48C8-9632-26D78A5119EB}zone', 8);
INSERT INTO userlevelpermissions (userlevelid, tablename, "permission") VALUES(0, '{1B294467-F675-48C8-9632-26D78A5119EB}categorie', 8);
INSERT INTO userlevelpermissions (userlevelid, tablename, "permission") VALUES(0, '{1B294467-F675-48C8-9632-26D78A5119EB}risposte_zona', 0);
INSERT INTO userlevelpermissions (userlevelid, tablename, "permission") VALUES(0, '{1B294467-F675-48C8-9632-26D78A5119EB}bot_instance', 0);
INSERT INTO userlevelpermissions (userlevelid, tablename, "permission") VALUES(0, '{1B294467-F675-48C8-9632-26D78A5119EB}knowledge_base', 0);
INSERT INTO userlevelpermissions (userlevelid, tablename, "permission") VALUES(0, '{1B294467-F675-48C8-9632-26D78A5119EB}bot', 0);
INSERT INTO userlevelpermissions (userlevelid, tablename, "permission") VALUES(0, '{1B294467-F675-48C8-9632-26D78A5119EB}answer_log', 0);
INSERT INTO userlevelpermissions (userlevelid, tablename, "permission") VALUES(5, '{1B294467-F675-48C8-9632-26D78A5119EB}categorie', 127);
INSERT INTO userlevelpermissions (userlevelid, tablename, "permission") VALUES(5, '{1B294467-F675-48C8-9632-26D78A5119EB}risposte_zona', 127);
INSERT INTO userlevelpermissions (userlevelid, tablename, "permission") VALUES(5, '{1B294467-F675-48C8-9632-26D78A5119EB}bot_instance', 0);
INSERT INTO userlevelpermissions (userlevelid, tablename, "permission") VALUES(5, '{1B294467-F675-48C8-9632-26D78A5119EB}knowledge_base', 0);
INSERT INTO userlevelpermissions (userlevelid, tablename, "permission") VALUES(5, '{1B294467-F675-48C8-9632-26D78A5119EB}bot', 0);
INSERT INTO userlevelpermissions (userlevelid, tablename, "permission") VALUES(5, '{1B294467-F675-48C8-9632-26D78A5119EB}answer_log', 104);
INSERT INTO userlevelpermissions (userlevelid, tablename, "permission") VALUES(5, '{1B294467-F675-48C8-9632-26D78A5119EB}audittrail', 104);
INSERT INTO userlevelpermissions (userlevelid, tablename, "permission") VALUES(5, '{1B294467-F675-48C8-9632-26D78A5119EB}utenti', 127);
INSERT INTO userlevelpermissions (userlevelid, tablename, "permission") VALUES(5, '{1B294467-F675-48C8-9632-26D78A5119EB}userlevelpermissions', 104);
INSERT INTO userlevelpermissions (userlevelid, tablename, "permission") VALUES(5, '{1B294467-F675-48C8-9632-26D78A5119EB}userlevels', 104);
INSERT INTO userlevelpermissions (userlevelid, tablename, "permission") VALUES(5, '{1B294467-F675-48C8-9632-26D78A5119EB}domande', 127);
INSERT INTO userlevelpermissions (userlevelid, tablename, "permission") VALUES(5, '{1B294467-F675-48C8-9632-26D78A5119EB}comuni', 127);
INSERT INTO userlevelpermissions (userlevelid, tablename, "permission") VALUES(5, '{1B294467-F675-48C8-9632-26D78A5119EB}risposte', 127);
INSERT INTO userlevelpermissions (userlevelid, tablename, "permission") VALUES(5, '{1B294467-F675-48C8-9632-26D78A5119EB}zone', 127);

