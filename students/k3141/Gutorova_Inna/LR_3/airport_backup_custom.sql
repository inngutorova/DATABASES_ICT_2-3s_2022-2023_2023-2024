PGDMP  "    3            	    {            airport    16.0    16.0 Y    D           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            E           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            F           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            G           1262    16397    airport    DATABASE     {   CREATE DATABASE airport WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE airport;
                postgres    false                        2615    16398    schema    SCHEMA        CREATE SCHEMA schema;
    DROP SCHEMA schema;
                postgres    false            �            1259    16424    seat    TABLE     �  CREATE TABLE schema.seat (
    id_seat integer NOT NULL,
    number integer NOT NULL,
    "row" integer NOT NULL,
    status character varying(20),
    id_route integer,
    CONSTRAINT check_number CHECK ((number > 0)),
    CONSTRAINT check_row CHECK (("row" > 0)),
    CONSTRAINT check_status CHECK (((status)::text = ANY ((ARRAY['Available'::character varying, 'Booked'::character varying, 'Purchased'::character varying])::text[])))
);
    DROP TABLE schema.seat;
       schema         heap    postgres    false    6            �            1259    16423    Seat_id_seat_seq    SEQUENCE     �   ALTER TABLE schema.seat ALTER COLUMN id_seat ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME schema."Seat_id_seat_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1
);
            schema          postgres    false    6    225            �            1259    16436    airport    TABLE     �   CREATE TABLE schema.airport (
    id_airport integer NOT NULL,
    name character varying(20) NOT NULL,
    country character varying(20) NOT NULL,
    city character varying(20) NOT NULL
);
    DROP TABLE schema.airport;
       schema         heap    postgres    false    6            �            1259    16435    airport_id_airport_seq    SEQUENCE     �   ALTER TABLE schema.airport ALTER COLUMN id_airport ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME schema.airport_id_airport_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1
);
            schema          postgres    false    6    229            �            1259    16469    company    TABLE     �   CREATE TABLE schema.company (
    id_company integer NOT NULL,
    name character varying(20) NOT NULL,
    country character varying(20) NOT NULL
);
    DROP TABLE schema.company;
       schema         heap    postgres    false    6            �            1259    16468    company_id_company_seq    SEQUENCE     �   ALTER TABLE schema.company ALTER COLUMN id_company ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME schema.company_id_company_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1
);
            schema          postgres    false    6    239            �            1259    16475    crew    TABLE     E  CREATE TABLE schema.crew (
    id_crew integer NOT NULL,
    allowance character varying(20) NOT NULL,
    "position" character varying(20),
    id_employee integer,
    id_route integer,
    CONSTRAINT check_allowance CHECK (((allowance)::text = ANY ((ARRAY['Yes'::character varying, 'No'::character varying])::text[])))
);
    DROP TABLE schema.crew;
       schema         heap    postgres    false    6            �            1259    16474    crew_id_crew_seq    SEQUENCE     �   ALTER TABLE schema.crew ALTER COLUMN id_crew ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME schema.crew_id_crew_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1
);
            schema          postgres    false    6    241            �            1259    16430    employee    TABLE     ~  CREATE TABLE schema.employee (
    id_employee integer NOT NULL,
    surname character varying(20) NOT NULL,
    name character varying(20) NOT NULL,
    patronymic character varying(20),
    passport_series integer NOT NULL,
    passport_number integer NOT NULL,
    passport_date date NOT NULL,
    passport_who_issued character varying(50) NOT NULL,
    id_company integer NOT NULL,
    "position" character varying(20),
    CONSTRAINT check_passport_number CHECK (((100000 <= passport_number) AND (passport_number <= 999999))),
    CONSTRAINT check_passport_series CHECK (((1000 <= passport_series) AND (passport_series <= 9999)))
);
    DROP TABLE schema.employee;
       schema         heap    postgres    false    6            �            1259    16429    employee_id_employee_seq    SEQUENCE     �   ALTER TABLE schema.employee ALTER COLUMN id_employee ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME schema.employee_id_employee_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1
);
            schema          postgres    false    227    6            �            1259    16463    model    TABLE     �  CREATE TABLE schema.model (
    id_model integer NOT NULL,
    release_date date NOT NULL,
    fuel_rate integer NOT NULL,
    type_of_plane character varying(20) NOT NULL,
    speed integer NOT NULL,
    number_of_seats integer NOT NULL,
    country character varying(20) NOT NULL,
    producer character varying(20) NOT NULL,
    purpose character varying(20) NOT NULL,
    load_capacity integer NOT NULL,
    CONSTRAINT check_fuel_rate CHECK ((fuel_rate > 0)),
    CONSTRAINT check_load_capacity CHECK ((load_capacity > 0)),
    CONSTRAINT check_number_of_seats CHECK ((number_of_seats > 0)),
    CONSTRAINT check_speed CHECK ((speed > 0))
);
    DROP TABLE schema.model;
       schema         heap    postgres    false    6            �            1259    16462    model_id_model_seq    SEQUENCE     �   ALTER TABLE schema.model ALTER COLUMN id_model ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME schema.model_id_model_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1
);
            schema          postgres    false    6    237            �            1259    16406 	   passenger    TABLE     9  CREATE TABLE schema.passenger (
    id_passenger integer NOT NULL,
    surname character varying(20) NOT NULL,
    name character varying(20) NOT NULL,
    patronymic character varying(20),
    passport_series integer NOT NULL,
    passport_number integer NOT NULL,
    passport_date date NOT NULL,
    passport_who_issued character varying(50) NOT NULL,
    CONSTRAINT check_passport_number CHECK (((100000 <= passport_number) AND (passport_number <= 999999))),
    CONSTRAINT check_passport_series CHECK (((1000 <= passport_series) AND (passport_series <= 9999)))
);
    DROP TABLE schema.passenger;
       schema         heap    postgres    false    6            �            1259    16405    passenger_id_passenger_seq    SEQUENCE     �   ALTER TABLE schema.passenger ALTER COLUMN id_passenger ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME schema.passenger_id_passenger_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1
);
            schema          postgres    false    6    219            �            1259    16452    plane    TABLE     2  CREATE TABLE schema.plane (
    id_plane integer NOT NULL,
    tail_number character varying(20) NOT NULL,
    flight_hours integer NOT NULL,
    date_last_repair date NOT NULL,
    id_model integer NOT NULL,
    id_company integer NOT NULL,
    CONSTRAINT check_flight_hours CHECK ((flight_hours > 0))
);
    DROP TABLE schema.plane;
       schema         heap    postgres    false    6            �            1259    16451    plane_id_plane_seq    SEQUENCE     �   ALTER TABLE schema.plane ALTER COLUMN id_plane ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME schema.plane_id_plane_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1
);
            schema          postgres    false    235    6            �            1259    16418    route    TABLE     v  CREATE TABLE schema.route (
    id_route integer NOT NULL,
    type character varying(20) NOT NULL,
    date_departure date NOT NULL,
    date_arrival date NOT NULL,
    id_schedule integer NOT NULL,
    id_plane integer NOT NULL,
    CONSTRAINT check_type CHECK (((type)::text = ANY ((ARRAY['Domestic'::character varying, 'International'::character varying])::text[])))
);
    DROP TABLE schema.route;
       schema         heap    postgres    false    6            �            1259    16417    route_id_route_seq    SEQUENCE     �   ALTER TABLE schema.route ALTER COLUMN id_route ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME schema.route_id_route_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1
);
            schema          postgres    false    6    223            �            1259    16446    schedule    TABLE     &  CREATE TABLE schema.schedule (
    id_schedule integer NOT NULL,
    time_arrival time with time zone NOT NULL,
    time_departure time with time zone NOT NULL,
    regularity character varying(20) NOT NULL,
    id_airport_arrival integer NOT NULL,
    id_airport_departure integer NOT NULL
);
    DROP TABLE schema.schedule;
       schema         heap    postgres    false    6            �            1259    16445    schedule_id_schedule_seq    SEQUENCE     �   ALTER TABLE schema.schedule ALTER COLUMN id_schedule ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME schema.schedule_id_schedule_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1
);
            schema          postgres    false    6    233            �            1259    16412    ticket    TABLE       CREATE TABLE schema.ticket (
    id_ticket integer NOT NULL,
    status character varying(20) NOT NULL,
    payment_status character varying(20) NOT NULL,
    service_class character varying(20) NOT NULL,
    baggage_insurance character varying(20) NOT NULL,
    baggage character varying(20) NOT NULL,
    id_ticket_office integer NOT NULL,
    id_passenger integer NOT NULL,
    id_seat integer NOT NULL,
    id_route integer NOT NULL,
    price real NOT NULL,
    CONSTRAINT check_baggage CHECK (((baggage)::text = ANY ((ARRAY['Yes'::character varying, 'No'::character varying])::text[]))),
    CONSTRAINT check_baggage_insuranve CHECK (((baggage_insurance)::text = ANY ((ARRAY['Yes'::character varying, 'No'::character varying])::text[]))),
    CONSTRAINT check_payment_status CHECK (((payment_status)::text = ANY ((ARRAY['Paid'::character varying, 'Not Paid'::character varying])::text[]))),
    CONSTRAINT check_price CHECK ((price > (0)::double precision)),
    CONSTRAINT check_service_class CHECK (((service_class)::text = ANY ((ARRAY['Business'::character varying, 'Economy'::character varying])::text[]))),
    CONSTRAINT check_status CHECK (((status)::text = ANY ((ARRAY['Purchased'::character varying, 'Available'::character varying, 'Booked'::character varying])::text[])))
);
    DROP TABLE schema.ticket;
       schema         heap    postgres    false    6            �            1259    16411    ticket_id_ticket_seq    SEQUENCE     �   ALTER TABLE schema.ticket ALTER COLUMN id_ticket ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME schema.ticket_id_ticket_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1
);
            schema          postgres    false    6    221            �            1259    16400    ticket_office    TABLE     �   CREATE TABLE schema.ticket_office (
    id_ticket_office integer NOT NULL,
    city character varying(20) NOT NULL,
    address character varying(50) NOT NULL
);
 !   DROP TABLE schema.ticket_office;
       schema         heap    postgres    false    6            �            1259    16399 "   ticket_office_id_ticket_office_seq    SEQUENCE     �   ALTER TABLE schema.ticket_office ALTER COLUMN id_ticket_office ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME schema.ticket_office_id_ticket_office_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1
);
            schema          postgres    false    217    6            �            1259    16442    transit    TABLE     '  CREATE TABLE schema.transit (
    id_transit integer NOT NULL,
    time_arrival time with time zone NOT NULL,
    time_departure time with time zone NOT NULL,
    id_schedule integer NOT NULL,
    id_airport integer NOT NULL,
    CONSTRAINT check_time CHECK ((time_departure > time_arrival))
);
    DROP TABLE schema.transit;
       schema         heap    postgres    false    6            �            1259    16441    transit_id_transit_seq    SEQUENCE     �   ALTER TABLE schema.transit ALTER COLUMN id_transit ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME schema.transit_id_transit_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1
);
            schema          postgres    false    6    231            5          0    16436    airport 
   TABLE DATA           B   COPY schema.airport (id_airport, name, country, city) FROM stdin;
    schema          postgres    false    229   w       ?          0    16469    company 
   TABLE DATA           <   COPY schema.company (id_company, name, country) FROM stdin;
    schema          postgres    false    239   `w       A          0    16475    crew 
   TABLE DATA           U   COPY schema.crew (id_crew, allowance, "position", id_employee, id_route) FROM stdin;
    schema          postgres    false    241   �w       3          0    16430    employee 
   TABLE DATA           �   COPY schema.employee (id_employee, surname, name, patronymic, passport_series, passport_number, passport_date, passport_who_issued, id_company, "position") FROM stdin;
    schema          postgres    false    227   �w       =          0    16463    model 
   TABLE DATA           �   COPY schema.model (id_model, release_date, fuel_rate, type_of_plane, speed, number_of_seats, country, producer, purpose, load_capacity) FROM stdin;
    schema          postgres    false    237   yx       +          0    16406 	   passenger 
   TABLE DATA           �   COPY schema.passenger (id_passenger, surname, name, patronymic, passport_series, passport_number, passport_date, passport_who_issued) FROM stdin;
    schema          postgres    false    219   y       ;          0    16452    plane 
   TABLE DATA           l   COPY schema.plane (id_plane, tail_number, flight_hours, date_last_repair, id_model, id_company) FROM stdin;
    schema          postgres    false    235   �y       /          0    16418    route 
   TABLE DATA           d   COPY schema.route (id_route, type, date_departure, date_arrival, id_schedule, id_plane) FROM stdin;
    schema          postgres    false    223   �y       9          0    16446    schedule 
   TABLE DATA           �   COPY schema.schedule (id_schedule, time_arrival, time_departure, regularity, id_airport_arrival, id_airport_departure) FROM stdin;
    schema          postgres    false    233   "z       1          0    16424    seat 
   TABLE DATA           H   COPY schema.seat (id_seat, number, "row", status, id_route) FROM stdin;
    schema          postgres    false    225   �z       -          0    16412    ticket 
   TABLE DATA           �   COPY schema.ticket (id_ticket, status, payment_status, service_class, baggage_insurance, baggage, id_ticket_office, id_passenger, id_seat, id_route, price) FROM stdin;
    schema          postgres    false    221   �z       )          0    16400    ticket_office 
   TABLE DATA           H   COPY schema.ticket_office (id_ticket_office, city, address) FROM stdin;
    schema          postgres    false    217   8{       7          0    16442    transit 
   TABLE DATA           d   COPY schema.transit (id_transit, time_arrival, time_departure, id_schedule, id_airport) FROM stdin;
    schema          postgres    false    231   w{       H           0    0    Seat_id_seat_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('schema."Seat_id_seat_seq"', 8, true);
          schema          postgres    false    224            I           0    0    airport_id_airport_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('schema.airport_id_airport_seq', 36, true);
          schema          postgres    false    228            J           0    0    company_id_company_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('schema.company_id_company_seq', 24, true);
          schema          postgres    false    238            K           0    0    crew_id_crew_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('schema.crew_id_crew_seq', 15, true);
          schema          postgres    false    240            L           0    0    employee_id_employee_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('schema.employee_id_employee_seq', 48, true);
          schema          postgres    false    226            M           0    0    model_id_model_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('schema.model_id_model_seq', 6, true);
          schema          postgres    false    236            N           0    0    passenger_id_passenger_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('schema.passenger_id_passenger_seq', 30, true);
          schema          postgres    false    218            O           0    0    plane_id_plane_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('schema.plane_id_plane_seq', 14, true);
          schema          postgres    false    234            P           0    0    route_id_route_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('schema.route_id_route_seq', 3, true);
          schema          postgres    false    222            Q           0    0    schedule_id_schedule_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('schema.schedule_id_schedule_seq', 12, true);
          schema          postgres    false    232            R           0    0    ticket_id_ticket_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('schema.ticket_id_ticket_seq', 9, true);
          schema          postgres    false    220            S           0    0 "   ticket_office_id_ticket_office_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('schema.ticket_office_id_ticket_office_seq', 3, true);
          schema          postgres    false    216            T           0    0    transit_id_transit_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('schema.transit_id_transit_seq', 3, true);
          schema          postgres    false    230            z           2606    16440    airport airport_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY schema.airport
    ADD CONSTRAINT airport_pkey PRIMARY KEY (id_airport);
 >   ALTER TABLE ONLY schema.airport DROP CONSTRAINT airport_pkey;
       schema            postgres    false    229            f           2606    16937    schedule check_time    CHECK CONSTRAINT     m   ALTER TABLE schema.schedule
    ADD CONSTRAINT check_time CHECK ((time_arrival > time_departure)) NOT VALID;
 8   ALTER TABLE schema.schedule DROP CONSTRAINT check_time;
       schema          postgres    false    233    233    233    233            �           2606    16473    company company_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY schema.company
    ADD CONSTRAINT company_pkey PRIMARY KEY (id_company);
 >   ALTER TABLE ONLY schema.company DROP CONSTRAINT company_pkey;
       schema            postgres    false    239            �           2606    16479    crew crew_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY schema.crew
    ADD CONSTRAINT crew_pkey PRIMARY KEY (id_crew);
 8   ALTER TABLE ONLY schema.crew DROP CONSTRAINT crew_pkey;
       schema            postgres    false    241            x           2606    16434    employee employee_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY schema.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id_employee);
 @   ALTER TABLE ONLY schema.employee DROP CONSTRAINT employee_pkey;
       schema            postgres    false    227            �           2606    16467    model model_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY schema.model
    ADD CONSTRAINT model_pkey PRIMARY KEY (id_model);
 :   ALTER TABLE ONLY schema.model DROP CONSTRAINT model_pkey;
       schema            postgres    false    237            p           2606    16410    passenger passenger_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY schema.passenger
    ADD CONSTRAINT passenger_pkey PRIMARY KEY (id_passenger);
 B   ALTER TABLE ONLY schema.passenger DROP CONSTRAINT passenger_pkey;
       schema            postgres    false    219            �           2606    16456    plane plane_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY schema.plane
    ADD CONSTRAINT plane_pkey PRIMARY KEY (id_plane);
 :   ALTER TABLE ONLY schema.plane DROP CONSTRAINT plane_pkey;
       schema            postgres    false    235            t           2606    16422    route route_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY schema.route
    ADD CONSTRAINT route_pkey PRIMARY KEY (id_route);
 :   ALTER TABLE ONLY schema.route DROP CONSTRAINT route_pkey;
       schema            postgres    false    223            ~           2606    16450    schedule schedule_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY schema.schedule
    ADD CONSTRAINT schedule_pkey PRIMARY KEY (id_schedule);
 @   ALTER TABLE ONLY schema.schedule DROP CONSTRAINT schedule_pkey;
       schema            postgres    false    233            v           2606    16428    seat seat_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY schema.seat
    ADD CONSTRAINT seat_pkey PRIMARY KEY (id_seat);
 8   ALTER TABLE ONLY schema.seat DROP CONSTRAINT seat_pkey;
       schema            postgres    false    225            n           2606    16404     ticket_office ticket_office_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY schema.ticket_office
    ADD CONSTRAINT ticket_office_pkey PRIMARY KEY (id_ticket_office);
 J   ALTER TABLE ONLY schema.ticket_office DROP CONSTRAINT ticket_office_pkey;
       schema            postgres    false    217            r           2606    16558    ticket ticket_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY schema.ticket
    ADD CONSTRAINT ticket_pkey PRIMARY KEY (id_ticket);
 <   ALTER TABLE ONLY schema.ticket DROP CONSTRAINT ticket_pkey;
       schema            postgres    false    221            |           2606    16526    transit transit_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY schema.transit
    ADD CONSTRAINT transit_pkey PRIMARY KEY (id_transit);
 >   ALTER TABLE ONLY schema.transit DROP CONSTRAINT transit_pkey;
       schema            postgres    false    231            �           1259    16914    fki_fk_employee    INDEX     G   CREATE INDEX fki_fk_employee ON schema.crew USING btree (id_employee);
 #   DROP INDEX schema.fki_fk_employee;
       schema            postgres    false    241            �           1259    16920    fki_fk_route    INDEX     A   CREATE INDEX fki_fk_route ON schema.crew USING btree (id_route);
     DROP INDEX schema.fki_fk_route;
       schema            postgres    false    241            �           2606    16532    transit fk_airport    FK CONSTRAINT     ~   ALTER TABLE ONLY schema.transit
    ADD CONSTRAINT fk_airport FOREIGN KEY (id_airport) REFERENCES schema.airport(id_airport);
 <   ALTER TABLE ONLY schema.transit DROP CONSTRAINT fk_airport;
       schema          postgres    false    229    231    4730            �           2606    16537    schedule fk_airport_arrival    FK CONSTRAINT     �   ALTER TABLE ONLY schema.schedule
    ADD CONSTRAINT fk_airport_arrival FOREIGN KEY (id_airport_arrival) REFERENCES schema.airport(id_airport);
 E   ALTER TABLE ONLY schema.schedule DROP CONSTRAINT fk_airport_arrival;
       schema          postgres    false    229    233    4730            �           2606    16542    schedule fk_airport_departure    FK CONSTRAINT     �   ALTER TABLE ONLY schema.schedule
    ADD CONSTRAINT fk_airport_departure FOREIGN KEY (id_airport_departure) REFERENCES schema.airport(id_airport);
 G   ALTER TABLE ONLY schema.schedule DROP CONSTRAINT fk_airport_departure;
       schema          postgres    false    233    229    4730            �           2606    16520    employee fk_company    FK CONSTRAINT        ALTER TABLE ONLY schema.employee
    ADD CONSTRAINT fk_company FOREIGN KEY (id_company) REFERENCES schema.company(id_company);
 =   ALTER TABLE ONLY schema.employee DROP CONSTRAINT fk_company;
       schema          postgres    false    239    227    4740            �           2606    16552    plane fk_company    FK CONSTRAINT     |   ALTER TABLE ONLY schema.plane
    ADD CONSTRAINT fk_company FOREIGN KEY (id_company) REFERENCES schema.company(id_company);
 :   ALTER TABLE ONLY schema.plane DROP CONSTRAINT fk_company;
       schema          postgres    false    239    4740    235            �           2606    16909    crew fk_employee    FK CONSTRAINT        ALTER TABLE ONLY schema.crew
    ADD CONSTRAINT fk_employee FOREIGN KEY (id_employee) REFERENCES schema.employee(id_employee);
 :   ALTER TABLE ONLY schema.crew DROP CONSTRAINT fk_employee;
       schema          postgres    false    4728    227    241            �           2606    16547    plane fk_model    FK CONSTRAINT     t   ALTER TABLE ONLY schema.plane
    ADD CONSTRAINT fk_model FOREIGN KEY (id_model) REFERENCES schema.model(id_model);
 8   ALTER TABLE ONLY schema.plane DROP CONSTRAINT fk_model;
       schema          postgres    false    237    235    4738            �           2606    16485    ticket fk_passenger    FK CONSTRAINT     �   ALTER TABLE ONLY schema.ticket
    ADD CONSTRAINT fk_passenger FOREIGN KEY (id_passenger) REFERENCES schema.passenger(id_passenger);
 =   ALTER TABLE ONLY schema.ticket DROP CONSTRAINT fk_passenger;
       schema          postgres    false    4720    221    219            �           2606    16510    route fk_plane    FK CONSTRAINT     t   ALTER TABLE ONLY schema.route
    ADD CONSTRAINT fk_plane FOREIGN KEY (id_plane) REFERENCES schema.plane(id_plane);
 8   ALTER TABLE ONLY schema.route DROP CONSTRAINT fk_plane;
       schema          postgres    false    4736    223    235            �           2606    16457    seat fk_route    FK CONSTRAINT     s   ALTER TABLE ONLY schema.seat
    ADD CONSTRAINT fk_route FOREIGN KEY (id_route) REFERENCES schema.route(id_route);
 7   ALTER TABLE ONLY schema.seat DROP CONSTRAINT fk_route;
       schema          postgres    false    225    223    4724            �           2606    16495    ticket fk_route    FK CONSTRAINT     u   ALTER TABLE ONLY schema.ticket
    ADD CONSTRAINT fk_route FOREIGN KEY (id_route) REFERENCES schema.route(id_route);
 9   ALTER TABLE ONLY schema.ticket DROP CONSTRAINT fk_route;
       schema          postgres    false    221    223    4724            �           2606    16915    crew fk_route    FK CONSTRAINT     s   ALTER TABLE ONLY schema.crew
    ADD CONSTRAINT fk_route FOREIGN KEY (id_route) REFERENCES schema.route(id_route);
 7   ALTER TABLE ONLY schema.crew DROP CONSTRAINT fk_route;
       schema          postgres    false    241    4724    223            �           2606    16500    route fk_schedule    FK CONSTRAINT     �   ALTER TABLE ONLY schema.route
    ADD CONSTRAINT fk_schedule FOREIGN KEY (id_schedule) REFERENCES schema.schedule(id_schedule);
 ;   ALTER TABLE ONLY schema.route DROP CONSTRAINT fk_schedule;
       schema          postgres    false    233    4734    223            �           2606    16527    transit fk_schedule    FK CONSTRAINT     �   ALTER TABLE ONLY schema.transit
    ADD CONSTRAINT fk_schedule FOREIGN KEY (id_schedule) REFERENCES schema.schedule(id_schedule);
 =   ALTER TABLE ONLY schema.transit DROP CONSTRAINT fk_schedule;
       schema          postgres    false    233    4734    231            �           2606    16490    ticket fk_seat    FK CONSTRAINT     q   ALTER TABLE ONLY schema.ticket
    ADD CONSTRAINT fk_seat FOREIGN KEY (id_seat) REFERENCES schema.seat(id_seat);
 8   ALTER TABLE ONLY schema.ticket DROP CONSTRAINT fk_seat;
       schema          postgres    false    221    225    4726            �           2606    16480    ticket fk_ticket_office    FK CONSTRAINT     �   ALTER TABLE ONLY schema.ticket
    ADD CONSTRAINT fk_ticket_office FOREIGN KEY (id_ticket_office) REFERENCES schema.ticket_office(id_ticket_office);
 A   ALTER TABLE ONLY schema.ticket DROP CONSTRAINT fk_ticket_office;
       schema          postgres    false    217    221    4718            5   ;   x�3�t�,*�/*Q0�t�/�+)��2K��\�.i�4�2�K�%�!��\1z\\\ �      ?   0   x�3�t��-H̫T0�J�J��,.#��\Ԉ�.j5����� ;�      A   0   x�3�L-�,���/�4�4�2�KR��R8�"�("�@�=... ��      3   �   x�M�M
�0���^@i�4?=�)�u4��m%Io�H4���'麅��� �R��RX��<�s�������|�d�c�|��)&�v�!P%	���K�5F���F�^�sM������a�e��;�8L\�NB���;�      =   ~   x�M�=�0��9(��~f.Ё��t%U Co�R,[�,�M��A-R����e>�\�Eԭ�ק�1ky�i�l[]ʛk�	DB �ӆ@�DrG���@ĉ��D����xW|Wb/SySJ_�F4p      +   n   x�M�1
�@����^`ż���F[Y,�Pa���fD�'^�)�3��2�.�~:¶^���C=0V�O�~h���C���3y�0���y��ޒ��jM��y���2n2�      ;   5   x�=ɱ�  ���ޅ�l&�9���&�^�ZP�d�V\�=���w��c�8�	�      /   H   x�3�t��M-.�L�4202�54�5�@frrqz敤�%�d��%� �-Q��F\Ƙ� 3���b���� �=S      9   O   x�3�4��26�20�60�4� 2�l��̜JNCN#.#NCC�C�����l�"#Nc.��)�"�"�����Q�\1z\\\ >S      1   8   x�3�4Bǲ�̜Ĥ�TNC.#N#4c ߈�)??;5�ӈ˄����+F��� �,T      -   _   x�3�(-J�H,NM�H�L�t*-��K-.�L�`C40�2BW횜���[��B eF@lj�e��X�������
�)Q�n��1u��qqq }=&�      )   /   x�3�t�,�T0�tLI)J-.V0�2������!B�p!c�=... [�      7   <   x�3�4��26�20�60�4�2�lCNC.#NC���!Bֈӈ(b�$k��B�=... ��     