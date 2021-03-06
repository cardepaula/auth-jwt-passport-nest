PGDMP                         x            freela    12.1     12.1 (Ubuntu 12.1-1.pgdg18.04+1) 0    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16384    freela    DATABASE     v   CREATE DATABASE freela WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';
    DROP DATABASE freela;
                admin    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                admin    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   admin    false    3            �           1247    16427    admin_status_enum    TYPE     n   CREATE TYPE public.admin_status_enum AS ENUM (
    'pendent',
    'active',
    'suspended',
    'deleted'
);
 $   DROP TYPE public.admin_status_enum;
       public          admin    false    3            �            1259    16437    admin    TABLE     �  CREATE TABLE public.admin (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    name character varying NOT NULL,
    "playerId" character varying DEFAULT 'UNKNOWN PLAYER ID'::character varying NOT NULL,
    "birthDay" date NOT NULL,
    email character varying NOT NULL,
    cpf character varying NOT NULL,
    phone character varying NOT NULL,
    "passwordHash" character varying NOT NULL,
    status public.admin_status_enum DEFAULT 'pendent'::public.admin_status_enum NOT NULL,
    "profilePicturePath" character varying,
    "emailVerificationCode" character varying,
    role_id integer
);
    DROP TABLE public.admin;
       public         heap    admin    false    644    644    3            �            1259    16435    admin_id_seq    SEQUENCE     �   CREATE SEQUENCE public.admin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.admin_id_seq;
       public          admin    false    209    3            �           0    0    admin_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.admin_id_seq OWNED BY public.admin.id;
          public          admin    false    208            �            1259    16387    log    TABLE     �  CREATE TABLE public.log (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    endpoint character varying NOT NULL,
    response integer NOT NULL,
    body character varying,
    params character varying,
    "userId" integer,
    "accountType" character varying,
    ip character varying,
    method character varying NOT NULL,
    "userAgent" character varying
);
    DROP TABLE public.log;
       public         heap    admin    false    3            �            1259    16385 
   log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE public.log_id_seq;
       public          admin    false    203    3            �           0    0 
   log_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE public.log_id_seq OWNED BY public.log.id;
          public          admin    false    202            �            1259    16400 
   permission    TABLE       CREATE TABLE public.permission (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    operation character varying NOT NULL,
    feature character varying NOT NULL
);
    DROP TABLE public.permission;
       public         heap    admin    false    3            �            1259    16398    permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.permission_id_seq;
       public          admin    false    3    205            �           0    0    permission_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.permission_id_seq OWNED BY public.permission.id;
          public          admin    false    204            �            1259    16414    role    TABLE     �   CREATE TABLE public.role (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    name character varying NOT NULL,
    description text
);
    DROP TABLE public.role;
       public         heap    admin    false    3            �            1259    16412    role_id_seq    SEQUENCE     �   CREATE SEQUENCE public.role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.role_id_seq;
       public          admin    false    3    207            �           0    0    role_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;
          public          admin    false    206            �            1259    16453    roles_permissions    TABLE     l   CREATE TABLE public.roles_permissions (
    role_id integer NOT NULL,
    permission_id integer NOT NULL
);
 %   DROP TABLE public.roles_permissions;
       public         heap    admin    false    3                       2604    16440    admin id    DEFAULT     d   ALTER TABLE ONLY public.admin ALTER COLUMN id SET DEFAULT nextval('public.admin_id_seq'::regclass);
 7   ALTER TABLE public.admin ALTER COLUMN id DROP DEFAULT;
       public          admin    false    208    209    209                       2604    16390    log id    DEFAULT     `   ALTER TABLE ONLY public.log ALTER COLUMN id SET DEFAULT nextval('public.log_id_seq'::regclass);
 5   ALTER TABLE public.log ALTER COLUMN id DROP DEFAULT;
       public          admin    false    202    203    203                       2604    16403    permission id    DEFAULT     n   ALTER TABLE ONLY public.permission ALTER COLUMN id SET DEFAULT nextval('public.permission_id_seq'::regclass);
 <   ALTER TABLE public.permission ALTER COLUMN id DROP DEFAULT;
       public          admin    false    204    205    205                       2604    16417    role id    DEFAULT     b   ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);
 6   ALTER TABLE public.role ALTER COLUMN id DROP DEFAULT;
       public          admin    false    206    207    207            �          0    16437    admin 
   TABLE DATA           �   COPY public.admin (id, "createdAt", "updatedAt", name, "playerId", "birthDay", email, cpf, phone, "passwordHash", status, "profilePicturePath", "emailVerificationCode", role_id) FROM stdin;
    public          admin    false    209            �          0    16387    log 
   TABLE DATA           �   COPY public.log (id, "createdAt", "updatedAt", endpoint, response, body, params, "userId", "accountType", ip, method, "userAgent") FROM stdin;
    public          admin    false    203            �          0    16400 
   permission 
   TABLE DATA           V   COPY public.permission (id, "createdAt", "updatedAt", operation, feature) FROM stdin;
    public          admin    false    205            �          0    16414    role 
   TABLE DATA           O   COPY public.role (id, "createdAt", "updatedAt", name, description) FROM stdin;
    public          admin    false    207            �          0    16453    roles_permissions 
   TABLE DATA           C   COPY public.roles_permissions (role_id, permission_id) FROM stdin;
    public          admin    false    210            �           0    0    admin_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.admin_id_seq', 6, true);
          public          admin    false    208            �           0    0 
   log_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.log_id_seq', 58, true);
          public          admin    false    202            �           0    0    permission_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.permission_id_seq', 16, true);
          public          admin    false    204            �           0    0    role_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.role_id_seq', 1, true);
          public          admin    false    206            #           2606    16457 0   roles_permissions PK_0cd11f0b35c4d348c6ebb9b36b7 
   CONSTRAINT     �   ALTER TABLE ONLY public.roles_permissions
    ADD CONSTRAINT "PK_0cd11f0b35c4d348c6ebb9b36b7" PRIMARY KEY (role_id, permission_id);
 \   ALTER TABLE ONLY public.roles_permissions DROP CONSTRAINT "PK_0cd11f0b35c4d348c6ebb9b36b7";
       public            admin    false    210    210                       2606    16397 "   log PK_350604cbdf991d5930d9e618fbd 
   CONSTRAINT     b   ALTER TABLE ONLY public.log
    ADD CONSTRAINT "PK_350604cbdf991d5930d9e618fbd" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.log DROP CONSTRAINT "PK_350604cbdf991d5930d9e618fbd";
       public            admin    false    203                       2606    16410 )   permission PK_3b8b97af9d9d8807e41e6f48362 
   CONSTRAINT     i   ALTER TABLE ONLY public.permission
    ADD CONSTRAINT "PK_3b8b97af9d9d8807e41e6f48362" PRIMARY KEY (id);
 U   ALTER TABLE ONLY public.permission DROP CONSTRAINT "PK_3b8b97af9d9d8807e41e6f48362";
       public            admin    false    205                       2606    16424 #   role PK_b36bcfe02fc8de3c57a8b2391c2 
   CONSTRAINT     c   ALTER TABLE ONLY public.role
    ADD CONSTRAINT "PK_b36bcfe02fc8de3c57a8b2391c2" PRIMARY KEY (id);
 O   ALTER TABLE ONLY public.role DROP CONSTRAINT "PK_b36bcfe02fc8de3c57a8b2391c2";
       public            admin    false    207                       2606    16449 $   admin PK_e032310bcef831fb83101899b10 
   CONSTRAINT     d   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT "PK_e032310bcef831fb83101899b10" PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.admin DROP CONSTRAINT "PK_e032310bcef831fb83101899b10";
       public            admin    false    209                       1259    16451    IDX_15329fb789ccfd5b452bd700a3    INDEX     X   CREATE UNIQUE INDEX "IDX_15329fb789ccfd5b452bd700a3" ON public.admin USING btree (cpf);
 4   DROP INDEX public."IDX_15329fb789ccfd5b452bd700a3";
       public            admin    false    209                       1259    16411    IDX_19e644a7fe5ac24c89f3e52dcd    INDEX     l   CREATE UNIQUE INDEX "IDX_19e644a7fe5ac24c89f3e52dcd" ON public.permission USING btree (operation, feature);
 4   DROP INDEX public."IDX_19e644a7fe5ac24c89f3e52dcd";
       public            admin    false    205    205                        1259    16459    IDX_337aa8dba227a1fe6b73998307    INDEX     g   CREATE INDEX "IDX_337aa8dba227a1fe6b73998307" ON public.roles_permissions USING btree (permission_id);
 4   DROP INDEX public."IDX_337aa8dba227a1fe6b73998307";
       public            admin    false    210                       1259    16452    IDX_605f773f0197434dd12ab65277    INDEX     Z   CREATE UNIQUE INDEX "IDX_605f773f0197434dd12ab65277" ON public.admin USING btree (phone);
 4   DROP INDEX public."IDX_605f773f0197434dd12ab65277";
       public            admin    false    209            !           1259    16458    IDX_7d2dad9f14eddeb09c256fea71    INDEX     a   CREATE INDEX "IDX_7d2dad9f14eddeb09c256fea71" ON public.roles_permissions USING btree (role_id);
 4   DROP INDEX public."IDX_7d2dad9f14eddeb09c256fea71";
       public            admin    false    210                       1259    16425    IDX_ae4578dcaed5adff96595e6166    INDEX     X   CREATE UNIQUE INDEX "IDX_ae4578dcaed5adff96595e6166" ON public.role USING btree (name);
 4   DROP INDEX public."IDX_ae4578dcaed5adff96595e6166";
       public            admin    false    207                       1259    16450    IDX_de87485f6489f5d0995f584195    INDEX     Z   CREATE UNIQUE INDEX "IDX_de87485f6489f5d0995f584195" ON public.admin USING btree (email);
 4   DROP INDEX public."IDX_de87485f6489f5d0995f584195";
       public            admin    false    209            &           2606    16470 0   roles_permissions FK_337aa8dba227a1fe6b73998307b    FK CONSTRAINT     �   ALTER TABLE ONLY public.roles_permissions
    ADD CONSTRAINT "FK_337aa8dba227a1fe6b73998307b" FOREIGN KEY (permission_id) REFERENCES public.permission(id) ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.roles_permissions DROP CONSTRAINT "FK_337aa8dba227a1fe6b73998307b";
       public          admin    false    205    210    2839            %           2606    16465 0   roles_permissions FK_7d2dad9f14eddeb09c256fea719    FK CONSTRAINT     �   ALTER TABLE ONLY public.roles_permissions
    ADD CONSTRAINT "FK_7d2dad9f14eddeb09c256fea719" FOREIGN KEY (role_id) REFERENCES public.role(id) ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.roles_permissions DROP CONSTRAINT "FK_7d2dad9f14eddeb09c256fea719";
       public          admin    false    210    2842    207            $           2606    16460 $   admin FK_fd32421f2d93414e46a8fcfd86b    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT "FK_fd32421f2d93414e46a8fcfd86b" FOREIGN KEY (role_id) REFERENCES public.role(id);
 P   ALTER TABLE ONLY public.admin DROP CONSTRAINT "FK_fd32421f2d93414e46a8fcfd86b";
       public          admin    false    207    2842    209            �   �   x�U��N�@@���)X�3L�;3��P5�tj���t3�C��F}zSw&g��S�)�T���$(c���Be�d��Uİ�S3�������s�'?�/��*�YY���)#t�x�f\���D�;@VJKm�s��2�[c0�	��dM۟���x���p����/�����3�Y톯�_�é��ǫ�;��S���ѝ��(�(�$m;�      �     x��ko�H�?��"�'`��9g��/ �+�DW���L�I�)����;�gR�D@��U�_'��Μ��<  8:5@�r�Jd(�P�M-�y>-�嬨�������rX�#���=L���X��i��.��;�Mf���x\^�W�������_i�O�<;98.�+��l$n�����q1�x;xkԿJ��[,�����G�j$�f\n=����q2�����|���=��,g�H[�[!r<�N�e�y�!�p6�H��M�	�x���C��n!��nB>ɧyw�E�G�i���m�MȧE�ٽ.��8Ced�]W6��r�ox��̓��d��Z�K�<ɫ�Xl|8)'e5p�E9ɗy�N����`B	Oċ�Z�bpr�Mja|4��)��m�r�B��<̖�"s�/�����읓�}���	R
�c` �;+�e�ԝ2[��Mݖ��fŌ��{��]dU��\N�Yw��qƋS�;p!)\���˹�/~���5�U�~CSw��}2������v�@�_5q0ѲԥQv�:oXQ�ˍ�77p�>g�&f�) �S]ٱ��E�;q�e0��q2��Mک��1B���\1�Gٸ.�Xd�-�#�L��&l��N���[�\� HFi�.Պk��%��{8�5^�a���Jtb^��|S�H�T(wm��h���^��uގ�h��ei��f� �h7ԥ]��+�Q�r-��Nڀ�|]ڱrM˳��wԏؔ�KA$�[��*W'���e]MfD��=�K;�N0G��Q.�);U�N���*!E�l��̧!��W���¾����Z��wC�)���f��s����QiH;�u�з,��[V�8n�v
�.���K��<ׇEի!�ک�!AL��	�e�jߍ5�J��o`�(���'�� �'6�J�Ț�t��k�W�x���Ƀg'���O�o0��n����}�݌,��a21#P�D }t��ĸU+�R�M�m���[|-;�v��.?����x�G�oq:���4W�M��@Ʌ�f�=��>y`��jE �۳�z��T�$܆���6�O�Pɤ�Z�6�OP*8�h!.u�OD��+#�@��'D*S�X�I]�I7�À'�7��ꐿ!��?vkHR&,�u�/�a�Cn�K&�0m����p���%�hh����<\����(t��~v�ܽ�ф��!}�
���LT�I�2�B�MjH�r!B�)H�����R�\?��!1�6�u�/� ��s��,hI[�Ǖ��f�7~p(5(lpW.��¯HD�Ā���V)�k��G�M.�ƫ���ӫcJ
N�&��6�S�s�M� q!��-�:AJ�I�U��Q �%
�uv����9Jl�����$|S0|��(���DѪ�u`+���А���d��]�q��oa4��$��n�]?oALr"�mRO��1�����&Y }� �gY1?-���޾ܨ%��F-�a��G��%˴!"��_������$��(4������:4Y�g?��`H�T>?�v0�F���sc�ʒ r�.u��_R\�����{���u      �   6  x�}�Kn�0D��)z�"�����&��Iz�*��ؔ���̇�i�gMg�>�$�" �L�qz�.�u�}��{{*��rγ���/ϼ���4��	C�yβ�9#&��������P�a0� 6Z�����˜�k����������<EI���c�nj���
z��>����6Hu���1$����b^��6�e:�\�E�Em8�����~��V�C������n\lQuQ�Z�N���,�whu����񘖛B���w��<h���m��jI3�����h5����,���h�tQ�)�������      �   G   x�3�4202�50�50S04�21�20�343654�'嘒�����X\�Z����_� D�)�E��\1z\\\ n
�      �   4   x���  ���0�p���A҇-Kf0�Xb
:�5�n5�V����ʃW |s1	�     