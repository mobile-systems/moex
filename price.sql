CREATE OR REPLACE FUNCTION sber.price(
	yr integer,
	mr integer,
	dr integer,
	near varchar)
    RETURNS TABLE(datetrade date, price double precision)
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$
	DECLARE
		neartable varchar := CONCAT('m202402', dr);
		datefrom date := CONCAT(dR, '-', mr, '-', yr);
	BEGIN
	RETURN QUERY EXECUTE format('SELECT	h4.datetrade AS datetrade, 
						h4.price AS price
				FROM	%I.%I AS h4
				WHERE	h4.dateid = %L
					AND h4.stockcode = %L
					AND h4.direction = %L
				ORDER BY price ASC LIMIT 1', 'sber', neartable, datefrom, near, 'BUY');
	END;
$BODY$;

ALTER FUNCTION sber.price(integer, integer, integer, varchar)
    OWNER TO quik;
