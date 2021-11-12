CREATE OR REPLACE FUNCTION unlockpa.insert_domande_nuovo_comune()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
		begin
			INSERT into risposte (id_comune, id_domanda, risposta, validato, domanda, categoria)
			select new.id, id, case when trim(risposta_default) is null then 
								    (select z.risposta_default from risposte_zona z   
		                            where z.id_zona = (select fk_zona from comuni where id = new.id) and 
		                            z.id_domanda = d.id)
		                        	when trim(risposta_default) is not null then 
		                           (select z.risposta_default from domande z where z.id = d.id)
                   end as risposta_default,
                   false, domanda, 
           		   (select categoria from categorie c where c.id = d.fk_categoria) as categoria 
                   from domande d;
            return null;
		end;
	$function$
;

CREATE OR REPLACE FUNCTION unlockpa.trg_update_zona_comune()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
BEGIN
   IF OLD.fk_zona <> NEW.fk_zona THEN
	UPDATE risposte 
	set risposta = sub.risposta_default
	from 
	(
		select risposta_default, id_domanda, comuni.id as id_comune from risposte_zona
		join comuni on comuni.fk_zona = id_zona
	) sub
	WHERE 
	risposte.id_comune = old.id
	and sub.id_domanda=risposte.id_domanda
	and sub.id_comune = risposte.id_comune;
   END IF;
   RETURN NEW;
END
$function$
;
CREATE OR REPLACE FUNCTION unlockpa.trg_insert_risposte_nuova_domanda()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
		begin
			---if new.risposta_default is null then 
				---insert into risposte_zona (id_domanda, id_zona, risposta_default)
				---values(new.id, 1, 'questa è una risposta di prova');
			---end if;
			
			INSERT into risposte (id_comune, id_domanda, risposta, domanda, validato, categoria)
			select 
				c.id,
				new.id,
			 	(select risposta_default from domande where id = new.id) as risposta,
			 	(select domanda from domande where id = new.id) as domanda,
                false,
                (select categoria from categorie where id = new.fk_categoria) as categoria 
                from comuni c;
            return null;
		end;
$function$
;
CREATE OR REPLACE FUNCTION unlockpa.trg_insert_risposte_archivio()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
		begin			
			INSERT into risposte_archivio (id_comune, id_domanda, data_modifica, risposta, domanda, validato, categoria)
			values (
				old.id_comune,
				old.id_domanda,
				now(),
			 	old.risposta,
			 	old.domanda,
			 	old.validato,
                old.categoria);
            IF (TG_OP = 'UPDATE') THEN
		       return new;
		    else
		    	return old;
		    end if;
		end;
$function$
;

create trigger trigger_insert after insert
    on
    unlockpa.comuni for each row execute procedure insert_domande_nuovo_comune();

create trigger tg_update_comune_zona after update
    on
    unlockpa.comuni for each row execute procedure trg_update_zona_comune();

create trigger tg_insert_domande after insert
    on
    unlockpa.domande for each row execute procedure trg_insert_risposte_nuova_domanda();

create trigger tg_insert_risposte_archivio before delete
    or update
        on
        unlockpa.risposte for each row execute procedure trg_insert_risposte_archivio();
