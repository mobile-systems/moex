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
		neartable varchar := CONCAT('sber.m202402', dr);
		datefrom date := CONCAT(dR, '-', mr, '-', yr);
	BEGIN
	RETURN QUERY EXECUTE format('SELECT	h4.datetrade AS datetrade, 
						h4.price AS price
				FROM	%I AS h4
				WHERE	h4.dateid = %I
					AND h4.stockcode = near
					AND h4.direction = %I
				ORDER BY spreadin ASC LIMIT 1', neartable, datefrom, 'BUY');
	END;
$BODY$;

ALTER FUNCTION sber.price(integer, integer, integer, varchar)
    OWNER TO quik;
