-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://github.com/pgadmin-org/pgadmin4/issues/new/choose if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public.categorias
(
    id_categoria serial NOT NULL,
    nombre_categoria character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT categorias_pkey PRIMARY KEY (id_categoria)
);

CREATE TABLE IF NOT EXISTS public.comentarios
(
    id_comentario serial NOT NULL,
    contenido_comentario character varying(100) COLLATE pg_catalog."default" NOT NULL,
    fecha_comentario timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    id_publicacion integer,
    id_usuario integer,
    CONSTRAINT comentarios_pkey PRIMARY KEY (id_comentario)
);

CREATE TABLE IF NOT EXISTS public.publicaciones
(
    id_publicacion serial NOT NULL,
    titulo_publicacion character varying(100) COLLATE pg_catalog."default" NOT NULL,
    contenido_publicacion character varying(900) COLLATE pg_catalog."default",
    fecha_publicacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    id_usuario integer,
    id_categoria integer,
    CONSTRAINT publicaciones_pkey PRIMARY KEY (id_publicacion)
);

CREATE TABLE IF NOT EXISTS public.usuarios
(
    id_usuario serial NOT NULL,
    nombre_usuario character varying(100) COLLATE pg_catalog."default" NOT NULL,
    password_usuario character varying(100) COLLATE pg_catalog."default" NOT NULL,
    email_usuario character varying(100) COLLATE pg_catalog."default" NOT NULL,
    fecharegistro_usuario timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario),
    CONSTRAINT usuarios_email_usuario_key UNIQUE (email_usuario)
);

ALTER TABLE IF EXISTS public.comentarios
    ADD CONSTRAINT id_publicacion FOREIGN KEY (id_publicacion)
    REFERENCES public.publicaciones (id_publicacion) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.comentarios
    ADD CONSTRAINT id_usuario FOREIGN KEY (id_usuario)
    REFERENCES public.usuarios (id_usuario) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.publicaciones
    ADD CONSTRAINT id_categoria FOREIGN KEY (id_categoria)
    REFERENCES public.categorias (id_categoria) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.publicaciones
    ADD CONSTRAINT id_usuario FOREIGN KEY (id_usuario)
    REFERENCES public.usuarios (id_usuario) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;