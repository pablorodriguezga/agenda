PGDMP     5    ;                {           agenda    15.3    15.3                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16398    agenda    DATABASE     y   CREATE DATABASE agenda WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE agenda;
                postgres    false            �            1259    16399    contacto_id_seq    SEQUENCE     x   CREATE SEQUENCE public.contacto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.contacto_id_seq;
       public          postgres    false            �            1259    16400    contacto    TABLE     �  CREATE TABLE public.contacto (
    id integer DEFAULT nextval('public.contacto_id_seq'::regclass) NOT NULL,
    nombre character varying(100) NOT NULL,
    apellidos character varying(200) NOT NULL,
    direccion character varying(200) NOT NULL,
    email character varying(100) NOT NULL,
    telefono character varying(100) NOT NULL,
    "fechaCreacion" timestamp without time zone NOT NULL
);
    DROP TABLE public.contacto;
       public         heap    postgres    false    214            �            1259    16406    pertenece_id_seq    SEQUENCE     y   CREATE SEQUENCE public.pertenece_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.pertenece_id_seq;
       public          postgres    false            �            1259    16407 	   pertenece    TABLE     �   CREATE TABLE public.pertenece (
    id integer DEFAULT nextval('public.pertenece_id_seq'::regclass) NOT NULL,
    id_usuario smallint NOT NULL,
    id_contacto smallint NOT NULL
);
    DROP TABLE public.pertenece;
       public         heap    postgres    false    216            �            1259    16444    roles_id_seq    SEQUENCE     u   CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public          postgres    false            �            1259    16435    roles    TABLE     �   CREATE TABLE public.roles (
    id integer DEFAULT nextval('public.roles_id_seq'::regclass) NOT NULL,
    rol character varying(20) NOT NULL
);
    DROP TABLE public.roles;
       public         heap    postgres    false    221            �            1259    16411    usuario    TABLE        CREATE TABLE public.usuario (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    apellidos character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL,
    id_rol integer
);
    DROP TABLE public.usuario;
       public         heap    postgres    false            �            1259    16414    usuario_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.usuario_id_seq;
       public          postgres    false    218                       0    0    usuario_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;
          public          postgres    false    219            v           2604    16415 
   usuario id    DEFAULT     h   ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);
 9   ALTER TABLE public.usuario ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218                      0    16400    contacto 
   TABLE DATA           f   COPY public.contacto (id, nombre, apellidos, direccion, email, telefono, "fechaCreacion") FROM stdin;
    public          postgres    false    215   �                 0    16407 	   pertenece 
   TABLE DATA           @   COPY public.pertenece (id, id_usuario, id_contacto) FROM stdin;
    public          postgres    false    217   �!                 0    16435    roles 
   TABLE DATA           (   COPY public.roles (id, rol) FROM stdin;
    public          postgres    false    220   �!                 0    16411    usuario 
   TABLE DATA           Q   COPY public.usuario (id, nombre, apellidos, email, password, id_rol) FROM stdin;
    public          postgres    false    218   "                   0    0    contacto_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.contacto_id_seq', 33, true);
          public          postgres    false    214            !           0    0    pertenece_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.pertenece_id_seq', 30, true);
          public          postgres    false    216            "           0    0    roles_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.roles_id_seq', 2, true);
          public          postgres    false    221            #           0    0    usuario_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.usuario_id_seq', 8, true);
          public          postgres    false    219            y           2606    16417    contacto contacto_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.contacto
    ADD CONSTRAINT contacto_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.contacto DROP CONSTRAINT contacto_pkey;
       public            postgres    false    215            {           2606    16419    pertenece pertenece_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.pertenece
    ADD CONSTRAINT pertenece_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.pertenece DROP CONSTRAINT pertenece_pkey;
       public            postgres    false    217                       2606    16443    roles rol_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT rol_pkey PRIMARY KEY (id) INCLUDE (id);
 8   ALTER TABLE ONLY public.roles DROP CONSTRAINT rol_pkey;
       public            postgres    false    220            }           2606    16421    usuario usuario_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public            postgres    false    218            �           2606    16422    pertenece fk_contacto    FK CONSTRAINT     {   ALTER TABLE ONLY public.pertenece
    ADD CONSTRAINT fk_contacto FOREIGN KEY (id_contacto) REFERENCES public.contacto(id);
 ?   ALTER TABLE ONLY public.pertenece DROP CONSTRAINT fk_contacto;
       public          postgres    false    215    3193    217            �           2606    16446    usuario fk_id_rol    FK CONSTRAINT     o   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT fk_id_rol FOREIGN KEY (id_rol) REFERENCES public.roles(id);
 ;   ALTER TABLE ONLY public.usuario DROP CONSTRAINT fk_id_rol;
       public          postgres    false    220    3199    218            �           2606    16427    pertenece fk_usuario    FK CONSTRAINT     x   ALTER TABLE ONLY public.pertenece
    ADD CONSTRAINT fk_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);
 >   ALTER TABLE ONLY public.pertenece DROP CONSTRAINT fk_usuario;
       public          postgres    false    218    217    3197               �  x�}��n�0���S��x$EYS	P�@a���2���H��3�m2v�ԭc�b=)b/8�G����;��x�w��a�'X|�S�Q�R������5m^�
k��ݠ�%$V����Jڂ(Ӱ�����ާ0���+��|VBw���Ό$B�ߨt��8Q3*`�&���P��
��J_%��)������2�22�$�*2*a�-l��M���{a!q��).�F#J��@+������IK4�)��KM`�O۱���r��������Q<�T�%�1�ڱV7}�L^Y����PK�<b`3֬T?����s.�Mr�6&�u��c�\8�.pG�KB$eKT��|���%C��M��m>�ඣ��'W��([\�OB��r5(3�`1��]�����g�W�v>�/��|܍�S?O�WcR�R[5)0��r/+��bn$�Zg?�,�����?         5   x���� C���b|$A�^���̬�D����-|�~���"��J�.��         #   x�3�LL����2���/�M̉/-N-����� t��         k   x�3���L/M���O)��8s�鹉�9z�����F�&��\f�����Eɇ�&�9��,8��3���<teF\&�9��Ŝ%������ũE騪� �*F��� �H2�     