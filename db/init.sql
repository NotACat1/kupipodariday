--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: migrations; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    "timestamp" bigint NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.migrations OWNER TO student;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO student;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: offer; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.offer (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    amount numeric(10,2) NOT NULL,
    hidden boolean DEFAULT false NOT NULL,
    "userId" integer,
    "itemId" integer
);


ALTER TABLE public.offer OWNER TO student;

--
-- Name: offer_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE public.offer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.offer_id_seq OWNER TO student;

--
-- Name: offer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE public.offer_id_seq OWNED BY public.offer.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    username character varying NOT NULL,
    about character varying DEFAULT 'Пока ничего не рассказал о себе'::character varying NOT NULL,
    avatar character varying DEFAULT 'https://i.pravatar.cc/300'::character varying NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL
);


ALTER TABLE public."user" OWNER TO student;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_id_seq OWNER TO student;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: wish; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.wish (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    name character varying NOT NULL,
    link character varying,
    image character varying,
    price numeric(10,2) NOT NULL,
    raised numeric(10,2) DEFAULT '0'::numeric NOT NULL,
    description character varying NOT NULL,
    copied integer DEFAULT 0 NOT NULL,
    "ownerId" integer,
    "originalWishId" integer
);


ALTER TABLE public.wish OWNER TO student;

--
-- Name: wish_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE public.wish_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wish_id_seq OWNER TO student;

--
-- Name: wish_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE public.wish_id_seq OWNED BY public.wish.id;


--
-- Name: wishlist; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.wishlist (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    name character varying NOT NULL,
    description character varying,
    image character varying,
    "ownerId" integer
);


ALTER TABLE public.wishlist OWNER TO student;

--
-- Name: wishlist_id_seq; Type: SEQUENCE; Schema: public; Owner: student
--

CREATE SEQUENCE public.wishlist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wishlist_id_seq OWNER TO student;

--
-- Name: wishlist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student
--

ALTER SEQUENCE public.wishlist_id_seq OWNED BY public.wishlist.id;


--
-- Name: wishlist_items_wish; Type: TABLE; Schema: public; Owner: student
--

CREATE TABLE public.wishlist_items_wish (
    "wishlistId" integer NOT NULL,
    "wishId" integer NOT NULL
);


ALTER TABLE public.wishlist_items_wish OWNER TO student;

--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: offer id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.offer ALTER COLUMN id SET DEFAULT nextval('public.offer_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Name: wish id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.wish ALTER COLUMN id SET DEFAULT nextval('public.wish_id_seq'::regclass);


--
-- Name: wishlist id; Type: DEFAULT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.wishlist ALTER COLUMN id SET DEFAULT nextval('public.wishlist_id_seq'::regclass);


--
-- Name: offer PK_57c6ae1abe49201919ef68de900; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.offer
    ADD CONSTRAINT "PK_57c6ae1abe49201919ef68de900" PRIMARY KEY (id);


--
-- Name: wishlist PK_620bff4a240d66c357b5d820eaa; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT "PK_620bff4a240d66c357b5d820eaa" PRIMARY KEY (id);


--
-- Name: migrations PK_8c82d7f526340ab734260ea46be; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT "PK_8c82d7f526340ab734260ea46be" PRIMARY KEY (id);


--
-- Name: wishlist_items_wish PK_bf04498b7fc0b487b15d3b62db0; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.wishlist_items_wish
    ADD CONSTRAINT "PK_bf04498b7fc0b487b15d3b62db0" PRIMARY KEY ("wishlistId", "wishId");


--
-- Name: user PK_cace4a159ff9f2512dd42373760; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "PK_cace4a159ff9f2512dd42373760" PRIMARY KEY (id);


--
-- Name: wish PK_e338d8f62014703650439326d3a; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.wish
    ADD CONSTRAINT "PK_e338d8f62014703650439326d3a" PRIMARY KEY (id);


--
-- Name: user UQ_78a916df40e02a9deb1c4b75edb; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "UQ_78a916df40e02a9deb1c4b75edb" UNIQUE (username);


--
-- Name: user UQ_e12875dfb3b1d92d7d7c5377e22; Type: CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "UQ_e12875dfb3b1d92d7d7c5377e22" UNIQUE (email);


--
-- Name: IDX_20a447bbd8b2e0c58b420300d4; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX "IDX_20a447bbd8b2e0c58b420300d4" ON public.wishlist_items_wish USING btree ("wishId");


--
-- Name: IDX_e686abff4343ad90ca53a7fc12; Type: INDEX; Schema: public; Owner: student
--

CREATE INDEX "IDX_e686abff4343ad90ca53a7fc12" ON public.wishlist_items_wish USING btree ("wishlistId");


--
-- Name: wishlist_items_wish FK_20a447bbd8b2e0c58b420300d4d; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.wishlist_items_wish
    ADD CONSTRAINT "FK_20a447bbd8b2e0c58b420300d4d" FOREIGN KEY ("wishId") REFERENCES public.wish(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: offer FK_40199af67b763fc3ecc5a0d44e0; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.offer
    ADD CONSTRAINT "FK_40199af67b763fc3ecc5a0d44e0" FOREIGN KEY ("itemId") REFERENCES public.wish(id);


--
-- Name: wishlist FK_acf92a9b67b36657847695751ba; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT "FK_acf92a9b67b36657847695751ba" FOREIGN KEY ("ownerId") REFERENCES public."user"(id) ON DELETE CASCADE;


--
-- Name: wish FK_b2b6713bbc7b397614210ecd0e1; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.wish
    ADD CONSTRAINT "FK_b2b6713bbc7b397614210ecd0e1" FOREIGN KEY ("originalWishId") REFERENCES public.wish(id);


--
-- Name: wish FK_d976be560c304e5396c50bd72c4; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.wish
    ADD CONSTRAINT "FK_d976be560c304e5396c50bd72c4" FOREIGN KEY ("ownerId") REFERENCES public."user"(id) ON DELETE CASCADE;


--
-- Name: wishlist_items_wish FK_e686abff4343ad90ca53a7fc122; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.wishlist_items_wish
    ADD CONSTRAINT "FK_e686abff4343ad90ca53a7fc122" FOREIGN KEY ("wishlistId") REFERENCES public.wishlist(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: offer FK_e8100751be1076656606ae045e3; Type: FK CONSTRAINT; Schema: public; Owner: student
--

ALTER TABLE ONLY public.offer
    ADD CONSTRAINT "FK_e8100751be1076656606ae045e3" FOREIGN KEY ("userId") REFERENCES public."user"(id);


--
-- PostgreSQL database dump complete
--

