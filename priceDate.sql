-- FUNCTION: sber.price(date, character varying) -- 2024-04-01
-- DROP FUNCTION IF EXISTS sber.price(date, character varying);
CREATE OR REPLACE FUNCTION sber.price(
	datefrom date,
	ticker character varying)
    RETURNS TABLE(datetrade date, price double precision) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$
DECLARE
--	neartable varchar := CONCAT('m', LEFT( datefrom::text, 2), SUBSTR(datefrom::text, 4, 2), RIGHT(datefrom::text, 4);
	neartable varchar := CONCAT('m', LEFT( datefrom::text, 4), SUBSTR(datefrom::text, 6, 2), RIGHT(datefrom::text, 2));
BEGIN
RETURN QUERY EXECUTE format('SELECT	h4.datetrade AS datetrade, 
					h4.price AS price
				FROM	%I.%I AS h4
				WHERE	h4.dateid = %L
					AND h4.stockcode = %L
					AND h4.direction = %L
				ORDER BY price ASC LIMIT 1', 'sber', neartable, datefrom, ticker, 'BUY');
END;
$BODY$;

ALTER FUNCTION sber.price(date, character varying)
    OWNER TO quik;
