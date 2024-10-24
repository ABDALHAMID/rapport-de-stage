PGDMP         
                |         	   arazan-db    15.3    15.3 ?   e           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            f           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            g           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            h           1262    16398 	   arazan-db    DATABASE        CREATE DATABASE "arazan-db" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'French_Morocco.1252';
    DROP DATABASE "arazan-db";
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            i           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    6            �           1247    58310    aisle_separator_enum    TYPE     O   CREATE TYPE public.aisle_separator_enum AS ENUM (
    '-',
    '_',
    '@'
);
 '   DROP TYPE public.aisle_separator_enum;
       public          postgres    false    6            �           1247    58375    aisle_xtype_enum    TYPE     J   CREATE TYPE public.aisle_xtype_enum AS ENUM (
    'CHAR',
    'NUMBER'
);
 #   DROP TYPE public.aisle_xtype_enum;
       public          postgres    false    6            �           1247    58387    aisle_ytype_enum    TYPE     J   CREATE TYPE public.aisle_ytype_enum AS ENUM (
    'CHAR',
    'NUMBER'
);
 #   DROP TYPE public.aisle_ytype_enum;
       public          postgres    false    6            �           1247    58399    aisle_ztype_enum    TYPE     J   CREATE TYPE public.aisle_ztype_enum AS ENUM (
    'CHAR',
    'NUMBER'
);
 #   DROP TYPE public.aisle_ztype_enum;
       public          postgres    false    6            :           1247    59830    itemclass_class_enum    TYPE     [   CREATE TYPE public.itemclass_class_enum AS ENUM (
    'A',
    'B',
    'C',
    'NONE'
);
 '   DROP TYPE public.itemclass_class_enum;
       public          postgres    false    6            �           1247    58479    location_abcclass_enum    TYPE     ]   CREATE TYPE public.location_abcclass_enum AS ENUM (
    'A',
    'B',
    'C',
    'NONE'
);
 )   DROP TYPE public.location_abcclass_enum;
       public          postgres    false    6                       1259    92025    address    TABLE     Q  CREATE TABLE public.address (
    refaddress character varying(12) NOT NULL,
    title character varying NOT NULL,
    refcompany character varying NOT NULL,
    reforganisation character varying NOT NULL,
    location character varying NOT NULL,
    refcity character varying NOT NULL,
    state character varying NOT NULL,
    zipcode character varying NOT NULL,
    refcountry character varying NOT NULL,
    actif boolean DEFAULT true NOT NULL,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.address;
       public         heap    postgres    false    6                       1259    92037    addresssitegeographics    TABLE     �  CREATE TABLE public.addresssitegeographics (
    refaddress character varying(12) NOT NULL,
    refcompany character varying NOT NULL,
    reforganisation character varying NOT NULL,
    refsitegeographic character varying NOT NULL,
    refaddresstype character varying NOT NULL,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL
);
 *   DROP TABLE public.addresssitegeographics;
       public         heap    postgres    false    6                       1259    92018    addresstype    TABLE        CREATE TABLE public.addresstype (
    refaddresstype character varying NOT NULL,
    addresstype character varying NOT NULL
);
    DROP TABLE public.addresstype;
       public         heap    postgres    false    6                       1259    108109    addressvendors    TABLE     �  CREATE TABLE public.addressvendors (
    refaddress character varying(12) NOT NULL,
    refcompany character varying NOT NULL,
    reforganisation character varying NOT NULL,
    refvendor character varying NOT NULL,
    refaddresstype character varying NOT NULL,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL
);
 "   DROP TABLE public.addressvendors;
       public         heap    postgres    false    6                       1259    92046    addresswarehouses    TABLE     �  CREATE TABLE public.addresswarehouses (
    refaddress character varying(12) NOT NULL,
    refcompany character varying NOT NULL,
    reforganisation character varying NOT NULL,
    refwarehouse character varying NOT NULL,
    refaddresstype character varying NOT NULL,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL
);
 %   DROP TABLE public.addresswarehouses;
       public         heap    postgres    false    6                        1259    91941    aisle    TABLE     �  CREATE TABLE public.aisle (
    refaisle character varying(12) NOT NULL,
    refarea character varying NOT NULL,
    refcompany character varying NOT NULL,
    reforganisation character varying NOT NULL,
    aisle character varying NOT NULL,
    reffurnituretype character varying NOT NULL,
    xshelf integer NOT NULL,
    xtype public.aisle_xtype_enum DEFAULT 'CHAR'::public.aisle_xtype_enum NOT NULL,
    yfloor integer NOT NULL,
    ytype public.aisle_ytype_enum DEFAULT 'CHAR'::public.aisle_ytype_enum NOT NULL,
    zsection integer NOT NULL,
    ztype public.aisle_ztype_enum DEFAULT 'CHAR'::public.aisle_ztype_enum NOT NULL,
    prefix character varying NOT NULL,
    separator public.aisle_separator_enum DEFAULT '-'::public.aisle_separator_enum NOT NULL,
    actif boolean NOT NULL,
    heightseparator integer NOT NULL,
    widthseparator integer NOT NULL,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.aisle;
       public         heap    postgres    false    1010    1013    1016    1007    6    1007    1010    1016    1013            �            1259    91743    area    TABLE     �  CREATE TABLE public.area (
    refarea character varying NOT NULL,
    area character varying NOT NULL,
    refcompany character varying NOT NULL,
    reforganisation character varying NOT NULL,
    refwarehouse character varying NOT NULL,
    actif boolean NOT NULL,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.area;
       public         heap    postgres    false    6            �            1259    91856 
   categories    TABLE     �  CREATE TABLE public.categories (
    refcategoriesgroup character varying NOT NULL,
    refcategories character varying NOT NULL,
    refcompany character varying NOT NULL,
    reforganisation character varying NOT NULL,
    refparentcategoriesgroup character varying,
    refparentcategories character varying,
    refparentcompany character varying,
    refparentorganisation character varying,
    category character varying NOT NULL,
    level character varying NOT NULL,
    actif boolean NOT NULL,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.categories;
       public         heap    postgres    false    6            �            1259    91865    categoriesgroup    TABLE     �  CREATE TABLE public.categoriesgroup (
    refcategoriesgroup character varying NOT NULL,
    refcompany character varying NOT NULL,
    reforganisation character varying NOT NULL,
    categoriesgroup character varying NOT NULL,
    refcontrolobject character varying NOT NULL,
    actif boolean NOT NULL,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL
);
 #   DROP TABLE public.categoriesgroup;
       public         heap    postgres    false    6            �            1259    91847    categoriesitems    TABLE     �  CREATE TABLE public.categoriesitems (
    refcategoriesgroup character varying NOT NULL,
    refcategories character varying NOT NULL,
    refcompany character varying NOT NULL,
    reforganisation character varying NOT NULL,
    refitem character varying NOT NULL,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL
);
 #   DROP TABLE public.categoriesitems;
       public         heap    postgres    false    6            �            1259    83589    city    TABLE     �   CREATE TABLE public.city (
    refcity character varying NOT NULL,
    refcountry character varying NOT NULL,
    city character varying NOT NULL
);
    DROP TABLE public.city;
       public         heap    postgres    false    6                       1259    91954    company    TABLE     B  CREATE TABLE public.company (
    refcompany character varying NOT NULL,
    reforganisation character varying NOT NULL,
    refcurrency character varying NOT NULL,
    company character varying NOT NULL,
    tel1 character varying,
    email1 character varying,
    responsable1 character varying,
    responsable2 character varying,
    tel2 character varying,
    email2 character varying,
    actif boolean DEFAULT true NOT NULL,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.company;
       public         heap    postgres    false    6            �            1259    63901    controlobject    TABLE     �  CREATE TABLE public.controlobject (
    refcontrolobject character varying NOT NULL,
    controlobject character varying NOT NULL,
    okforgroupcategories boolean DEFAULT false NOT NULL,
    okforworkflows boolean DEFAULT false NOT NULL,
    generatedpk boolean DEFAULT false NOT NULL,
    currentindex integer DEFAULT 1000 NOT NULL,
    prefix character varying DEFAULT ''::character varying NOT NULL,
    startwith integer DEFAULT 1000 NOT NULL,
    okforaddress boolean DEFAULT false NOT NULL
);
 !   DROP TABLE public.controlobject;
       public         heap    postgres    false    6            �            1259    83582    country    TABLE     s   CREATE TABLE public.country (
    refcountry character varying NOT NULL,
    country character varying NOT NULL
);
    DROP TABLE public.country;
       public         heap    postgres    false    6            �            1259    63227    currency    TABLE     v   CREATE TABLE public.currency (
    refcurrency character varying NOT NULL,
    currency character varying NOT NULL
);
    DROP TABLE public.currency;
       public         heap    postgres    false    6            �            1259    91826    deliverymode    TABLE     �   CREATE TABLE public.deliverymode (
    refdeliverymode character varying NOT NULL,
    deliverymode character varying NOT NULL,
    refcompany character varying NOT NULL,
    reforganisation character varying NOT NULL
);
     DROP TABLE public.deliverymode;
       public         heap    postgres    false    6            �            1259    63117    furnituretype    TABLE     �   CREATE TABLE public.furnituretype (
    reffurnituretype character varying NOT NULL,
    furnituretype character varying NOT NULL
);
 !   DROP TABLE public.furnituretype;
       public         heap    postgres    false    6                       1259    139615    inventorydimension    TABLE     	  CREATE TABLE public.inventorydimension (
    inventorydimensionid integer NOT NULL,
    refinventorydimensionserial character varying NOT NULL,
    refinventorydimensionowner character varying NOT NULL,
    refinventorydimensionpallet character varying NOT NULL,
    reflocation character varying NOT NULL,
    refaisle character varying NOT NULL,
    refarea character varying NOT NULL,
    refwarehouse character varying NOT NULL,
    refsitegeographic character varying NOT NULL,
    refcompany character varying NOT NULL,
    reforganisation character varying NOT NULL,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL,
    refinventorydimensionbatch character varying NOT NULL
);
 &   DROP TABLE public.inventorydimension;
       public         heap    postgres    false    6                       1259    139614 +   inventorydimension_inventorydimensionid_seq    SEQUENCE     �   CREATE SEQUENCE public.inventorydimension_inventorydimensionid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.inventorydimension_inventorydimensionid_seq;
       public          postgres    false    6    286            j           0    0 +   inventorydimension_inventorydimensionid_seq    SEQUENCE OWNED BY     {   ALTER SEQUENCE public.inventorydimension_inventorydimensionid_seq OWNED BY public.inventorydimension.inventorydimensionid;
          public          postgres    false    285                       1259    139605    inventorydimensionbatch    TABLE     1  CREATE TABLE public.inventorydimensionbatch (
    refinventorydimensionbatch character varying NOT NULL,
    inventorydimensionbatch character varying NOT NULL,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL
);
 +   DROP TABLE public.inventorydimensionbatch;
       public         heap    postgres    false    6            0           1259    140849    inventorydimensionbatchitem    TABLE     �  CREATE TABLE public.inventorydimensionbatchitem (
    refinventorydimensionbatch character varying NOT NULL,
    refitem character varying NOT NULL,
    refcompany character varying NOT NULL,
    reforganisation character varying NOT NULL,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL
);
 /   DROP TABLE public.inventorydimensionbatchitem;
       public         heap    postgres    false    6                       1259    139587    inventorydimensionowner    TABLE     (  CREATE TABLE public.inventorydimensionowner (
    refinventorydimensionowner character varying NOT NULL,
    inventoryowner character varying NOT NULL,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL
);
 +   DROP TABLE public.inventorydimensionowner;
       public         heap    postgres    false    6            .           1259    140831    inventorydimensionowneritem    TABLE     �  CREATE TABLE public.inventorydimensionowneritem (
    refinventorydimensionowner character varying NOT NULL,
    refitem character varying NOT NULL,
    refcompany character varying NOT NULL,
    reforganisation character varying NOT NULL,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL
);
 /   DROP TABLE public.inventorydimensionowneritem;
       public         heap    postgres    false    6                       1259    139578    inventorydimensionpallet    TABLE     4  CREATE TABLE public.inventorydimensionpallet (
    refinventorydimensionpallet character varying NOT NULL,
    inventorydimensionpallet character varying NOT NULL,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL
);
 ,   DROP TABLE public.inventorydimensionpallet;
       public         heap    postgres    false    6            -           1259    140822    inventorydimensionpalletitem    TABLE     �  CREATE TABLE public.inventorydimensionpalletitem (
    refinventorydimensionpallet character varying NOT NULL,
    refitem character varying NOT NULL,
    refcompany character varying NOT NULL,
    reforganisation character varying NOT NULL,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL
);
 0   DROP TABLE public.inventorydimensionpalletitem;
       public         heap    postgres    false    6                       1259    139596    inventorydimensionserial    TABLE     4  CREATE TABLE public.inventorydimensionserial (
    refinventorydimensionserial character varying NOT NULL,
    inventorydimensionserial character varying NOT NULL,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL
);
 ,   DROP TABLE public.inventorydimensionserial;
       public         heap    postgres    false    6            /           1259    140840    inventorydimensionserialitem    TABLE     �  CREATE TABLE public.inventorydimensionserialitem (
    refinventorydimensionserial character varying NOT NULL,
    refitem character varying NOT NULL,
    refcompany character varying NOT NULL,
    reforganisation character varying NOT NULL,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL
);
 0   DROP TABLE public.inventorydimensionserialitem;
       public         heap    postgres    false    6            4           1259    141124    inventoryonhand    TABLE     �  CREATE TABLE public.inventoryonhand (
    reforganisation character varying NOT NULL,
    refcompany character varying NOT NULL,
    refitem character varying NOT NULL,
    refinventunit character varying NOT NULL,
    unit character varying NOT NULL,
    refcurrency character varying NOT NULL,
    item character varying NOT NULL,
    itemdescription character varying NOT NULL,
    searchname character varying NOT NULL,
    inventorydimensionid integer NOT NULL,
    refinventorydimensionserial character varying NOT NULL,
    refinventorydimensionowner character varying NOT NULL,
    refinventorydimensionpallet character varying NOT NULL,
    refinventorydimensionbatch character varying NOT NULL,
    refsitegeographic character varying NOT NULL,
    refwarehouse character varying NOT NULL,
    refarea character varying NOT NULL,
    refaisle character varying NOT NULL,
    reflocation character varying NOT NULL,
    physicalavailable integer NOT NULL,
    physicalreserve integer NOT NULL,
    totalphysicalavailable integer NOT NULL,
    totalordredissue integer NOT NULL,
    physicalpicked integer NOT NULL,
    totalarrivalreceipt integer NOT NULL,
    totalordredreceipt integer NOT NULL,
    closedtransaction boolean NOT NULL,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL,
    inventoryonhandid integer NOT NULL
);
 #   DROP TABLE public.inventoryonhand;
       public         heap    postgres    false    6            5           1259    141131 %   inventoryonhand_inventoryonhandid_seq    SEQUENCE     �   CREATE SEQUENCE public.inventoryonhand_inventoryonhandid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.inventoryonhand_inventoryonhandid_seq;
       public          postgres    false    308    6            k           0    0 %   inventoryonhand_inventoryonhandid_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.inventoryonhand_inventoryonhandid_seq OWNED BY public.inventoryonhand.inventoryonhandid;
          public          postgres    false    309                       1259    139625    inventoryreceivingjournal    TABLE     +  CREATE TABLE public.inventoryreceivingjournal (
    refinventoryreceivingjournal character varying NOT NULL,
    reforganisation character varying NOT NULL,
    refcompany character varying NOT NULL,
    refwarehouse character varying NOT NULL,
    refinventoryreceivingjournalstatus character varying NOT NULL,
    refpurchaseorder character varying NOT NULL,
    refsitegeographic character varying NOT NULL,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL
);
 -   DROP TABLE public.inventoryreceivingjournal;
       public         heap    postgres    false    6            "           1259    139642    inventoryreceivingjournalline    TABLE     2  CREATE TABLE public.inventoryreceivingjournalline (
    reforganisation character varying NOT NULL,
    refcompany character varying NOT NULL,
    receivingjournallineid integer NOT NULL,
    refinventoryreceivingjournal character varying NOT NULL,
    inventorydimensionid integer NOT NULL,
    refitem character varying NOT NULL,
    qty integer NOT NULL,
    refinventunit character varying NOT NULL,
    reftransactionunit character varying NOT NULL,
    coefficient integer NOT NULL,
    unitprice integer NOT NULL,
    refinventoryreceivingjournalstatus character varying NOT NULL,
    purchaseorderlineid integer NOT NULL,
    refcurrency character varying NOT NULL,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL
);
 1   DROP TABLE public.inventoryreceivingjournalline;
       public         heap    postgres    false    6            !           1259    139641 8   inventoryreceivingjournalline_receivingjournallineid_seq    SEQUENCE     �   CREATE SEQUENCE public.inventoryreceivingjournalline_receivingjournallineid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 O   DROP SEQUENCE public.inventoryreceivingjournalline_receivingjournallineid_seq;
       public          postgres    false    290    6            l           0    0 8   inventoryreceivingjournalline_receivingjournallineid_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.inventoryreceivingjournalline_receivingjournallineid_seq OWNED BY public.inventoryreceivingjournalline.receivingjournallineid;
          public          postgres    false    289                        1259    139634    inventoryreceivingjournalstatus    TABLE     �   CREATE TABLE public.inventoryreceivingjournalstatus (
    refinventoryreceivingjournalstatus character varying NOT NULL,
    inventoryreceivingjournalstatus character varying NOT NULL
);
 3   DROP TABLE public.inventoryreceivingjournalstatus;
       public         heap    postgres    false    6            +           1259    140468    inventorytrackingobject    TABLE     �   CREATE TABLE public.inventorytrackingobject (
    refinventorytrackingobject character varying NOT NULL,
    inventorytrackingobject character varying NOT NULL
);
 +   DROP TABLE public.inventorytrackingobject;
       public         heap    postgres    false    6                       1259    139566    inventorytransaction    TABLE       CREATE TABLE public.inventorytransaction (
    reforganisation character varying NOT NULL,
    refcompany character varying NOT NULL,
    inventorytransactionid integer NOT NULL,
    refinventorytransactionorigin integer NOT NULL,
    inventorydimensionid integer NOT NULL,
    refitem character varying NOT NULL,
    physicalcost integer NOT NULL,
    financialcost integer NOT NULL,
    physicaldate timestamp with time zone NOT NULL,
    financialdate timestamp with time zone NOT NULL,
    priceunit integer NOT NULL,
    refinventunit character varying NOT NULL,
    reftransactionunit character varying NOT NULL,
    coefficient integer NOT NULL,
    refinventorytransactionstatusoutput character varying NOT NULL,
    refinventorytransactionstatusinput character varying NOT NULL,
    refcurrency character varying NOT NULL,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL,
    inventqty integer NOT NULL,
    transactqty integer NOT NULL,
    financialcosttransaction integer NOT NULL,
    physicalcosttransaction integer NOT NULL,
    financialamounttransaction integer NOT NULL,
    physicalamounttransaction integer NOT NULL,
    closedtransaction boolean DEFAULT false NOT NULL
);
 (   DROP TABLE public.inventorytransaction;
       public         heap    postgres    false    6                       1259    139565 /   inventorytransaction_inventorytransactionid_seq    SEQUENCE     �   CREATE SEQUENCE public.inventorytransaction_inventorytransactionid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 F   DROP SEQUENCE public.inventorytransaction_inventorytransactionid_seq;
       public          postgres    false    6    280            m           0    0 /   inventorytransaction_inventorytransactionid_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.inventorytransaction_inventorytransactionid_seq OWNED BY public.inventorytransaction.inventorytransactionid;
          public          postgres    false    279                       1259    139541    inventorytransactionorigin    TABLE       CREATE TABLE public.inventorytransactionorigin (
    refinventorytransactionorigin integer NOT NULL,
    reforganisation character varying NOT NULL,
    refcompany character varying NOT NULL,
    refoperation character varying NOT NULL,
    refinventorytransactionorigintype character varying NOT NULL,
    refitem character varying NOT NULL,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL,
    actif boolean NOT NULL
);
 .   DROP TABLE public.inventorytransactionorigin;
       public         heap    postgres    false    6                       1259    139540 <   inventorytransactionorigin_refinventorytransactionorigin_seq    SEQUENCE     �   CREATE SEQUENCE public.inventorytransactionorigin_refinventorytransactionorigin_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 S   DROP SEQUENCE public.inventorytransactionorigin_refinventorytransactionorigin_seq;
       public          postgres    false    6    276            n           0    0 <   inventorytransactionorigin_refinventorytransactionorigin_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.inventorytransactionorigin_refinventorytransactionorigin_seq OWNED BY public.inventorytransactionorigin.refinventorytransactionorigin;
          public          postgres    false    275                       1259    139533    inventorytransactionorigintype    TABLE     �   CREATE TABLE public.inventorytransactionorigintype (
    refinventorytransactionorigintype character varying NOT NULL,
    inventorytransactionorigintype character varying NOT NULL
);
 2   DROP TABLE public.inventorytransactionorigintype;
       public         heap    postgres    false    6                       1259    139558    inventorytransactionstatusinput    TABLE       CREATE TABLE public.inventorytransactionstatusinput (
    refinventorytransactionstatusinput character varying NOT NULL,
    inventorytransactionstatusinput character varying NOT NULL,
    inventorytransactionstatusinputdescription character varying,
    abrv character varying
);
 3   DROP TABLE public.inventorytransactionstatusinput;
       public         heap    postgres    false    6                       1259    139551     inventorytransactionstatusoutput    TABLE       CREATE TABLE public.inventorytransactionstatusoutput (
    refinventorytransactionstatusoutput character varying NOT NULL,
    inventorytransactionstatusoutput character varying NOT NULL,
    inventorytransactionstatusoutputdescription character varying,
    abrv character varying
);
 4   DROP TABLE public.inventorytransactionstatusoutput;
       public         heap    postgres    false    6            '           1259    139677    inventorytransfer    TABLE     
  CREATE TABLE public.inventorytransfer (
    refinventorytransfer character varying NOT NULL,
    reforganisation character varying NOT NULL,
    refcompany character varying NOT NULL,
    refwarehousefrom character varying NOT NULL,
    refinventorytransferstatus character varying NOT NULL,
    refwarehousetransitfrom character varying NOT NULL,
    refwarehouseto character varying NOT NULL,
    refinventorytransfertype character varying NOT NULL,
    reflocationfrom character varying NOT NULL,
    reflocationto character varying NOT NULL,
    refaislefrom character varying NOT NULL,
    refaisleto character varying NOT NULL,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL
);
 %   DROP TABLE public.inventorytransfer;
       public         heap    postgres    false    6            %           1259    139660    inventorytransferline    TABLE     o  CREATE TABLE public.inventorytransferline (
    reforganisation character varying NOT NULL,
    refcompany character varying NOT NULL,
    inventorytransferlineid integer NOT NULL,
    refinventorytransfer character varying NOT NULL,
    inventorydimensionid integer NOT NULL,
    refitem character varying NOT NULL,
    qty integer NOT NULL,
    qtyremaining integer NOT NULL,
    refunitinvent character varying NOT NULL,
    refunittrans character varying NOT NULL,
    coefficient integer NOT NULL,
    priceunit integer NOT NULL,
    refinventorytransferstatus character varying NOT NULL,
    refcurrency character varying NOT NULL,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL,
    refinventunit character varying NOT NULL,
    reftransactionunit character varying NOT NULL
);
 )   DROP TABLE public.inventorytransferline;
       public         heap    postgres    false    6            $           1259    139659 1   inventorytransferline_inventorytransferlineid_seq    SEQUENCE     �   CREATE SEQUENCE public.inventorytransferline_inventorytransferlineid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 H   DROP SEQUENCE public.inventorytransferline_inventorytransferlineid_seq;
       public          postgres    false    6    293            o           0    0 1   inventorytransferline_inventorytransferlineid_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.inventorytransferline_inventorytransferlineid_seq OWNED BY public.inventorytransferline.inventorytransferlineid;
          public          postgres    false    292            &           1259    139670    inventorytransferstatus    TABLE     �   CREATE TABLE public.inventorytransferstatus (
    refinventorytransferstatus character varying NOT NULL,
    inventorytransferstatus character varying NOT NULL
);
 +   DROP TABLE public.inventorytransferstatus;
       public         heap    postgres    false    6            #           1259    139652    inventorytransfertype    TABLE     �   CREATE TABLE public.inventorytransfertype (
    refinventorytransfertype character varying NOT NULL,
    inventorytransfertype character varying NOT NULL
);
 )   DROP TABLE public.inventorytransfertype;
       public         heap    postgres    false    6            (           1259    140437    inventoryvaluationmethode    TABLE     �   CREATE TABLE public.inventoryvaluationmethode (
    refinventoryvaluationmethode character varying NOT NULL,
    inventoryvaluationmethode character varying NOT NULL
);
 -   DROP TABLE public.inventoryvaluationmethode;
       public         heap    postgres    false    6                       1259    92074 	   itemclass    TABLE     �  CREATE TABLE public.itemclass (
    refitem character varying NOT NULL,
    reforganisation character varying NOT NULL,
    refcompany character varying NOT NULL,
    refwarehouse character varying NOT NULL,
    class public.itemclass_class_enum DEFAULT 'NONE'::public.itemclass_class_enum NOT NULL,
    actif boolean DEFAULT true NOT NULL,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.itemclass;
       public         heap    postgres    false    1082    6    1082            )           1259    140444 	   itemmodel    TABLE     <  CREATE TABLE public.itemmodel (
    refitemmodel character varying NOT NULL,
    refcompany character varying NOT NULL,
    reforganisation character varying NOT NULL,
    itemmodel character varying NOT NULL,
    actif boolean DEFAULT true NOT NULL,
    allownegativephysicalinventory boolean DEFAULT false NOT NULL,
    storedproduct boolean DEFAULT true NOT NULL,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL,
    refinventoryvaluationmethode character varying NOT NULL
);
    DROP TABLE public.itemmodel;
       public         heap    postgres    false    6            	           1259    92055    items    TABLE     �  CREATE TABLE public.items (
    refitem character varying NOT NULL,
    reforganisation character varying NOT NULL,
    item character varying NOT NULL,
    barcode character varying,
    itemdescription character varying,
    searchname character varying,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.items;
       public         heap    postgres    false    6                       1259    116246 
   itemsgroup    TABLE       CREATE TABLE public.itemsgroup (
    refitemgroup character varying NOT NULL,
    itemgroup character varying NOT NULL,
    refcompany character varying NOT NULL,
    reforganisation character varying NOT NULL,
    actif boolean NOT NULL,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.itemsgroup;
       public         heap    postgres    false    6            �            1259    91914    itemsreleased    TABLE     �  CREATE TABLE public.itemsreleased (
    refitem character varying NOT NULL,
    refcompany character varying NOT NULL,
    reforganisation character varying NOT NULL,
    stopedpurch boolean DEFAULT false,
    stopedsales boolean DEFAULT false,
    stopedinvent boolean DEFAULT false,
    safetystock integer DEFAULT 0,
    refunitinvent character varying,
    refunitsales character varying,
    refunitpurch character varying,
    refunitorder character varying,
    expirationdate integer DEFAULT 0,
    bestbeforetime integer DEFAULT 0,
    removaltime integer DEFAULT 0,
    alerttime integer DEFAULT 0,
    reftaxepurchase character varying,
    reftaxesales character varying,
    idheaderparametre integer,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL,
    refitemgroup character varying,
    purchaseprice numeric(10,2) DEFAULT '0'::numeric,
    salesprice numeric(10,2) DEFAULT '0'::numeric,
    purchasepriceunit numeric(10,0) DEFAULT '0'::numeric,
    salespriceunit numeric(10,0) DEFAULT '0'::numeric,
    refitemmodel character varying,
    refitemstoragedimensionmodel character varying,
    refitemtrackingdimensionmodel character varying
);
 !   DROP TABLE public.itemsreleased;
       public         heap    postgres    false    6            ,           1259    140475    itemstoragedimensionmodel    TABLE     �  CREATE TABLE public.itemstoragedimensionmodel (
    refitemstoragedimensionmodel character varying NOT NULL,
    refcompany character varying NOT NULL,
    reforganisation character varying NOT NULL,
    itemstoragedimensionmodel character varying NOT NULL,
    sitegeographique boolean DEFAULT true NOT NULL,
    warehouse boolean DEFAULT true NOT NULL,
    location boolean DEFAULT true NOT NULL,
    reftrackingobject character varying NOT NULL,
    actif boolean DEFAULT true NOT NULL,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL,
    refinventorytrackingobject character varying NOT NULL
);
 -   DROP TABLE public.itemstoragedimensionmodel;
       public         heap    postgres    false    6            �            1259    62930    itemtracking    TABLE     �   CREATE TABLE public.itemtracking (
    refitemtracking character varying NOT NULL,
    itemtracking character varying NOT NULL
);
     DROP TABLE public.itemtracking;
       public         heap    postgres    false    6            *           1259    140455    itemtrackingdimensionmodel    TABLE     �  CREATE TABLE public.itemtrackingdimensionmodel (
    refitemtrackingdimensionmodel character varying NOT NULL,
    refcompany character varying NOT NULL,
    reforganisation character varying NOT NULL,
    itemtrackingdimensionmodel character varying NOT NULL,
    batch boolean DEFAULT true NOT NULL,
    serial boolean DEFAULT true NOT NULL,
    palette boolean DEFAULT true NOT NULL,
    owner boolean DEFAULT true NOT NULL,
    refinventorytrackingobject character varying NOT NULL,
    actif boolean DEFAULT true NOT NULL,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL
);
 .   DROP TABLE public.itemtrackingdimensionmodel;
       public         heap    postgres    false    6            �            1259    63269    language    TABLE     v   CREATE TABLE public.language (
    reflanguage character varying NOT NULL,
    language character varying NOT NULL
);
    DROP TABLE public.language;
       public         heap    postgres    false    6                       1259    91998    location    TABLE     �  CREATE TABLE public.location (
    reflocation character varying(20) NOT NULL,
    refcompany character varying NOT NULL,
    reforganisation character varying NOT NULL,
    actif boolean DEFAULT true NOT NULL,
    refaisle character varying NOT NULL,
    pickingpriority integer DEFAULT 0 NOT NULL,
    locked boolean DEFAULT false NOT NULL,
    lockedforsale boolean DEFAULT false NOT NULL,
    oneitem boolean DEFAULT false NOT NULL,
    oneserial boolean DEFAULT false NOT NULL,
    onebatch boolean DEFAULT false NOT NULL,
    defaultforoneitem boolean DEFAULT false NOT NULL,
    pickinglocation boolean DEFAULT false NOT NULL,
    outofuse boolean DEFAULT false NOT NULL,
    abcclass public.location_abcclass_enum DEFAULT 'NONE'::public.location_abcclass_enum NOT NULL,
    shelf integer NOT NULL,
    floor integer NOT NULL,
    section integer NOT NULL,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.location;
       public         heap    postgres    false    1019    6    1019            �            1259    91674    organisation    TABLE       CREATE TABLE public.organisation (
    reforganisation character varying NOT NULL,
    organisation character varying NOT NULL,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL
);
     DROP TABLE public.organisation;
       public         heap    postgres    false    6            �            1259    91734 
   parametres    TABLE     �  CREATE TABLE public.parametres (
    "order" integer NOT NULL,
    refparametre character varying NOT NULL,
    refcompany character varying NOT NULL,
    reforganisation character varying NOT NULL,
    parametre character varying NOT NULL,
    actif boolean NOT NULL,
    reftypeparametre character varying NOT NULL,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.parametres;
       public         heap    postgres    false    6            �            1259    91724    parametresattributs    TABLE     �  CREATE TABLE public.parametresattributs (
    refcompany character varying NOT NULL,
    refparametre character varying NOT NULL,
    value character varying NOT NULL,
    reforganisation character varying NOT NULL,
    actif boolean NOT NULL,
    isdefault boolean DEFAULT false NOT NULL,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL
);
 '   DROP TABLE public.parametresattributs;
       public         heap    postgres    false    6            �            1259    91703    parametresheaders    TABLE     �  CREATE TABLE public.parametresheaders (
    idheaderparametre integer NOT NULL,
    refheaderparametre character varying NOT NULL,
    refcompany character varying NOT NULL,
    reforganisation character varying NOT NULL,
    reftypeparametre character varying NOT NULL,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL
);
 %   DROP TABLE public.parametresheaders;
       public         heap    postgres    false    6            �            1259    91702 '   parametresheaders_idheaderparametre_seq    SEQUENCE     �   CREATE SEQUENCE public.parametresheaders_idheaderparametre_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.parametresheaders_idheaderparametre_seq;
       public          postgres    false    231    6            p           0    0 '   parametresheaders_idheaderparametre_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.parametresheaders_idheaderparametre_seq OWNED BY public.parametresheaders.idheaderparametre;
          public          postgres    false    230            �            1259    91715    parametreslines    TABLE     �  CREATE TABLE public.parametreslines (
    idheaderparametre integer NOT NULL,
    refcompany character varying NOT NULL,
    refparametre character varying NOT NULL,
    value character varying NOT NULL,
    reforganisation character varying NOT NULL,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL
);
 #   DROP TABLE public.parametreslines;
       public         heap    postgres    false    6            �            1259    62978    parametrestypes    TABLE     �   CREATE TABLE public.parametrestypes (
    reftypeparametre character varying NOT NULL,
    typeparametre character varying NOT NULL
);
 #   DROP TABLE public.parametrestypes;
       public         heap    postgres    false    6            �            1259    91833    paymentcondition    TABLE     N  CREATE TABLE public.paymentcondition (
    refpaymentcondition character varying NOT NULL,
    paymentcondition character varying NOT NULL,
    months integer NOT NULL,
    days integer NOT NULL,
    modepaiement character varying NOT NULL,
    refcompany character varying NOT NULL,
    reforganisation character varying NOT NULL
);
 $   DROP TABLE public.paymentcondition;
       public         heap    postgres    false    6            �            1259    91840    paymentmethod    TABLE     �   CREATE TABLE public.paymentmethod (
    refpaymentmethod character varying NOT NULL,
    paymentmethod character varying NOT NULL,
    refcompany character varying NOT NULL,
    reforganisation character varying NOT NULL
);
 !   DROP TABLE public.paymentmethod;
       public         heap    postgres    false    6            �            1259    91761 
   pricemodel    TABLE     �  CREATE TABLE public.pricemodel (
    refpricemodel character varying NOT NULL,
    refcompany character varying NOT NULL,
    reforganisation character varying NOT NULL,
    pricemodel character varying NOT NULL,
    actif boolean NOT NULL,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.pricemodel;
       public         heap    postgres    false    6                       1259    92106    purchaseorder    TABLE     2  CREATE TABLE public.purchaseorder (
    refpurchaseorder character varying NOT NULL,
    refcompany character varying NOT NULL,
    reforganisation character varying NOT NULL,
    refpurchaseorderstatuts character varying NOT NULL,
    refvendor character varying NOT NULL,
    refpurchaserequisition character varying NOT NULL,
    refcurrency character varying NOT NULL,
    reftaxegroup character varying NOT NULL,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL
);
 !   DROP TABLE public.purchaseorder;
       public         heap    postgres    false    6                       1259    92086    purchaseorderlines    TABLE     �  CREATE TABLE public.purchaseorderlines (
    purchaseorderlineid integer NOT NULL,
    idlinepurchaserequisition integer NOT NULL,
    refpurchaseorder character varying NOT NULL,
    refcompany character varying NOT NULL,
    reforganisation character varying NOT NULL,
    refitem character varying NOT NULL,
    quantity numeric(10,2) DEFAULT '0'::numeric NOT NULL,
    price numeric(10,2) DEFAULT '0'::numeric NOT NULL,
    lineamountttcvalue numeric(10,2) DEFAULT '0'::numeric NOT NULL,
    lineamounttvavalue numeric(10,2) DEFAULT '0'::numeric NOT NULL,
    lineamounthtvalue numeric(10,2) DEFAULT '0'::numeric NOT NULL,
    linepricehtvalue numeric(10,2) DEFAULT '0'::numeric NOT NULL,
    linepricettcvalue numeric(10,2) DEFAULT '0'::numeric NOT NULL,
    discountvalue numeric(10,2) DEFAULT '0'::numeric NOT NULL,
    discountpercentage numeric(10,2) DEFAULT '0'::numeric NOT NULL,
    reftaxe character varying NOT NULL,
    taxevalue numeric(10,2) DEFAULT '0'::numeric NOT NULL,
    idheaderparametre integer,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL
);
 &   DROP TABLE public.purchaseorderlines;
       public         heap    postgres    false    6                       1259    92085 *   purchaseorderlines_purchaseorderlineid_seq    SEQUENCE     �   CREATE SEQUENCE public.purchaseorderlines_purchaseorderlineid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.purchaseorderlines_purchaseorderlineid_seq;
       public          postgres    false    6    269            q           0    0 *   purchaseorderlines_purchaseorderlineid_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public.purchaseorderlines_purchaseorderlineid_seq OWNED BY public.purchaseorderlines.purchaseorderlineid;
          public          postgres    false    268            �            1259    66874    purchaseorderstatuts    TABLE     �   CREATE TABLE public.purchaseorderstatuts (
    refpurchaseorderstatuts character varying NOT NULL,
    purchaseorderstatuts character varying NOT NULL
);
 (   DROP TABLE public.purchaseorderstatuts;
       public         heap    postgres    false    6            �            1259    91770    purchaserequisition    TABLE       CREATE TABLE public.purchaserequisition (
    refpurchaserequisition character varying NOT NULL,
    refcompany character varying NOT NULL,
    reforganisation character varying NOT NULL,
    refpurchaserequisitionstatuts character varying NOT NULL,
    preparator character varying NOT NULL,
    requisitionobjectif character varying,
    requisitiondate timestamp with time zone DEFAULT now() NOT NULL,
    details character varying,
    submittedby character varying,
    datesubmittion timestamp without time zone,
    approvedby character varying,
    dateapprovement timestamp without time zone,
    closedby character varying,
    dateclosing timestamp without time zone,
    rejectedby character varying,
    daterejection timestamp without time zone,
    description character varying(256),
    actif boolean DEFAULT true NOT NULL,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL,
    refwarehouse character varying NOT NULL
);
 '   DROP TABLE public.purchaserequisition;
       public         heap    postgres    false    6            �            1259    91894    purchaserequisitionlines    TABLE     �  CREATE TABLE public.purchaserequisitionlines (
    id integer NOT NULL,
    refvendor character varying,
    refpurchaserequisition character varying NOT NULL,
    refcompany character varying NOT NULL,
    reforganisation character varying NOT NULL,
    refitem character varying,
    quantity numeric(10,2) DEFAULT '0'::numeric NOT NULL,
    price numeric(10,2) DEFAULT '0'::numeric NOT NULL,
    discountvalue numeric(10,2) DEFAULT '0'::numeric NOT NULL,
    discountpercentage numeric(10,2) DEFAULT '0'::numeric NOT NULL,
    lineamounthtvalue numeric(10,2) DEFAULT '0'::numeric NOT NULL,
    linepricehtvalue numeric(10,2) DEFAULT '0'::numeric NOT NULL,
    idheaderparametre integer,
    refcurrency character varying,
    reftaxe character varying,
    taxevalue numeric(10,2) DEFAULT '0'::numeric,
    linepricettcvalue numeric(10,2) DEFAULT '0'::numeric,
    lineamountttcvalue numeric(10,2) DEFAULT '0'::numeric,
    lineamounttvavalue numeric(10,2) DEFAULT '0'::numeric,
    reftaxegroup character varying,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL,
    refpurchaserequisitionstatuts character varying
);
 ,   DROP TABLE public.purchaserequisitionlines;
       public         heap    postgres    false    6            �            1259    91893    purchaserequisitionlines_id_seq    SEQUENCE     �   CREATE SEQUENCE public.purchaserequisitionlines_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.purchaserequisitionlines_id_seq;
       public          postgres    false    6    253            r           0    0    purchaserequisitionlines_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.purchaserequisitionlines_id_seq OWNED BY public.purchaserequisitionlines.id;
          public          postgres    false    252            �            1259    66776    purchaserequisitionstatuts    TABLE     �   CREATE TABLE public.purchaserequisitionstatuts (
    refpurchaserequisitionstatuts character varying NOT NULL,
    purchaserequisitionstatuts character varying NOT NULL
);
 .   DROP TABLE public.purchaserequisitionstatuts;
       public         heap    postgres    false    6            �            1259    91692    sitegeographic    TABLE     �  CREATE TABLE public.sitegeographic (
    refcompany character varying NOT NULL,
    refsitegeographic character varying NOT NULL,
    reforganisation character varying NOT NULL,
    sitegeographic character varying NOT NULL,
    description character varying,
    actif boolean DEFAULT true NOT NULL,
    idheaderparametre integer,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL
);
 "   DROP TABLE public.sitegeographic;
       public         heap    postgres    false    6            �            1259    91812    taxe    TABLE     �   CREATE TABLE public.taxe (
    reftaxe character varying NOT NULL,
    taxe character varying NOT NULL,
    refcompany character varying NOT NULL,
    reforganisation character varying NOT NULL,
    refcurrency character varying
);
    DROP TABLE public.taxe;
       public         heap    postgres    false    6            �            1259    91805    taxebygroup    TABLE     �   CREATE TABLE public.taxebygroup (
    reftaxegroup character varying NOT NULL,
    reftaxe character varying NOT NULL,
    refcompany character varying NOT NULL,
    reforganisation character varying NOT NULL
);
    DROP TABLE public.taxebygroup;
       public         heap    postgres    false    6            �            1259    91798 	   taxegroup    TABLE     �   CREATE TABLE public.taxegroup (
    reftaxegroup character varying NOT NULL,
    refcompany character varying NOT NULL,
    reforganisation character varying NOT NULL,
    taxegroup character varying NOT NULL
);
    DROP TABLE public.taxegroup;
       public         heap    postgres    false    6            �            1259    91790    taxeline    TABLE       CREATE TABLE public.taxeline (
    reftaxe character varying NOT NULL,
    refcompany character varying NOT NULL,
    reforganisation character varying NOT NULL,
    datedebut date NOT NULL,
    datefin date NOT NULL,
    percentage numeric(10,2) DEFAULT '0'::numeric NOT NULL
);
    DROP TABLE public.taxeline;
       public         heap    postgres    false    6            �            1259    91752    units    TABLE     p  CREATE TABLE public.units (
    refunit character varying NOT NULL,
    reforganisation character varying NOT NULL,
    refcompany character varying NOT NULL,
    unit character varying NOT NULL,
    actif boolean NOT NULL,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.units;
       public         heap    postgres    false    6            
           1259    92064    uomclassicconversion    TABLE     �  CREATE TABLE public.uomclassicconversion (
    refcompany character varying NOT NULL,
    reforganisation character varying NOT NULL,
    refunitfrom character varying NOT NULL,
    refunitto character varying NOT NULL,
    coefficient numeric(7,2) DEFAULT '0'::numeric NOT NULL,
    actif boolean NOT NULL,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL
);
 (   DROP TABLE public.uomclassicconversion;
       public         heap    postgres    false    6            �            1259    91931    uomconversion    TABLE     �  CREATE TABLE public.uomconversion (
    refitem character varying NOT NULL,
    refcompany character varying NOT NULL,
    reforganisation character varying NOT NULL,
    refunitfrom character varying NOT NULL,
    refunitto character varying NOT NULL,
    coefficient numeric(7,2) DEFAULT '0'::numeric NOT NULL,
    actif boolean NOT NULL,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL
);
 !   DROP TABLE public.uomconversion;
       public         heap    postgres    false    6                       1259    91985    user    TABLE     �  CREATE TABLE public."user" (
    reforganisation character varying NOT NULL,
    matricule character varying NOT NULL,
    login character varying NOT NULL,
    pwd character varying NOT NULL,
    actif boolean NOT NULL,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL,
    lastname character varying NOT NULL,
    firstname character varying NOT NULL,
    email character varying NOT NULL
);
    DROP TABLE public."user";
       public         heap    postgres    false    6                       1259    124495    usercompanieswarehouses    TABLE     �  CREATE TABLE public.usercompanieswarehouses (
    reforganisation character varying NOT NULL,
    refcompany character varying NOT NULL,
    matricule character varying NOT NULL,
    refwarehouse character varying NOT NULL,
    canrequestpurchase boolean DEFAULT false NOT NULL,
    canreceipt boolean DEFAULT false NOT NULL,
    actif boolean DEFAULT true NOT NULL,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL
);
 +   DROP TABLE public.usercompanieswarehouses;
       public         heap    postgres    false    6                       1259    91974    usercompany    TABLE     �  CREATE TABLE public.usercompany (
    reforganisation character varying NOT NULL,
    refcompany character varying NOT NULL,
    matricule character varying NOT NULL,
    actif boolean DEFAULT true NOT NULL,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL,
    defaultrefcompany boolean DEFAULT false NOT NULL
);
    DROP TABLE public.usercompany;
       public         heap    postgres    false    6            �            1259    91781    vendor    TABLE       CREATE TABLE public.vendor (
    refvendor character varying NOT NULL,
    reforganisation character varying NOT NULL,
    refvendortype character varying NOT NULL,
    prenom character varying,
    nom character varying NOT NULL,
    ice character varying,
    if character varying,
    rc character varying,
    patente character varying,
    cnss character varying,
    ncin character varying,
    contactdescription character varying,
    contactmail character varying,
    contacttelephone character varying,
    refcurrency character varying NOT NULL,
    refvendorinvoicing character varying,
    reflanguage character varying NOT NULL,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.vendor;
       public         heap    postgres    false    6            �            1259    91819    vendorgroup    TABLE     �   CREATE TABLE public.vendorgroup (
    refvendorgroup character varying NOT NULL,
    vendorgroup character varying NOT NULL,
    refcompany character varying NOT NULL,
    reforganisation character varying NOT NULL
);
    DROP TABLE public.vendorgroup;
       public         heap    postgres    false    6            �            1259    91883    vendorreleased    TABLE     I  CREATE TABLE public.vendorreleased (
    refvendor character varying NOT NULL,
    refcompany character varying NOT NULL,
    reforganisation character varying NOT NULL,
    refvendorgroup character varying,
    refdeliverymode character varying,
    refpaymentcondition character varying,
    refpaymentmethod character varying,
    idheaderparametre integer,
    bloqued boolean DEFAULT false NOT NULL,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL,
    reftaxegroup character varying
);
 "   DROP TABLE public.vendorreleased;
       public         heap    postgres    false    6            �            1259    63234 
   vendortype    TABLE     |   CREATE TABLE public.vendortype (
    refvendortype character varying NOT NULL,
    vendortype character varying NOT NULL
);
    DROP TABLE public.vendortype;
       public         heap    postgres    false    6            �            1259    91683 	   warehouse    TABLE       CREATE TABLE public.warehouse (
    refwarehouse character varying NOT NULL,
    warehouse character varying NOT NULL,
    refcompany character varying NOT NULL,
    reforganisation character varying NOT NULL,
    refsitegeographic character varying NOT NULL,
    actif boolean NOT NULL,
    idheaderparametre integer,
    datetimecreation timestamp with time zone DEFAULT now() NOT NULL,
    datetimelastupdate timestamp with time zone DEFAULT now() NOT NULL,
    refdefaultreceivelocation character varying,
    refdefaultreceiveaisle character varying,
    refdefaultexpeditionlocation character varying,
    refdefaultexpeditionaisle character varying,
    refdefaultgoodsfabricationlocation character varying,
    refdefaultgoodsfabricationaisle character varying,
    refdefaultrawmaterialconsumptionlocation character varying,
    refdefaultrawmaterialconsumptionaisle character varying,
    refdefaultreturnlocation character varying,
    refdefaultreturnaisle character varying,
    negativephysicalstock boolean DEFAULT false
);
    DROP TABLE public.warehouse;
       public         heap    postgres    false    6            �           2604    139618 '   inventorydimension inventorydimensionid    DEFAULT     �   ALTER TABLE ONLY public.inventorydimension ALTER COLUMN inventorydimensionid SET DEFAULT nextval('public.inventorydimension_inventorydimensionid_seq'::regclass);
 V   ALTER TABLE public.inventorydimension ALTER COLUMN inventorydimensionid DROP DEFAULT;
       public          postgres    false    285    286    286            �           2604    141132 !   inventoryonhand inventoryonhandid    DEFAULT     �   ALTER TABLE ONLY public.inventoryonhand ALTER COLUMN inventoryonhandid SET DEFAULT nextval('public.inventoryonhand_inventoryonhandid_seq'::regclass);
 P   ALTER TABLE public.inventoryonhand ALTER COLUMN inventoryonhandid DROP DEFAULT;
       public          postgres    false    309    308            �           2604    139645 4   inventoryreceivingjournalline receivingjournallineid    DEFAULT     �   ALTER TABLE ONLY public.inventoryreceivingjournalline ALTER COLUMN receivingjournallineid SET DEFAULT nextval('public.inventoryreceivingjournalline_receivingjournallineid_seq'::regclass);
 c   ALTER TABLE public.inventoryreceivingjournalline ALTER COLUMN receivingjournallineid DROP DEFAULT;
       public          postgres    false    289    290    290            z           2604    139569 +   inventorytransaction inventorytransactionid    DEFAULT     �   ALTER TABLE ONLY public.inventorytransaction ALTER COLUMN inventorytransactionid SET DEFAULT nextval('public.inventorytransaction_inventorytransactionid_seq'::regclass);
 Z   ALTER TABLE public.inventorytransaction ALTER COLUMN inventorytransactionid DROP DEFAULT;
       public          postgres    false    279    280    280            w           2604    139544 8   inventorytransactionorigin refinventorytransactionorigin    DEFAULT     �   ALTER TABLE ONLY public.inventorytransactionorigin ALTER COLUMN refinventorytransactionorigin SET DEFAULT nextval('public.inventorytransactionorigin_refinventorytransactionorigin_seq'::regclass);
 g   ALTER TABLE public.inventorytransactionorigin ALTER COLUMN refinventorytransactionorigin DROP DEFAULT;
       public          postgres    false    275    276    276            �           2604    139663 -   inventorytransferline inventorytransferlineid    DEFAULT     �   ALTER TABLE ONLY public.inventorytransferline ALTER COLUMN inventorytransferlineid SET DEFAULT nextval('public.inventorytransferline_inventorytransferlineid_seq'::regclass);
 \   ALTER TABLE public.inventorytransferline ALTER COLUMN inventorytransferlineid DROP DEFAULT;
       public          postgres    false    292    293    293            �           2604    91706 #   parametresheaders idheaderparametre    DEFAULT     �   ALTER TABLE ONLY public.parametresheaders ALTER COLUMN idheaderparametre SET DEFAULT nextval('public.parametresheaders_idheaderparametre_seq'::regclass);
 R   ALTER TABLE public.parametresheaders ALTER COLUMN idheaderparametre DROP DEFAULT;
       public          postgres    false    231    230    231            _           2604    92089 &   purchaseorderlines purchaseorderlineid    DEFAULT     �   ALTER TABLE ONLY public.purchaseorderlines ALTER COLUMN purchaseorderlineid SET DEFAULT nextval('public.purchaseorderlines_purchaseorderlineid_seq'::regclass);
 U   ALTER TABLE public.purchaseorderlines ALTER COLUMN purchaseorderlineid DROP DEFAULT;
       public          postgres    false    268    269    269                       2604    91897    purchaserequisitionlines id    DEFAULT     �   ALTER TABLE ONLY public.purchaserequisitionlines ALTER COLUMN id SET DEFAULT nextval('public.purchaserequisitionlines_id_seq'::regclass);
 J   ALTER TABLE public.purchaserequisitionlines ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    252    253    253            6          0    92025    address 
   TABLE DATA           �   COPY public.address (refaddress, title, refcompany, reforganisation, location, refcity, state, zipcode, refcountry, actif, datetimecreation, datetimelastupdate) FROM stdin;
    public          postgres    false    262   �)      7          0    92037    addresssitegeographics 
   TABLE DATA           �   COPY public.addresssitegeographics (refaddress, refcompany, reforganisation, refsitegeographic, refaddresstype, datetimecreation, datetimelastupdate) FROM stdin;
    public          postgres    false    263   x+      5          0    92018    addresstype 
   TABLE DATA           B   COPY public.addresstype (refaddresstype, addresstype) FROM stdin;
    public          postgres    false    261   ,      ?          0    108109    addressvendors 
   TABLE DATA           �   COPY public.addressvendors (refaddress, refcompany, reforganisation, refvendor, refaddresstype, datetimecreation, datetimelastupdate) FROM stdin;
    public          postgres    false    271   X,      8          0    92046    addresswarehouses 
   TABLE DATA           �   COPY public.addresswarehouses (refaddress, refcompany, reforganisation, refwarehouse, refaddresstype, datetimecreation, datetimelastupdate) FROM stdin;
    public          postgres    false    264   �,      0          0    91941    aisle 
   TABLE DATA           �   COPY public.aisle (refaisle, refarea, refcompany, reforganisation, aisle, reffurnituretype, xshelf, xtype, yfloor, ytype, zsection, ztype, prefix, separator, actif, heightseparator, widthseparator, datetimecreation, datetimelastupdate) FROM stdin;
    public          postgres    false    256   W-                0    91743    area 
   TABLE DATA           �   COPY public.area (refarea, area, refcompany, reforganisation, refwarehouse, actif, datetimecreation, datetimelastupdate) FROM stdin;
    public          postgres    false    235   �-      )          0    91856 
   categories 
   TABLE DATA           �   COPY public.categories (refcategoriesgroup, refcategories, refcompany, reforganisation, refparentcategoriesgroup, refparentcategories, refparentcompany, refparentorganisation, category, level, actif, datetimecreation, datetimelastupdate) FROM stdin;
    public          postgres    false    249   �.      *          0    91865    categoriesgroup 
   TABLE DATA           �   COPY public.categoriesgroup (refcategoriesgroup, refcompany, reforganisation, categoriesgroup, refcontrolobject, actif, datetimecreation, datetimelastupdate) FROM stdin;
    public          postgres    false    250   �0      (          0    91847    categoriesitems 
   TABLE DATA           �   COPY public.categoriesitems (refcategoriesgroup, refcategories, refcompany, reforganisation, refitem, datetimecreation, datetimelastupdate) FROM stdin;
    public          postgres    false    248   �1                0    83589    city 
   TABLE DATA           9   COPY public.city (refcity, refcountry, city) FROM stdin;
    public          postgres    false    226   "2      1          0    91954    company 
   TABLE DATA           �   COPY public.company (refcompany, reforganisation, refcurrency, company, tel1, email1, responsable1, responsable2, tel2, email2, actif, datetimecreation, datetimelastupdate) FROM stdin;
    public          postgres    false    257   v2                0    63901    controlobject 
   TABLE DATA           �   COPY public.controlobject (refcontrolobject, controlobject, okforgroupcategories, okforworkflows, generatedpk, currentindex, prefix, startwith, okforaddress) FROM stdin;
    public          postgres    false    222   a3                0    83582    country 
   TABLE DATA           6   COPY public.country (refcountry, country) FROM stdin;
    public          postgres    false    225   T4                0    63227    currency 
   TABLE DATA           9   COPY public.currency (refcurrency, currency) FROM stdin;
    public          postgres    false    219   �4      %          0    91826    deliverymode 
   TABLE DATA           b   COPY public.deliverymode (refdeliverymode, deliverymode, refcompany, reforganisation) FROM stdin;
    public          postgres    false    245   =5      
          0    63117    furnituretype 
   TABLE DATA           H   COPY public.furnituretype (reffurnituretype, furnituretype) FROM stdin;
    public          postgres    false    218   �5      N          0    139615    inventorydimension 
   TABLE DATA           8  COPY public.inventorydimension (inventorydimensionid, refinventorydimensionserial, refinventorydimensionowner, refinventorydimensionpallet, reflocation, refaisle, refarea, refwarehouse, refsitegeographic, refcompany, reforganisation, datetimecreation, datetimelastupdate, refinventorydimensionbatch) FROM stdin;
    public          postgres    false    286   �5      L          0    139605    inventorydimensionbatch 
   TABLE DATA           �   COPY public.inventorydimensionbatch (refinventorydimensionbatch, inventorydimensionbatch, datetimecreation, datetimelastupdate) FROM stdin;
    public          postgres    false    284   �5      `          0    140849    inventorydimensionbatchitem 
   TABLE DATA           �   COPY public.inventorydimensionbatchitem (refinventorydimensionbatch, refitem, refcompany, reforganisation, datetimecreation, datetimelastupdate) FROM stdin;
    public          postgres    false    304   �5      J          0    139587    inventorydimensionowner 
   TABLE DATA           �   COPY public.inventorydimensionowner (refinventorydimensionowner, inventoryowner, datetimecreation, datetimelastupdate) FROM stdin;
    public          postgres    false    282   6      ^          0    140831    inventorydimensionowneritem 
   TABLE DATA           �   COPY public.inventorydimensionowneritem (refinventorydimensionowner, refitem, refcompany, reforganisation, datetimecreation, datetimelastupdate) FROM stdin;
    public          postgres    false    302   "6      I          0    139578    inventorydimensionpallet 
   TABLE DATA           �   COPY public.inventorydimensionpallet (refinventorydimensionpallet, inventorydimensionpallet, datetimecreation, datetimelastupdate) FROM stdin;
    public          postgres    false    281   ?6      ]          0    140822    inventorydimensionpalletitem 
   TABLE DATA           �   COPY public.inventorydimensionpalletitem (refinventorydimensionpallet, refitem, refcompany, reforganisation, datetimecreation, datetimelastupdate) FROM stdin;
    public          postgres    false    301   \6      K          0    139596    inventorydimensionserial 
   TABLE DATA           �   COPY public.inventorydimensionserial (refinventorydimensionserial, inventorydimensionserial, datetimecreation, datetimelastupdate) FROM stdin;
    public          postgres    false    283   y6      _          0    140840    inventorydimensionserialitem 
   TABLE DATA           �   COPY public.inventorydimensionserialitem (refinventorydimensionserial, refitem, refcompany, reforganisation, datetimecreation, datetimelastupdate) FROM stdin;
    public          postgres    false    303   �6      a          0    141124    inventoryonhand 
   TABLE DATA           0  COPY public.inventoryonhand (reforganisation, refcompany, refitem, refinventunit, unit, refcurrency, item, itemdescription, searchname, inventorydimensionid, refinventorydimensionserial, refinventorydimensionowner, refinventorydimensionpallet, refinventorydimensionbatch, refsitegeographic, refwarehouse, refarea, refaisle, reflocation, physicalavailable, physicalreserve, totalphysicalavailable, totalordredissue, physicalpicked, totalarrivalreceipt, totalordredreceipt, closedtransaction, datetimecreation, datetimelastupdate, inventoryonhandid) FROM stdin;
    public          postgres    false    308   �6      O          0    139625    inventoryreceivingjournal 
   TABLE DATA           �   COPY public.inventoryreceivingjournal (refinventoryreceivingjournal, reforganisation, refcompany, refwarehouse, refinventoryreceivingjournalstatus, refpurchaseorder, refsitegeographic, datetimecreation, datetimelastupdate) FROM stdin;
    public          postgres    false    287   �6      R          0    139642    inventoryreceivingjournalline 
   TABLE DATA           U  COPY public.inventoryreceivingjournalline (reforganisation, refcompany, receivingjournallineid, refinventoryreceivingjournal, inventorydimensionid, refitem, qty, refinventunit, reftransactionunit, coefficient, unitprice, refinventoryreceivingjournalstatus, purchaseorderlineid, refcurrency, datetimecreation, datetimelastupdate) FROM stdin;
    public          postgres    false    290   �6      P          0    139634    inventoryreceivingjournalstatus 
   TABLE DATA           ~   COPY public.inventoryreceivingjournalstatus (refinventoryreceivingjournalstatus, inventoryreceivingjournalstatus) FROM stdin;
    public          postgres    false    288   
7      [          0    140468    inventorytrackingobject 
   TABLE DATA           f   COPY public.inventorytrackingobject (refinventorytrackingobject, inventorytrackingobject) FROM stdin;
    public          postgres    false    299   '7      H          0    139566    inventorytransaction 
   TABLE DATA           '  COPY public.inventorytransaction (reforganisation, refcompany, inventorytransactionid, refinventorytransactionorigin, inventorydimensionid, refitem, physicalcost, financialcost, physicaldate, financialdate, priceunit, refinventunit, reftransactionunit, coefficient, refinventorytransactionstatusoutput, refinventorytransactionstatusinput, refcurrency, datetimecreation, datetimelastupdate, inventqty, transactqty, financialcosttransaction, physicalcosttransaction, financialamounttransaction, physicalamounttransaction, closedtransaction) FROM stdin;
    public          postgres    false    280   D7      D          0    139541    inventorytransactionorigin 
   TABLE DATA           �   COPY public.inventorytransactionorigin (refinventorytransactionorigin, reforganisation, refcompany, refoperation, refinventorytransactionorigintype, refitem, datetimecreation, datetimelastupdate, actif) FROM stdin;
    public          postgres    false    276   a7      B          0    139533    inventorytransactionorigintype 
   TABLE DATA           {   COPY public.inventorytransactionorigintype (refinventorytransactionorigintype, inventorytransactionorigintype) FROM stdin;
    public          postgres    false    274   ~7      F          0    139558    inventorytransactionstatusinput 
   TABLE DATA           �   COPY public.inventorytransactionstatusinput (refinventorytransactionstatusinput, inventorytransactionstatusinput, inventorytransactionstatusinputdescription, abrv) FROM stdin;
    public          postgres    false    278   8      E          0    139551     inventorytransactionstatusoutput 
   TABLE DATA           �   COPY public.inventorytransactionstatusoutput (refinventorytransactionstatusoutput, inventorytransactionstatusoutput, inventorytransactionstatusoutputdescription, abrv) FROM stdin;
    public          postgres    false    277   �9      W          0    139677    inventorytransfer 
   TABLE DATA           /  COPY public.inventorytransfer (refinventorytransfer, reforganisation, refcompany, refwarehousefrom, refinventorytransferstatus, refwarehousetransitfrom, refwarehouseto, refinventorytransfertype, reflocationfrom, reflocationto, refaislefrom, refaisleto, datetimecreation, datetimelastupdate) FROM stdin;
    public          postgres    false    295   �;      U          0    139660    inventorytransferline 
   TABLE DATA           T  COPY public.inventorytransferline (reforganisation, refcompany, inventorytransferlineid, refinventorytransfer, inventorydimensionid, refitem, qty, qtyremaining, refunitinvent, refunittrans, coefficient, priceunit, refinventorytransferstatus, refcurrency, datetimecreation, datetimelastupdate, refinventunit, reftransactionunit) FROM stdin;
    public          postgres    false    293   �;      V          0    139670    inventorytransferstatus 
   TABLE DATA           f   COPY public.inventorytransferstatus (refinventorytransferstatus, inventorytransferstatus) FROM stdin;
    public          postgres    false    294   �;      S          0    139652    inventorytransfertype 
   TABLE DATA           `   COPY public.inventorytransfertype (refinventorytransfertype, inventorytransfertype) FROM stdin;
    public          postgres    false    291   <      X          0    140437    inventoryvaluationmethode 
   TABLE DATA           l   COPY public.inventoryvaluationmethode (refinventoryvaluationmethode, inventoryvaluationmethode) FROM stdin;
    public          postgres    false    296    <      ;          0    92074 	   itemclass 
   TABLE DATA           �   COPY public.itemclass (refitem, reforganisation, refcompany, refwarehouse, class, actif, datetimecreation, datetimelastupdate) FROM stdin;
    public          postgres    false    267   =<      Y          0    140444 	   itemmodel 
   TABLE DATA           �   COPY public.itemmodel (refitemmodel, refcompany, reforganisation, itemmodel, actif, allownegativephysicalinventory, storedproduct, datetimecreation, datetimelastupdate, refinventoryvaluationmethode) FROM stdin;
    public          postgres    false    297   �<      9          0    92055    items 
   TABLE DATA           �   COPY public.items (refitem, reforganisation, item, barcode, itemdescription, searchname, datetimecreation, datetimelastupdate) FROM stdin;
    public          postgres    false    265   �<      @          0    116246 
   itemsgroup 
   TABLE DATA           �   COPY public.itemsgroup (refitemgroup, itemgroup, refcompany, reforganisation, actif, datetimecreation, datetimelastupdate) FROM stdin;
    public          postgres    false    272   �=      .          0    91914    itemsreleased 
   TABLE DATA           �  COPY public.itemsreleased (refitem, refcompany, reforganisation, stopedpurch, stopedsales, stopedinvent, safetystock, refunitinvent, refunitsales, refunitpurch, refunitorder, expirationdate, bestbeforetime, removaltime, alerttime, reftaxepurchase, reftaxesales, idheaderparametre, datetimecreation, datetimelastupdate, refitemgroup, purchaseprice, salesprice, purchasepriceunit, salespriceunit, refitemmodel, refitemstoragedimensionmodel, refitemtrackingdimensionmodel) FROM stdin;
    public          postgres    false    254   >      \          0    140475    itemstoragedimensionmodel 
   TABLE DATA             COPY public.itemstoragedimensionmodel (refitemstoragedimensionmodel, refcompany, reforganisation, itemstoragedimensionmodel, sitegeographique, warehouse, location, reftrackingobject, actif, datetimecreation, datetimelastupdate, refinventorytrackingobject) FROM stdin;
    public          postgres    false    300   ?                0    62930    itemtracking 
   TABLE DATA           E   COPY public.itemtracking (refitemtracking, itemtracking) FROM stdin;
    public          postgres    false    216   3?      Z          0    140455    itemtrackingdimensionmodel 
   TABLE DATA           �   COPY public.itemtrackingdimensionmodel (refitemtrackingdimensionmodel, refcompany, reforganisation, itemtrackingdimensionmodel, batch, serial, palette, owner, refinventorytrackingobject, actif, datetimecreation, datetimelastupdate) FROM stdin;
    public          postgres    false    298   m?                0    63269    language 
   TABLE DATA           9   COPY public.language (reflanguage, language) FROM stdin;
    public          postgres    false    221   �?      4          0    91998    location 
   TABLE DATA             COPY public.location (reflocation, refcompany, reforganisation, actif, refaisle, pickingpriority, locked, lockedforsale, oneitem, oneserial, onebatch, defaultforoneitem, pickinglocation, outofuse, abcclass, shelf, floor, section, datetimecreation, datetimelastupdate) FROM stdin;
    public          postgres    false    260   �?                0    91674    organisation 
   TABLE DATA           k   COPY public.organisation (reforganisation, organisation, datetimecreation, datetimelastupdate) FROM stdin;
    public          postgres    false    227   �@                0    91734 
   parametres 
   TABLE DATA           �   COPY public.parametres ("order", refparametre, refcompany, reforganisation, parametre, actif, reftypeparametre, datetimecreation, datetimelastupdate) FROM stdin;
    public          postgres    false    234   A                0    91724    parametresattributs 
   TABLE DATA           �   COPY public.parametresattributs (refcompany, refparametre, value, reforganisation, actif, isdefault, datetimecreation, datetimelastupdate) FROM stdin;
    public          postgres    false    233   �A                0    91703    parametresheaders 
   TABLE DATA           �   COPY public.parametresheaders (idheaderparametre, refheaderparametre, refcompany, reforganisation, reftypeparametre, datetimecreation, datetimelastupdate) FROM stdin;
    public          postgres    false    231   �B                0    91715    parametreslines 
   TABLE DATA           �   COPY public.parametreslines (idheaderparametre, refcompany, refparametre, value, reforganisation, datetimecreation, datetimelastupdate) FROM stdin;
    public          postgres    false    232   �C      	          0    62978    parametrestypes 
   TABLE DATA           J   COPY public.parametrestypes (reftypeparametre, typeparametre) FROM stdin;
    public          postgres    false    217   �D      &          0    91833    paymentcondition 
   TABLE DATA           �   COPY public.paymentcondition (refpaymentcondition, paymentcondition, months, days, modepaiement, refcompany, reforganisation) FROM stdin;
    public          postgres    false    246   �D      '          0    91840    paymentmethod 
   TABLE DATA           e   COPY public.paymentmethod (refpaymentmethod, paymentmethod, refcompany, reforganisation) FROM stdin;
    public          postgres    false    247   E                0    91761 
   pricemodel 
   TABLE DATA           �   COPY public.pricemodel (refpricemodel, refcompany, reforganisation, pricemodel, actif, datetimecreation, datetimelastupdate) FROM stdin;
    public          postgres    false    237   �E      >          0    92106    purchaseorder 
   TABLE DATA           �   COPY public.purchaseorder (refpurchaseorder, refcompany, reforganisation, refpurchaseorderstatuts, refvendor, refpurchaserequisition, refcurrency, reftaxegroup, datetimecreation, datetimelastupdate) FROM stdin;
    public          postgres    false    270   %F      =          0    92086    purchaseorderlines 
   TABLE DATA           u  COPY public.purchaseorderlines (purchaseorderlineid, idlinepurchaserequisition, refpurchaseorder, refcompany, reforganisation, refitem, quantity, price, lineamountttcvalue, lineamounttvavalue, lineamounthtvalue, linepricehtvalue, linepricettcvalue, discountvalue, discountpercentage, reftaxe, taxevalue, idheaderparametre, datetimecreation, datetimelastupdate) FROM stdin;
    public          postgres    false    269   BF                0    66874    purchaseorderstatuts 
   TABLE DATA           ]   COPY public.purchaseorderstatuts (refpurchaseorderstatuts, purchaseorderstatuts) FROM stdin;
    public          postgres    false    224   _F                0    91770    purchaserequisition 
   TABLE DATA           p  COPY public.purchaserequisition (refpurchaserequisition, refcompany, reforganisation, refpurchaserequisitionstatuts, preparator, requisitionobjectif, requisitiondate, details, submittedby, datesubmittion, approvedby, dateapprovement, closedby, dateclosing, rejectedby, daterejection, description, actif, datetimecreation, datetimelastupdate, refwarehouse) FROM stdin;
    public          postgres    false    238   �F      -          0    91894    purchaserequisitionlines 
   TABLE DATA           �  COPY public.purchaserequisitionlines (id, refvendor, refpurchaserequisition, refcompany, reforganisation, refitem, quantity, price, discountvalue, discountpercentage, lineamounthtvalue, linepricehtvalue, idheaderparametre, refcurrency, reftaxe, taxevalue, linepricettcvalue, lineamountttcvalue, lineamounttvavalue, reftaxegroup, datetimecreation, datetimelastupdate, refpurchaserequisitionstatuts) FROM stdin;
    public          postgres    false    253   uG                0    66776    purchaserequisitionstatuts 
   TABLE DATA           o   COPY public.purchaserequisitionstatuts (refpurchaserequisitionstatuts, purchaserequisitionstatuts) FROM stdin;
    public          postgres    false    223   ;H                0    91692    sitegeographic 
   TABLE DATA           �   COPY public.sitegeographic (refcompany, refsitegeographic, reforganisation, sitegeographic, description, actif, idheaderparametre, datetimecreation, datetimelastupdate) FROM stdin;
    public          postgres    false    229   �H      #          0    91812    taxe 
   TABLE DATA           W   COPY public.taxe (reftaxe, taxe, refcompany, reforganisation, refcurrency) FROM stdin;
    public          postgres    false    243   RI      "          0    91805    taxebygroup 
   TABLE DATA           Y   COPY public.taxebygroup (reftaxegroup, reftaxe, refcompany, reforganisation) FROM stdin;
    public          postgres    false    242   �I      !          0    91798 	   taxegroup 
   TABLE DATA           Y   COPY public.taxegroup (reftaxegroup, refcompany, reforganisation, taxegroup) FROM stdin;
    public          postgres    false    241   IJ                 0    91790    taxeline 
   TABLE DATA           h   COPY public.taxeline (reftaxe, refcompany, reforganisation, datedebut, datefin, percentage) FROM stdin;
    public          postgres    false    240   �J                0    91752    units 
   TABLE DATA           x   COPY public.units (refunit, reforganisation, refcompany, unit, actif, datetimecreation, datetimelastupdate) FROM stdin;
    public          postgres    false    236   gK      :          0    92064    uomclassicconversion 
   TABLE DATA           �   COPY public.uomclassicconversion (refcompany, reforganisation, refunitfrom, refunitto, coefficient, actif, datetimecreation, datetimelastupdate) FROM stdin;
    public          postgres    false    266   )L      /          0    91931    uomconversion 
   TABLE DATA           �   COPY public.uomconversion (refitem, refcompany, reforganisation, refunitfrom, refunitto, coefficient, actif, datetimecreation, datetimelastupdate) FROM stdin;
    public          postgres    false    255   �L      3          0    91985    user 
   TABLE DATA           �   COPY public."user" (reforganisation, matricule, login, pwd, actif, datetimecreation, datetimelastupdate, lastname, firstname, email) FROM stdin;
    public          postgres    false    259   �M      A          0    124495    usercompanieswarehouses 
   TABLE DATA           �   COPY public.usercompanieswarehouses (reforganisation, refcompany, matricule, refwarehouse, canrequestpurchase, canreceipt, actif, datetimecreation, datetimelastupdate) FROM stdin;
    public          postgres    false    273   @O      2          0    91974    usercompany 
   TABLE DATA           �   COPY public.usercompany (reforganisation, refcompany, matricule, actif, datetimecreation, datetimelastupdate, defaultrefcompany) FROM stdin;
    public          postgres    false    258   �O                0    91781    vendor 
   TABLE DATA             COPY public.vendor (refvendor, reforganisation, refvendortype, prenom, nom, ice, if, rc, patente, cnss, ncin, contactdescription, contactmail, contacttelephone, refcurrency, refvendorinvoicing, reflanguage, datetimecreation, datetimelastupdate) FROM stdin;
    public          postgres    false    239   �P      $          0    91819    vendorgroup 
   TABLE DATA           _   COPY public.vendorgroup (refvendorgroup, vendorgroup, refcompany, reforganisation) FROM stdin;
    public          postgres    false    244   |Q      +          0    91883    vendorreleased 
   TABLE DATA           �   COPY public.vendorreleased (refvendor, refcompany, reforganisation, refvendorgroup, refdeliverymode, refpaymentcondition, refpaymentmethod, idheaderparametre, bloqued, datetimecreation, datetimelastupdate, reftaxegroup) FROM stdin;
    public          postgres    false    251   �Q                0    63234 
   vendortype 
   TABLE DATA           ?   COPY public.vendortype (refvendortype, vendortype) FROM stdin;
    public          postgres    false    220   yR                0    91683 	   warehouse 
   TABLE DATA           �  COPY public.warehouse (refwarehouse, warehouse, refcompany, reforganisation, refsitegeographic, actif, idheaderparametre, datetimecreation, datetimelastupdate, refdefaultreceivelocation, refdefaultreceiveaisle, refdefaultexpeditionlocation, refdefaultexpeditionaisle, refdefaultgoodsfabricationlocation, refdefaultgoodsfabricationaisle, refdefaultrawmaterialconsumptionlocation, refdefaultrawmaterialconsumptionaisle, refdefaultreturnlocation, refdefaultreturnaisle, negativephysicalstock) FROM stdin;
    public          postgres    false    228   �R      s           0    0 +   inventorydimension_inventorydimensionid_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.inventorydimension_inventorydimensionid_seq', 1, false);
          public          postgres    false    285            t           0    0 %   inventoryonhand_inventoryonhandid_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.inventoryonhand_inventoryonhandid_seq', 1, false);
          public          postgres    false    309            u           0    0 8   inventoryreceivingjournalline_receivingjournallineid_seq    SEQUENCE SET     g   SELECT pg_catalog.setval('public.inventoryreceivingjournalline_receivingjournallineid_seq', 1, false);
          public          postgres    false    289            v           0    0 /   inventorytransaction_inventorytransactionid_seq    SEQUENCE SET     ^   SELECT pg_catalog.setval('public.inventorytransaction_inventorytransactionid_seq', 1, false);
          public          postgres    false    279            w           0    0 <   inventorytransactionorigin_refinventorytransactionorigin_seq    SEQUENCE SET     k   SELECT pg_catalog.setval('public.inventorytransactionorigin_refinventorytransactionorigin_seq', 1, false);
          public          postgres    false    275            x           0    0 1   inventorytransferline_inventorytransferlineid_seq    SEQUENCE SET     `   SELECT pg_catalog.setval('public.inventorytransferline_inventorytransferlineid_seq', 1, false);
          public          postgres    false    292            y           0    0 '   parametresheaders_idheaderparametre_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.parametresheaders_idheaderparametre_seq', 5, true);
          public          postgres    false    230            z           0    0 *   purchaseorderlines_purchaseorderlineid_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.purchaseorderlines_purchaseorderlineid_seq', 1, true);
          public          postgres    false    268            {           0    0    purchaserequisitionlines_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.purchaserequisitionlines_id_seq', 4, true);
          public          postgres    false    252                       2606    91873 .   categoriesgroup PK_0496bffba1398a43bb2ab82b24e 
   CONSTRAINT     �   ALTER TABLE ONLY public.categoriesgroup
    ADD CONSTRAINT "PK_0496bffba1398a43bb2ab82b24e" PRIMARY KEY (refcategoriesgroup, refcompany, reforganisation);
 Z   ALTER TABLE ONLY public.categoriesgroup DROP CONSTRAINT "PK_0496bffba1398a43bb2ab82b24e";
       public            postgres    false    250    250    250            �           2606    91839 /   paymentcondition PK_092bdbdf631a52edda7a8db80a7 
   CONSTRAINT     �   ALTER TABLE ONLY public.paymentcondition
    ADD CONSTRAINT "PK_092bdbdf631a52edda7a8db80a7" PRIMARY KEY (refpaymentcondition, refcompany, reforganisation);
 [   ALTER TABLE ONLY public.paymentcondition DROP CONSTRAINT "PK_092bdbdf631a52edda7a8db80a7";
       public            postgres    false    246    246    246            �           2606    91701 -   sitegeographic PK_09afb968062dee4eebc0b7be1dc 
   CONSTRAINT     �   ALTER TABLE ONLY public.sitegeographic
    ADD CONSTRAINT "PK_09afb968062dee4eebc0b7be1dc" PRIMARY KEY (refcompany, refsitegeographic, reforganisation);
 Y   ALTER TABLE ONLY public.sitegeographic DROP CONSTRAINT "PK_09afb968062dee4eebc0b7be1dc";
       public            postgres    false    229    229    229            Q           2606    139651 <   inventoryreceivingjournalline PK_09e6c3b6c3224b6defbc7f5939b 
   CONSTRAINT     �   ALTER TABLE ONLY public.inventoryreceivingjournalline
    ADD CONSTRAINT "PK_09e6c3b6c3224b6defbc7f5939b" PRIMARY KEY (receivingjournallineid);
 h   ALTER TABLE ONLY public.inventoryreceivingjournalline DROP CONSTRAINT "PK_09e6c3b6c3224b6defbc7f5939b";
       public            postgres    false    290            7           2606    139550 9   inventorytransactionorigin PK_0ea939dd96ea7bf3bd0204c217e 
   CONSTRAINT     �   ALTER TABLE ONLY public.inventorytransactionorigin
    ADD CONSTRAINT "PK_0ea939dd96ea7bf3bd0204c217e" PRIMARY KEY (refinventorytransactionorigin);
 e   ALTER TABLE ONLY public.inventorytransactionorigin DROP CONSTRAINT "PK_0ea939dd96ea7bf3bd0204c217e";
       public            postgres    false    276                       2606    91940 ,   uomconversion PK_14a6901e27d71742b75efcc6fe2 
   CONSTRAINT     �   ALTER TABLE ONLY public.uomconversion
    ADD CONSTRAINT "PK_14a6901e27d71742b75efcc6fe2" PRIMARY KEY (refitem, refcompany, reforganisation, refunitfrom, refunitto);
 X   ALTER TABLE ONLY public.uomconversion DROP CONSTRAINT "PK_14a6901e27d71742b75efcc6fe2";
       public            postgres    false    255    255    255    255    255            i           2606    140848 ;   inventorydimensionserialitem PK_1a49b8daf7ffba1723f84f8280d 
   CONSTRAINT     �   ALTER TABLE ONLY public.inventorydimensionserialitem
    ADD CONSTRAINT "PK_1a49b8daf7ffba1723f84f8280d" PRIMARY KEY (refinventorydimensionserial, refitem, refcompany, reforganisation);
 g   ALTER TABLE ONLY public.inventorydimensionserialitem DROP CONSTRAINT "PK_1a49b8daf7ffba1723f84f8280d";
       public            postgres    false    303    303    303    303            	           2606    91930 ,   itemsreleased PK_1bca9b9635b52234851f311c07c 
   CONSTRAINT     �   ALTER TABLE ONLY public.itemsreleased
    ADD CONSTRAINT "PK_1bca9b9635b52234851f311c07c" PRIMARY KEY (refitem, refcompany, reforganisation);
 X   ALTER TABLE ONLY public.itemsreleased DROP CONSTRAINT "PK_1bca9b9635b52234851f311c07c";
       public            postgres    false    254    254    254            a           2606    140474 6   inventorytrackingobject PK_1cadd1daa11affbbb738164c3b1 
   CONSTRAINT     �   ALTER TABLE ONLY public.inventorytrackingobject
    ADD CONSTRAINT "PK_1cadd1daa11affbbb738164c3b1" PRIMARY KEY (refinventorytrackingobject);
 b   ALTER TABLE ONLY public.inventorytrackingobject DROP CONSTRAINT "PK_1cadd1daa11affbbb738164c3b1";
       public            postgres    false    299            U           2606    139669 4   inventorytransferline PK_1d614578804bb5f43a6ed9199be 
   CONSTRAINT     �   ALTER TABLE ONLY public.inventorytransferline
    ADD CONSTRAINT "PK_1d614578804bb5f43a6ed9199be" PRIMARY KEY (inventorytransferlineid);
 `   ALTER TABLE ONLY public.inventorytransferline DROP CONSTRAINT "PK_1d614578804bb5f43a6ed9199be";
       public            postgres    false    293            �           2606    91712 0   parametresheaders PK_1de2e9a49ac4daca7b7173d862b 
   CONSTRAINT        ALTER TABLE ONLY public.parametresheaders
    ADD CONSTRAINT "PK_1de2e9a49ac4daca7b7173d862b" PRIMARY KEY (idheaderparametre);
 \   ALTER TABLE ONLY public.parametresheaders DROP CONSTRAINT "PK_1de2e9a49ac4daca7b7173d862b";
       public            postgres    false    231            S           2606    139658 4   inventorytransfertype PK_1fcec6b5b823e447d0a6a446226 
   CONSTRAINT     �   ALTER TABLE ONLY public.inventorytransfertype
    ADD CONSTRAINT "PK_1fcec6b5b823e447d0a6a446226" PRIMARY KEY (refinventorytransfertype);
 `   ALTER TABLE ONLY public.inventorytransfertype DROP CONSTRAINT "PK_1fcec6b5b823e447d0a6a446226";
       public            postgres    false    291            �           2606    63240 )   vendortype PK_21d2025fa4797fde72d81244590 
   CONSTRAINT     t   ALTER TABLE ONLY public.vendortype
    ADD CONSTRAINT "PK_21d2025fa4797fde72d81244590" PRIMARY KEY (refvendortype);
 U   ALTER TABLE ONLY public.vendortype DROP CONSTRAINT "PK_21d2025fa4797fde72d81244590";
       public            postgres    false    220            �           2606    91691 (   warehouse PK_2ad84708441caeb28aa156168a8 
   CONSTRAINT     �   ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT "PK_2ad84708441caeb28aa156168a8" PRIMARY KEY (refwarehouse, refcompany, reforganisation);
 T   ALTER TABLE ONLY public.warehouse DROP CONSTRAINT "PK_2ad84708441caeb28aa156168a8";
       public            postgres    false    228    228    228            �           2606    91825 *   vendorgroup PK_2ded4f1a41ed5c8c79707d8e553 
   CONSTRAINT     �   ALTER TABLE ONLY public.vendorgroup
    ADD CONSTRAINT "PK_2ded4f1a41ed5c8c79707d8e553" PRIMARY KEY (refvendorgroup, refcompany, reforganisation);
 V   ALTER TABLE ONLY public.vendorgroup DROP CONSTRAINT "PK_2ded4f1a41ed5c8c79707d8e553";
       public            postgres    false    244    244    244                       2606    91993 #   user PK_30d95e49b1e7ccf642633f759ee 
   CONSTRAINT     }   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "PK_30d95e49b1e7ccf642633f759ee" PRIMARY KEY (reforganisation, matricule);
 Q   ALTER TABLE ONLY public."user" DROP CONSTRAINT "PK_30d95e49b1e7ccf642633f759ee";
       public            postgres    false    259    259            c           2606    140486 8   itemstoragedimensionmodel PK_340981bb982700fe3b448028cfd 
   CONSTRAINT     �   ALTER TABLE ONLY public.itemstoragedimensionmodel
    ADD CONSTRAINT "PK_340981bb982700fe3b448028cfd" PRIMARY KEY (refitemstoragedimensionmodel, refcompany, reforganisation);
 d   ALTER TABLE ONLY public.itemstoragedimensionmodel DROP CONSTRAINT "PK_340981bb982700fe3b448028cfd";
       public            postgres    false    300    300    300            �           2606    83595 #   city PK_35e8fe611d3d106992072b12a88 
   CONSTRAINT     h   ALTER TABLE ONLY public.city
    ADD CONSTRAINT "PK_35e8fe611d3d106992072b12a88" PRIMARY KEY (refcity);
 O   ALTER TABLE ONLY public.city DROP CONSTRAINT "PK_35e8fe611d3d106992072b12a88";
       public            postgres    false    226            �           2606    63907 ,   controlobject PK_361521f40014a48c5ca85798fa5 
   CONSTRAINT     z   ALTER TABLE ONLY public.controlobject
    ADD CONSTRAINT "PK_361521f40014a48c5ca85798fa5" PRIMARY KEY (refcontrolobject);
 X   ALTER TABLE ONLY public.controlobject DROP CONSTRAINT "PK_361521f40014a48c5ca85798fa5";
       public            postgres    false    222            E           2606    139604 7   inventorydimensionserial PK_399964ac71b82bda8f5a83b5011 
   CONSTRAINT     �   ALTER TABLE ONLY public.inventorydimensionserial
    ADD CONSTRAINT "PK_399964ac71b82bda8f5a83b5011" PRIMARY KEY (refinventorydimensionserial);
 c   ALTER TABLE ONLY public.inventorydimensionserial DROP CONSTRAINT "PK_399964ac71b82bda8f5a83b5011";
       public            postgres    false    283            g           2606    140839 :   inventorydimensionowneritem PK_3a0073d86b64ee29ed8e43228c2 
   CONSTRAINT     �   ALTER TABLE ONLY public.inventorydimensionowneritem
    ADD CONSTRAINT "PK_3a0073d86b64ee29ed8e43228c2" PRIMARY KEY (refinventorydimensionowner, refitem, refcompany, reforganisation);
 f   ALTER TABLE ONLY public.inventorydimensionowneritem DROP CONSTRAINT "PK_3a0073d86b64ee29ed8e43228c2";
       public            postgres    false    302    302    302    302                       2606    91892 -   vendorreleased PK_40405435645bf9fd23baddf3682 
   CONSTRAINT     �   ALTER TABLE ONLY public.vendorreleased
    ADD CONSTRAINT "PK_40405435645bf9fd23baddf3682" PRIMARY KEY (refvendor, refcompany, reforganisation);
 Y   ALTER TABLE ONLY public.vendorreleased DROP CONSTRAINT "PK_40405435645bf9fd23baddf3682";
       public            postgres    false    251    251    251            �           2606    63275 '   language PK_4185126059bef8a054068ca41f9 
   CONSTRAINT     p   ALTER TABLE ONLY public.language
    ADD CONSTRAINT "PK_4185126059bef8a054068ca41f9" PRIMARY KEY (reflanguage);
 S   ALTER TABLE ONLY public.language DROP CONSTRAINT "PK_4185126059bef8a054068ca41f9";
       public            postgres    false    221            %           2606    92063 $   items PK_426166eef0acd7cf5ffda67c4f5 
   CONSTRAINT     z   ALTER TABLE ONLY public.items
    ADD CONSTRAINT "PK_426166eef0acd7cf5ffda67c4f5" PRIMARY KEY (refitem, reforganisation);
 P   ALTER TABLE ONLY public.items DROP CONSTRAINT "PK_426166eef0acd7cf5ffda67c4f5";
       public            postgres    false    265    265                       2606    92034 &   address PK_44546ece1d2eae45651b7cadd3e 
   CONSTRAINT     �   ALTER TABLE ONLY public.address
    ADD CONSTRAINT "PK_44546ece1d2eae45651b7cadd3e" PRIMARY KEY (refaddress, refcompany, reforganisation);
 R   ALTER TABLE ONLY public.address DROP CONSTRAINT "PK_44546ece1d2eae45651b7cadd3e";
       public            postgres    false    262    262    262            1           2606    116254 )   itemsgroup PK_44b048cc2d4df7db108daa101ee 
   CONSTRAINT     �   ALTER TABLE ONLY public.itemsgroup
    ADD CONSTRAINT "PK_44b048cc2d4df7db108daa101ee" PRIMARY KEY (refitemgroup, refcompany, reforganisation);
 U   ALTER TABLE ONLY public.itemsgroup DROP CONSTRAINT "PK_44b048cc2d4df7db108daa101ee";
       public            postgres    false    272    272    272            �           2606    66880 3   purchaseorderstatuts PK_51aba4a3c5862680f677536bb0c 
   CONSTRAINT     �   ALTER TABLE ONLY public.purchaseorderstatuts
    ADD CONSTRAINT "PK_51aba4a3c5862680f677536bb0c" PRIMARY KEY (refpurchaseorderstatuts);
 _   ALTER TABLE ONLY public.purchaseorderstatuts DROP CONSTRAINT "PK_51aba4a3c5862680f677536bb0c";
       public            postgres    false    224            )           2606    92084 (   itemclass PK_529da4d7dfd2d7763ee84014f69 
   CONSTRAINT     �   ALTER TABLE ONLY public.itemclass
    ADD CONSTRAINT "PK_529da4d7dfd2d7763ee84014f69" PRIMARY KEY (refitem, reforganisation, refcompany, refwarehouse);
 T   ALTER TABLE ONLY public.itemclass DROP CONSTRAINT "PK_529da4d7dfd2d7763ee84014f69";
       public            postgres    false    267    267    267    267            �           2606    91723 .   parametreslines PK_52ea41c7272a92c40048d14b750 
   CONSTRAINT     �   ALTER TABLE ONLY public.parametreslines
    ADD CONSTRAINT "PK_52ea41c7272a92c40048d14b750" PRIMARY KEY (idheaderparametre, refcompany, refparametre, value, reforganisation);
 Z   ALTER TABLE ONLY public.parametreslines DROP CONSTRAINT "PK_52ea41c7272a92c40048d14b750";
       public            postgres    false    232    232    232    232    232            �           2606    91832 +   deliverymode PK_55a33d08f3ce2a9c267da71224d 
   CONSTRAINT     �   ALTER TABLE ONLY public.deliverymode
    ADD CONSTRAINT "PK_55a33d08f3ce2a9c267da71224d" PRIMARY KEY (refdeliverymode, refcompany, reforganisation);
 W   ALTER TABLE ONLY public.deliverymode DROP CONSTRAINT "PK_55a33d08f3ce2a9c267da71224d";
       public            postgres    false    245    245    245            #           2606    92054 0   addresswarehouses PK_57ebc89d08bca33d297666bfa5f 
   CONSTRAINT     �   ALTER TABLE ONLY public.addresswarehouses
    ADD CONSTRAINT "PK_57ebc89d08bca33d297666bfa5f" PRIMARY KEY (refaddress, refcompany, reforganisation, refwarehouse, refaddresstype);
 \   ALTER TABLE ONLY public.addresswarehouses DROP CONSTRAINT "PK_57ebc89d08bca33d297666bfa5f";
       public            postgres    false    264    264    264    264    264                       2606    91984 *   usercompany PK_58bdd9d29bac9c61880cf6bd973 
   CONSTRAINT     �   ALTER TABLE ONLY public.usercompany
    ADD CONSTRAINT "PK_58bdd9d29bac9c61880cf6bd973" PRIMARY KEY (reforganisation, refcompany, matricule);
 V   ALTER TABLE ONLY public.usercompany DROP CONSTRAINT "PK_58bdd9d29bac9c61880cf6bd973";
       public            postgres    false    258    258    258            G           2606    139613 6   inventorydimensionbatch PK_5a4a2fe273be71e1dd5cec554b4 
   CONSTRAINT     �   ALTER TABLE ONLY public.inventorydimensionbatch
    ADD CONSTRAINT "PK_5a4a2fe273be71e1dd5cec554b4" PRIMARY KEY (refinventorydimensionbatch);
 b   ALTER TABLE ONLY public.inventorydimensionbatch DROP CONSTRAINT "PK_5a4a2fe273be71e1dd5cec554b4";
       public            postgres    false    284            �           2606    91789 %   vendor PK_5b8d0d9b5804bc2a2a540ad11da 
   CONSTRAINT     }   ALTER TABLE ONLY public.vendor
    ADD CONSTRAINT "PK_5b8d0d9b5804bc2a2a540ad11da" PRIMARY KEY (refvendor, reforganisation);
 Q   ALTER TABLE ONLY public.vendor DROP CONSTRAINT "PK_5b8d0d9b5804bc2a2a540ad11da";
       public            postgres    false    239    239            �           2606    91751 #   area PK_5ec5a05b24281dca74583e2f300 
   CONSTRAINT     �   ALTER TABLE ONLY public.area
    ADD CONSTRAINT "PK_5ec5a05b24281dca74583e2f300" PRIMARY KEY (refarea, refcompany, reforganisation);
 O   ALTER TABLE ONLY public.area DROP CONSTRAINT "PK_5ec5a05b24281dca74583e2f300";
       public            postgres    false    235    235    235            C           2606    139595 6   inventorydimensionowner PK_605576994a06f5cfe09415fd0f8 
   CONSTRAINT     �   ALTER TABLE ONLY public.inventorydimensionowner
    ADD CONSTRAINT "PK_605576994a06f5cfe09415fd0f8" PRIMARY KEY (refinventorydimensionowner);
 b   ALTER TABLE ONLY public.inventorydimensionowner DROP CONSTRAINT "PK_605576994a06f5cfe09415fd0f8";
       public            postgres    false    282            [           2606    140443 8   inventoryvaluationmethode PK_644d82b4ada8473f53356725167 
   CONSTRAINT     �   ALTER TABLE ONLY public.inventoryvaluationmethode
    ADD CONSTRAINT "PK_644d82b4ada8473f53356725167" PRIMARY KEY (refinventoryvaluationmethode);
 d   ALTER TABLE ONLY public.inventoryvaluationmethode DROP CONSTRAINT "PK_644d82b4ada8473f53356725167";
       public            postgres    false    296            A           2606    139586 7   inventorydimensionpallet PK_674262a5e792526b186193c4128 
   CONSTRAINT     �   ALTER TABLE ONLY public.inventorydimensionpallet
    ADD CONSTRAINT "PK_674262a5e792526b186193c4128" PRIMARY KEY (refinventorydimensionpallet);
 c   ALTER TABLE ONLY public.inventorydimensionpallet DROP CONSTRAINT "PK_674262a5e792526b186193c4128";
       public            postgres    false    281            �           2606    91804 (   taxegroup PK_7311262dbe83df5cc89176ce8e7 
   CONSTRAINT     �   ALTER TABLE ONLY public.taxegroup
    ADD CONSTRAINT "PK_7311262dbe83df5cc89176ce8e7" PRIMARY KEY (reftaxegroup, refcompany, reforganisation);
 T   ALTER TABLE ONLY public.taxegroup DROP CONSTRAINT "PK_7311262dbe83df5cc89176ce8e7";
       public            postgres    false    241    241    241            M           2606    139633 8   inventoryreceivingjournal PK_786f8ad28311d891d16a9a26464 
   CONSTRAINT     �   ALTER TABLE ONLY public.inventoryreceivingjournal
    ADD CONSTRAINT "PK_786f8ad28311d891d16a9a26464" PRIMARY KEY (refinventoryreceivingjournal, reforganisation, refcompany);
 d   ALTER TABLE ONLY public.inventoryreceivingjournal DROP CONSTRAINT "PK_786f8ad28311d891d16a9a26464";
       public            postgres    false    287    287    287            �           2606    91742 )   parametres PK_796ba5cf992de927506e475dc52 
   CONSTRAINT     �   ALTER TABLE ONLY public.parametres
    ADD CONSTRAINT "PK_796ba5cf992de927506e475dc52" PRIMARY KEY (refparametre, refcompany, reforganisation);
 U   ALTER TABLE ONLY public.parametres DROP CONSTRAINT "PK_796ba5cf992de927506e475dc52";
       public            postgres    false    234    234    234            m           2606    141139 .   inventoryonhand PK_7e5f2e28005c5dea607de3f17db 
   CONSTRAINT     }   ALTER TABLE ONLY public.inventoryonhand
    ADD CONSTRAINT "PK_7e5f2e28005c5dea607de3f17db" PRIMARY KEY (inventoryonhandid);
 Z   ALTER TABLE ONLY public.inventoryonhand DROP CONSTRAINT "PK_7e5f2e28005c5dea607de3f17db";
       public            postgres    false    308            �           2606    83588 &   country PK_7e95e12847de67d4e22b2f8897a 
   CONSTRAINT     n   ALTER TABLE ONLY public.country
    ADD CONSTRAINT "PK_7e95e12847de67d4e22b2f8897a" PRIMARY KEY (refcountry);
 R   ALTER TABLE ONLY public.country DROP CONSTRAINT "PK_7e95e12847de67d4e22b2f8897a";
       public            postgres    false    225            3           2606    124506 6   usercompanieswarehouses PK_7ee75abb11a1c84bdfa0c615018 
   CONSTRAINT     �   ALTER TABLE ONLY public.usercompanieswarehouses
    ADD CONSTRAINT "PK_7ee75abb11a1c84bdfa0c615018" PRIMARY KEY (reforganisation, refcompany, matricule, refwarehouse);
 b   ALTER TABLE ONLY public.usercompanieswarehouses DROP CONSTRAINT "PK_7ee75abb11a1c84bdfa0c615018";
       public            postgres    false    273    273    273    273            W           2606    139676 6   inventorytransferstatus PK_8014c55ec4c881d2f947399e7fd 
   CONSTRAINT     �   ALTER TABLE ONLY public.inventorytransferstatus
    ADD CONSTRAINT "PK_8014c55ec4c881d2f947399e7fd" PRIMARY KEY (refinventorytransferstatus);
 b   ALTER TABLE ONLY public.inventorytransferstatus DROP CONSTRAINT "PK_8014c55ec4c881d2f947399e7fd";
       public            postgres    false    294            �           2606    91780 2   purchaserequisition PK_819f7da2ba0c0e20c789435a6f7 
   CONSTRAINT     �   ALTER TABLE ONLY public.purchaserequisition
    ADD CONSTRAINT "PK_819f7da2ba0c0e20c789435a6f7" PRIMARY KEY (refpurchaserequisition, refcompany, reforganisation);
 ^   ALTER TABLE ONLY public.purchaserequisition DROP CONSTRAINT "PK_819f7da2ba0c0e20c789435a6f7";
       public            postgres    false    238    238    238            �           2606    91846 ,   paymentmethod PK_896790966af999938b800764231 
   CONSTRAINT     �   ALTER TABLE ONLY public.paymentmethod
    ADD CONSTRAINT "PK_896790966af999938b800764231" PRIMARY KEY (refpaymentmethod, refcompany, reforganisation);
 X   ALTER TABLE ONLY public.paymentmethod DROP CONSTRAINT "PK_896790966af999938b800764231";
       public            postgres    false    247    247    247            O           2606    139640 >   inventoryreceivingjournalstatus PK_8c23ab99701cc33cc7186671401 
   CONSTRAINT     �   ALTER TABLE ONLY public.inventoryreceivingjournalstatus
    ADD CONSTRAINT "PK_8c23ab99701cc33cc7186671401" PRIMARY KEY (refinventoryreceivingjournalstatus);
 j   ALTER TABLE ONLY public.inventoryreceivingjournalstatus DROP CONSTRAINT "PK_8c23ab99701cc33cc7186671401";
       public            postgres    false    288                       2606    91864 )   categories PK_8f25afa314f59e48d9179d9457a 
   CONSTRAINT     �   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT "PK_8f25afa314f59e48d9179d9457a" PRIMARY KEY (refcategoriesgroup, refcategories, refcompany, reforganisation);
 U   ALTER TABLE ONLY public.categories DROP CONSTRAINT "PK_8f25afa314f59e48d9179d9457a";
       public            postgres    false    249    249    249    249            '           2606    92073 3   uomclassicconversion PK_8f7753c704bd47a83186c926830 
   CONSTRAINT     �   ALTER TABLE ONLY public.uomclassicconversion
    ADD CONSTRAINT "PK_8f7753c704bd47a83186c926830" PRIMARY KEY (refcompany, reforganisation, refunitfrom, refunitto);
 _   ALTER TABLE ONLY public.uomclassicconversion DROP CONSTRAINT "PK_8f7753c704bd47a83186c926830";
       public            postgres    false    266    266    266    266            9           2606    139557 ?   inventorytransactionstatusoutput PK_91534883942bfd4e762fa1e41f7 
   CONSTRAINT     �   ALTER TABLE ONLY public.inventorytransactionstatusoutput
    ADD CONSTRAINT "PK_91534883942bfd4e762fa1e41f7" PRIMARY KEY (refinventorytransactionstatusoutput);
 k   ALTER TABLE ONLY public.inventorytransactionstatusoutput DROP CONSTRAINT "PK_91534883942bfd4e762fa1e41f7";
       public            postgres    false    277            Y           2606    139685 0   inventorytransfer PK_94ef199eaaaf4f1926a040b4f47 
   CONSTRAINT     �   ALTER TABLE ONLY public.inventorytransfer
    ADD CONSTRAINT "PK_94ef199eaaaf4f1926a040b4f47" PRIMARY KEY (refinventorytransfer, reforganisation, refcompany);
 \   ALTER TABLE ONLY public.inventorytransfer DROP CONSTRAINT "PK_94ef199eaaaf4f1926a040b4f47";
       public            postgres    false    295    295    295                       2606    108055 '   location PK_9797f23b6fd54efe9a15362a5b2 
   CONSTRAINT     �   ALTER TABLE ONLY public.location
    ADD CONSTRAINT "PK_9797f23b6fd54efe9a15362a5b2" PRIMARY KEY (reflocation, refcompany, reforganisation, refaisle);
 S   ALTER TABLE ONLY public.location DROP CONSTRAINT "PK_9797f23b6fd54efe9a15362a5b2";
       public            postgres    false    260    260    260    260            !           2606    92045 5   addresssitegeographics PK_98e84f2e5c096bd79d6d2d0b299 
   CONSTRAINT     �   ALTER TABLE ONLY public.addresssitegeographics
    ADD CONSTRAINT "PK_98e84f2e5c096bd79d6d2d0b299" PRIMARY KEY (refaddress, refcompany, reforganisation, refsitegeographic, refaddresstype);
 a   ALTER TABLE ONLY public.addresssitegeographics DROP CONSTRAINT "PK_98e84f2e5c096bd79d6d2d0b299";
       public            postgres    false    263    263    263    263    263            I           2606    139624 1   inventorydimension PK_9f489c9feb8fbbe43d04714fac4 
   CONSTRAINT     �   ALTER TABLE ONLY public.inventorydimension
    ADD CONSTRAINT "PK_9f489c9feb8fbbe43d04714fac4" PRIMARY KEY (inventorydimensionid);
 ]   ALTER TABLE ONLY public.inventorydimension DROP CONSTRAINT "PK_9f489c9feb8fbbe43d04714fac4";
       public            postgres    false    286            �           2606    91769 )   pricemodel PK_9f7d16d90abec311513672730b1 
   CONSTRAINT     �   ALTER TABLE ONLY public.pricemodel
    ADD CONSTRAINT "PK_9f7d16d90abec311513672730b1" PRIMARY KEY (refpricemodel, refcompany, reforganisation);
 U   ALTER TABLE ONLY public.pricemodel DROP CONSTRAINT "PK_9f7d16d90abec311513672730b1";
       public            postgres    false    237    237    237            �           2606    66782 9   purchaserequisitionstatuts PK_a342e74a3b52bf34855652ba3cf 
   CONSTRAINT     �   ALTER TABLE ONLY public.purchaserequisitionstatuts
    ADD CONSTRAINT "PK_a342e74a3b52bf34855652ba3cf" PRIMARY KEY (refpurchaserequisitionstatuts);
 e   ALTER TABLE ONLY public.purchaserequisitionstatuts DROP CONSTRAINT "PK_a342e74a3b52bf34855652ba3cf";
       public            postgres    false    223            �           2606    91760 $   units PK_a3f2e8a3bf0efda0a5fb0b80fe2 
   CONSTRAINT     �   ALTER TABLE ONLY public.units
    ADD CONSTRAINT "PK_a3f2e8a3bf0efda0a5fb0b80fe2" PRIMARY KEY (refunit, reforganisation, refcompany);
 P   ALTER TABLE ONLY public.units DROP CONSTRAINT "PK_a3f2e8a3bf0efda0a5fb0b80fe2";
       public            postgres    false    236    236    236            �           2606    63123 ,   furnituretype PK_a8d95bf898d57e0548b5516ee03 
   CONSTRAINT     z   ALTER TABLE ONLY public.furnituretype
    ADD CONSTRAINT "PK_a8d95bf898d57e0548b5516ee03" PRIMARY KEY (reffurnituretype);
 X   ALTER TABLE ONLY public.furnituretype DROP CONSTRAINT "PK_a8d95bf898d57e0548b5516ee03";
       public            postgres    false    218            ;           2606    139564 >   inventorytransactionstatusinput PK_aa288d824ce6f3ca448f54c3395 
   CONSTRAINT     �   ALTER TABLE ONLY public.inventorytransactionstatusinput
    ADD CONSTRAINT "PK_aa288d824ce6f3ca448f54c3395" PRIMARY KEY (refinventorytransactionstatusinput);
 j   ALTER TABLE ONLY public.inventorytransactionstatusinput DROP CONSTRAINT "PK_aa288d824ce6f3ca448f54c3395";
       public            postgres    false    278            �           2606    91797 '   taxeline PK_b050e55727b8a04fc7afbf51a29 
   CONSTRAINT     �   ALTER TABLE ONLY public.taxeline
    ADD CONSTRAINT "PK_b050e55727b8a04fc7afbf51a29" PRIMARY KEY (reftaxe, refcompany, reforganisation, datedebut);
 S   ALTER TABLE ONLY public.taxeline DROP CONSTRAINT "PK_b050e55727b8a04fc7afbf51a29";
       public            postgres    false    240    240    240    240            �           2606    91733 2   parametresattributs PK_b1ea98c0fc9de8754e504a9babb 
   CONSTRAINT     �   ALTER TABLE ONLY public.parametresattributs
    ADD CONSTRAINT "PK_b1ea98c0fc9de8754e504a9babb" PRIMARY KEY (refcompany, refparametre, value, reforganisation);
 ^   ALTER TABLE ONLY public.parametresattributs DROP CONSTRAINT "PK_b1ea98c0fc9de8754e504a9babb";
       public            postgres    false    233    233    233    233            e           2606    140830 ;   inventorydimensionpalletitem PK_b25349a8e514fc42d8ac8456cd8 
   CONSTRAINT     �   ALTER TABLE ONLY public.inventorydimensionpalletitem
    ADD CONSTRAINT "PK_b25349a8e514fc42d8ac8456cd8" PRIMARY KEY (refinventorydimensionpallet, refitem, refcompany, reforganisation);
 g   ALTER TABLE ONLY public.inventorydimensionpalletitem DROP CONSTRAINT "PK_b25349a8e514fc42d8ac8456cd8";
       public            postgres    false    301    301    301    301            �           2606    91855 .   categoriesitems PK_b8cf225e2d641fae7acadb6f50c 
   CONSTRAINT     �   ALTER TABLE ONLY public.categoriesitems
    ADD CONSTRAINT "PK_b8cf225e2d641fae7acadb6f50c" PRIMARY KEY (refcategoriesgroup, refcompany, reforganisation, refitem);
 Z   ALTER TABLE ONLY public.categoriesitems DROP CONSTRAINT "PK_b8cf225e2d641fae7acadb6f50c";
       public            postgres    false    248    248    248    248            /           2606    108117 -   addressvendors PK_bc2f2d9a958ae107479602412be 
   CONSTRAINT     �   ALTER TABLE ONLY public.addressvendors
    ADD CONSTRAINT "PK_bc2f2d9a958ae107479602412be" PRIMARY KEY (refaddress, refcompany, reforganisation, refvendor, refaddresstype);
 Y   ALTER TABLE ONLY public.addressvendors DROP CONSTRAINT "PK_bc2f2d9a958ae107479602412be";
       public            postgres    false    271    271    271    271    271            ]           2606    140454 (   itemmodel PK_bf95b21aeeaf49b223da6210f02 
   CONSTRAINT     �   ALTER TABLE ONLY public.itemmodel
    ADD CONSTRAINT "PK_bf95b21aeeaf49b223da6210f02" PRIMARY KEY (refitemmodel, refcompany, reforganisation);
 T   ALTER TABLE ONLY public.itemmodel DROP CONSTRAINT "PK_bf95b21aeeaf49b223da6210f02";
       public            postgres    false    297    297    297                       2606    91963 &   company PK_c4cdc543a7c6b1b68920a4c5215 
   CONSTRAINT        ALTER TABLE ONLY public.company
    ADD CONSTRAINT "PK_c4cdc543a7c6b1b68920a4c5215" PRIMARY KEY (refcompany, reforganisation);
 R   ALTER TABLE ONLY public.company DROP CONSTRAINT "PK_c4cdc543a7c6b1b68920a4c5215";
       public            postgres    false    257    257                       2606    91913 7   purchaserequisitionlines PK_c82f10a824423919373023c4791 
   CONSTRAINT     w   ALTER TABLE ONLY public.purchaserequisitionlines
    ADD CONSTRAINT "PK_c82f10a824423919373023c4791" PRIMARY KEY (id);
 c   ALTER TABLE ONLY public.purchaserequisitionlines DROP CONSTRAINT "PK_c82f10a824423919373023c4791";
       public            postgres    false    253            �           2606    63233 '   currency PK_ce54c4d579c41ccbfaabf054bcb 
   CONSTRAINT     p   ALTER TABLE ONLY public.currency
    ADD CONSTRAINT "PK_ce54c4d579c41ccbfaabf054bcb" PRIMARY KEY (refcurrency);
 S   ALTER TABLE ONLY public.currency DROP CONSTRAINT "PK_ce54c4d579c41ccbfaabf054bcb";
       public            postgres    false    219            �           2606    91682 +   organisation PK_d0de544fac90aa110ff0425cc97 
   CONSTRAINT     x   ALTER TABLE ONLY public.organisation
    ADD CONSTRAINT "PK_d0de544fac90aa110ff0425cc97" PRIMARY KEY (reforganisation);
 W   ALTER TABLE ONLY public.organisation DROP CONSTRAINT "PK_d0de544fac90aa110ff0425cc97";
       public            postgres    false    227            +           2606    92105 1   purchaseorderlines PK_d2b6ffb464530ae9fb63f584a95 
   CONSTRAINT     �   ALTER TABLE ONLY public.purchaseorderlines
    ADD CONSTRAINT "PK_d2b6ffb464530ae9fb63f584a95" PRIMARY KEY (purchaseorderlineid);
 ]   ALTER TABLE ONLY public.purchaseorderlines DROP CONSTRAINT "PK_d2b6ffb464530ae9fb63f584a95";
       public            postgres    false    269            =           2606    139575 3   inventorytransaction PK_d3253f2c58720ef28a09c1a8d25 
   CONSTRAINT     �   ALTER TABLE ONLY public.inventorytransaction
    ADD CONSTRAINT "PK_d3253f2c58720ef28a09c1a8d25" PRIMARY KEY (inventorytransactionid);
 _   ALTER TABLE ONLY public.inventorytransaction DROP CONSTRAINT "PK_d3253f2c58720ef28a09c1a8d25";
       public            postgres    false    280            5           2606    139539 =   inventorytransactionorigintype PK_d6935cfd0c6b25844ad081cc387 
   CONSTRAINT     �   ALTER TABLE ONLY public.inventorytransactionorigintype
    ADD CONSTRAINT "PK_d6935cfd0c6b25844ad081cc387" PRIMARY KEY (refinventorytransactionorigintype);
 i   ALTER TABLE ONLY public.inventorytransactionorigintype DROP CONSTRAINT "PK_d6935cfd0c6b25844ad081cc387";
       public            postgres    false    274            �           2606    62936 +   itemtracking PK_da04f65737eb4821d82f3a0131f 
   CONSTRAINT     x   ALTER TABLE ONLY public.itemtracking
    ADD CONSTRAINT "PK_da04f65737eb4821d82f3a0131f" PRIMARY KEY (refitemtracking);
 W   ALTER TABLE ONLY public.itemtracking DROP CONSTRAINT "PK_da04f65737eb4821d82f3a0131f";
       public            postgres    false    216                       2606    91953 $   aisle PK_db4ecdbaf2aad026f6cbc927d38 
   CONSTRAINT     �   ALTER TABLE ONLY public.aisle
    ADD CONSTRAINT "PK_db4ecdbaf2aad026f6cbc927d38" PRIMARY KEY (refaisle, refcompany, reforganisation);
 P   ALTER TABLE ONLY public.aisle DROP CONSTRAINT "PK_db4ecdbaf2aad026f6cbc927d38";
       public            postgres    false    256    256    256            �           2606    91818 #   taxe PK_def297b9a3818f3cf3b9943d54d 
   CONSTRAINT     �   ALTER TABLE ONLY public.taxe
    ADD CONSTRAINT "PK_def297b9a3818f3cf3b9943d54d" PRIMARY KEY (reftaxe, refcompany, reforganisation);
 O   ALTER TABLE ONLY public.taxe DROP CONSTRAINT "PK_def297b9a3818f3cf3b9943d54d";
       public            postgres    false    243    243    243            �           2606    62984 .   parametrestypes PK_dfc9f710c986174c374d12d1cdf 
   CONSTRAINT     |   ALTER TABLE ONLY public.parametrestypes
    ADD CONSTRAINT "PK_dfc9f710c986174c374d12d1cdf" PRIMARY KEY (reftypeparametre);
 Z   ALTER TABLE ONLY public.parametrestypes DROP CONSTRAINT "PK_dfc9f710c986174c374d12d1cdf";
       public            postgres    false    217            _           2606    140467 9   itemtrackingdimensionmodel PK_e526d456f78095d75eb9c303f88 
   CONSTRAINT     �   ALTER TABLE ONLY public.itemtrackingdimensionmodel
    ADD CONSTRAINT "PK_e526d456f78095d75eb9c303f88" PRIMARY KEY (refitemtrackingdimensionmodel, refcompany, reforganisation);
 e   ALTER TABLE ONLY public.itemtrackingdimensionmodel DROP CONSTRAINT "PK_e526d456f78095d75eb9c303f88";
       public            postgres    false    298    298    298            k           2606    140857 :   inventorydimensionbatchitem PK_e85b5c28028f5d541242dc0c25f 
   CONSTRAINT     �   ALTER TABLE ONLY public.inventorydimensionbatchitem
    ADD CONSTRAINT "PK_e85b5c28028f5d541242dc0c25f" PRIMARY KEY (refinventorydimensionbatch, refitem, refcompany, reforganisation);
 f   ALTER TABLE ONLY public.inventorydimensionbatchitem DROP CONSTRAINT "PK_e85b5c28028f5d541242dc0c25f";
       public            postgres    false    304    304    304    304                       2606    92024 *   addresstype PK_edc898abb78ba32181f61d8a1a8 
   CONSTRAINT     v   ALTER TABLE ONLY public.addresstype
    ADD CONSTRAINT "PK_edc898abb78ba32181f61d8a1a8" PRIMARY KEY (refaddresstype);
 V   ALTER TABLE ONLY public.addresstype DROP CONSTRAINT "PK_edc898abb78ba32181f61d8a1a8";
       public            postgres    false    261            -           2606    92114 ,   purchaseorder PK_f96059ff370e6a4f4d7707b0222 
   CONSTRAINT     �   ALTER TABLE ONLY public.purchaseorder
    ADD CONSTRAINT "PK_f96059ff370e6a4f4d7707b0222" PRIMARY KEY (refpurchaseorder, refcompany, reforganisation);
 X   ALTER TABLE ONLY public.purchaseorder DROP CONSTRAINT "PK_f96059ff370e6a4f4d7707b0222";
       public            postgres    false    270    270    270            �           2606    91811 *   taxebygroup PK_fd1df7c52bf3234194881651614 
   CONSTRAINT     �   ALTER TABLE ONLY public.taxebygroup
    ADD CONSTRAINT "PK_fd1df7c52bf3234194881651614" PRIMARY KEY (reftaxegroup, reftaxe, refcompany, reforganisation);
 V   ALTER TABLE ONLY public.taxebygroup DROP CONSTRAINT "PK_fd1df7c52bf3234194881651614";
       public            postgres    false    242    242    242    242            ?           2606    139577 3   inventorytransaction REL_35d1c53b65c850c621335b24be 
   CONSTRAINT     �   ALTER TABLE ONLY public.inventorytransaction
    ADD CONSTRAINT "REL_35d1c53b65c850c621335b24be" UNIQUE (refinventorytransactionorigin);
 _   ALTER TABLE ONLY public.inventorytransaction DROP CONSTRAINT "REL_35d1c53b65c850c621335b24be";
       public            postgres    false    280            �           2606    108091 %   vendor UQ_13c88bba65ee2aa99660883e5c6 
   CONSTRAINT     b   ALTER TABLE ONLY public.vendor
    ADD CONSTRAINT "UQ_13c88bba65ee2aa99660883e5c6" UNIQUE (cnss);
 Q   ALTER TABLE ONLY public.vendor DROP CONSTRAINT "UQ_13c88bba65ee2aa99660883e5c6";
       public            postgres    false    239            �           2606    91714 0   parametresheaders UQ_1417154d5112f2beefc0ed31223 
   CONSTRAINT     �   ALTER TABLE ONLY public.parametresheaders
    ADD CONSTRAINT "UQ_1417154d5112f2beefc0ed31223" UNIQUE (refcompany, refheaderparametre, reforganisation);
 \   ALTER TABLE ONLY public.parametresheaders DROP CONSTRAINT "UQ_1417154d5112f2beefc0ed31223";
       public            postgres    false    231    231    231            �           2606    108083 %   vendor UQ_1c0d3b078ebab289a04aa0f6277 
   CONSTRAINT     a   ALTER TABLE ONLY public.vendor
    ADD CONSTRAINT "UQ_1c0d3b078ebab289a04aa0f6277" UNIQUE (ice);
 Q   ALTER TABLE ONLY public.vendor DROP CONSTRAINT "UQ_1c0d3b078ebab289a04aa0f6277";
       public            postgres    false    239            K           2606    140859 1   inventorydimension UQ_4243e546406df693a6a66d366c6 
   CONSTRAINT     8  ALTER TABLE ONLY public.inventorydimension
    ADD CONSTRAINT "UQ_4243e546406df693a6a66d366c6" UNIQUE (refinventorydimensionbatch, refinventorydimensionserial, refinventorydimensionowner, refinventorydimensionpallet, reflocation, refaisle, refarea, refwarehouse, refsitegeographic, refcompany, reforganisation);
 ]   ALTER TABLE ONLY public.inventorydimension DROP CONSTRAINT "UQ_4243e546406df693a6a66d366c6";
       public            postgres    false    286    286    286    286    286    286    286    286    286    286    286            �           2606    66949 ,   controlobject UQ_8791a1f9f55c427e020bba76028 
   CONSTRAINT     k   ALTER TABLE ONLY public.controlobject
    ADD CONSTRAINT "UQ_8791a1f9f55c427e020bba76028" UNIQUE (prefix);
 X   ALTER TABLE ONLY public.controlobject DROP CONSTRAINT "UQ_8791a1f9f55c427e020bba76028";
       public            postgres    false    222            �           2606    108093 %   vendor UQ_8d2ea966ac830604b37210800b3 
   CONSTRAINT     b   ALTER TABLE ONLY public.vendor
    ADD CONSTRAINT "UQ_8d2ea966ac830604b37210800b3" UNIQUE (ncin);
 Q   ALTER TABLE ONLY public.vendor DROP CONSTRAINT "UQ_8d2ea966ac830604b37210800b3";
       public            postgres    false    239            �           2606    108085 %   vendor UQ_9e038d4386f6a7993c3888c2c9e 
   CONSTRAINT     `   ALTER TABLE ONLY public.vendor
    ADD CONSTRAINT "UQ_9e038d4386f6a7993c3888c2c9e" UNIQUE (if);
 Q   ALTER TABLE ONLY public.vendor DROP CONSTRAINT "UQ_9e038d4386f6a7993c3888c2c9e";
       public            postgres    false    239            �           2606    108087 %   vendor UQ_a5f1e5686d7bb21d2782d3c026a 
   CONSTRAINT     `   ALTER TABLE ONLY public.vendor
    ADD CONSTRAINT "UQ_a5f1e5686d7bb21d2782d3c026a" UNIQUE (rc);
 Q   ALTER TABLE ONLY public.vendor DROP CONSTRAINT "UQ_a5f1e5686d7bb21d2782d3c026a";
       public            postgres    false    239                       2606    91997 #   user UQ_c897cfe8980f3ce8ab8e5eb1014 
   CONSTRAINT     t   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "UQ_c897cfe8980f3ce8ab8e5eb1014" UNIQUE (login, reforganisation);
 Q   ALTER TABLE ONLY public."user" DROP CONSTRAINT "UQ_c897cfe8980f3ce8ab8e5eb1014";
       public            postgres    false    259    259            �           2606    108089 %   vendor UQ_c9bfa5a7443429df43b86d56f1e 
   CONSTRAINT     e   ALTER TABLE ONLY public.vendor
    ADD CONSTRAINT "UQ_c9bfa5a7443429df43b86d56f1e" UNIQUE (patente);
 Q   ALTER TABLE ONLY public.vendor DROP CONSTRAINT "UQ_c9bfa5a7443429df43b86d56f1e";
       public            postgres    false    239                       2606    92036 &   address UQ_dc72f107eef6108d4163fae4cd2 
   CONSTRAINT     d   ALTER TABLE ONLY public.address
    ADD CONSTRAINT "UQ_dc72f107eef6108d4163fae4cd2" UNIQUE (title);
 R   ALTER TABLE ONLY public.address DROP CONSTRAINT "UQ_dc72f107eef6108d4163fae4cd2";
       public            postgres    false    262                       2606    91995 #   user UQ_fb05d80057242c50467475fa51f 
   CONSTRAINT     t   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "UQ_fb05d80057242c50467475fa51f" UNIQUE (email, reforganisation);
 Q   ALTER TABLE ONLY public."user" DROP CONSTRAINT "UQ_fb05d80057242c50467475fa51f";
       public            postgres    false    259    259                       2606    92870 1   purchaseorderlines FK_003dfd35fc76c3d99870c439ec2    FK CONSTRAINT     �   ALTER TABLE ONLY public.purchaseorderlines
    ADD CONSTRAINT "FK_003dfd35fc76c3d99870c439ec2" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 ]   ALTER TABLE ONLY public.purchaseorderlines DROP CONSTRAINT "FK_003dfd35fc76c3d99870c439ec2";
       public          postgres    false    269    3855    269    257    257            �           2606    92630 ,   itemsreleased FK_00a8a68a34c8182e7385a3445b3    FK CONSTRAINT     �   ALTER TABLE ONLY public.itemsreleased
    ADD CONSTRAINT "FK_00a8a68a34c8182e7385a3445b3" FOREIGN KEY (idheaderparametre) REFERENCES public.parametresheaders(idheaderparametre);
 X   ALTER TABLE ONLY public.itemsreleased DROP CONSTRAINT "FK_00a8a68a34c8182e7385a3445b3";
       public          postgres    false    3791    254    231            �           2606    92190 2   parametresattributs FK_013d5646f454d0c50b0e8f8fdea    FK CONSTRAINT     �   ALTER TABLE ONLY public.parametresattributs
    ADD CONSTRAINT "FK_013d5646f454d0c50b0e8f8fdea" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 ^   ALTER TABLE ONLY public.parametresattributs DROP CONSTRAINT "FK_013d5646f454d0c50b0e8f8fdea";
       public          postgres    false    233    233    257    257    3855            �           2606    92370 #   taxe FK_01d700246362f025ed90e92662e    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxe
    ADD CONSTRAINT "FK_01d700246362f025ed90e92662e" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 O   ALTER TABLE ONLY public.taxe DROP CONSTRAINT "FK_01d700246362f025ed90e92662e";
       public          postgres    false    243    3785    227                       2606    92865 (   itemclass FK_02148e60b533930f397f9aac5d8    FK CONSTRAINT     �   ALTER TABLE ONLY public.itemclass
    ADD CONSTRAINT "FK_02148e60b533930f397f9aac5d8" FOREIGN KEY (refwarehouse, refcompany, reforganisation) REFERENCES public.warehouse(refwarehouse, refcompany, reforganisation);
 T   ALTER TABLE ONLY public.itemclass DROP CONSTRAINT "FK_02148e60b533930f397f9aac5d8";
       public          postgres    false    228    228    228    3787    267    267    267            G           2606    139891 4   inventorytransferline FK_0230e1049722ad3298319aa061c    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorytransferline
    ADD CONSTRAINT "FK_0230e1049722ad3298319aa061c" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 `   ALTER TABLE ONLY public.inventorytransferline DROP CONSTRAINT "FK_0230e1049722ad3298319aa061c";
       public          postgres    false    293    3785    227                       2606    108118 -   addressvendors FK_0254230818d43d525d1d63df6ee    FK CONSTRAINT     �   ALTER TABLE ONLY public.addressvendors
    ADD CONSTRAINT "FK_0254230818d43d525d1d63df6ee" FOREIGN KEY (refcompany, reforganisation, refvendor) REFERENCES public.vendorreleased(refcompany, reforganisation, refvendor);
 Y   ALTER TABLE ONLY public.addressvendors DROP CONSTRAINT "FK_0254230818d43d525d1d63df6ee";
       public          postgres    false    251    271    3845    271    251    251    271            �           2606    92810 0   addresswarehouses FK_02be016c7f7363c8f206dc30b14    FK CONSTRAINT     �   ALTER TABLE ONLY public.addresswarehouses
    ADD CONSTRAINT "FK_02be016c7f7363c8f206dc30b14" FOREIGN KEY (refaddresstype) REFERENCES public.addresstype(refaddresstype);
 \   ALTER TABLE ONLY public.addresswarehouses DROP CONSTRAINT "FK_02be016c7f7363c8f206dc30b14";
       public          postgres    false    3867    264    261            �           2606    92725 *   usercompany FK_03a99d019799f22011e70444d29    FK CONSTRAINT     �   ALTER TABLE ONLY public.usercompany
    ADD CONSTRAINT "FK_03a99d019799f22011e70444d29" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 V   ALTER TABLE ONLY public.usercompany DROP CONSTRAINT "FK_03a99d019799f22011e70444d29";
       public          postgres    false    258    227    3785            .           2606    140547 1   inventorydimension FK_04da507e08fd7c1c355a87d52fb    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorydimension
    ADD CONSTRAINT "FK_04da507e08fd7c1c355a87d52fb" FOREIGN KEY (refinventorydimensionbatch) REFERENCES public.inventorydimensionbatch(refinventorydimensionbatch);
 ]   ALTER TABLE ONLY public.inventorydimension DROP CONSTRAINT "FK_04da507e08fd7c1c355a87d52fb";
       public          postgres    false    3911    286    284            =           2606    139871 <   inventoryreceivingjournalline FK_0644426bc9145f3af44072fe4f4    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventoryreceivingjournalline
    ADD CONSTRAINT "FK_0644426bc9145f3af44072fe4f4" FOREIGN KEY (refinventoryreceivingjournalstatus) REFERENCES public.inventoryreceivingjournalstatus(refinventoryreceivingjournalstatus);
 h   ALTER TABLE ONLY public.inventoryreceivingjournalline DROP CONSTRAINT "FK_0644426bc9145f3af44072fe4f4";
       public          postgres    false    3919    290    288            /           2606    139771 1   inventorydimension FK_06ab33dc0ce0bc995a9fce7b328    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorydimension
    ADD CONSTRAINT "FK_06ab33dc0ce0bc995a9fce7b328" FOREIGN KEY (refinventorydimensionowner) REFERENCES public.inventorydimensionowner(refinventorydimensionowner);
 ]   ALTER TABLE ONLY public.inventorydimension DROP CONSTRAINT "FK_06ab33dc0ce0bc995a9fce7b328";
       public          postgres    false    3907    286    282                       2606    116260 )   itemsgroup FK_06de51550cda811246386c2c588    FK CONSTRAINT     �   ALTER TABLE ONLY public.itemsgroup
    ADD CONSTRAINT "FK_06de51550cda811246386c2c588" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 U   ALTER TABLE ONLY public.itemsgroup DROP CONSTRAINT "FK_06de51550cda811246386c2c588";
       public          postgres    false    227    272    3785            $           2606    139746 3   inventorytransaction FK_078766b1c40f73087101f1a59f6    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorytransaction
    ADD CONSTRAINT "FK_078766b1c40f73087101f1a59f6" FOREIGN KEY (refinventorytransactionstatusoutput) REFERENCES public.inventorytransactionstatusoutput(refinventorytransactionstatusoutput);
 _   ALTER TABLE ONLY public.inventorytransaction DROP CONSTRAINT "FK_078766b1c40f73087101f1a59f6";
       public          postgres    false    280    3897    277            a           2606    140522 8   itemstoragedimensionmodel FK_080f5ccaa10f8d834077b6e8396    FK CONSTRAINT     �   ALTER TABLE ONLY public.itemstoragedimensionmodel
    ADD CONSTRAINT "FK_080f5ccaa10f8d834077b6e8396" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 d   ALTER TABLE ONLY public.itemstoragedimensionmodel DROP CONSTRAINT "FK_080f5ccaa10f8d834077b6e8396";
       public          postgres    false    3785    300    227            l           2606    140900 ;   inventorydimensionserialitem FK_08c1f73ee09dffeb617a515ead6    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorydimensionserialitem
    ADD CONSTRAINT "FK_08c1f73ee09dffeb617a515ead6" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 g   ALTER TABLE ONLY public.inventorydimensionserialitem DROP CONSTRAINT "FK_08c1f73ee09dffeb617a515ead6";
       public          postgres    false    3855    257    257    303    303            �           2606    92390 +   deliverymode FK_095212296f24be1812daaf6c751    FK CONSTRAINT     �   ALTER TABLE ONLY public.deliverymode
    ADD CONSTRAINT "FK_095212296f24be1812daaf6c751" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 W   ALTER TABLE ONLY public.deliverymode DROP CONSTRAINT "FK_095212296f24be1812daaf6c751";
       public          postgres    false    245    257    257    3855    245            %           2606    139711 3   inventorytransaction FK_0dffe1cb06d79683be72f9cc4cf    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorytransaction
    ADD CONSTRAINT "FK_0dffe1cb06d79683be72f9cc4cf" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 _   ALTER TABLE ONLY public.inventorytransaction DROP CONSTRAINT "FK_0dffe1cb06d79683be72f9cc4cf";
       public          postgres    false    280    280    257    257    3855                       2606    139706 9   inventorytransactionorigin FK_0ea939dd96ea7bf3bd0204c217e    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorytransactionorigin
    ADD CONSTRAINT "FK_0ea939dd96ea7bf3bd0204c217e" FOREIGN KEY (refinventorytransactionorigin) REFERENCES public.inventorytransaction(refinventorytransactionorigin);
 e   ALTER TABLE ONLY public.inventorytransactionorigin DROP CONSTRAINT "FK_0ea939dd96ea7bf3bd0204c217e";
       public          postgres    false    3903    276    280            7           2606    139806 8   inventoryreceivingjournal FK_0ed291ad7e20236f48c43d12724    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventoryreceivingjournal
    ADD CONSTRAINT "FK_0ed291ad7e20236f48c43d12724" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 d   ALTER TABLE ONLY public.inventoryreceivingjournal DROP CONSTRAINT "FK_0ed291ad7e20236f48c43d12724";
       public          postgres    false    257    257    287    287    3855            �           2606    140537 ,   itemsreleased FK_114c2c0d68ebd13e4f3733570a4    FK CONSTRAINT     
  ALTER TABLE ONLY public.itemsreleased
    ADD CONSTRAINT "FK_114c2c0d68ebd13e4f3733570a4" FOREIGN KEY (refitemstoragedimensionmodel, refcompany, reforganisation) REFERENCES public.itemstoragedimensionmodel(refitemstoragedimensionmodel, refcompany, reforganisation);
 X   ALTER TABLE ONLY public.itemsreleased DROP CONSTRAINT "FK_114c2c0d68ebd13e4f3733570a4";
       public          postgres    false    300    254    254    254    3939    300    300            o           2606    92125 (   warehouse FK_119e16714f13b115b2110c61060    FK CONSTRAINT     �   ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT "FK_119e16714f13b115b2110c61060" FOREIGN KEY (idheaderparametre) REFERENCES public.parametresheaders(idheaderparametre);
 T   ALTER TABLE ONLY public.warehouse DROP CONSTRAINT "FK_119e16714f13b115b2110c61060";
       public          postgres    false    231    3791    228            �           2606    92660 ,   uomconversion FK_120ea49f1a7989d38370fbfb706    FK CONSTRAINT     �   ALTER TABLE ONLY public.uomconversion
    ADD CONSTRAINT "FK_120ea49f1a7989d38370fbfb706" FOREIGN KEY (refunitto, refcompany, reforganisation) REFERENCES public.units(refunit, refcompany, reforganisation);
 X   ALTER TABLE ONLY public.uomconversion DROP CONSTRAINT "FK_120ea49f1a7989d38370fbfb706";
       public          postgres    false    3803    255    255    236    255    236    236            P           2606    139966 0   inventorytransfer FK_12bac275dd201ebc0cdf3d0647b    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorytransfer
    ADD CONSTRAINT "FK_12bac275dd201ebc0cdf3d0647b" FOREIGN KEY (refcompany, reforganisation, refaisleto) REFERENCES public.aisle(refcompany, reforganisation, refaisle);
 \   ALTER TABLE ONLY public.inventorytransfer DROP CONSTRAINT "FK_12bac275dd201ebc0cdf3d0647b";
       public          postgres    false    256    256    3853    256    295    295    295            Q           2606    139936 0   inventorytransfer FK_12bbd7d4036857f2b16b0cd402c    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorytransfer
    ADD CONSTRAINT "FK_12bbd7d4036857f2b16b0cd402c" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 \   ALTER TABLE ONLY public.inventorytransfer DROP CONSTRAINT "FK_12bbd7d4036857f2b16b0cd402c";
       public          postgres    false    227    295    3785            �           2606    92635 ,   itemsreleased FK_1377ec34bf2e3f89cc26532498e    FK CONSTRAINT     �   ALTER TABLE ONLY public.itemsreleased
    ADD CONSTRAINT "FK_1377ec34bf2e3f89cc26532498e" FOREIGN KEY (reftaxesales, refcompany, reforganisation) REFERENCES public.taxe(reftaxe, refcompany, reforganisation);
 X   ALTER TABLE ONLY public.itemsreleased DROP CONSTRAINT "FK_1377ec34bf2e3f89cc26532498e";
       public          postgres    false    243    3829    254    254    254    243    243            �           2606    92750 '   location FK_15084993e84728dbd9d7bf5f0d5    FK CONSTRAINT     �   ALTER TABLE ONLY public.location
    ADD CONSTRAINT "FK_15084993e84728dbd9d7bf5f0d5" FOREIGN KEY (refaisle, refcompany, reforganisation) REFERENCES public.aisle(refaisle, refcompany, reforganisation);
 S   ALTER TABLE ONLY public.location DROP CONSTRAINT "FK_15084993e84728dbd9d7bf5f0d5";
       public          postgres    false    260    260    260    3853    256    256    256            �           2606    92320 '   taxeline FK_150ad86b38254832809e6c3d838    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxeline
    ADD CONSTRAINT "FK_150ad86b38254832809e6c3d838" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 S   ALTER TABLE ONLY public.taxeline DROP CONSTRAINT "FK_150ad86b38254832809e6c3d838";
       public          postgres    false    3855    257    257    240    240            �           2606    92220 #   area FK_152a37bab5654692c7b9f526f8a    FK CONSTRAINT     �   ALTER TABLE ONLY public.area
    ADD CONSTRAINT "FK_152a37bab5654692c7b9f526f8a" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 O   ALTER TABLE ONLY public.area DROP CONSTRAINT "FK_152a37bab5654692c7b9f526f8a";
       public          postgres    false    235    3785    227            �           2606    92805 0   addresswarehouses FK_162cfb7b215e4fa4717a1f08075    FK CONSTRAINT     �   ALTER TABLE ONLY public.addresswarehouses
    ADD CONSTRAINT "FK_162cfb7b215e4fa4717a1f08075" FOREIGN KEY (refcompany, reforganisation, refaddress) REFERENCES public.address(refcompany, reforganisation, refaddress);
 \   ALTER TABLE ONLY public.addresswarehouses DROP CONSTRAINT "FK_162cfb7b215e4fa4717a1f08075";
       public          postgres    false    262    264    264    264    3869    262    262            �           2606    92200 )   parametres FK_16ab240bf85ac261ad2587636cf    FK CONSTRAINT     �   ALTER TABLE ONLY public.parametres
    ADD CONSTRAINT "FK_16ab240bf85ac261ad2587636cf" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 U   ALTER TABLE ONLY public.parametres DROP CONSTRAINT "FK_16ab240bf85ac261ad2587636cf";
       public          postgres    false    234    257    257    3855    234            �           2606    92470 .   categoriesgroup FK_1a4280a5d75984a5c0c120f66b6    FK CONSTRAINT     �   ALTER TABLE ONLY public.categoriesgroup
    ADD CONSTRAINT "FK_1a4280a5d75984a5c0c120f66b6" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 Z   ALTER TABLE ONLY public.categoriesgroup DROP CONSTRAINT "FK_1a4280a5d75984a5c0c120f66b6";
       public          postgres    false    250    3785    227            �           2606    92595 ,   itemsreleased FK_1b8e0dfc91dbd21c1119cc26a17    FK CONSTRAINT     �   ALTER TABLE ONLY public.itemsreleased
    ADD CONSTRAINT "FK_1b8e0dfc91dbd21c1119cc26a17" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 X   ALTER TABLE ONLY public.itemsreleased DROP CONSTRAINT "FK_1b8e0dfc91dbd21c1119cc26a17";
       public          postgres    false    227    3785    254            H           2606    139911 4   inventorytransferline FK_1c121c119365ddcd6380549ed1c    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorytransferline
    ADD CONSTRAINT "FK_1c121c119365ddcd6380549ed1c" FOREIGN KEY (refcurrency) REFERENCES public.currency(refcurrency);
 `   ALTER TABLE ONLY public.inventorytransferline DROP CONSTRAINT "FK_1c121c119365ddcd6380549ed1c";
       public          postgres    false    219    293    3767            �           2606    92395 +   deliverymode FK_1e64ccf78fdc5c13f3f9ab8c2e0    FK CONSTRAINT     �   ALTER TABLE ONLY public.deliverymode
    ADD CONSTRAINT "FK_1e64ccf78fdc5c13f3f9ab8c2e0" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 W   ALTER TABLE ONLY public.deliverymode DROP CONSTRAINT "FK_1e64ccf78fdc5c13f3f9ab8c2e0";
       public          postgres    false    3785    245    227            �           2606    92355 *   taxebygroup FK_1e7630bde40260fe0eea424524d    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxebygroup
    ADD CONSTRAINT "FK_1e7630bde40260fe0eea424524d" FOREIGN KEY (reftaxe, refcompany, reforganisation) REFERENCES public.taxe(reftaxe, refcompany, reforganisation);
 V   ALTER TABLE ONLY public.taxebygroup DROP CONSTRAINT "FK_1e7630bde40260fe0eea424524d";
       public          postgres    false    242    242    242    243    3829    243    243            >           2606    139866 <   inventoryreceivingjournalline FK_1e86b82de952b4a1ce079d01793    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventoryreceivingjournalline
    ADD CONSTRAINT "FK_1e86b82de952b4a1ce079d01793" FOREIGN KEY (inventorydimensionid) REFERENCES public.inventorydimension(inventorydimensionid);
 h   ALTER TABLE ONLY public.inventoryreceivingjournalline DROP CONSTRAINT "FK_1e86b82de952b4a1ce079d01793";
       public          postgres    false    3913    286    290                       2606    92890 1   purchaseorderlines FK_1ed8256552b7c39db99ad60944a    FK CONSTRAINT     �   ALTER TABLE ONLY public.purchaseorderlines
    ADD CONSTRAINT "FK_1ed8256552b7c39db99ad60944a" FOREIGN KEY (refitem, refcompany, reforganisation) REFERENCES public.itemsreleased(refitem, refcompany, reforganisation);
 ]   ALTER TABLE ONLY public.purchaseorderlines DROP CONSTRAINT "FK_1ed8256552b7c39db99ad60944a";
       public          postgres    false    254    254    254    3849    269    269    269            x           2606    92145 -   sitegeographic FK_1eea0f4d456178c7a87eb0442b0    FK CONSTRAINT     �   ALTER TABLE ONLY public.sitegeographic
    ADD CONSTRAINT "FK_1eea0f4d456178c7a87eb0442b0" FOREIGN KEY (idheaderparametre) REFERENCES public.parametresheaders(idheaderparametre);
 Y   ALTER TABLE ONLY public.sitegeographic DROP CONSTRAINT "FK_1eea0f4d456178c7a87eb0442b0";
       public          postgres    false    229    3791    231            0           2606    139766 1   inventorydimension FK_1f800c6ea0a5c20ea0dbc1755d6    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorydimension
    ADD CONSTRAINT "FK_1f800c6ea0a5c20ea0dbc1755d6" FOREIGN KEY (refinventorydimensionserial) REFERENCES public.inventorydimensionserial(refinventorydimensionserial);
 ]   ALTER TABLE ONLY public.inventorydimension DROP CONSTRAINT "FK_1f800c6ea0a5c20ea0dbc1755d6";
       public          postgres    false    286    283    3909            I           2606    139926 4   inventorytransferline FK_21d0f92554582bfc009552993bd    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorytransferline
    ADD CONSTRAINT "FK_21d0f92554582bfc009552993bd" FOREIGN KEY (refinventorytransferstatus) REFERENCES public.inventorytransferstatus(refinventorytransferstatus);
 `   ALTER TABLE ONLY public.inventorytransferline DROP CONSTRAINT "FK_21d0f92554582bfc009552993bd";
       public          postgres    false    3927    294    293            �           2606    140542 ,   itemsreleased FK_224796f8f4ac27a4ba22df648d5    FK CONSTRAINT       ALTER TABLE ONLY public.itemsreleased
    ADD CONSTRAINT "FK_224796f8f4ac27a4ba22df648d5" FOREIGN KEY (refitemtrackingdimensionmodel, refcompany, reforganisation) REFERENCES public.itemtrackingdimensionmodel(refitemtrackingdimensionmodel, refcompany, reforganisation);
 X   ALTER TABLE ONLY public.itemsreleased DROP CONSTRAINT "FK_224796f8f4ac27a4ba22df648d5";
       public          postgres    false    298    254    254    254    3935    298    298            8           2606    139821 8   inventoryreceivingjournal FK_24c8324b06a86f14bfb99607581    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventoryreceivingjournal
    ADD CONSTRAINT "FK_24c8324b06a86f14bfb99607581" FOREIGN KEY (refcompany, reforganisation, refpurchaseorder) REFERENCES public.purchaseorder(refcompany, reforganisation, refpurchaseorder);
 d   ALTER TABLE ONLY public.inventoryreceivingjournal DROP CONSTRAINT "FK_24c8324b06a86f14bfb99607581";
       public          postgres    false    270    270    287    287    287    3885    270            �           2606    92460 )   categories FK_26a6dc58bc867f7fb7d54543830    FK CONSTRAINT     �   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT "FK_26a6dc58bc867f7fb7d54543830" FOREIGN KEY (refcategoriesgroup, refcompany, reforganisation) REFERENCES public.categoriesgroup(refcategoriesgroup, refcompany, reforganisation);
 U   ALTER TABLE ONLY public.categories DROP CONSTRAINT "FK_26a6dc58bc867f7fb7d54543830";
       public          postgres    false    250    250    3843    249    250    249    249            �           2606    92335 (   taxegroup FK_277634f3e379e5b391dfc8f7857    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxegroup
    ADD CONSTRAINT "FK_277634f3e379e5b391dfc8f7857" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 T   ALTER TABLE ONLY public.taxegroup DROP CONSTRAINT "FK_277634f3e379e5b391dfc8f7857";
       public          postgres    false    241    241    257    257    3855            �           2606    92195 2   parametresattributs FK_2883fc363a54a3d726197b53242    FK CONSTRAINT     �   ALTER TABLE ONLY public.parametresattributs
    ADD CONSTRAINT "FK_2883fc363a54a3d726197b53242" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 ^   ALTER TABLE ONLY public.parametresattributs DROP CONSTRAINT "FK_2883fc363a54a3d726197b53242";
       public          postgres    false    227    233    3785            R           2606    139941 0   inventorytransfer FK_291bd1439924c83ba789841fd1b    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorytransfer
    ADD CONSTRAINT "FK_291bd1439924c83ba789841fd1b" FOREIGN KEY (refcompany, reforganisation, refwarehousefrom) REFERENCES public.warehouse(refcompany, reforganisation, refwarehouse);
 \   ALTER TABLE ONLY public.inventorytransfer DROP CONSTRAINT "FK_291bd1439924c83ba789841fd1b";
       public          postgres    false    228    228    295    295    295    3787    228            �           2606    92605 ,   itemsreleased FK_2a54ee4af1e2b90173cfb93caed    FK CONSTRAINT     �   ALTER TABLE ONLY public.itemsreleased
    ADD CONSTRAINT "FK_2a54ee4af1e2b90173cfb93caed" FOREIGN KEY (refunitsales, refcompany, reforganisation) REFERENCES public.units(refunit, refcompany, reforganisation);
 X   ALTER TABLE ONLY public.itemsreleased DROP CONSTRAINT "FK_2a54ee4af1e2b90173cfb93caed";
       public          postgres    false    236    3803    254    236    254    236    254            �           2606    92535 -   vendorreleased FK_2ab7757b9b2dbf343e7abc4e5f0    FK CONSTRAINT     �   ALTER TABLE ONLY public.vendorreleased
    ADD CONSTRAINT "FK_2ab7757b9b2dbf343e7abc4e5f0" FOREIGN KEY (refpaymentmethod, refcompany, reforganisation) REFERENCES public.paymentmethod(refpaymentmethod, refcompany, reforganisation);
 Y   ALTER TABLE ONLY public.vendorreleased DROP CONSTRAINT "FK_2ab7757b9b2dbf343e7abc4e5f0";
       public          postgres    false    247    251    251    251    3837    247    247            y           2606    92135 -   sitegeographic FK_2ac1e70c6853a12d1fc38eca025    FK CONSTRAINT     �   ALTER TABLE ONLY public.sitegeographic
    ADD CONSTRAINT "FK_2ac1e70c6853a12d1fc38eca025" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 Y   ALTER TABLE ONLY public.sitegeographic DROP CONSTRAINT "FK_2ac1e70c6853a12d1fc38eca025";
       public          postgres    false    229    257    257    3855    229            �           2606    92675 $   aisle FK_2b1956cd40962850c756df8e6d1    FK CONSTRAINT     �   ALTER TABLE ONLY public.aisle
    ADD CONSTRAINT "FK_2b1956cd40962850c756df8e6d1" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 P   ALTER TABLE ONLY public.aisle DROP CONSTRAINT "FK_2b1956cd40962850c756df8e6d1";
       public          postgres    false    3785    227    256            �           2606    92385 *   vendorgroup FK_2b92e8d285554ba3a660694663f    FK CONSTRAINT     �   ALTER TABLE ONLY public.vendorgroup
    ADD CONSTRAINT "FK_2b92e8d285554ba3a660694663f" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 V   ALTER TABLE ONLY public.vendorgroup DROP CONSTRAINT "FK_2b92e8d285554ba3a660694663f";
       public          postgres    false    3785    244    227            �           2606    92465 .   categoriesgroup FK_2c2e04bb633afdabc2dda7f3630    FK CONSTRAINT     �   ALTER TABLE ONLY public.categoriesgroup
    ADD CONSTRAINT "FK_2c2e04bb633afdabc2dda7f3630" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 Z   ALTER TABLE ONLY public.categoriesgroup DROP CONSTRAINT "FK_2c2e04bb633afdabc2dda7f3630";
       public          postgres    false    250    257    257    3855    250            �           2606    92475 .   categoriesgroup FK_2d35d57e41a187a00e5bce8d2dd    FK CONSTRAINT     �   ALTER TABLE ONLY public.categoriesgroup
    ADD CONSTRAINT "FK_2d35d57e41a187a00e5bce8d2dd" FOREIGN KEY (refcontrolobject) REFERENCES public.controlobject(refcontrolobject);
 Z   ALTER TABLE ONLY public.categoriesgroup DROP CONSTRAINT "FK_2d35d57e41a187a00e5bce8d2dd";
       public          postgres    false    250    222    3773            d           2606    140860 ;   inventorydimensionpalletitem FK_2e973ab59c1c98d33c5572b7472    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorydimensionpalletitem
    ADD CONSTRAINT "FK_2e973ab59c1c98d33c5572b7472" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 g   ALTER TABLE ONLY public.inventorydimensionpalletitem DROP CONSTRAINT "FK_2e973ab59c1c98d33c5572b7472";
       public          postgres    false    257    3855    301    257    301            �           2606    92400 /   paymentcondition FK_302befef4d74f6da038b84923b1    FK CONSTRAINT     �   ALTER TABLE ONLY public.paymentcondition
    ADD CONSTRAINT "FK_302befef4d74f6da038b84923b1" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 [   ALTER TABLE ONLY public.paymentcondition DROP CONSTRAINT "FK_302befef4d74f6da038b84923b1";
       public          postgres    false    257    246    246    3855    257            �           2606    92550 7   purchaserequisitionlines FK_31b85fc4b60e7ac19c61d9ddfa1    FK CONSTRAINT     �   ALTER TABLE ONLY public.purchaserequisitionlines
    ADD CONSTRAINT "FK_31b85fc4b60e7ac19c61d9ddfa1" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 c   ALTER TABLE ONLY public.purchaserequisitionlines DROP CONSTRAINT "FK_31b85fc4b60e7ac19c61d9ddfa1";
       public          postgres    false    3785    253    227            p           2606    108062 (   warehouse FK_321bdccb903de287efe8aeb2182    FK CONSTRAINT     	  ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT "FK_321bdccb903de287efe8aeb2182" FOREIGN KEY (refdefaultexpeditionlocation, refdefaultexpeditionaisle, refcompany, reforganisation) REFERENCES public.location(reflocation, refaisle, refcompany, reforganisation);
 T   ALTER TABLE ONLY public.warehouse DROP CONSTRAINT "FK_321bdccb903de287efe8aeb2182";
       public          postgres    false    260    228    228    228    3865    260    260    228    260            �           2606    92375 #   taxe FK_323a5d8ede04d9a39a05a1cc888    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxe
    ADD CONSTRAINT "FK_323a5d8ede04d9a39a05a1cc888" FOREIGN KEY (refcurrency) REFERENCES public.currency(refcurrency);
 O   ALTER TABLE ONLY public.taxe DROP CONSTRAINT "FK_323a5d8ede04d9a39a05a1cc888";
       public          postgres    false    243    3767    219            �           2606    92640 ,   itemsreleased FK_335890878d7fff8576778be70c4    FK CONSTRAINT     �   ALTER TABLE ONLY public.itemsreleased
    ADD CONSTRAINT "FK_335890878d7fff8576778be70c4" FOREIGN KEY (reftaxepurchase, refcompany, reforganisation) REFERENCES public.taxe(reftaxe, refcompany, reforganisation);
 X   ALTER TABLE ONLY public.itemsreleased DROP CONSTRAINT "FK_335890878d7fff8576778be70c4";
       public          postgres    false    243    243    243    3829    254    254    254                       2606    92860 (   itemclass FK_336445eae796b411687cefd3275    FK CONSTRAINT     �   ALTER TABLE ONLY public.itemclass
    ADD CONSTRAINT "FK_336445eae796b411687cefd3275" FOREIGN KEY (refitem, refcompany, reforganisation) REFERENCES public.itemsreleased(refitem, refcompany, reforganisation);
 T   ALTER TABLE ONLY public.itemclass DROP CONSTRAINT "FK_336445eae796b411687cefd3275";
       public          postgres    false    267    267    267    254    254    3849    254            1           2606    139776 1   inventorydimension FK_341b0b9fbaa56008b9ca1b056de    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorydimension
    ADD CONSTRAINT "FK_341b0b9fbaa56008b9ca1b056de" FOREIGN KEY (refinventorydimensionpallet) REFERENCES public.inventorydimensionpallet(refinventorydimensionpallet);
 ]   ALTER TABLE ONLY public.inventorydimension DROP CONSTRAINT "FK_341b0b9fbaa56008b9ca1b056de";
       public          postgres    false    286    281    3905            �           2606    92540 -   vendorreleased FK_35cef9912fe3f9ad81f911268ee    FK CONSTRAINT     �   ALTER TABLE ONLY public.vendorreleased
    ADD CONSTRAINT "FK_35cef9912fe3f9ad81f911268ee" FOREIGN KEY (reftaxegroup, refcompany, reforganisation) REFERENCES public.taxegroup(reftaxegroup, refcompany, reforganisation);
 Y   ALTER TABLE ONLY public.vendorreleased DROP CONSTRAINT "FK_35cef9912fe3f9ad81f911268ee";
       public          postgres    false    241    251    251    251    3825    241    241            &           2606    139726 3   inventorytransaction FK_35d1c53b65c850c621335b24be8    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorytransaction
    ADD CONSTRAINT "FK_35d1c53b65c850c621335b24be8" FOREIGN KEY (refinventorytransactionorigin) REFERENCES public.inventorytransactionorigin(refinventorytransactionorigin);
 _   ALTER TABLE ONLY public.inventorytransaction DROP CONSTRAINT "FK_35d1c53b65c850c621335b24be8";
       public          postgres    false    3895    276    280            �           2606    92435 .   categoriesitems FK_37e35aa2540897d139544c314b1    FK CONSTRAINT     �   ALTER TABLE ONLY public.categoriesitems
    ADD CONSTRAINT "FK_37e35aa2540897d139544c314b1" FOREIGN KEY (refcategoriesgroup, refcompany, reforganisation) REFERENCES public.categoriesgroup(refcategoriesgroup, refcompany, reforganisation);
 Z   ALTER TABLE ONLY public.categoriesitems DROP CONSTRAINT "FK_37e35aa2540897d139544c314b1";
       public          postgres    false    250    248    248    248    3843    250    250                       2606    108123 -   addressvendors FK_37e914ad4de4499605b0ea245b2    FK CONSTRAINT     �   ALTER TABLE ONLY public.addressvendors
    ADD CONSTRAINT "FK_37e914ad4de4499605b0ea245b2" FOREIGN KEY (refcompany, reforganisation, refaddress) REFERENCES public.address(refcompany, reforganisation, refaddress);
 Y   ALTER TABLE ONLY public.addressvendors DROP CONSTRAINT "FK_37e914ad4de4499605b0ea245b2";
       public          postgres    false    262    271    271    271    3869    262    262            h           2606    140890 :   inventorydimensionowneritem FK_3a9e47c0653af0b7e15ba85eadf    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorydimensionowneritem
    ADD CONSTRAINT "FK_3a9e47c0653af0b7e15ba85eadf" FOREIGN KEY (refitem, refcompany, reforganisation) REFERENCES public.itemsreleased(refitem, refcompany, reforganisation);
 f   ALTER TABLE ONLY public.inventorydimensionowneritem DROP CONSTRAINT "FK_3a9e47c0653af0b7e15ba85eadf";
       public          postgres    false    254    254    302    3849    302    254    302            b           2606    140517 8   itemstoragedimensionmodel FK_3d5c9df42c776d3d37752cb1a21    FK CONSTRAINT     �   ALTER TABLE ONLY public.itemstoragedimensionmodel
    ADD CONSTRAINT "FK_3d5c9df42c776d3d37752cb1a21" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 d   ALTER TABLE ONLY public.itemstoragedimensionmodel DROP CONSTRAINT "FK_3d5c9df42c776d3d37752cb1a21";
       public          postgres    false    257    257    3855    300    300            �           2606    92280 2   purchaserequisition FK_3ede83ad8fc9cfab0ffe9977637    FK CONSTRAINT     �   ALTER TABLE ONLY public.purchaserequisition
    ADD CONSTRAINT "FK_3ede83ad8fc9cfab0ffe9977637" FOREIGN KEY (approvedby, refcompany, reforganisation) REFERENCES public.usercompany(matricule, refcompany, reforganisation);
 ^   ALTER TABLE ONLY public.purchaserequisition DROP CONSTRAINT "FK_3ede83ad8fc9cfab0ffe9977637";
       public          postgres    false    238    3857    258    258    258    238    238            �           2606    92820 0   addresswarehouses FK_3f2a2d472f216346fcc04cfe133    FK CONSTRAINT     �   ALTER TABLE ONLY public.addresswarehouses
    ADD CONSTRAINT "FK_3f2a2d472f216346fcc04cfe133" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 \   ALTER TABLE ONLY public.addresswarehouses DROP CONSTRAINT "FK_3f2a2d472f216346fcc04cfe133";
       public          postgres    false    264    3785    227            �           2606    92795 5   addresssitegeographics FK_3fb5de09c7d4e4e8b7ea6a74b62    FK CONSTRAINT     �   ALTER TABLE ONLY public.addresssitegeographics
    ADD CONSTRAINT "FK_3fb5de09c7d4e4e8b7ea6a74b62" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 a   ALTER TABLE ONLY public.addresssitegeographics DROP CONSTRAINT "FK_3fb5de09c7d4e4e8b7ea6a74b62";
       public          postgres    false    263    3785    227            	           2606    92895 1   purchaseorderlines FK_404ac42f8e28c61525ff300f526    FK CONSTRAINT     �   ALTER TABLE ONLY public.purchaseorderlines
    ADD CONSTRAINT "FK_404ac42f8e28c61525ff300f526" FOREIGN KEY (idlinepurchaserequisition) REFERENCES public.purchaserequisitionlines(id);
 ]   ALTER TABLE ONLY public.purchaseorderlines DROP CONSTRAINT "FK_404ac42f8e28c61525ff300f526";
       public          postgres    false    253    3847    269            ^           2606    140507 9   itemtrackingdimensionmodel FK_41a438b05d78ab350689b780cd5    FK CONSTRAINT     �   ALTER TABLE ONLY public.itemtrackingdimensionmodel
    ADD CONSTRAINT "FK_41a438b05d78ab350689b780cd5" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 e   ALTER TABLE ONLY public.itemtrackingdimensionmodel DROP CONSTRAINT "FK_41a438b05d78ab350689b780cd5";
       public          postgres    false    3785    227    298            t           2606    141165 .   inventoryonhand FK_422420ac8be43d3823a1fcf5d23    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventoryonhand
    ADD CONSTRAINT "FK_422420ac8be43d3823a1fcf5d23" FOREIGN KEY (inventorydimensionid) REFERENCES public.inventorydimension(inventorydimensionid);
 Z   ALTER TABLE ONLY public.inventoryonhand DROP CONSTRAINT "FK_422420ac8be43d3823a1fcf5d23";
       public          postgres    false    308    286    3913            �           2606    124438 2   purchaserequisition FK_42448b2af55b3bc44ef627fcb10    FK CONSTRAINT     �   ALTER TABLE ONLY public.purchaserequisition
    ADD CONSTRAINT "FK_42448b2af55b3bc44ef627fcb10" FOREIGN KEY (refwarehouse, reforganisation, refcompany) REFERENCES public.warehouse(refwarehouse, reforganisation, refcompany);
 ^   ALTER TABLE ONLY public.purchaserequisition DROP CONSTRAINT "FK_42448b2af55b3bc44ef627fcb10";
       public          postgres    false    228    3787    238    228    228    238    238            p           2606    140935 :   inventorydimensionbatchitem FK_477d32bcbe8fbe6e8a01c81bb0c    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorydimensionbatchitem
    ADD CONSTRAINT "FK_477d32bcbe8fbe6e8a01c81bb0c" FOREIGN KEY (refinventorydimensionbatch) REFERENCES public.inventorydimensionbatch(refinventorydimensionbatch);
 f   ALTER TABLE ONLY public.inventorydimensionbatchitem DROP CONSTRAINT "FK_477d32bcbe8fbe6e8a01c81bb0c";
       public          postgres    false    3911    304    284            '           2606    139741 3   inventorytransaction FK_49b0d19253d4ae7925db3ce8467    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorytransaction
    ADD CONSTRAINT "FK_49b0d19253d4ae7925db3ce8467" FOREIGN KEY (refcurrency) REFERENCES public.currency(refcurrency);
 _   ALTER TABLE ONLY public.inventorytransaction DROP CONSTRAINT "FK_49b0d19253d4ae7925db3ce8467";
       public          postgres    false    280    3767    219            9           2606    139811 8   inventoryreceivingjournal FK_4a2d2591c08d5846b0ba6ee62a7    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventoryreceivingjournal
    ADD CONSTRAINT "FK_4a2d2591c08d5846b0ba6ee62a7" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 d   ALTER TABLE ONLY public.inventoryreceivingjournal DROP CONSTRAINT "FK_4a2d2591c08d5846b0ba6ee62a7";
       public          postgres    false    3785    227    287            �           2606    140553 7   purchaserequisitionlines FK_4a323d4312cc2a147c75bbb7369    FK CONSTRAINT     �   ALTER TABLE ONLY public.purchaserequisitionlines
    ADD CONSTRAINT "FK_4a323d4312cc2a147c75bbb7369" FOREIGN KEY (refpurchaserequisitionstatuts) REFERENCES public.purchaserequisitionstatuts(refpurchaserequisitionstatuts);
 c   ALTER TABLE ONLY public.purchaserequisitionlines DROP CONSTRAINT "FK_4a323d4312cc2a147c75bbb7369";
       public          postgres    false    223    253    3777            :           2606    139816 8   inventoryreceivingjournal FK_4acd84dd97b76438684086858f4    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventoryreceivingjournal
    ADD CONSTRAINT "FK_4acd84dd97b76438684086858f4" FOREIGN KEY (refcompany, reforganisation, refwarehouse) REFERENCES public.warehouse(refcompany, reforganisation, refwarehouse);
 d   ALTER TABLE ONLY public.inventoryreceivingjournal DROP CONSTRAINT "FK_4acd84dd97b76438684086858f4";
       public          postgres    false    228    287    228    287    228    287    3787            �           2606    92380 *   vendorgroup FK_4c54dfc5202fcb742788768cebf    FK CONSTRAINT     �   ALTER TABLE ONLY public.vendorgroup
    ADD CONSTRAINT "FK_4c54dfc5202fcb742788768cebf" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 V   ALTER TABLE ONLY public.vendorgroup DROP CONSTRAINT "FK_4c54dfc5202fcb742788768cebf";
       public          postgres    false    257    257    3855    244    244            �           2606    92760 &   address FK_4e749c87802e78fec6cedd48fb7    FK CONSTRAINT     �   ALTER TABLE ONLY public.address
    ADD CONSTRAINT "FK_4e749c87802e78fec6cedd48fb7" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 R   ALTER TABLE ONLY public.address DROP CONSTRAINT "FK_4e749c87802e78fec6cedd48fb7";
       public          postgres    false    262    3785    227            e           2606    140875 ;   inventorydimensionpalletitem FK_515af1753a6f97ecb5056b99edc    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorydimensionpalletitem
    ADD CONSTRAINT "FK_515af1753a6f97ecb5056b99edc" FOREIGN KEY (refinventorydimensionpallet) REFERENCES public.inventorydimensionpallet(refinventorydimensionpallet);
 g   ALTER TABLE ONLY public.inventorydimensionpalletitem DROP CONSTRAINT "FK_515af1753a6f97ecb5056b99edc";
       public          postgres    false    3905    281    301            �           2606    92270 2   purchaserequisition FK_51c5ff40ce4a2eb06b00efe2283    FK CONSTRAINT     �   ALTER TABLE ONLY public.purchaserequisition
    ADD CONSTRAINT "FK_51c5ff40ce4a2eb06b00efe2283" FOREIGN KEY (preparator, refcompany, reforganisation) REFERENCES public.usercompany(matricule, refcompany, reforganisation);
 ^   ALTER TABLE ONLY public.purchaserequisition DROP CONSTRAINT "FK_51c5ff40ce4a2eb06b00efe2283";
       public          postgres    false    258    3857    238    238    238    258    258            ;           2606    139826 8   inventoryreceivingjournal FK_522eab2ab3d13be393e9f626c3d    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventoryreceivingjournal
    ADD CONSTRAINT "FK_522eab2ab3d13be393e9f626c3d" FOREIGN KEY (refcompany, reforganisation, refsitegeographic) REFERENCES public.sitegeographic(refcompany, reforganisation, refsitegeographic);
 d   ALTER TABLE ONLY public.inventoryreceivingjournal DROP CONSTRAINT "FK_522eab2ab3d13be393e9f626c3d";
       public          postgres    false    287    287    229    229    229    3789    287            J           2606    139916 4   inventorytransferline FK_52f946d9982176834b7b4690ec1    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorytransferline
    ADD CONSTRAINT "FK_52f946d9982176834b7b4690ec1" FOREIGN KEY (inventorydimensionid) REFERENCES public.inventorydimension(inventorydimensionid);
 `   ALTER TABLE ONLY public.inventorytransferline DROP CONSTRAINT "FK_52f946d9982176834b7b4690ec1";
       public          postgres    false    286    293    3913            K           2606    139886 4   inventorytransferline FK_54dc11555e255c4bf5b0079fcc7    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorytransferline
    ADD CONSTRAINT "FK_54dc11555e255c4bf5b0079fcc7" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 `   ALTER TABLE ONLY public.inventorytransferline DROP CONSTRAINT "FK_54dc11555e255c4bf5b0079fcc7";
       public          postgres    false    293    293    3855    257    257            �           2606    92330 '   taxeline FK_54fa79664ae21016b4252f95d77    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxeline
    ADD CONSTRAINT "FK_54fa79664ae21016b4252f95d77" FOREIGN KEY (reftaxe, refcompany, reforganisation) REFERENCES public.taxe(reftaxe, refcompany, reforganisation);
 S   ALTER TABLE ONLY public.taxeline DROP CONSTRAINT "FK_54fa79664ae21016b4252f95d77";
       public          postgres    false    243    243    243    240    240    240    3829            �           2606    92420 .   categoriesitems FK_5549484d786843848b8f9c32527    FK CONSTRAINT     �   ALTER TABLE ONLY public.categoriesitems
    ADD CONSTRAINT "FK_5549484d786843848b8f9c32527" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 Z   ALTER TABLE ONLY public.categoriesitems DROP CONSTRAINT "FK_5549484d786843848b8f9c32527";
       public          postgres    false    257    248    248    3855    257            �           2606    92740 '   location FK_55b7d944016e34d1f133233e5b9    FK CONSTRAINT     �   ALTER TABLE ONLY public.location
    ADD CONSTRAINT "FK_55b7d944016e34d1f133233e5b9" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 S   ALTER TABLE ONLY public.location DROP CONSTRAINT "FK_55b7d944016e34d1f133233e5b9";
       public          postgres    false    3855    257    257    260    260            S           2606    139956 0   inventorytransfer FK_5668b532c22e8bcfe7334cfb68b    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorytransfer
    ADD CONSTRAINT "FK_5668b532c22e8bcfe7334cfb68b" FOREIGN KEY (refcompany, reforganisation, reflocationfrom, refaislefrom) REFERENCES public.location(refcompany, reforganisation, reflocation, refaisle);
 \   ALTER TABLE ONLY public.inventorytransfer DROP CONSTRAINT "FK_5668b532c22e8bcfe7334cfb68b";
       public          postgres    false    260    295    295    295    295    3865    260    260    260            {           2606    92150 0   parametresheaders FK_5714ecbdbdf7bb8b061faa88528    FK CONSTRAINT     �   ALTER TABLE ONLY public.parametresheaders
    ADD CONSTRAINT "FK_5714ecbdbdf7bb8b061faa88528" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 \   ALTER TABLE ONLY public.parametresheaders DROP CONSTRAINT "FK_5714ecbdbdf7bb8b061faa88528";
       public          postgres    false    231    3855    257    257    231            u           2606    141160 .   inventoryonhand FK_5798e4b91c3f7352018f347cb27    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventoryonhand
    ADD CONSTRAINT "FK_5798e4b91c3f7352018f347cb27" FOREIGN KEY (refcurrency) REFERENCES public.currency(refcurrency);
 Z   ALTER TABLE ONLY public.inventoryonhand DROP CONSTRAINT "FK_5798e4b91c3f7352018f347cb27";
       public          postgres    false    3767    219    308            |           2606    92155 0   parametresheaders FK_57d7a8cbc74d229cb6663ee84ea    FK CONSTRAINT     �   ALTER TABLE ONLY public.parametresheaders
    ADD CONSTRAINT "FK_57d7a8cbc74d229cb6663ee84ea" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 \   ALTER TABLE ONLY public.parametresheaders DROP CONSTRAINT "FK_57d7a8cbc74d229cb6663ee84ea";
       public          postgres    false    227    231    3785            �           2606    92735 #   user FK_57f285ca898f6b2d3c7be39839e    FK CONSTRAINT     �   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "FK_57f285ca898f6b2d3c7be39839e" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 Q   ALTER TABLE ONLY public."user" DROP CONSTRAINT "FK_57f285ca898f6b2d3c7be39839e";
       public          postgres    false    3785    227    259                       2606    92905 ,   purchaseorder FK_5935f70a4f7d3d38b4c61d09b1d    FK CONSTRAINT     �   ALTER TABLE ONLY public.purchaseorder
    ADD CONSTRAINT "FK_5935f70a4f7d3d38b4c61d09b1d" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 X   ALTER TABLE ONLY public.purchaseorder DROP CONSTRAINT "FK_5935f70a4f7d3d38b4c61d09b1d";
       public          postgres    false    3785    270    227            (           2606    139716 3   inventorytransaction FK_59d9431c7899537eb4cf2a05850    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorytransaction
    ADD CONSTRAINT "FK_59d9431c7899537eb4cf2a05850" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 _   ALTER TABLE ONLY public.inventorytransaction DROP CONSTRAINT "FK_59d9431c7899537eb4cf2a05850";
       public          postgres    false    3785    280    227            f           2606    140870 ;   inventorydimensionpalletitem FK_5b2c6ec9368a5258c43d1173334    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorydimensionpalletitem
    ADD CONSTRAINT "FK_5b2c6ec9368a5258c43d1173334" FOREIGN KEY (refitem, refcompany, reforganisation) REFERENCES public.itemsreleased(refitem, refcompany, reforganisation);
 g   ALTER TABLE ONLY public.inventorydimensionpalletitem DROP CONSTRAINT "FK_5b2c6ec9368a5258c43d1173334";
       public          postgres    false    3849    254    301    301    301    254    254            ?           2606    139851 <   inventoryreceivingjournalline FK_5b36c6ea73cf058a88d44879730    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventoryreceivingjournalline
    ADD CONSTRAINT "FK_5b36c6ea73cf058a88d44879730" FOREIGN KEY (refinventunit, refcompany, reforganisation) REFERENCES public.units(refunit, refcompany, reforganisation);
 h   ALTER TABLE ONLY public.inventoryreceivingjournalline DROP CONSTRAINT "FK_5b36c6ea73cf058a88d44879730";
       public          postgres    false    236    290    290    3803    236    290    236                       2606    92910 ,   purchaseorder FK_5bd5457a0e912b057c7b049df11    FK CONSTRAINT     �   ALTER TABLE ONLY public.purchaseorder
    ADD CONSTRAINT "FK_5bd5457a0e912b057c7b049df11" FOREIGN KEY (refpurchaseorderstatuts) REFERENCES public.purchaseorderstatuts(refpurchaseorderstatuts);
 X   ALTER TABLE ONLY public.purchaseorder DROP CONSTRAINT "FK_5bd5457a0e912b057c7b049df11";
       public          postgres    false    270    3779    224            �           2606    92425 .   categoriesitems FK_5c2337f863369894b085ac44121    FK CONSTRAINT     �   ALTER TABLE ONLY public.categoriesitems
    ADD CONSTRAINT "FK_5c2337f863369894b085ac44121" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 Z   ALTER TABLE ONLY public.categoriesitems DROP CONSTRAINT "FK_5c2337f863369894b085ac44121";
       public          postgres    false    248    3785    227            �           2606    92685 $   aisle FK_5cd6cb6fad77ab2316701023b59    FK CONSTRAINT     �   ALTER TABLE ONLY public.aisle
    ADD CONSTRAINT "FK_5cd6cb6fad77ab2316701023b59" FOREIGN KEY (refarea, refcompany, reforganisation) REFERENCES public.area(refarea, refcompany, reforganisation);
 P   ALTER TABLE ONLY public.aisle DROP CONSTRAINT "FK_5cd6cb6fad77ab2316701023b59";
       public          postgres    false    256    256    235    235    3801    235    256            �           2606    92580 7   purchaserequisitionlines FK_5dba849b973183637596f571aa7    FK CONSTRAINT     �   ALTER TABLE ONLY public.purchaserequisitionlines
    ADD CONSTRAINT "FK_5dba849b973183637596f571aa7" FOREIGN KEY (reftaxe, refcompany, reforganisation) REFERENCES public.taxe(reftaxe, refcompany, reforganisation);
 c   ALTER TABLE ONLY public.purchaserequisitionlines DROP CONSTRAINT "FK_5dba849b973183637596f571aa7";
       public          postgres    false    253    3829    253    243    243    243    253            L           2606    139906 4   inventorytransferline FK_5f29a56ca70e43c5438593ba9a0    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorytransferline
    ADD CONSTRAINT "FK_5f29a56ca70e43c5438593ba9a0" FOREIGN KEY (reftransactionunit, refcompany, reforganisation) REFERENCES public.units(refunit, refcompany, reforganisation);
 `   ALTER TABLE ONLY public.inventorytransferline DROP CONSTRAINT "FK_5f29a56ca70e43c5438593ba9a0";
       public          postgres    false    3803    293    236    236    236    293    293            i           2606    140895 :   inventorydimensionowneritem FK_60e0b348bae95b85e65508998b8    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorydimensionowneritem
    ADD CONSTRAINT "FK_60e0b348bae95b85e65508998b8" FOREIGN KEY (refinventorydimensionowner) REFERENCES public.inventorydimensionowner(refinventorydimensionowner);
 f   ALTER TABLE ONLY public.inventorydimensionowneritem DROP CONSTRAINT "FK_60e0b348bae95b85e65508998b8";
       public          postgres    false    282    302    3907            @           2606    139846 <   inventoryreceivingjournalline FK_62a5ac2b8ee6cbecd575e45e4d7    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventoryreceivingjournalline
    ADD CONSTRAINT "FK_62a5ac2b8ee6cbecd575e45e4d7" FOREIGN KEY (refitem, refcompany, reforganisation) REFERENCES public.itemsreleased(refitem, refcompany, reforganisation);
 h   ALTER TABLE ONLY public.inventoryreceivingjournalline DROP CONSTRAINT "FK_62a5ac2b8ee6cbecd575e45e4d7";
       public          postgres    false    290    3849    290    254    254    290    254            �           2606    92365 #   taxe FK_6474e34163be4b6878e7f0ca9df    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxe
    ADD CONSTRAINT "FK_6474e34163be4b6878e7f0ca9df" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 O   ALTER TABLE ONLY public.taxe DROP CONSTRAINT "FK_6474e34163be4b6878e7f0ca9df";
       public          postgres    false    243    243    3855    257    257            �           2606    92250 )   pricemodel FK_64c6b52ae4dd49f115933364aaa    FK CONSTRAINT     �   ALTER TABLE ONLY public.pricemodel
    ADD CONSTRAINT "FK_64c6b52ae4dd49f115933364aaa" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 U   ALTER TABLE ONLY public.pricemodel DROP CONSTRAINT "FK_64c6b52ae4dd49f115933364aaa";
       public          postgres    false    237    3785    227            A           2606    139856 <   inventoryreceivingjournalline FK_6637a20cfab2dbfe20514033ead    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventoryreceivingjournalline
    ADD CONSTRAINT "FK_6637a20cfab2dbfe20514033ead" FOREIGN KEY (reftransactionunit, refcompany, reforganisation) REFERENCES public.units(refunit, refcompany, reforganisation);
 h   ALTER TABLE ONLY public.inventoryreceivingjournalline DROP CONSTRAINT "FK_6637a20cfab2dbfe20514033ead";
       public          postgres    false    236    236    236    3803    290    290    290            �           2606    92315 %   vendor FK_6656d0905c7619d0ebc8d96958e    FK CONSTRAINT     �   ALTER TABLE ONLY public.vendor
    ADD CONSTRAINT "FK_6656d0905c7619d0ebc8d96958e" FOREIGN KEY (refvendorinvoicing, reforganisation) REFERENCES public.vendor(refvendor, reforganisation);
 Q   ALTER TABLE ONLY public.vendor DROP CONSTRAINT "FK_6656d0905c7619d0ebc8d96958e";
       public          postgres    false    3809    239    239    239    239            �           2606    92615 ,   itemsreleased FK_68e296451e599cd20b25e10850a    FK CONSTRAINT     �   ALTER TABLE ONLY public.itemsreleased
    ADD CONSTRAINT "FK_68e296451e599cd20b25e10850a" FOREIGN KEY (refunitorder, refcompany, reforganisation) REFERENCES public.units(refunit, refcompany, reforganisation);
 X   ALTER TABLE ONLY public.itemsreleased DROP CONSTRAINT "FK_68e296451e599cd20b25e10850a";
       public          postgres    false    254    236    236    236    3803    254    254            [           2606    140487 (   itemmodel FK_6940712fc30f4932cb913eb0175    FK CONSTRAINT     �   ALTER TABLE ONLY public.itemmodel
    ADD CONSTRAINT "FK_6940712fc30f4932cb913eb0175" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 T   ALTER TABLE ONLY public.itemmodel DROP CONSTRAINT "FK_6940712fc30f4932cb913eb0175";
       public          postgres    false    297    257    257    297    3855            T           2606    139971 0   inventorytransfer FK_6a302ef2a5101152ce4594826c5    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorytransfer
    ADD CONSTRAINT "FK_6a302ef2a5101152ce4594826c5" FOREIGN KEY (refcompany, reforganisation, refaislefrom) REFERENCES public.aisle(refcompany, reforganisation, refaisle);
 \   ALTER TABLE ONLY public.inventorytransfer DROP CONSTRAINT "FK_6a302ef2a5101152ce4594826c5";
       public          postgres    false    256    295    295    295    3853    256    256            �           2606    92835 3   uomclassicconversion FK_6c5daabb9d4deb365bfcee1c665    FK CONSTRAINT     �   ALTER TABLE ONLY public.uomclassicconversion
    ADD CONSTRAINT "FK_6c5daabb9d4deb365bfcee1c665" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 _   ALTER TABLE ONLY public.uomclassicconversion DROP CONSTRAINT "FK_6c5daabb9d4deb365bfcee1c665";
       public          postgres    false    3785    266    227            )           2606    139751 3   inventorytransaction FK_6f2220618ca3ba96af71ea3f742    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorytransaction
    ADD CONSTRAINT "FK_6f2220618ca3ba96af71ea3f742" FOREIGN KEY (refinventorytransactionstatusinput) REFERENCES public.inventorytransactionstatusinput(refinventorytransactionstatusinput);
 _   ALTER TABLE ONLY public.inventorytransaction DROP CONSTRAINT "FK_6f2220618ca3ba96af71ea3f742";
       public          postgres    false    280    3899    278            v           2606    141150 .   inventoryonhand FK_6f89665c133e5097504f20d60c5    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventoryonhand
    ADD CONSTRAINT "FK_6f89665c133e5097504f20d60c5" FOREIGN KEY (refitem, refcompany, reforganisation) REFERENCES public.itemsreleased(refitem, refcompany, reforganisation);
 Z   ALTER TABLE ONLY public.inventoryonhand DROP CONSTRAINT "FK_6f89665c133e5097504f20d60c5";
       public          postgres    false    308    308    254    254    254    3849    308            �           2606    92565 7   purchaserequisitionlines FK_7175c12fedfad5bf72826006598    FK CONSTRAINT     �   ALTER TABLE ONLY public.purchaserequisitionlines
    ADD CONSTRAINT "FK_7175c12fedfad5bf72826006598" FOREIGN KEY (refitem, refcompany, reforganisation) REFERENCES public.itemsreleased(refitem, refcompany, reforganisation);
 c   ALTER TABLE ONLY public.purchaserequisitionlines DROP CONSTRAINT "FK_7175c12fedfad5bf72826006598";
       public          postgres    false    254    254    253    3849    254    253    253            w           2606    141145 .   inventoryonhand FK_731a710190f9d95c725575d8089    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventoryonhand
    ADD CONSTRAINT "FK_731a710190f9d95c725575d8089" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 Z   ALTER TABLE ONLY public.inventoryonhand DROP CONSTRAINT "FK_731a710190f9d95c725575d8089";
       public          postgres    false    308    227    3785            2           2606    139781 1   inventorydimension FK_74dd7624eae0ba3e9ba0cd5b9ac    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorydimension
    ADD CONSTRAINT "FK_74dd7624eae0ba3e9ba0cd5b9ac" FOREIGN KEY (reflocation, refaisle, refcompany, reforganisation) REFERENCES public.location(reflocation, refaisle, refcompany, reforganisation);
 ]   ALTER TABLE ONLY public.inventorydimension DROP CONSTRAINT "FK_74dd7624eae0ba3e9ba0cd5b9ac";
       public          postgres    false    286    3865    260    260    260    260    286    286    286            �           2606    92265 2   purchaserequisition FK_7535705b7fa8d5a15b12fdbd855    FK CONSTRAINT     �   ALTER TABLE ONLY public.purchaserequisition
    ADD CONSTRAINT "FK_7535705b7fa8d5a15b12fdbd855" FOREIGN KEY (refpurchaserequisitionstatuts) REFERENCES public.purchaserequisitionstatuts(refpurchaserequisitionstatuts);
 ^   ALTER TABLE ONLY public.purchaserequisition DROP CONSTRAINT "FK_7535705b7fa8d5a15b12fdbd855";
       public          postgres    false    3777    238    223            j           2606    140885 :   inventorydimensionowneritem FK_7694f3b5ae80ebbc69694052ed4    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorydimensionowneritem
    ADD CONSTRAINT "FK_7694f3b5ae80ebbc69694052ed4" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 f   ALTER TABLE ONLY public.inventorydimensionowneritem DROP CONSTRAINT "FK_7694f3b5ae80ebbc69694052ed4";
       public          postgres    false    3785    302    227            �           2606    92505 -   vendorreleased FK_769d9c8c9739b32589e9d24e50d    FK CONSTRAINT     �   ALTER TABLE ONLY public.vendorreleased
    ADD CONSTRAINT "FK_769d9c8c9739b32589e9d24e50d" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 Y   ALTER TABLE ONLY public.vendorreleased DROP CONSTRAINT "FK_769d9c8c9739b32589e9d24e50d";
       public          postgres    false    257    3855    251    251    257            *           2606    139736 3   inventorytransaction FK_76be7eb4f5a6b8e5fd35dfd13d6    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorytransaction
    ADD CONSTRAINT "FK_76be7eb4f5a6b8e5fd35dfd13d6" FOREIGN KEY (reftransactionunit, refcompany, reforganisation) REFERENCES public.units(refunit, refcompany, reforganisation);
 _   ALTER TABLE ONLY public.inventorytransaction DROP CONSTRAINT "FK_76be7eb4f5a6b8e5fd35dfd13d6";
       public          postgres    false    236    280    236    236    3803    280    280            q           2606    92120 (   warehouse FK_770ade4f1d069b92c60c5476f51    FK CONSTRAINT     �   ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT "FK_770ade4f1d069b92c60c5476f51" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 T   ALTER TABLE ONLY public.warehouse DROP CONSTRAINT "FK_770ade4f1d069b92c60c5476f51";
       public          postgres    false    3785    228    227            q           2606    140920 :   inventorydimensionbatchitem FK_77a7ce3383dc464ebff88024d26    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorydimensionbatchitem
    ADD CONSTRAINT "FK_77a7ce3383dc464ebff88024d26" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 f   ALTER TABLE ONLY public.inventorydimensionbatchitem DROP CONSTRAINT "FK_77a7ce3383dc464ebff88024d26";
       public          postgres    false    3855    304    257    304    257            z           2606    92140 -   sitegeographic FK_7891abd930bf53d5fbb71cbc69f    FK CONSTRAINT     �   ALTER TABLE ONLY public.sitegeographic
    ADD CONSTRAINT "FK_7891abd930bf53d5fbb71cbc69f" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 Y   ALTER TABLE ONLY public.sitegeographic DROP CONSTRAINT "FK_7891abd930bf53d5fbb71cbc69f";
       public          postgres    false    229    227    3785            �           2606    92545 7   purchaserequisitionlines FK_7a31a85b98a32ded299c28745cc    FK CONSTRAINT     �   ALTER TABLE ONLY public.purchaserequisitionlines
    ADD CONSTRAINT "FK_7a31a85b98a32ded299c28745cc" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 c   ALTER TABLE ONLY public.purchaserequisitionlines DROP CONSTRAINT "FK_7a31a85b98a32ded299c28745cc";
       public          postgres    false    257    253    253    3855    257                       2606    108138 -   addressvendors FK_7cebac7b09c80695dc8a4076136    FK CONSTRAINT     �   ALTER TABLE ONLY public.addressvendors
    ADD CONSTRAINT "FK_7cebac7b09c80695dc8a4076136" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 Y   ALTER TABLE ONLY public.addressvendors DROP CONSTRAINT "FK_7cebac7b09c80695dc8a4076136";
       public          postgres    false    3785    271    227            �           2606    92650 ,   uomconversion FK_7ded4473c876e85b6f1fc6bcc9b    FK CONSTRAINT     �   ALTER TABLE ONLY public.uomconversion
    ADD CONSTRAINT "FK_7ded4473c876e85b6f1fc6bcc9b" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 X   ALTER TABLE ONLY public.uomconversion DROP CONSTRAINT "FK_7ded4473c876e85b6f1fc6bcc9b";
       public          postgres    false    255    227    3785            3           2606    139791 1   inventorydimension FK_7e2b4d7a44cadceac5bcd3369a8    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorydimension
    ADD CONSTRAINT "FK_7e2b4d7a44cadceac5bcd3369a8" FOREIGN KEY (refarea, refcompany, reforganisation) REFERENCES public.area(refarea, refcompany, reforganisation);
 ]   ALTER TABLE ONLY public.inventorydimension DROP CONSTRAINT "FK_7e2b4d7a44cadceac5bcd3369a8";
       public          postgres    false    235    286    286    286    235    235    3801            r           2606    92115 (   warehouse FK_7eb66bfa0aa1b6d2557e0ce05bc    FK CONSTRAINT     �   ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT "FK_7eb66bfa0aa1b6d2557e0ce05bc" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 T   ALTER TABLE ONLY public.warehouse DROP CONSTRAINT "FK_7eb66bfa0aa1b6d2557e0ce05bc";
       public          postgres    false    257    228    228    3855    257            x           2606    141155 .   inventoryonhand FK_7f02855c68bc43606b072d5da29    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventoryonhand
    ADD CONSTRAINT "FK_7f02855c68bc43606b072d5da29" FOREIGN KEY (refinventunit, refcompany, reforganisation) REFERENCES public.units(refunit, refcompany, reforganisation);
 Z   ALTER TABLE ONLY public.inventoryonhand DROP CONSTRAINT "FK_7f02855c68bc43606b072d5da29";
       public          postgres    false    308    236    236    236    3803    308    308            ~           2606    92180 .   parametreslines FK_7f7ccc332bc2786453fd74ba2e1    FK CONSTRAINT     �   ALTER TABLE ONLY public.parametreslines
    ADD CONSTRAINT "FK_7f7ccc332bc2786453fd74ba2e1" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 Z   ALTER TABLE ONLY public.parametreslines DROP CONSTRAINT "FK_7f7ccc332bc2786453fd74ba2e1";
       public          postgres    false    232    227    3785            �           2606    92815 0   addresswarehouses FK_7f9eb53d1a2cea8848d530d5fee    FK CONSTRAINT     �   ALTER TABLE ONLY public.addresswarehouses
    ADD CONSTRAINT "FK_7f9eb53d1a2cea8848d530d5fee" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 \   ALTER TABLE ONLY public.addresswarehouses DROP CONSTRAINT "FK_7f9eb53d1a2cea8848d530d5fee";
       public          postgres    false    3855    264    257    257    264            �           2606    92690 &   company FK_80344975cdea4d0b926306a18b3    FK CONSTRAINT     �   ALTER TABLE ONLY public.company
    ADD CONSTRAINT "FK_80344975cdea4d0b926306a18b3" FOREIGN KEY (refcurrency) REFERENCES public.currency(refcurrency);
 R   ALTER TABLE ONLY public.company DROP CONSTRAINT "FK_80344975cdea4d0b926306a18b3";
       public          postgres    false    3767    219    257            �           2606    92790 5   addresssitegeographics FK_804c8640c492a3e7f707e0a64a6    FK CONSTRAINT     �   ALTER TABLE ONLY public.addresssitegeographics
    ADD CONSTRAINT "FK_804c8640c492a3e7f707e0a64a6" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 a   ALTER TABLE ONLY public.addresssitegeographics DROP CONSTRAINT "FK_804c8640c492a3e7f707e0a64a6";
       public          postgres    false    263    263    3855    257    257            s           2606    92130 (   warehouse FK_81994a8a1faec8f91172d36db34    FK CONSTRAINT     �   ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT "FK_81994a8a1faec8f91172d36db34" FOREIGN KEY (refcompany, reforganisation, refsitegeographic) REFERENCES public.sitegeographic(refcompany, reforganisation, refsitegeographic);
 T   ALTER TABLE ONLY public.warehouse DROP CONSTRAINT "FK_81994a8a1faec8f91172d36db34";
       public          postgres    false    229    229    229    3789    228    228    228                       2606    92170 .   parametreslines FK_82cafa240a1b22c04851ef88dc9    FK CONSTRAINT     �   ALTER TABLE ONLY public.parametreslines
    ADD CONSTRAINT "FK_82cafa240a1b22c04851ef88dc9" FOREIGN KEY (refcompany, refparametre, reforganisation, value) REFERENCES public.parametresattributs(refcompany, refparametre, reforganisation, value);
 Z   ALTER TABLE ONLY public.parametreslines DROP CONSTRAINT "FK_82cafa240a1b22c04851ef88dc9";
       public          postgres    false    3797    233    233    233    233    232    232    232    232            �           2606    92430 .   categoriesitems FK_8307059aa29de44e44a4b20b52c    FK CONSTRAINT       ALTER TABLE ONLY public.categoriesitems
    ADD CONSTRAINT "FK_8307059aa29de44e44a4b20b52c" FOREIGN KEY (refcategoriesgroup, refcategories, refcompany, reforganisation) REFERENCES public.categories(refcategoriesgroup, refcategories, refcompany, reforganisation);
 Z   ALTER TABLE ONLY public.categoriesitems DROP CONSTRAINT "FK_8307059aa29de44e44a4b20b52c";
       public          postgres    false    249    248    248    248    248    3841    249    249    249            �           2606    92450 )   categories FK_834ddaa2c30322fba9105ce30b4    FK CONSTRAINT     �   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT "FK_834ddaa2c30322fba9105ce30b4" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 U   ALTER TABLE ONLY public.categories DROP CONSTRAINT "FK_834ddaa2c30322fba9105ce30b4";
       public          postgres    false    249    227    3785            4           2606    139801 1   inventorydimension FK_83782baad7afb2c8f0b64d50d96    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorydimension
    ADD CONSTRAINT "FK_83782baad7afb2c8f0b64d50d96" FOREIGN KEY (refsitegeographic, refcompany, reforganisation) REFERENCES public.sitegeographic(refsitegeographic, refcompany, reforganisation);
 ]   ALTER TABLE ONLY public.inventorydimension DROP CONSTRAINT "FK_83782baad7afb2c8f0b64d50d96";
       public          postgres    false    286    286    286    229    229    229    3789            �           2606    92715 *   usercompany FK_84bf65fdc5d9639426416cf092a    FK CONSTRAINT     �   ALTER TABLE ONLY public.usercompany
    ADD CONSTRAINT "FK_84bf65fdc5d9639426416cf092a" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 V   ALTER TABLE ONLY public.usercompany DROP CONSTRAINT "FK_84bf65fdc5d9639426416cf092a";
       public          postgres    false    257    258    258    257    3855            �           2606    92745 '   location FK_860ed295fae1891cef9ca8bd357    FK CONSTRAINT     �   ALTER TABLE ONLY public.location
    ADD CONSTRAINT "FK_860ed295fae1891cef9ca8bd357" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 S   ALTER TABLE ONLY public.location DROP CONSTRAINT "FK_860ed295fae1891cef9ca8bd357";
       public          postgres    false    260    3785    227            �           2606    92555 7   purchaserequisitionlines FK_86b09b837764d4910196b80179f    FK CONSTRAINT     �   ALTER TABLE ONLY public.purchaserequisitionlines
    ADD CONSTRAINT "FK_86b09b837764d4910196b80179f" FOREIGN KEY (idheaderparametre) REFERENCES public.parametresheaders(idheaderparametre);
 c   ALTER TABLE ONLY public.purchaserequisitionlines DROP CONSTRAINT "FK_86b09b837764d4910196b80179f";
       public          postgres    false    3791    231    253            �           2606    92340 (   taxegroup FK_86f1ff6108a162ff401b0b2d4c5    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxegroup
    ADD CONSTRAINT "FK_86f1ff6108a162ff401b0b2d4c5" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 T   ALTER TABLE ONLY public.taxegroup DROP CONSTRAINT "FK_86f1ff6108a162ff401b0b2d4c5";
       public          postgres    false    241    227    3785                       2606    124507 6   usercompanieswarehouses FK_87acc74eb7c6596b6892d1e4f47    FK CONSTRAINT     �   ALTER TABLE ONLY public.usercompanieswarehouses
    ADD CONSTRAINT "FK_87acc74eb7c6596b6892d1e4f47" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 b   ALTER TABLE ONLY public.usercompanieswarehouses DROP CONSTRAINT "FK_87acc74eb7c6596b6892d1e4f47";
       public          postgres    false    273    273    257    257    3855            \           2606    140492 (   itemmodel FK_87dec274509903315182c26ea07    FK CONSTRAINT     �   ALTER TABLE ONLY public.itemmodel
    ADD CONSTRAINT "FK_87dec274509903315182c26ea07" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 T   ALTER TABLE ONLY public.itemmodel DROP CONSTRAINT "FK_87dec274509903315182c26ea07";
       public          postgres    false    3785    227    297            �           2606    92530 -   vendorreleased FK_87e332cf842ed8cf6970a2a7bc0    FK CONSTRAINT     �   ALTER TABLE ONLY public.vendorreleased
    ADD CONSTRAINT "FK_87e332cf842ed8cf6970a2a7bc0" FOREIGN KEY (refpaymentcondition, refcompany, reforganisation) REFERENCES public.paymentcondition(refpaymentcondition, refcompany, reforganisation);
 Y   ALTER TABLE ONLY public.vendorreleased DROP CONSTRAINT "FK_87e332cf842ed8cf6970a2a7bc0";
       public          postgres    false    246    251    251    251    3835    246    246            <           2606    139831 8   inventoryreceivingjournal FK_8a6208fc2c60c3fdb330a3f6695    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventoryreceivingjournal
    ADD CONSTRAINT "FK_8a6208fc2c60c3fdb330a3f6695" FOREIGN KEY (refinventoryreceivingjournalstatus) REFERENCES public.inventoryreceivingjournalstatus(refinventoryreceivingjournalstatus);
 d   ALTER TABLE ONLY public.inventoryreceivingjournal DROP CONSTRAINT "FK_8a6208fc2c60c3fdb330a3f6695";
       public          postgres    false    288    3919    287            �           2606    92520 -   vendorreleased FK_8bb4f3eba0db66428d208a84bdd    FK CONSTRAINT     �   ALTER TABLE ONLY public.vendorreleased
    ADD CONSTRAINT "FK_8bb4f3eba0db66428d208a84bdd" FOREIGN KEY (refvendorgroup, refcompany, reforganisation) REFERENCES public.vendorgroup(refvendorgroup, refcompany, reforganisation);
 Y   ALTER TABLE ONLY public.vendorreleased DROP CONSTRAINT "FK_8bb4f3eba0db66428d208a84bdd";
       public          postgres    false    244    244    244    251    3831    251    251            �           2606    92185 2   parametresattributs FK_8bbfc870de5c69e5cffc90d7811    FK CONSTRAINT     �   ALTER TABLE ONLY public.parametresattributs
    ADD CONSTRAINT "FK_8bbfc870de5c69e5cffc90d7811" FOREIGN KEY (refcompany, refparametre, reforganisation) REFERENCES public.parametres(refcompany, refparametre, reforganisation);
 ^   ALTER TABLE ONLY public.parametresattributs DROP CONSTRAINT "FK_8bbfc870de5c69e5cffc90d7811";
       public          postgres    false    234    233    233    233    3799    234    234            �           2606    92240 $   units FK_8e44b7f36b24012aaf49b3ee103    FK CONSTRAINT     �   ALTER TABLE ONLY public.units
    ADD CONSTRAINT "FK_8e44b7f36b24012aaf49b3ee103" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 P   ALTER TABLE ONLY public.units DROP CONSTRAINT "FK_8e44b7f36b24012aaf49b3ee103";
       public          postgres    false    236    3785    227                       2606    92915 ,   purchaseorder FK_91149273a40c7d0e92fcb520138    FK CONSTRAINT     �   ALTER TABLE ONLY public.purchaseorder
    ADD CONSTRAINT "FK_91149273a40c7d0e92fcb520138" FOREIGN KEY (refvendor, refcompany, reforganisation) REFERENCES public.vendorreleased(refvendor, refcompany, reforganisation);
 X   ALTER TABLE ONLY public.purchaseorder DROP CONSTRAINT "FK_91149273a40c7d0e92fcb520138";
       public          postgres    false    251    251    270    270    251    3845    270            �           2606    92510 -   vendorreleased FK_92cd396325ad798cab89bfd8f79    FK CONSTRAINT     �   ALTER TABLE ONLY public.vendorreleased
    ADD CONSTRAINT "FK_92cd396325ad798cab89bfd8f79" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 Y   ALTER TABLE ONLY public.vendorreleased DROP CONSTRAINT "FK_92cd396325ad798cab89bfd8f79";
       public          postgres    false    3785    227    251            �           2606    92560 7   purchaserequisitionlines FK_95ef4fc721afda1e8f45611be65    FK CONSTRAINT       ALTER TABLE ONLY public.purchaserequisitionlines
    ADD CONSTRAINT "FK_95ef4fc721afda1e8f45611be65" FOREIGN KEY (refpurchaserequisition, refcompany, reforganisation) REFERENCES public.purchaserequisition(refpurchaserequisition, refcompany, reforganisation);
 c   ALTER TABLE ONLY public.purchaserequisitionlines DROP CONSTRAINT "FK_95ef4fc721afda1e8f45611be65";
       public          postgres    false    238    3807    253    253    253    238    238            �           2606    92210 )   parametres FK_972408ebef61d073c8fc9106ab2    FK CONSTRAINT     �   ALTER TABLE ONLY public.parametres
    ADD CONSTRAINT "FK_972408ebef61d073c8fc9106ab2" FOREIGN KEY (reftypeparametre) REFERENCES public.parametrestypes(reftypeparametre);
 U   ALTER TABLE ONLY public.parametres DROP CONSTRAINT "FK_972408ebef61d073c8fc9106ab2";
       public          postgres    false    3763    217    234            B           2606    139876 <   inventoryreceivingjournalline FK_98ae56cb8f9b6498e7f8da129c1    FK CONSTRAINT       ALTER TABLE ONLY public.inventoryreceivingjournalline
    ADD CONSTRAINT "FK_98ae56cb8f9b6498e7f8da129c1" FOREIGN KEY (refcompany, reforganisation, refinventoryreceivingjournal) REFERENCES public.inventoryreceivingjournal(refcompany, reforganisation, refinventoryreceivingjournal);
 h   ALTER TABLE ONLY public.inventoryreceivingjournalline DROP CONSTRAINT "FK_98ae56cb8f9b6498e7f8da129c1";
       public          postgres    false    290    290    287    287    3917    287    290                        2606    139686 9   inventorytransactionorigin FK_98d4421c7521ed09106db5e7772    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorytransactionorigin
    ADD CONSTRAINT "FK_98d4421c7521ed09106db5e7772" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 e   ALTER TABLE ONLY public.inventorytransactionorigin DROP CONSTRAINT "FK_98d4421c7521ed09106db5e7772";
       public          postgres    false    276    257    257    3855    276            �           2606    92825 $   items FK_9958ea5ff7b38e350958025d2df    FK CONSTRAINT     �   ALTER TABLE ONLY public.items
    ADD CONSTRAINT "FK_9958ea5ff7b38e350958025d2df" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 P   ALTER TABLE ONLY public.items DROP CONSTRAINT "FK_9958ea5ff7b38e350958025d2df";
       public          postgres    false    3785    265    227            C           2606    139836 <   inventoryreceivingjournalline FK_99e5f789df9fbfdfc53377827d8    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventoryreceivingjournalline
    ADD CONSTRAINT "FK_99e5f789df9fbfdfc53377827d8" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 h   ALTER TABLE ONLY public.inventoryreceivingjournalline DROP CONSTRAINT "FK_99e5f789df9fbfdfc53377827d8";
       public          postgres    false    290    3855    290    257    257            �           2606    92405 /   paymentcondition FK_9a62e687fbed665275a6b6144a2    FK CONSTRAINT     �   ALTER TABLE ONLY public.paymentcondition
    ADD CONSTRAINT "FK_9a62e687fbed665275a6b6144a2" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 [   ALTER TABLE ONLY public.paymentcondition DROP CONSTRAINT "FK_9a62e687fbed665275a6b6144a2";
       public          postgres    false    3785    246    227            
           2606    92875 1   purchaseorderlines FK_9abf045f83eadf6f62ea40a71f4    FK CONSTRAINT     �   ALTER TABLE ONLY public.purchaseorderlines
    ADD CONSTRAINT "FK_9abf045f83eadf6f62ea40a71f4" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 ]   ALTER TABLE ONLY public.purchaseorderlines DROP CONSTRAINT "FK_9abf045f83eadf6f62ea40a71f4";
       public          postgres    false    3785    269    227                       2606    92920 ,   purchaseorder FK_9b569f9ae62fece0b247c435b3c    FK CONSTRAINT     �   ALTER TABLE ONLY public.purchaseorder
    ADD CONSTRAINT "FK_9b569f9ae62fece0b247c435b3c" FOREIGN KEY (refpurchaserequisition, refcompany, reforganisation) REFERENCES public.purchaserequisition(refpurchaserequisition, refcompany, reforganisation);
 X   ALTER TABLE ONLY public.purchaseorder DROP CONSTRAINT "FK_9b569f9ae62fece0b247c435b3c";
       public          postgres    false    3807    270    238    270    270    238    238            �           2606    92345 *   taxebygroup FK_9c7b0685d6ae10fd42f092836d3    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxebygroup
    ADD CONSTRAINT "FK_9c7b0685d6ae10fd42f092836d3" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 V   ALTER TABLE ONLY public.taxebygroup DROP CONSTRAINT "FK_9c7b0685d6ae10fd42f092836d3";
       public          postgres    false    3855    257    242    242    257            n           2606    83596 #   city FK_9c9db21fc92c6b791392e4f8c32    FK CONSTRAINT     �   ALTER TABLE ONLY public.city
    ADD CONSTRAINT "FK_9c9db21fc92c6b791392e4f8c32" FOREIGN KEY (refcountry) REFERENCES public.country(refcountry);
 O   ALTER TABLE ONLY public.city DROP CONSTRAINT "FK_9c9db21fc92c6b791392e4f8c32";
       public          postgres    false    3781    226    225            _           2606    140502 9   itemtrackingdimensionmodel FK_9e6df900748f60e1efbfbb76586    FK CONSTRAINT     �   ALTER TABLE ONLY public.itemtrackingdimensionmodel
    ADD CONSTRAINT "FK_9e6df900748f60e1efbfbb76586" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 e   ALTER TABLE ONLY public.itemtrackingdimensionmodel DROP CONSTRAINT "FK_9e6df900748f60e1efbfbb76586";
       public          postgres    false    298    257    257    3855    298            �           2606    92285 2   purchaserequisition FK_9f37b8225cf3c809929c844aad5    FK CONSTRAINT     �   ALTER TABLE ONLY public.purchaserequisition
    ADD CONSTRAINT "FK_9f37b8225cf3c809929c844aad5" FOREIGN KEY (closedby, refcompany, reforganisation) REFERENCES public.usercompany(matricule, refcompany, reforganisation);
 ^   ALTER TABLE ONLY public.purchaserequisition DROP CONSTRAINT "FK_9f37b8225cf3c809929c844aad5";
       public          postgres    false    238    238    238    3857    258    258    258            �           2606    92350 *   taxebygroup FK_a071d9a0aa0d26c6eae43d26722    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxebygroup
    ADD CONSTRAINT "FK_a071d9a0aa0d26c6eae43d26722" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 V   ALTER TABLE ONLY public.taxebygroup DROP CONSTRAINT "FK_a071d9a0aa0d26c6eae43d26722";
       public          postgres    false    3785    242    227            �           2606    92215 #   area FK_a08ead84c1c61e53fb5e2d431a1    FK CONSTRAINT     �   ALTER TABLE ONLY public.area
    ADD CONSTRAINT "FK_a08ead84c1c61e53fb5e2d431a1" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 O   ALTER TABLE ONLY public.area DROP CONSTRAINT "FK_a08ead84c1c61e53fb5e2d431a1";
       public          postgres    false    257    3855    235    257    235            �           2606    92570 7   purchaserequisitionlines FK_a0a2cd8d66c7a2289e18557a1d3    FK CONSTRAINT     �   ALTER TABLE ONLY public.purchaserequisitionlines
    ADD CONSTRAINT "FK_a0a2cd8d66c7a2289e18557a1d3" FOREIGN KEY (refvendor, refcompany, reforganisation) REFERENCES public.vendorreleased(refvendor, refcompany, reforganisation);
 c   ALTER TABLE ONLY public.purchaserequisitionlines DROP CONSTRAINT "FK_a0a2cd8d66c7a2289e18557a1d3";
       public          postgres    false    251    251    3845    251    253    253    253                       2606    92885 1   purchaseorderlines FK_a179e6804a08a20521f0283d0dd    FK CONSTRAINT     �   ALTER TABLE ONLY public.purchaseorderlines
    ADD CONSTRAINT "FK_a179e6804a08a20521f0283d0dd" FOREIGN KEY (refpurchaseorder, refcompany, reforganisation) REFERENCES public.purchaseorder(refpurchaseorder, refcompany, reforganisation);
 ]   ALTER TABLE ONLY public.purchaseorderlines DROP CONSTRAINT "FK_a179e6804a08a20521f0283d0dd";
       public          postgres    false    3885    270    269    269    270    269    270            c           2606    140527 8   itemstoragedimensionmodel FK_a2df3cec9a290347f2262b154d5    FK CONSTRAINT     �   ALTER TABLE ONLY public.itemstoragedimensionmodel
    ADD CONSTRAINT "FK_a2df3cec9a290347f2262b154d5" FOREIGN KEY (refinventorytrackingobject) REFERENCES public.inventorytrackingobject(refinventorytrackingobject);
 d   ALTER TABLE ONLY public.itemstoragedimensionmodel DROP CONSTRAINT "FK_a2df3cec9a290347f2262b154d5";
       public          postgres    false    300    299    3937            �           2606    92410 ,   paymentmethod FK_a363e6ef5c9afe3fca8ce009f36    FK CONSTRAINT     �   ALTER TABLE ONLY public.paymentmethod
    ADD CONSTRAINT "FK_a363e6ef5c9afe3fca8ce009f36" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 X   ALTER TABLE ONLY public.paymentmethod DROP CONSTRAINT "FK_a363e6ef5c9afe3fca8ce009f36";
       public          postgres    false    257    247    247    3855    257            m           2606    140905 ;   inventorydimensionserialitem FK_a483c574c079a6b32c16297edde    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorydimensionserialitem
    ADD CONSTRAINT "FK_a483c574c079a6b32c16297edde" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 g   ALTER TABLE ONLY public.inventorydimensionserialitem DROP CONSTRAINT "FK_a483c574c079a6b32c16297edde";
       public          postgres    false    3785    303    227            t           2606    108077 (   warehouse FK_a5bf187484c91e1588f69e487af    FK CONSTRAINT       ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT "FK_a5bf187484c91e1588f69e487af" FOREIGN KEY (refdefaultreturnlocation, refdefaultreturnaisle, refcompany, reforganisation) REFERENCES public.location(reflocation, refaisle, refcompany, reforganisation);
 T   ALTER TABLE ONLY public.warehouse DROP CONSTRAINT "FK_a5bf187484c91e1588f69e487af";
       public          postgres    false    260    228    260    260    228    228    228    260    3865            �           2606    108099 %   vendor FK_a65b7d0e5384c73afb907d242b1    FK CONSTRAINT     �   ALTER TABLE ONLY public.vendor
    ADD CONSTRAINT "FK_a65b7d0e5384c73afb907d242b1" FOREIGN KEY (refcurrency) REFERENCES public.currency(refcurrency);
 Q   ALTER TABLE ONLY public.vendor DROP CONSTRAINT "FK_a65b7d0e5384c73afb907d242b1";
       public          postgres    false    239    219    3767            5           2606    139786 1   inventorydimension FK_a6ac7ed0aafcabfd01ae09c5b90    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorydimension
    ADD CONSTRAINT "FK_a6ac7ed0aafcabfd01ae09c5b90" FOREIGN KEY (refaisle, refcompany, reforganisation) REFERENCES public.aisle(refaisle, refcompany, reforganisation);
 ]   ALTER TABLE ONLY public.inventorydimension DROP CONSTRAINT "FK_a6ac7ed0aafcabfd01ae09c5b90";
       public          postgres    false    3853    286    286    256    286    256    256            }           2606    92160 0   parametresheaders FK_a6d141f3d03fa7fd512f20a6961    FK CONSTRAINT     �   ALTER TABLE ONLY public.parametresheaders
    ADD CONSTRAINT "FK_a6d141f3d03fa7fd512f20a6961" FOREIGN KEY (reftypeparametre) REFERENCES public.parametrestypes(reftypeparametre);
 \   ALTER TABLE ONLY public.parametresheaders DROP CONSTRAINT "FK_a6d141f3d03fa7fd512f20a6961";
       public          postgres    false    231    3763    217            �           2606    92275 2   purchaserequisition FK_a72a4d920a6489165a5559c6689    FK CONSTRAINT     �   ALTER TABLE ONLY public.purchaserequisition
    ADD CONSTRAINT "FK_a72a4d920a6489165a5559c6689" FOREIGN KEY (submittedby, refcompany, reforganisation) REFERENCES public.usercompany(matricule, refcompany, reforganisation);
 ^   ALTER TABLE ONLY public.purchaserequisition DROP CONSTRAINT "FK_a72a4d920a6489165a5559c6689";
       public          postgres    false    238    258    258    258    3857    238    238            u           2606    108072 (   warehouse FK_a9c1298d654766b10ab9b1e2f3b    FK CONSTRAINT     !  ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT "FK_a9c1298d654766b10ab9b1e2f3b" FOREIGN KEY (refdefaultrawmaterialconsumptionlocation, refdefaultrawmaterialconsumptionaisle, refcompany, reforganisation) REFERENCES public.location(reflocation, refaisle, refcompany, reforganisation);
 T   ALTER TABLE ONLY public.warehouse DROP CONSTRAINT "FK_a9c1298d654766b10ab9b1e2f3b";
       public          postgres    false    3865    228    228    228    228    260    260    260    260            �           2606    92260 2   purchaserequisition FK_ab3ba59b2da482faf484cb1c0a3    FK CONSTRAINT     �   ALTER TABLE ONLY public.purchaserequisition
    ADD CONSTRAINT "FK_ab3ba59b2da482faf484cb1c0a3" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 ^   ALTER TABLE ONLY public.purchaserequisition DROP CONSTRAINT "FK_ab3ba59b2da482faf484cb1c0a3";
       public          postgres    false    3785    227    238            �           2606    92305 %   vendor FK_ab3edd43e40226ce484db2499dd    FK CONSTRAINT     �   ALTER TABLE ONLY public.vendor
    ADD CONSTRAINT "FK_ab3edd43e40226ce484db2499dd" FOREIGN KEY (refvendortype) REFERENCES public.vendortype(refvendortype);
 Q   ALTER TABLE ONLY public.vendor DROP CONSTRAINT "FK_ab3edd43e40226ce484db2499dd";
       public          postgres    false    239    220    3769            D           2606    139861 <   inventoryreceivingjournalline FK_ae52221cbfc6c81a8586f3afdb1    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventoryreceivingjournalline
    ADD CONSTRAINT "FK_ae52221cbfc6c81a8586f3afdb1" FOREIGN KEY (refcurrency) REFERENCES public.currency(refcurrency);
 h   ALTER TABLE ONLY public.inventoryreceivingjournalline DROP CONSTRAINT "FK_ae52221cbfc6c81a8586f3afdb1";
       public          postgres    false    219    3767    290            �           2606    92765 &   address FK_ae74bebb6517b7c6163b407fbe2    FK CONSTRAINT     �   ALTER TABLE ONLY public.address
    ADD CONSTRAINT "FK_ae74bebb6517b7c6163b407fbe2" FOREIGN KEY (refcity) REFERENCES public.city(refcity);
 R   ALTER TABLE ONLY public.address DROP CONSTRAINT "FK_ae74bebb6517b7c6163b407fbe2";
       public          postgres    false    226    3783    262            �           2606    92255 2   purchaserequisition FK_aec0bba82b453bce3134aa6b14e    FK CONSTRAINT     �   ALTER TABLE ONLY public.purchaserequisition
    ADD CONSTRAINT "FK_aec0bba82b453bce3134aa6b14e" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 ^   ALTER TABLE ONLY public.purchaserequisition DROP CONSTRAINT "FK_aec0bba82b453bce3134aa6b14e";
       public          postgres    false    257    238    238    3855    257                       2606    124522 6   usercompanieswarehouses FK_af0d6076b3a5e4d6c225850a7cf    FK CONSTRAINT     �   ALTER TABLE ONLY public.usercompanieswarehouses
    ADD CONSTRAINT "FK_af0d6076b3a5e4d6c225850a7cf" FOREIGN KEY (refwarehouse, reforganisation, refcompany) REFERENCES public.warehouse(refwarehouse, reforganisation, refcompany);
 b   ALTER TABLE ONLY public.usercompanieswarehouses DROP CONSTRAINT "FK_af0d6076b3a5e4d6c225850a7cf";
       public          postgres    false    273    228    228    228    3787    273    273            ]           2606    140497 (   itemmodel FK_b144d66d8fb88bf3075806e9f65    FK CONSTRAINT     �   ALTER TABLE ONLY public.itemmodel
    ADD CONSTRAINT "FK_b144d66d8fb88bf3075806e9f65" FOREIGN KEY (refinventoryvaluationmethode) REFERENCES public.inventoryvaluationmethode(refinventoryvaluationmethode);
 T   ALTER TABLE ONLY public.itemmodel DROP CONSTRAINT "FK_b144d66d8fb88bf3075806e9f65";
       public          postgres    false    3931    297    296            �           2606    92755 &   address FK_b189940b42494f5c15dc587e6b7    FK CONSTRAINT     �   ALTER TABLE ONLY public.address
    ADD CONSTRAINT "FK_b189940b42494f5c15dc587e6b7" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 R   ALTER TABLE ONLY public.address DROP CONSTRAINT "FK_b189940b42494f5c15dc587e6b7";
       public          postgres    false    262    3855    257    257    262            �           2606    92295 %   vendor FK_b476d781a19adbc6880ca62f907    FK CONSTRAINT     �   ALTER TABLE ONLY public.vendor
    ADD CONSTRAINT "FK_b476d781a19adbc6880ca62f907" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 Q   ALTER TABLE ONLY public.vendor DROP CONSTRAINT "FK_b476d781a19adbc6880ca62f907";
       public          postgres    false    227    239    3785            �           2606    92445 )   categories FK_b4863e78599c9fee343d868be4f    FK CONSTRAINT     �   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT "FK_b4863e78599c9fee343d868be4f" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 U   ALTER TABLE ONLY public.categories DROP CONSTRAINT "FK_b4863e78599c9fee343d868be4f";
       public          postgres    false    257    249    249    3855    257            +           2606    139721 3   inventorytransaction FK_b56c94a6a01cc3771b4b3b3cc7d    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorytransaction
    ADD CONSTRAINT "FK_b56c94a6a01cc3771b4b3b3cc7d" FOREIGN KEY (refitem, refcompany, reforganisation) REFERENCES public.itemsreleased(refitem, refcompany, reforganisation);
 _   ALTER TABLE ONLY public.inventorytransaction DROP CONSTRAINT "FK_b56c94a6a01cc3771b4b3b3cc7d";
       public          postgres    false    254    254    280    3849    254    280    280            �           2606    92655 ,   uomconversion FK_b58c0d0d22c081bee14e7597862    FK CONSTRAINT     �   ALTER TABLE ONLY public.uomconversion
    ADD CONSTRAINT "FK_b58c0d0d22c081bee14e7597862" FOREIGN KEY (refunitfrom, refcompany, reforganisation) REFERENCES public.units(refunit, refcompany, reforganisation);
 X   ALTER TABLE ONLY public.uomconversion DROP CONSTRAINT "FK_b58c0d0d22c081bee14e7597862";
       public          postgres    false    255    236    236    3803    236    255    255                       2606    92930 ,   purchaseorder FK_b5a401a0ec14da3c1f79c547559    FK CONSTRAINT     �   ALTER TABLE ONLY public.purchaseorder
    ADD CONSTRAINT "FK_b5a401a0ec14da3c1f79c547559" FOREIGN KEY (reftaxegroup, refcompany, reforganisation) REFERENCES public.taxegroup(reftaxegroup, refcompany, reforganisation);
 X   ALTER TABLE ONLY public.purchaseorder DROP CONSTRAINT "FK_b5a401a0ec14da3c1f79c547559";
       public          postgres    false    241    270    270    241    241    3825    270            y           2606    141140 .   inventoryonhand FK_b5bfd7fe63811f3330088da91b4    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventoryonhand
    ADD CONSTRAINT "FK_b5bfd7fe63811f3330088da91b4" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 Z   ALTER TABLE ONLY public.inventoryonhand DROP CONSTRAINT "FK_b5bfd7fe63811f3330088da91b4";
       public          postgres    false    3855    308    257    257    308            �           2606    92455 )   categories FK_b669cff25bd8043523b3bbef177    FK CONSTRAINT       ALTER TABLE ONLY public.categories
    ADD CONSTRAINT "FK_b669cff25bd8043523b3bbef177" FOREIGN KEY (refparentcategoriesgroup, refparentcategories, refparentcompany, refparentorganisation) REFERENCES public.categories(refcategoriesgroup, refcategories, refcompany, reforganisation);
 U   ALTER TABLE ONLY public.categories DROP CONSTRAINT "FK_b669cff25bd8043523b3bbef177";
       public          postgres    false    249    249    249    249    3841    249    249    249    249            ,           2606    139756 3   inventorytransaction FK_b753cbf2507007b2893ca300e9f    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorytransaction
    ADD CONSTRAINT "FK_b753cbf2507007b2893ca300e9f" FOREIGN KEY (inventorydimensionid) REFERENCES public.inventorydimension(inventorydimensionid);
 _   ALTER TABLE ONLY public.inventorytransaction DROP CONSTRAINT "FK_b753cbf2507007b2893ca300e9f";
       public          postgres    false    286    3913    280                       2606    92880 1   purchaseorderlines FK_b8c155416a1d25677f2c7c9571d    FK CONSTRAINT     �   ALTER TABLE ONLY public.purchaseorderlines
    ADD CONSTRAINT "FK_b8c155416a1d25677f2c7c9571d" FOREIGN KEY (idheaderparametre) REFERENCES public.parametresheaders(idheaderparametre);
 ]   ALTER TABLE ONLY public.purchaseorderlines DROP CONSTRAINT "FK_b8c155416a1d25677f2c7c9571d";
       public          postgres    false    3791    269    231            n           2606    140915 ;   inventorydimensionserialitem FK_ba65a352f11e1d0769c1602d619    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorydimensionserialitem
    ADD CONSTRAINT "FK_ba65a352f11e1d0769c1602d619" FOREIGN KEY (refinventorydimensionserial) REFERENCES public.inventorydimensionserial(refinventorydimensionserial);
 g   ALTER TABLE ONLY public.inventorydimensionserialitem DROP CONSTRAINT "FK_ba65a352f11e1d0769c1602d619";
       public          postgres    false    3909    283    303            �           2606    92680 $   aisle FK_bb7fda9b9a220f69a3e9a466209    FK CONSTRAINT     �   ALTER TABLE ONLY public.aisle
    ADD CONSTRAINT "FK_bb7fda9b9a220f69a3e9a466209" FOREIGN KEY (reffurnituretype) REFERENCES public.furnituretype(reffurnituretype);
 P   ALTER TABLE ONLY public.aisle DROP CONSTRAINT "FK_bb7fda9b9a220f69a3e9a466209";
       public          postgres    false    3765    218    256                       2606    92925 ,   purchaseorder FK_bcb8a914a6c1664df6c117c4964    FK CONSTRAINT     �   ALTER TABLE ONLY public.purchaseorder
    ADD CONSTRAINT "FK_bcb8a914a6c1664df6c117c4964" FOREIGN KEY (refcurrency) REFERENCES public.currency(refcurrency);
 X   ALTER TABLE ONLY public.purchaseorder DROP CONSTRAINT "FK_bcb8a914a6c1664df6c117c4964";
       public          postgres    false    270    3767    219            �           2606    92235 $   units FK_be31a53e1b70044b9c75c71aff7    FK CONSTRAINT     �   ALTER TABLE ONLY public.units
    ADD CONSTRAINT "FK_be31a53e1b70044b9c75c71aff7" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 P   ALTER TABLE ONLY public.units DROP CONSTRAINT "FK_be31a53e1b70044b9c75c71aff7";
       public          postgres    false    236    236    3855    257    257            !           2606    139691 9   inventorytransactionorigin FK_c067b7e219be8e6952629ca1680    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorytransactionorigin
    ADD CONSTRAINT "FK_c067b7e219be8e6952629ca1680" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 e   ALTER TABLE ONLY public.inventorytransactionorigin DROP CONSTRAINT "FK_c067b7e219be8e6952629ca1680";
       public          postgres    false    227    276    3785            M           2606    139901 4   inventorytransferline FK_c433893bf0c1be9dc91f82e1c5a    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorytransferline
    ADD CONSTRAINT "FK_c433893bf0c1be9dc91f82e1c5a" FOREIGN KEY (refinventunit, refcompany, reforganisation) REFERENCES public.units(refunit, refcompany, reforganisation);
 `   ALTER TABLE ONLY public.inventorytransferline DROP CONSTRAINT "FK_c433893bf0c1be9dc91f82e1c5a";
       public          postgres    false    293    236    236    236    293    293    3803                       2606    108128 -   addressvendors FK_c51121d9d2b607eb58a302db934    FK CONSTRAINT     �   ALTER TABLE ONLY public.addressvendors
    ADD CONSTRAINT "FK_c51121d9d2b607eb58a302db934" FOREIGN KEY (refaddresstype) REFERENCES public.addresstype(refaddresstype);
 Y   ALTER TABLE ONLY public.addressvendors DROP CONSTRAINT "FK_c51121d9d2b607eb58a302db934";
       public          postgres    false    271    3867    261            �           2606    92780 5   addresssitegeographics FK_c5ffc81795971bc2a3098ea9496    FK CONSTRAINT     �   ALTER TABLE ONLY public.addresssitegeographics
    ADD CONSTRAINT "FK_c5ffc81795971bc2a3098ea9496" FOREIGN KEY (refcompany, reforganisation, refaddress) REFERENCES public.address(refcompany, reforganisation, refaddress);
 a   ALTER TABLE ONLY public.addresssitegeographics DROP CONSTRAINT "FK_c5ffc81795971bc2a3098ea9496";
       public          postgres    false    3869    262    263    263    263    262    262            U           2606    139931 0   inventorytransfer FK_c62606d175ddd173fa01c90b58b    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorytransfer
    ADD CONSTRAINT "FK_c62606d175ddd173fa01c90b58b" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 \   ALTER TABLE ONLY public.inventorytransfer DROP CONSTRAINT "FK_c62606d175ddd173fa01c90b58b";
       public          postgres    false    257    257    295    295    3855                       2606    92900 ,   purchaseorder FK_c6c409fd9aea053e27650089bff    FK CONSTRAINT     �   ALTER TABLE ONLY public.purchaseorder
    ADD CONSTRAINT "FK_c6c409fd9aea053e27650089bff" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 X   ALTER TABLE ONLY public.purchaseorder DROP CONSTRAINT "FK_c6c409fd9aea053e27650089bff";
       public          postgres    false    3855    257    270    270    257            V           2606    139961 0   inventorytransfer FK_c6d3bddf88a56e2e7b5fe603878    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorytransfer
    ADD CONSTRAINT "FK_c6d3bddf88a56e2e7b5fe603878" FOREIGN KEY (refcompany, reforganisation, reflocationfrom, refaisleto) REFERENCES public.location(refcompany, reforganisation, reflocation, refaisle);
 \   ALTER TABLE ONLY public.inventorytransfer DROP CONSTRAINT "FK_c6d3bddf88a56e2e7b5fe603878";
       public          postgres    false    295    260    260    295    3865    260    260    295    295            N           2606    139896 4   inventorytransferline FK_c72a7d2b5456bce06e96349d5f7    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorytransferline
    ADD CONSTRAINT "FK_c72a7d2b5456bce06e96349d5f7" FOREIGN KEY (refitem, refcompany, reforganisation) REFERENCES public.itemsreleased(refitem, refcompany, reforganisation);
 `   ALTER TABLE ONLY public.inventorytransferline DROP CONSTRAINT "FK_c72a7d2b5456bce06e96349d5f7";
       public          postgres    false    254    293    254    254    293    3849    293            �           2606    116265 ,   itemsreleased FK_c7dea5525e2d1c270a61c4abb5c    FK CONSTRAINT     �   ALTER TABLE ONLY public.itemsreleased
    ADD CONSTRAINT "FK_c7dea5525e2d1c270a61c4abb5c" FOREIGN KEY (refitemgroup, refcompany, reforganisation) REFERENCES public.itemsgroup(refitemgroup, refcompany, reforganisation);
 X   ALTER TABLE ONLY public.itemsreleased DROP CONSTRAINT "FK_c7dea5525e2d1c270a61c4abb5c";
       public          postgres    false    272    272    254    254    254    3889    272                        2606    92840 3   uomclassicconversion FK_c8cf61f81af04b98c2eae9b3c8f    FK CONSTRAINT     �   ALTER TABLE ONLY public.uomclassicconversion
    ADD CONSTRAINT "FK_c8cf61f81af04b98c2eae9b3c8f" FOREIGN KEY (refunitfrom, refcompany, reforganisation) REFERENCES public.units(refunit, refcompany, reforganisation);
 _   ALTER TABLE ONLY public.uomclassicconversion DROP CONSTRAINT "FK_c8cf61f81af04b98c2eae9b3c8f";
       public          postgres    false    236    236    266    3803    266    266    236                       2606    116255 )   itemsgroup FK_c97ab302543e07cfc831daaf602    FK CONSTRAINT     �   ALTER TABLE ONLY public.itemsgroup
    ADD CONSTRAINT "FK_c97ab302543e07cfc831daaf602" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 U   ALTER TABLE ONLY public.itemsgroup DROP CONSTRAINT "FK_c97ab302543e07cfc831daaf602";
       public          postgres    false    3855    257    272    257    272                       2606    92855 (   itemclass FK_ccfe56eb8899494ccd01da62814    FK CONSTRAINT     �   ALTER TABLE ONLY public.itemclass
    ADD CONSTRAINT "FK_ccfe56eb8899494ccd01da62814" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 T   ALTER TABLE ONLY public.itemclass DROP CONSTRAINT "FK_ccfe56eb8899494ccd01da62814";
       public          postgres    false    3785    267    227            �           2606    92175 .   parametreslines FK_cda29be649c7f3e3a2ac1d5c57f    FK CONSTRAINT     �   ALTER TABLE ONLY public.parametreslines
    ADD CONSTRAINT "FK_cda29be649c7f3e3a2ac1d5c57f" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 Z   ALTER TABLE ONLY public.parametreslines DROP CONSTRAINT "FK_cda29be649c7f3e3a2ac1d5c57f";
       public          postgres    false    257    232    232    3855    257            �           2606    92695 &   company FK_ce0059de4f318d4b3359d249a2f    FK CONSTRAINT     �   ALTER TABLE ONLY public.company
    ADD CONSTRAINT "FK_ce0059de4f318d4b3359d249a2f" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 R   ALTER TABLE ONLY public.company DROP CONSTRAINT "FK_ce0059de4f318d4b3359d249a2f";
       public          postgres    false    227    257    3785            �           2606    92770 &   address FK_ce32b95195d922701f6ba3fc531    FK CONSTRAINT     �   ALTER TABLE ONLY public.address
    ADD CONSTRAINT "FK_ce32b95195d922701f6ba3fc531" FOREIGN KEY (refcountry) REFERENCES public.country(refcountry);
 R   ALTER TABLE ONLY public.address DROP CONSTRAINT "FK_ce32b95195d922701f6ba3fc531";
       public          postgres    false    3781    262    225            v           2606    108057 (   warehouse FK_d067816c0654d35276a4a9dc63f    FK CONSTRAINT       ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT "FK_d067816c0654d35276a4a9dc63f" FOREIGN KEY (refdefaultreceivelocation, refdefaultreceiveaisle, refcompany, reforganisation) REFERENCES public.location(reflocation, refaisle, refcompany, reforganisation);
 T   ALTER TABLE ONLY public.warehouse DROP CONSTRAINT "FK_d067816c0654d35276a4a9dc63f";
       public          postgres    false    228    260    260    260    260    3865    228    228    228            �           2606    92415 ,   paymentmethod FK_d0e9e4497f59b485279d3734b35    FK CONSTRAINT     �   ALTER TABLE ONLY public.paymentmethod
    ADD CONSTRAINT "FK_d0e9e4497f59b485279d3734b35" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 X   ALTER TABLE ONLY public.paymentmethod DROP CONSTRAINT "FK_d0e9e4497f59b485279d3734b35";
       public          postgres    false    3785    247    227            "           2606    139701 9   inventorytransactionorigin FK_d1a037ea6af40a765a6550659fd    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorytransactionorigin
    ADD CONSTRAINT "FK_d1a037ea6af40a765a6550659fd" FOREIGN KEY (refinventorytransactionorigintype) REFERENCES public.inventorytransactionorigintype(refinventorytransactionorigintype);
 e   ALTER TABLE ONLY public.inventorytransactionorigin DROP CONSTRAINT "FK_d1a037ea6af40a765a6550659fd";
       public          postgres    false    276    3893    274            �           2606    92325 '   taxeline FK_d2f7613885e2175d59ded143455    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxeline
    ADD CONSTRAINT "FK_d2f7613885e2175d59ded143455" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 S   ALTER TABLE ONLY public.taxeline DROP CONSTRAINT "FK_d2f7613885e2175d59ded143455";
       public          postgres    false    3785    227    240            �           2606    92590 ,   itemsreleased FK_d48304716a65bc5a2336666cd77    FK CONSTRAINT     �   ALTER TABLE ONLY public.itemsreleased
    ADD CONSTRAINT "FK_d48304716a65bc5a2336666cd77" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 X   ALTER TABLE ONLY public.itemsreleased DROP CONSTRAINT "FK_d48304716a65bc5a2336666cd77";
       public          postgres    false    254    3855    257    257    254            k           2606    140880 :   inventorydimensionowneritem FK_d52a0c189dbcc86d2b92e6788a2    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorydimensionowneritem
    ADD CONSTRAINT "FK_d52a0c189dbcc86d2b92e6788a2" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 f   ALTER TABLE ONLY public.inventorydimensionowneritem DROP CONSTRAINT "FK_d52a0c189dbcc86d2b92e6788a2";
       public          postgres    false    257    3855    302    302    257            �           2606    92515 -   vendorreleased FK_d706cc1f473d8e45e143058bab9    FK CONSTRAINT     �   ALTER TABLE ONLY public.vendorreleased
    ADD CONSTRAINT "FK_d706cc1f473d8e45e143058bab9" FOREIGN KEY (idheaderparametre) REFERENCES public.parametresheaders(idheaderparametre);
 Y   ALTER TABLE ONLY public.vendorreleased DROP CONSTRAINT "FK_d706cc1f473d8e45e143058bab9";
       public          postgres    false    231    251    3791            -           2606    139731 3   inventorytransaction FK_d8035c41b3bf9700346cd2c059c    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorytransaction
    ADD CONSTRAINT "FK_d8035c41b3bf9700346cd2c059c" FOREIGN KEY (refinventunit, refcompany, reforganisation) REFERENCES public.units(refunit, refcompany, reforganisation);
 _   ALTER TABLE ONLY public.inventorytransaction DROP CONSTRAINT "FK_d8035c41b3bf9700346cd2c059c";
       public          postgres    false    280    280    280    3803    236    236    236                       2606    108133 -   addressvendors FK_d906107d5dda1491a3939f33c4b    FK CONSTRAINT     �   ALTER TABLE ONLY public.addressvendors
    ADD CONSTRAINT "FK_d906107d5dda1491a3939f33c4b" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 Y   ALTER TABLE ONLY public.addressvendors DROP CONSTRAINT "FK_d906107d5dda1491a3939f33c4b";
       public          postgres    false    271    271    3855    257    257            W           2606    139981 0   inventorytransfer FK_da39f04e466decc71fa7f7cd49b    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorytransfer
    ADD CONSTRAINT "FK_da39f04e466decc71fa7f7cd49b" FOREIGN KEY (refinventorytransferstatus) REFERENCES public.inventorytransferstatus(refinventorytransferstatus);
 \   ALTER TABLE ONLY public.inventorytransfer DROP CONSTRAINT "FK_da39f04e466decc71fa7f7cd49b";
       public          postgres    false    294    3927    295            r           2606    140925 :   inventorydimensionbatchitem FK_da8e8cc7aaa91fb270e83fd3cb0    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorydimensionbatchitem
    ADD CONSTRAINT "FK_da8e8cc7aaa91fb270e83fd3cb0" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 f   ALTER TABLE ONLY public.inventorydimensionbatchitem DROP CONSTRAINT "FK_da8e8cc7aaa91fb270e83fd3cb0";
       public          postgres    false    3785    304    227            �           2606    92575 7   purchaserequisitionlines FK_dbfd9545371c227eba6c2cd978d    FK CONSTRAINT     �   ALTER TABLE ONLY public.purchaserequisitionlines
    ADD CONSTRAINT "FK_dbfd9545371c227eba6c2cd978d" FOREIGN KEY (refcurrency) REFERENCES public.currency(refcurrency);
 c   ALTER TABLE ONLY public.purchaserequisitionlines DROP CONSTRAINT "FK_dbfd9545371c227eba6c2cd978d";
       public          postgres    false    253    219    3767            �           2606    92730 *   usercompany FK_dcc4c7ebae78de026c1df04c116    FK CONSTRAINT     �   ALTER TABLE ONLY public.usercompany
    ADD CONSTRAINT "FK_dcc4c7ebae78de026c1df04c116" FOREIGN KEY (matricule, reforganisation) REFERENCES public."user"(matricule, reforganisation);
 V   ALTER TABLE ONLY public.usercompany DROP CONSTRAINT "FK_dcc4c7ebae78de026c1df04c116";
       public          postgres    false    259    259    3859    258    258            �           2606    92800 0   addresswarehouses FK_de2732d457cf0d70944e06ae3c2    FK CONSTRAINT     �   ALTER TABLE ONLY public.addresswarehouses
    ADD CONSTRAINT "FK_de2732d457cf0d70944e06ae3c2" FOREIGN KEY (refcompany, reforganisation, refwarehouse) REFERENCES public.warehouse(refcompany, reforganisation, refwarehouse);
 \   ALTER TABLE ONLY public.addresswarehouses DROP CONSTRAINT "FK_de2732d457cf0d70944e06ae3c2";
       public          postgres    false    264    264    264    3787    228    228    228            �           2606    92775 5   addresssitegeographics FK_debde37af00c7e885d0b3a637a6    FK CONSTRAINT     �   ALTER TABLE ONLY public.addresssitegeographics
    ADD CONSTRAINT "FK_debde37af00c7e885d0b3a637a6" FOREIGN KEY (refcompany, reforganisation, refsitegeographic) REFERENCES public.sitegeographic(refcompany, reforganisation, refsitegeographic);
 a   ALTER TABLE ONLY public.addresssitegeographics DROP CONSTRAINT "FK_debde37af00c7e885d0b3a637a6";
       public          postgres    false    229    229    229    263    263    263    3789            �           2606    92165 .   parametreslines FK_df2e4607dea5737ad8d35c65c0e    FK CONSTRAINT     �   ALTER TABLE ONLY public.parametreslines
    ADD CONSTRAINT "FK_df2e4607dea5737ad8d35c65c0e" FOREIGN KEY (idheaderparametre) REFERENCES public.parametresheaders(idheaderparametre);
 Z   ALTER TABLE ONLY public.parametreslines DROP CONSTRAINT "FK_df2e4607dea5737ad8d35c65c0e";
       public          postgres    false    231    232    3791            g           2606    140865 ;   inventorydimensionpalletitem FK_df41d6a7b97d205ff3493381918    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorydimensionpalletitem
    ADD CONSTRAINT "FK_df41d6a7b97d205ff3493381918" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 g   ALTER TABLE ONLY public.inventorydimensionpalletitem DROP CONSTRAINT "FK_df41d6a7b97d205ff3493381918";
       public          postgres    false    227    3785    301            #           2606    139696 9   inventorytransactionorigin FK_e06a7c2fc1dae469f14acb44cc7    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorytransactionorigin
    ADD CONSTRAINT "FK_e06a7c2fc1dae469f14acb44cc7" FOREIGN KEY (refitem, refcompany, reforganisation) REFERENCES public.itemsreleased(refitem, refcompany, reforganisation);
 e   ALTER TABLE ONLY public.inventorytransactionorigin DROP CONSTRAINT "FK_e06a7c2fc1dae469f14acb44cc7";
       public          postgres    false    254    276    254    3849    254    276    276            �           2606    92245 )   pricemodel FK_e0761f533f913e5b38b2d9c84a9    FK CONSTRAINT     �   ALTER TABLE ONLY public.pricemodel
    ADD CONSTRAINT "FK_e0761f533f913e5b38b2d9c84a9" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 U   ALTER TABLE ONLY public.pricemodel DROP CONSTRAINT "FK_e0761f533f913e5b38b2d9c84a9";
       public          postgres    false    237    237    3855    257    257            �           2606    92670 $   aisle FK_e088082891c681fc7bec88b8f13    FK CONSTRAINT     �   ALTER TABLE ONLY public.aisle
    ADD CONSTRAINT "FK_e088082891c681fc7bec88b8f13" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 P   ALTER TABLE ONLY public.aisle DROP CONSTRAINT "FK_e088082891c681fc7bec88b8f13";
       public          postgres    false    257    257    3855    256    256            �           2606    92440 .   categoriesitems FK_e18a0d7645f8a3b64f389f0b38f    FK CONSTRAINT     �   ALTER TABLE ONLY public.categoriesitems
    ADD CONSTRAINT "FK_e18a0d7645f8a3b64f389f0b38f" FOREIGN KEY (refitem, refcompany, reforganisation) REFERENCES public.itemsreleased(refitem, refcompany, reforganisation);
 Z   ALTER TABLE ONLY public.categoriesitems DROP CONSTRAINT "FK_e18a0d7645f8a3b64f389f0b38f";
       public          postgres    false    254    248    248    248    3849    254    254            �           2606    92230 #   area FK_e3894eee12dcbf2bb9d4f07413c    FK CONSTRAINT     �   ALTER TABLE ONLY public.area
    ADD CONSTRAINT "FK_e3894eee12dcbf2bb9d4f07413c" FOREIGN KEY (refwarehouse, refcompany, reforganisation) REFERENCES public.warehouse(refwarehouse, refcompany, reforganisation);
 O   ALTER TABLE ONLY public.area DROP CONSTRAINT "FK_e3894eee12dcbf2bb9d4f07413c";
       public          postgres    false    3787    235    235    235    228    228    228                       2606    124517 6   usercompanieswarehouses FK_e3b07895f70cd33faef46205f22    FK CONSTRAINT     �   ALTER TABLE ONLY public.usercompanieswarehouses
    ADD CONSTRAINT "FK_e3b07895f70cd33faef46205f22" FOREIGN KEY (matricule, reforganisation, refcompany) REFERENCES public.usercompany(matricule, reforganisation, refcompany);
 b   ALTER TABLE ONLY public.usercompanieswarehouses DROP CONSTRAINT "FK_e3b07895f70cd33faef46205f22";
       public          postgres    false    273    3857    258    258    273    273    258            w           2606    108067 (   warehouse FK_e3d9d6ca71b4f813fb0592fc863    FK CONSTRAINT       ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT "FK_e3d9d6ca71b4f813fb0592fc863" FOREIGN KEY (refdefaultgoodsfabricationlocation, refdefaultgoodsfabricationaisle, refcompany, reforganisation) REFERENCES public.location(reflocation, refaisle, refcompany, reforganisation);
 T   ALTER TABLE ONLY public.warehouse DROP CONSTRAINT "FK_e3d9d6ca71b4f813fb0592fc863";
       public          postgres    false    260    260    228    228    3865    260    260    228    228                       2606    124512 6   usercompanieswarehouses FK_e3e6ca0af350da9e63d986b8c83    FK CONSTRAINT     �   ALTER TABLE ONLY public.usercompanieswarehouses
    ADD CONSTRAINT "FK_e3e6ca0af350da9e63d986b8c83" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 b   ALTER TABLE ONLY public.usercompanieswarehouses DROP CONSTRAINT "FK_e3e6ca0af350da9e63d986b8c83";
       public          postgres    false    227    273    3785            X           2606    139976 0   inventorytransfer FK_e3f4f68f244c5c881a6143d1c72    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorytransfer
    ADD CONSTRAINT "FK_e3f4f68f244c5c881a6143d1c72" FOREIGN KEY (refinventorytransfertype) REFERENCES public.inventorytransfertype(refinventorytransfertype);
 \   ALTER TABLE ONLY public.inventorytransfer DROP CONSTRAINT "FK_e3f4f68f244c5c881a6143d1c72";
       public          postgres    false    291    3923    295            �           2606    92525 -   vendorreleased FK_e44f918084a52a28e35033d0e59    FK CONSTRAINT     �   ALTER TABLE ONLY public.vendorreleased
    ADD CONSTRAINT "FK_e44f918084a52a28e35033d0e59" FOREIGN KEY (refdeliverymode, refcompany, reforganisation) REFERENCES public.deliverymode(refdeliverymode, refcompany, reforganisation);
 Y   ALTER TABLE ONLY public.vendorreleased DROP CONSTRAINT "FK_e44f918084a52a28e35033d0e59";
       public          postgres    false    245    3833    245    245    251    251    251            �           2606    140532 ,   itemsreleased FK_e5e95da53656fd6e3ee17dc96ed    FK CONSTRAINT     �   ALTER TABLE ONLY public.itemsreleased
    ADD CONSTRAINT "FK_e5e95da53656fd6e3ee17dc96ed" FOREIGN KEY (refitemmodel, refcompany, reforganisation) REFERENCES public.itemmodel(refitemmodel, refcompany, reforganisation);
 X   ALTER TABLE ONLY public.itemsreleased DROP CONSTRAINT "FK_e5e95da53656fd6e3ee17dc96ed";
       public          postgres    false    297    297    297    3933    254    254    254            s           2606    140930 :   inventorydimensionbatchitem FK_e67430f5f88675c3601f0d014e1    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorydimensionbatchitem
    ADD CONSTRAINT "FK_e67430f5f88675c3601f0d014e1" FOREIGN KEY (refitem, refcompany, reforganisation) REFERENCES public.itemsreleased(refitem, refcompany, reforganisation);
 f   ALTER TABLE ONLY public.inventorydimensionbatchitem DROP CONSTRAINT "FK_e67430f5f88675c3601f0d014e1";
       public          postgres    false    254    304    304    304    3849    254    254            O           2606    139921 4   inventorytransferline FK_eaf0cea7091013bd23232834d92    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorytransferline
    ADD CONSTRAINT "FK_eaf0cea7091013bd23232834d92" FOREIGN KEY (refinventorytransfer, refcompany, reforganisation) REFERENCES public.inventorytransfer(refinventorytransfer, refcompany, reforganisation);
 `   ALTER TABLE ONLY public.inventorytransferline DROP CONSTRAINT "FK_eaf0cea7091013bd23232834d92";
       public          postgres    false    295    295    293    293    3929    293    295            �           2606    92645 ,   uomconversion FK_eb33c64ed1a5615dd660bed9c84    FK CONSTRAINT     �   ALTER TABLE ONLY public.uomconversion
    ADD CONSTRAINT "FK_eb33c64ed1a5615dd660bed9c84" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 X   ALTER TABLE ONLY public.uomconversion DROP CONSTRAINT "FK_eb33c64ed1a5615dd660bed9c84";
       public          postgres    false    255    257    255    257    3855            �           2606    92665 ,   uomconversion FK_eb84f834db081acba6db14b1c3a    FK CONSTRAINT     �   ALTER TABLE ONLY public.uomconversion
    ADD CONSTRAINT "FK_eb84f834db081acba6db14b1c3a" FOREIGN KEY (refitem, refcompany, reforganisation) REFERENCES public.itemsreleased(refitem, refcompany, reforganisation);
 X   ALTER TABLE ONLY public.uomconversion DROP CONSTRAINT "FK_eb84f834db081acba6db14b1c3a";
       public          postgres    false    255    3849    255    255    254    254    254            �           2606    92600 ,   itemsreleased FK_ec281f85b8fc0081d0e4e4b7538    FK CONSTRAINT     �   ALTER TABLE ONLY public.itemsreleased
    ADD CONSTRAINT "FK_ec281f85b8fc0081d0e4e4b7538" FOREIGN KEY (refunitinvent, refcompany, reforganisation) REFERENCES public.units(refunit, refcompany, reforganisation);
 X   ALTER TABLE ONLY public.itemsreleased DROP CONSTRAINT "FK_ec281f85b8fc0081d0e4e4b7538";
       public          postgres    false    236    236    3803    254    254    254    236            6           2606    139796 1   inventorydimension FK_ed0fa2c836e9c6fa32235415ab5    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorydimension
    ADD CONSTRAINT "FK_ed0fa2c836e9c6fa32235415ab5" FOREIGN KEY (refwarehouse, refcompany, reforganisation) REFERENCES public.warehouse(refwarehouse, refcompany, reforganisation);
 ]   ALTER TABLE ONLY public.inventorydimension DROP CONSTRAINT "FK_ed0fa2c836e9c6fa32235415ab5";
       public          postgres    false    228    228    286    286    286    3787    228            Y           2606    139951 0   inventorytransfer FK_ed57fb9b13a3a73bc02e143ebeb    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorytransfer
    ADD CONSTRAINT "FK_ed57fb9b13a3a73bc02e143ebeb" FOREIGN KEY (refcompany, reforganisation, refwarehouseto) REFERENCES public.warehouse(refcompany, reforganisation, refwarehouse);
 \   ALTER TABLE ONLY public.inventorytransfer DROP CONSTRAINT "FK_ed57fb9b13a3a73bc02e143ebeb";
       public          postgres    false    228    228    228    295    295    295    3787            Z           2606    139946 0   inventorytransfer FK_edcccbaff1c471e423162053e06    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorytransfer
    ADD CONSTRAINT "FK_edcccbaff1c471e423162053e06" FOREIGN KEY (refcompany, reforganisation, refwarehousetransitfrom) REFERENCES public.warehouse(refcompany, reforganisation, refwarehouse);
 \   ALTER TABLE ONLY public.inventorytransfer DROP CONSTRAINT "FK_edcccbaff1c471e423162053e06";
       public          postgres    false    228    228    228    3787    295    295    295            E           2606    139881 <   inventoryreceivingjournalline FK_ef0940e2a93b4bae738c83cff20    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventoryreceivingjournalline
    ADD CONSTRAINT "FK_ef0940e2a93b4bae738c83cff20" FOREIGN KEY (purchaseorderlineid) REFERENCES public.purchaseorderlines(purchaseorderlineid);
 h   ALTER TABLE ONLY public.inventoryreceivingjournalline DROP CONSTRAINT "FK_ef0940e2a93b4bae738c83cff20";
       public          postgres    false    269    3883    290            �           2606    92205 )   parametres FK_ef429006cb33d938e24c6ea4db6    FK CONSTRAINT     �   ALTER TABLE ONLY public.parametres
    ADD CONSTRAINT "FK_ef429006cb33d938e24c6ea4db6" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 U   ALTER TABLE ONLY public.parametres DROP CONSTRAINT "FK_ef429006cb33d938e24c6ea4db6";
       public          postgres    false    227    3785    234            `           2606    140512 9   itemtrackingdimensionmodel FK_ef782a70c384762183d3ea4d792    FK CONSTRAINT     �   ALTER TABLE ONLY public.itemtrackingdimensionmodel
    ADD CONSTRAINT "FK_ef782a70c384762183d3ea4d792" FOREIGN KEY (refinventorytrackingobject) REFERENCES public.inventorytrackingobject(refinventorytrackingobject);
 e   ALTER TABLE ONLY public.itemtrackingdimensionmodel DROP CONSTRAINT "FK_ef782a70c384762183d3ea4d792";
       public          postgres    false    298    3937    299            �           2606    92610 ,   itemsreleased FK_f016047ca5da16782586ce20ff6    FK CONSTRAINT     �   ALTER TABLE ONLY public.itemsreleased
    ADD CONSTRAINT "FK_f016047ca5da16782586ce20ff6" FOREIGN KEY (refunitpurch, refcompany, reforganisation) REFERENCES public.units(refunit, refcompany, reforganisation);
 X   ALTER TABLE ONLY public.itemsreleased DROP CONSTRAINT "FK_f016047ca5da16782586ce20ff6";
       public          postgres    false    254    236    236    236    254    3803    254            F           2606    139841 <   inventoryreceivingjournalline FK_f0b39e0112ca1debbe5fd035c51    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventoryreceivingjournalline
    ADD CONSTRAINT "FK_f0b39e0112ca1debbe5fd035c51" FOREIGN KEY (reforganisation) REFERENCES public.organisation(reforganisation);
 h   ALTER TABLE ONLY public.inventoryreceivingjournalline DROP CONSTRAINT "FK_f0b39e0112ca1debbe5fd035c51";
       public          postgres    false    290    227    3785            �           2606    116274 ,   itemsreleased FK_f187275d4abdd62612a4b9d9406    FK CONSTRAINT     �   ALTER TABLE ONLY public.itemsreleased
    ADD CONSTRAINT "FK_f187275d4abdd62612a4b9d9406" FOREIGN KEY (refitem, reforganisation) REFERENCES public.items(refitem, reforganisation);
 X   ALTER TABLE ONLY public.itemsreleased DROP CONSTRAINT "FK_f187275d4abdd62612a4b9d9406";
       public          postgres    false    265    254    254    265    3877            �           2606    92585 7   purchaserequisitionlines FK_f1ab0058d205c4d2ea73285c45d    FK CONSTRAINT     �   ALTER TABLE ONLY public.purchaserequisitionlines
    ADD CONSTRAINT "FK_f1ab0058d205c4d2ea73285c45d" FOREIGN KEY (reftaxegroup, refcompany, reforganisation) REFERENCES public.taxegroup(reftaxegroup, refcompany, reforganisation);
 c   ALTER TABLE ONLY public.purchaserequisitionlines DROP CONSTRAINT "FK_f1ab0058d205c4d2ea73285c45d";
       public          postgres    false    241    3825    253    253    241    253    241            �           2606    92360 *   taxebygroup FK_f27101e4f5953af2beb3863e0db    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxebygroup
    ADD CONSTRAINT "FK_f27101e4f5953af2beb3863e0db" FOREIGN KEY (reftaxegroup, refcompany, reforganisation) REFERENCES public.taxegroup(reftaxegroup, refcompany, reforganisation);
 V   ALTER TABLE ONLY public.taxebygroup DROP CONSTRAINT "FK_f27101e4f5953af2beb3863e0db";
       public          postgres    false    242    242    241    241    241    3825    242            �           2606    108094 -   vendorreleased FK_f2ee2422a9257a92132004a40e7    FK CONSTRAINT     �   ALTER TABLE ONLY public.vendorreleased
    ADD CONSTRAINT "FK_f2ee2422a9257a92132004a40e7" FOREIGN KEY (reforganisation, refvendor) REFERENCES public.vendor(reforganisation, refvendor);
 Y   ALTER TABLE ONLY public.vendorreleased DROP CONSTRAINT "FK_f2ee2422a9257a92132004a40e7";
       public          postgres    false    3809    239    239    251    251            o           2606    140910 ;   inventorydimensionserialitem FK_f402e49a995b94f2397ecc58f0c    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventorydimensionserialitem
    ADD CONSTRAINT "FK_f402e49a995b94f2397ecc58f0c" FOREIGN KEY (refitem, refcompany, reforganisation) REFERENCES public.itemsreleased(refitem, refcompany, reforganisation);
 g   ALTER TABLE ONLY public.inventorydimensionserialitem DROP CONSTRAINT "FK_f402e49a995b94f2397ecc58f0c";
       public          postgres    false    254    254    303    303    303    3849    254                       2606    92830 3   uomclassicconversion FK_f5305036ae6051a16bed35b710d    FK CONSTRAINT     �   ALTER TABLE ONLY public.uomclassicconversion
    ADD CONSTRAINT "FK_f5305036ae6051a16bed35b710d" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 _   ALTER TABLE ONLY public.uomclassicconversion DROP CONSTRAINT "FK_f5305036ae6051a16bed35b710d";
       public          postgres    false    257    266    266    3855    257                       2606    92845 3   uomclassicconversion FK_fa74db0f58d367c212161a6aa9f    FK CONSTRAINT     �   ALTER TABLE ONLY public.uomclassicconversion
    ADD CONSTRAINT "FK_fa74db0f58d367c212161a6aa9f" FOREIGN KEY (refunitto, refcompany, reforganisation) REFERENCES public.units(refunit, refcompany, reforganisation);
 _   ALTER TABLE ONLY public.uomclassicconversion DROP CONSTRAINT "FK_fa74db0f58d367c212161a6aa9f";
       public          postgres    false    266    266    3803    236    236    236    266            �           2606    108104 %   vendor FK_facd74e7f5f43d7603616b80bdf    FK CONSTRAINT     �   ALTER TABLE ONLY public.vendor
    ADD CONSTRAINT "FK_facd74e7f5f43d7603616b80bdf" FOREIGN KEY (reflanguage) REFERENCES public.language(reflanguage);
 Q   ALTER TABLE ONLY public.vendor DROP CONSTRAINT "FK_facd74e7f5f43d7603616b80bdf";
       public          postgres    false    3771    239    221            �           2606    92785 5   addresssitegeographics FK_fb462080058016ec7779b6ba923    FK CONSTRAINT     �   ALTER TABLE ONLY public.addresssitegeographics
    ADD CONSTRAINT "FK_fb462080058016ec7779b6ba923" FOREIGN KEY (refaddresstype) REFERENCES public.addresstype(refaddresstype);
 a   ALTER TABLE ONLY public.addresssitegeographics DROP CONSTRAINT "FK_fb462080058016ec7779b6ba923";
       public          postgres    false    261    3867    263                       2606    92850 (   itemclass FK_fb6e0a567ec0ec036512a33d4c6    FK CONSTRAINT     �   ALTER TABLE ONLY public.itemclass
    ADD CONSTRAINT "FK_fb6e0a567ec0ec036512a33d4c6" FOREIGN KEY (refcompany, reforganisation) REFERENCES public.company(refcompany, reforganisation);
 T   ALTER TABLE ONLY public.itemclass DROP CONSTRAINT "FK_fb6e0a567ec0ec036512a33d4c6";
       public          postgres    false    257    267    267    3855    257            �           2606    92290 2   purchaserequisition FK_fc9aad1cc9edc54d053e64aaba6    FK CONSTRAINT     �   ALTER TABLE ONLY public.purchaserequisition
    ADD CONSTRAINT "FK_fc9aad1cc9edc54d053e64aaba6" FOREIGN KEY (rejectedby, refcompany, reforganisation) REFERENCES public.usercompany(matricule, refcompany, reforganisation);
 ^   ALTER TABLE ONLY public.purchaserequisition DROP CONSTRAINT "FK_fc9aad1cc9edc54d053e64aaba6";
       public          postgres    false    258    238    238    238    3857    258    258            6   �  x�}�Mk�0��+�ެ����n��b��,�䄄\Lv)�m��Geh�����Aϼ3X[A�t=�� �Χ���:�~�8]���x<ݎ�i_ɳ�}"_�E���� �k�P�Ǯ{�5`�e�қ���T�g�@�sHX"҄hcMUr%	M���M"��R�%�c�R��/��O#�m�?N���t	ny����t��_����qv%$���$��{&!�L��WM�t6��2�����Ї�BqV:U˾��M����Aj	�c#W+����y��bM[�4�9�,M�j3┗P�*���?4-��Yw[,P��1cE&�K�j:kr��y)��Ni�Y܅�붳K�U�"N����/$�<M�=~h�����LĢ��.4���[E�FA�N      7   �   x�}�A
�0@�ur
�%!3�$&�`���X-�����
ڮ?<~.Lb�>ţ�o"�����v�:�:eH!5@	|�[�!����*sa�ou�\�3ڂ�m�x*��v����w�^al�&��M�_�G�/-�|��:W      5   9   x��w	u�����qUpqU�q�x�9z#I�E��\�]P4�E�b���� nk�      ?   p   x�}��
�0 �s�އ%i�������ĭ���߱��󃗋x<��Y�V���jKy�_u���=Ş��tLJ�t`���\L/��6�u��CǒH�����+��!��u'�      8   o   x�}��
�0 �s��GK���Ԯ�TQ��/v��O��_�Ӵ�4���yM�䈍CRy	DAȶ�5?��E�뜇#����i��|m�q�6����"�"�)      0   �   x�}�A
�0����K��$�1+C6kIEA/��1*.�Ef�/�⿐	� �W����0�����FYb�c:0���#h��P�f`w�z�l�[I�G���qN��[�~c������o�Zz[�U��43,�⪄�58         �   x����
�@��٧�>\f���[l3�TT
$�%z҂(�
��0��(�1�M_��NeյG�xh��$ST)�Dh���
��^��,�>A������^Z��3��s����AW�}��zE��TJ���K�*&���bY�l�f��.���RM��jg^�|Jٙ3Ʈ��S�      )     x����n�0F��)z�������y�Х	�)���}-V��ǖ�rw>�����4dݮϞ���������Hd_��
n
n��HV�2EB���_,��K�&	<�s�TD���Q��\�-�0�����N��!E{z�Mvq
�{��1n�6��R{����u���n%�5F	�1�o�t�vي1Y���B^ML:k��ޘަ�h}s�t��x\��a$9)��N�pV��}�zj����m�8�Z�҂
R:U���c[�C�洅b�?SqÔ�2�k�>��n����hq�#ʊf-��AJ'�]ۀyJI���\beLg�s�.���,Jt�t��B������^BPH�{ʐ��B�[��^y��wU��+��)����v�]r�s�*)�k�B��4���}�j�����	�)�=��}���Po�_��n��a~ȁ�/h<]�_�^�H��j�mA�����\� ��G�92���&�:����+��A	"�7׎ǯ�:���U�������'���/�E      *   �   x�}��
�0E��Wd/�<kv�5�&%-�����T��������)�B�ㅜB�s!a��uk�b����F�������<(nU�A���4ĒB��a+�7f��!��R>�$�O���rc�Y�Ū�j�i�޵�Z������U�����y��q �z)~Pz��;~�Ib      (   ~   x���M
�0@�u��˄��i���'PcH���ϡ�.Dĕ���B���T�
�4��:����R����V	I�4 ��OƳ�dF�fG��B���'��"s��{�f�����A;��q����� �``9         D   x�s1����wv��tLOL�,�r1��'�f%E��!�U NwG?GN��d��=... o2      1   �   x���A��0��ur�쇆�gLvA�
��qh�t38ap���ީ���j�[���!����Wd_���x��zVen��"!���ʕP+�H	�1G��+ݗ�n��]ӆ�za?�����6�=�,�Fc<G?W��Syܷ>�M��m��mRd_��@>�1f��Jǿ�)�t�����90�۷�i8��~���h,h�PJ3�XZ\i�#}׏�Rz��n�         �   x�UPAn�0<;���P�W��i�S'�
iϼ���&!�U$ۓ�G��A0�Kw���ٶ-�T�fz��j~�S(�j�(4�	��M���9����j��9N�;@:i�%��/�{<�[8ҖO�<l��
�5��b�.��	r8n��ʆY����r����c�w��Ʌ~/������E���^?����,n��Y�&����f'�����ϙ�c��uml         k   x��;
�0 �Y:LF1�2䳄,Jb\C+CƜ��[_�c���^�8*NN��d)�ų=������0ɓ`�j��P���[��<��[Mq&YIZ�j�Z�큈?�� �         ^   x�=���0�)2����X$6�D��s �IW����)j##V1Ȍ��X��>�k�%�ڊ���:(��R�����V�p#��������U>      %   :   x�st�t��t�P�Q��~�Aa\��A�!����p�d�h��k'�F������ ��      
      x����q�S\1z\\\ 2BP      N      x������ � �      L      x������ � �      `      x������ � �      J      x������ � �      ^      x������ � �      I      x������ � �      ]      x������ � �      K      x������ � �      _      x������ � �      a      x������ � �      O      x������ � �      R      x������ � �      P      x������ � �      [      x������ � �      H      x������ � �      D      x������ � �      B   u   x�]��	�0��h�L��-��H2'9_�������qwYJ�.�D�^�u�����\?�X���
c$��:��c,�󏲴x��"��Sr��x��tb���6B���} �#2�      F   �  x���Kn�0���)� v�q �Z��JW�0��"j��r��w��coڴ@")����OJ���a��J�:�0��A��im<�wyI��M���<�HX�u��j!���>�/U�*��[V,Ѡm#�M/�� ����pkCLe�.�����j:)��1X�wt@=A��v��u�=㾤ǜ:4�����h�R�z-���9/6:^�'J�#1�S�n�r�9���i����g}sޚ���-�>D�4!l�!{��̠ـ���"�ֵ5���"#��c/�J똁�="&ĳǤ�=��i��k�nO�?����!ڎ[��Q�LIiƧ���^���I���?r��=�/���5�����;O[qa�s�N.�R}MGso����=���:��(�8�#��|�F~(�'�^�x�]s�܃ݷ�<i��$���B]˼�3�,��6S���O���-q�e���|%��	��R      E   �  x��S�r�0<�_�c;k�<> �u�Ԗ3���L��ɒT�}@)V<�!��"��.���z}S,�2YL�fp���Q`4΃C�QŹ�q׸�\�ŜJӷli(��	�(�S@�ؒ�Vi��#T�I>���w�Lޖ��![%�T�
l��C5�UFa��&��8���QfwY�����cH1�m kT�FgTi��w:ߏ�q@/�ٖ���l��V?ӯ��"����2��`܁)]�ǬX>$����d:��醂�� *gF��)���Ɂ5>0O�j����F��o�]T����`�+�����<浸-�U���o��|�g�~e���c2��l��sC�N��l��p�`q��o��mb�h�+��<�զHޣs�]PGҼ4oҏܒ�\�"K����&�y	��ш���䳹��
!^+�Ne      W      x������ � �      U      x������ � �      V      x������ � �      S      x������ � �      X      x������ � �      ;   �   x�m��
�0��s���J�vI���'E�v�	|�A� �?����@
��t9O�n�vs���؎��'0��QjԊ0'f�䝆�m�.2���~�2l�Q>��FPUJ�]j����dۯ��e���������ܭ1���8      Y      x������ � �      9   �   x�m�=�0E��W�],､&v�PQ[t�Rk�@�����tD��������dıؕ��X�b��a�C����bbD&�rC��g��;<.�ts���$J���5�A0���,(͐3e�Ƞ� �P�#����P��~\����u�����ć Yq�n�g�����,�'�[�����:�R��>r      @   L   x�v�s�qUpqVp�t��t�����
�,�4202�50"C#+C+S=K3#C#SmC��\1z\\\ P{}      .   �   x����n�0�g�)��mI�CҢ	������Zr���P� A}��|`P�������E�Ԁ���=�@l�!�YbvQ�S�>�5���f3T���{KB�Oܸ����a��M�.�y�5���B�[��&h�(Q6����p�Q� >�r�+j1J
-knx������d�l��1~���ܼ�hޤ�~�u��'3�I[r6���R
+�Б-%[)j�� D�覛���+xX      \      x������ � �         *   x���v�V �<��}�C8�L� �  �+F��� �
2      Z      x������ � �         A   x�K,�t,JL�L�J+�t+J�K��J��t�K��,2�9��@̂΀��������T�=... r��      4   �   x����
�@����p�g���J�� 

$p���$�*3Q�swg�qn]Q�������\/7�>"�s���쀁�0��Qs֌��Y%R��|iꁔu�����d?�6i�<�"V](='�u�q7%�¿��0�p�-���}�S�[�����ҧV���޲���Ї5Ƽ %Ot         _   x���
���Sv
�tv�4202�50�54S04�22�20�36012��60�/����	�
�!A���>�!��~8�����6*����� ��"j         �   x����
�0ϛ�Ƚ6������.�XLbi�g����Y{|�a$�.-p���A!�KٴP�|��>Oc^��}�o�D��BS)�em���ݶ�ٜPS�`�[��##ρҁ��R
�(M�#��L�[o�W~K��c�i���Qt
u�k�@���/AG           x���Kj�0�ur���I�{�f�L�4y��{�ޟz�IP]�ݏ>$˹\?�P�sц�޴C??��<�:�zB�Qy���t��O�K$_�<�=� 	�����m��GV \EhXq.�2�-4c"��UƓ�����O�6YS>:Q�Y�ܦɜ�О��"PYR��M�Z_C_��R��cB�-�u�!�2���2�ܧ+9���-�� �8�4C�ӕ����uƢ8��7�>]�a�,7�Q��6M/��ܷYTYAV�â�4�cr�;FHt��쇴�eY��(��         �   x���A
�0E��)���L2�4مVl�F���x�s؂B�Z*����?����B��"Evh��ڦKXL���mŴ�(���]PV:2����u�5������$Z6�)7,�)xS8A;I�A���_����O�L�:��W��!	���9~Pn_?ب��T -=!)�+)H���Xh<         �   x����
�0����݇c�lg��-�j��A��ϑ���0����v(��eU�N�X����ʚ�@��6��2V7&�D[�k-���ky�Á�w'�]��pe6i��A�t����T�\�^ʾz�V�E�uj�7��v`���	^��g��� Y��������ڙMs��U8��>�A�ܟ�1&���Rr!08$G׎�������|�(��B-��      	   +   x�s�s��t�t�2���<�B|��=�C�9Q�\1z\\\ ���      &   M   x��4�r��4P��Rp��Sp	U����4 �r���������xp�{Dq�{��qYx��@���� ���qqq ��q      '   Y   x��ut���,NU8�@!%�� �8�$3?���#�3��/8(�+�5�3,�(575�D!��(1/=�YA���3gPj.Ș���R�Bd�=... 6�!         �   x�}��
�0��s��KK�֬�y���� �q����
"E���'���6ۛ����E�2Ί�����`�o����
��E��?dY,�D.&�E��ZDjR�!bƩ�����1[�9'l#�X���1��Az�w��~"�88      >      x������ � �      =      x������ � �         5   x�s�		�t�9<%$4�5��)�Ǐ�)�?����ߏ���χH�� �b���� V}�         �   x��N�
�0=g_��lK�i�(A��0A��Ѫ��ϷS"�H�K����B�<�~��%�r1:k:cû��i? E�F8���$c"Cs����lTh�v�o�ًv2i��Y%m�^.���2��J;c?H/6o�x����G���e�Y�1�B����ٝu�ַ+�b�4�	�og�q��8�'<P      -   �   x�u��
1��٧�.�$Mڦ�UA�PQ�}��]aAP3a�@&�}�D��h�����r����	؄�XL�K�L)�<���@a�<íZ��0X=��P��7���U�!��񌭰q�bÜx�\i(��])�7:;��z���|���K��$��(1��Ik���{�BK         ^   x���� k{
&�@\Y�p���g#�����I�-�pJ�~���*���;�2g������	Z)y+�>�ʓ �Lo�����>��"         �   x�m�M
�0����ٹ���41M)�@K��TA<D�-�ԟ�|/���ζp��8� ���e�#�s�:y���1�z77p�If�2R<�U��(
c���w��B%tiH�����>���X�x߅0L�����NCx���_�&C���ו]c��h7�      #   c   x�q�00�q�pUvQ�rv�Q0W�t�����
��ut�*24�(u�@�44��������*#��F󌰚U����=... |�3~      "   t   x�st	r�q�0�t�����
�r��:�bJ��;;����p���ǡ��Sj36�t}<������%�9T�pa���Fui���q�
��H�c
c��=... �sf      !   �   x�u�K� D��\ ����*��*U��9J�DʧY��捹�l��1o�T����>a��I
qH=��q�)�<�d�`�1	U�|mK�*��+�\� �g��myS
�F�5�W�k�.�jz��=���S������t��|D��_          l   x���1� ���y� ���8(Qc��9$ZL4&�u����͊��nSK?L��j�FbS�
�����zY֟���%H�\v���̹�a�n��M�e����Z�Y?U         �   x�}��
�0��s���J�%�ڛȨcs�n
�Ń�������7���ж.�/��f'�� �~��S�F���_���" �l������z�_��;���#V��!a�U�U��	2sTb	3;B�\�e�~�/�6t�u�*6h��h�ɪ�U�_�� �=&�� ��Љ*�JJ���Z�      :   �   x�}�A
�0�us���L2Ә��E,�"Z�cxl�II%����1���^�p�=��Ѝs V�J���)5��k���U���CLٴ��c�`�kj�KL��{$`�^���՝�D�V; ��H�Mה���\�s��I{�<[Kb\���=�se�m��OaO�ufq7V���ZFi}      /   �   x�u�A
�0E��)����I&�d'.j�Ѫ ���TAk[!�G���E1��f�Mw:^̹kzS����!�PB�W`�@���V�J��0$��Q}5֫yW�9�)��19� c�"�����}@�d�������	}���hy^�3{�c�4�.%� gv�Hq����'�~>��Y��~��;k�ΘaB      3   t  x�m��nZ1F��)�WX3����T�P�T���P7��oJBզ�����J���fq�h��N� p�����oT$�y6���QFĮ��� ���a���' tc4�8�՞�Xz��J�2�hZ�.�s�N���'���)� z�G7���^��u�~���/Ar3�AN���'����-H�ZB1�e����v�x�_�[p1[.ҧ��g��v�7�춧���z��6U��c,�l�X|_�5"�fsǾ��$[Og���5Z6/���"��N#:c��2}��W����I=-����,ͪ��[�����<�a5�"=Cu�q�D�փe �������9h!�d���	T"Ӂ&6|�7�C������I���7��U�F�?ź�{      A   �   x���
�t���4600�4�tt���,C##]3]#KCs+S 2�33763�60�+���� �� ��4�[������0I���`,n6�54T04�2��24�356410C�C�+F��� ��94      2   �   x�u�M
�@���݋�$�L2�*Tj�hA\��?Zşj�~y���}s<��zW�SC�w�����%��Z$	�"�J�Er"Үh�^���qCAQs���i��V��r1�雌%$C0��s�#r2��>D���0{��#QJ �d�����HqݧÌ��#+R� �~����W_�B�S+         �   x�-�AO�0�Ϗ_ѻ�y��zv�6�RBY���=�q���eWo��|33�	Q�ٵ��_ަ9.�?g���vG�j�4 "	��ĕrxu���M(膛��kCؚIe�J��.����m��Ʋ�e�m�{rMհ�?�P���,�O����w\���j��6Y
x�;�^O(�U*�QnHUp�#�t����3F� ��KQ�-M�y�$�WR<�      $   N   x���w�t���v
V��wv��t�����
�r	BUp�swBV�n��gp�g`�+��=... e=W      +   �   x�m�A
�0�����K�L�$mv��ZiSI5�d��A��������%D	���>�1�05���G��ta�-, Q�5WT�ud����lm�飆㪨�P�H������w���ݷ��f�����qe%�`i����˂1� uL,�         )   x�H-*���K��2�����2�K2��8�9\1z\\\ �f?         �   x���M
�0���)�/Jfb�fe�1��bh��@{��Zi�̼y<��vr����L��ְҰ!􇓶��UL[]֞��\�n�g�^ȝ�A�I�e���Tȕ�8ˀ�q��.�/5Sm���o\��Zw�@�����1f���E�F�g �LU���$]]]@!�e6��%�+g:Ɣ���M2     