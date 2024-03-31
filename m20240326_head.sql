-- Name: m20240326; Type: TABLE; Schema: sber; Owner: quik
--

CREATE TABLE sber.m20240326 (
    id bigint NOT NULL,
    orderid bigint,
    datetrade date,
    dateid date,
    timeid time without time zone,
    stockcode text,
    price double precision,
    count bigint,
    volume double precision,
    oi double precision,
    direction text
);


ALTER TABLE sber.m20240326 OWNER TO quik;

--
-- TOC entry 209 (class 1259 OID 16433)
-- Name: m20240326_id_seq; Type: SEQUENCE; Schema: sber; Owner: quik
--

CREATE SEQUENCE sber.m20240326_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sber.m20240326_id_seq OWNER TO quik;

--
-- TOC entry 2969 (class 0 OID 0)
-- Dependencies: 209
-- Name: m20240326_id_seq; Type: SEQUENCE OWNED BY; Schema: sber; Owner: quik
--

ALTER SEQUENCE sber.m20240326_id_seq OWNED BY sber.m20240326.id;


--
-- TOC entry 2838 (class 2604 OID 16456)
-- Name: m20240326 id; Type: DEFAULT; Schema: sber; Owner: quik
--

ALTER TABLE ONLY sber.m20240326 ALTER COLUMN id SET DEFAULT nextval('sber.m20240326_id_seq'::regclass);


-- Name: m20240326 m20240326_pkey; Type: CONSTRAINT; Schema: sber; Owner: quik
--

ALTER TABLE ONLY sber.m20240326
    ADD CONSTRAINT m20240326_pkey PRIMARY KEY (id);
