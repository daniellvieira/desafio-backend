class CreateTrgAttTotalParlamentarian < ActiveRecord::Migration[6.0]
  def change
    execute "
      CREATE OR REPLACE FUNCTION public.trg_att_total_parlamentarian()
        RETURNS trigger
        LANGUAGE 'plpgsql'
        COST 100
        VOLATILE NOT LEAKPROOF
      AS $BODY$

      DECLARE
        old_total double precision;
        new_total double precision;
      BEGIN
        IF TG_OP = 'INSERT' OR TG_OP = 'UPDATE' THEN
          SELECT SUM(e.value)
            INTO new_total
            FROM expenses e
            JOIN parlamentarians p ON p.id = e.parlamentarian_id
            WHERE e.parlamentarian_id = new.parlamentarian_id;
          UPDATE parlamentarians set total = COALESCE(new_total, 0) where id = new.parlamentarian_id;
        END IF;

        IF ( (TG_OP = 'UPDATE' AND new.parlamentarian_id != old.parlamentarian_id) OR TG_OP = 'DELETE') THEN
          SELECT SUM(e.value)
            INTO new_total
            FROM expenses e
            JOIN parlamentarians p ON p.id = e.parlamentarian_id
            WHERE e.parlamentarian_id = old.parlamentarian_id;
          UPDATE parlamentarians set total = COALESCE(new_total, 0) where id = old.parlamentarian_id;
        END IF;

        RETURN null;
      END;
      $BODY$;

      CREATE TRIGGER trg_att_total_parlamentarian
        AFTER INSERT OR UPDATE OR DELETE
        ON public.expenses
        FOR EACH ROW
        EXECUTE PROCEDURE public.trg_att_total_parlamentarian();"
  end
end
