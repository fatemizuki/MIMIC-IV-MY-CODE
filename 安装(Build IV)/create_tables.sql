-- -------------------------------------------------------------------------------
--
-- Create the MIMIC-IV tables
-- Adapted from https://github.com/MIT-LCP/mimic-code/blob/master/buildmimic/postgres/postgres_create_tables.sql
-- Adapted from https://github.com/YIKUAN8/MIMIC-IV-Postgres/blob/master/create_tables.sql
--
-- -------------------------------------------------------------------------------

--------------------------------------------------------
--  DDL for Table ADMISSIONS
--------------------------------------------------------

DROP TABLE IF EXISTS ADMISSIONS CASCADE;
CREATE TABLE ADMISSIONS
(
  subject_id INT NOT NULL,
  hadm_id INT NOT NULL,
  admittime TIMESTAMP(0) NOT NULL,
  dischtime TIMESTAMP(0) NOT NULL,
  deathtime TIMESTAMP(0),
  admission_type VARCHAR(40) NOT NULL,
  admission_location VARCHAR(60),
  discharge_location VARCHAR(60),
  insurance VARCHAR(255) NOT NULL,
  language VARCHAR(10),
  marital_status VARCHAR(80),
  ethnicity VARCHAR(80) NOT NULL,
  edregtime TIMESTAMP(0),
  edouttime TIMESTAMP(0),
  hospital_expire_flag SMALLINT,
  CONSTRAINT adm_hadm_pk PRIMARY KEY (hadm_id),
  CONSTRAINT adm_hadm_unique UNIQUE (hadm_id)
) ;

--------------------------------------------------------
--  DDL for Table PATIENTS
--------------------------------------------------------

DROP TABLE IF EXISTS PATIENTS CASCADE;
CREATE TABLE PATIENTS
(
	subject_id INT NOT NULL,
	gender VARCHAR(1) NOT NULL,
	anchor_age INT,
  	anchor_year INT,
  	anchor_year_group VARCHAR(255),
	dod TIMESTAMP(0),
	CONSTRAINT pat_subid_unique UNIQUE (subject_id),
	CONSTRAINT pat_subid_pk PRIMARY KEY (subject_id)
) ;

--------------------------------------------------------
--  DDL for Table TRANSFERS
--------------------------------------------------------

DROP TABLE IF EXISTS TRANSFERS CASCADE;
CREATE TABLE TRANSFERS
(
	subject_id INT NOT NULL,
	hadm_id INT NOT NULL,
  	transfer_id INT,
	eventtype VARCHAR(20),
	careunit VARCHAR(255),
	intime TIMESTAMP(0),
	outtime TIMESTAMP(0),
	CONSTRAINT transfers_subid_transid_pk PRIMARY KEY (subject_id,transfer_id)
) ;

--------------------------------------------------------
--  DDL for Table D_HCPCS
--------------------------------------------------------

DROP TABLE IF EXISTS D_HCPCS CASCADE;
CREATE TABLE D_HCPCS
(
	code CHAR(5),
	category SMALLINT,
	long_description TEXT,
	short_description VARCHAR(180),
	CONSTRAINT d_hcpcs_code_unique UNIQUE (code),
	CONSTRAINT d_hcpcs_code_pk PRIMARY KEY (code)
) ;

--------------------------------------------------------
--  DDL for Table D_ICD_DIAGNOSES
--------------------------------------------------------

DROP TABLE IF EXISTS D_ICD_DIAGNOSES CASCADE;
CREATE TABLE D_ICD_DIAGNOSES
(
	icd_code VARCHAR(10) NOT NULL,
	icd_version INT NOT NULL,
	long_title VARCHAR(300) NOT NULL,
	CONSTRAINT d_icd_diagonses_icd_code_version_pk PRIMARY KEY (icd_code,icd_version)
) ;

--------------------------------------------------------
--  DDL for Table D_ICD_PROCEDURES
--------------------------------------------------------

DROP TABLE IF EXISTS D_ICD_PROCEDURES CASCADE;
CREATE TABLE D_ICD_PROCEDURES
(
	icd_code VARCHAR(10) NOT NULL,
	icd_version INT NOT NULL,
	long_title VARCHAR(300) NOT NULL,
	CONSTRAINT d_icd_procedures_icd_code_pk PRIMARY KEY (icd_code)
) ;

--------------------------------------------------------
--  DDL for Table D_LABITEMS
--------------------------------------------------------

DROP TABLE IF EXISTS D_LABITEMS CASCADE;
CREATE TABLE D_LABITEMS
(
	itemid INT NOT NULL,
	label VARCHAR(50) NOT NULL,
	fluid VARCHAR(50) NOT NULL,
	category VARCHAR(50) NOT NULL,
	loinc_code VARCHAR(50),
	CONSTRAINT d_labitems_itemid_pk PRIMARY KEY (itemid)
) ;

--------------------------------------------------------
--  DDL for Table DIAGNOSES_ICD
--------------------------------------------------------

DROP TABLE IF EXISTS DIAGNOSES_ICD CASCADE;
CREATE TABLE DIAGNOSES_ICD
(
	subject_id INT NOT NULL,
	hadm_id INT NOT NULL,
	seq_num INT,
	icd_code CHAR(7),
	icd_version INT
) ;

--------------------------------------------------------
--  DDL for Table DRGCODES
--------------------------------------------------------

DROP TABLE IF EXISTS DRGCODES CASCADE;
CREATE TABLE DRGCODES
(
	subject_id INT NOT NULL,
	hadm_id INT NOT NULL,
	drg_type VARCHAR(4),
	drg_code VARCHAR(10),
	description VARCHAR(195),
	drg_severity SMALLINT,
	drg_mortality SMALLINT
) ;

--------------------------------------------------------
--  DDL for Table EMAR
-- pharmacy_id not mentioned
--------------------------------------------------------

DROP TABLE IF EXISTS EMAR CASCADE;
CREATE TABLE EMAR
(
	subject_id INT NOT NULL,
	hadm_id INT,
	emar_id VARCHAR(100) NOT NULL,
	emar_seq INT NOT NULL,
	poe_id VARCHAR(25) NOT NULL,
	pharmacy_id INT,
	charttime TIMESTAMP(0) NOT NULL,
	medication TEXT,
	event_txt TEXT,
	scheduletime TIMESTAMP(0),
	storetime TIMESTAMP(0) NOT NULL,
	CONSTRAINT emar_emar_id_pk PRIMARY KEY (emar_id)
) ;

--------------------------------------------------------
--  DDL for Table EMAR_DETAIL
--------------------------------------------------------

DROP TABLE IF EXISTS EMAR_DETAIL CASCADE;
CREATE TABLE EMAR_DETAIL
(
	subject_id INT NOT NULL,
	emar_id VARCHAR(25) NOT NULL,
	emar_seq INT NOT NULL,
	parent_field_ordinal NUMERIC(5,3),
	administration_types VARCHAR(50),
	pharmacy_id INT,
	barcode_type VARCHAR(4),
	Reason_for_No_Barcode TEXT,
	Complete_Dose_Not_Given VARCHAR(5),
	Dose_Due VARCHAR(50),
	Dose_Due_Unit VARCHAR(50),
	Dose_Given VARCHAR(255),
	Dose_Given_Unit VARCHAR(50),
	will_remainder_of_dose_be_given VARCHAR(5),
	Product_Amount_Given VARCHAR(30),
	Product_Unit VARCHAR(30),
	Product_Code VARCHAR(30),
	Product_Description VARCHAR(255),
	Product_Description_Other VARCHAR(255),
	Prior_Infusion_Rate VARCHAR(20),
	Infusion_Rate VARCHAR(20),
	Infusion_Rate_Adjustment VARCHAR(50),
	Infusion_Rate_Adjustment_Amount VARCHAR(30),
	Infusion_Rate_Units VARCHAR(30),
	Route VARCHAR(5),
	Infusion_Complete VARCHAR(255),
	Completion_Interval VARCHAR(30),
	New_IV_Bag_Hung VARCHAR(1),
	Continued_infusion_in_other_location VARCHAR(1),
	Restart_Interval VARCHAR(30),
	Side VARCHAR(10),
	Site VARCHAR(255),
	non_formulary_visual_verification VARCHAR(1)
) ;

--------------------------------------------------------
--  DDL for Table HCPCSEVENTS
--------------------------------------------------------

DROP TABLE IF EXISTS HCPCSEVENTS CASCADE;
CREATE TABLE HCPCSEVENTS
(
	subject_id INT NOT NULL,
	hadm_id INT NOT NULL,
	hcpcs_cd CHAR(5),
	seq_num INT,
	short_description TEXT
) ;


--------------------------------------------------------
--  DDL for Table LABEVENTS
-- labevent_id not mentioned
--------------------------------------------------------

DROP TABLE IF EXISTS LABEVENTS CASCADE;
CREATE TABLE LABEVENTS
(
	labevent_id INT NOT NULL,
	subject_id INT NOT NULL,
	hadm_id INT,
	stay_id INT,
	spec_id INT NOT NULL,
	itemid INT NOT NULL,
	charttime TIMESTAMP(0) NOT NULL,
	storetime TIMESTAMP(0),
	value VARCHAR(200),
	valuenum DOUBLE PRECISION,
	valueuom VARCHAR(20),
	ref_range_lower DOUBLE PRECISION,
	ref_range_upper DOUBLE PRECISION,
	flag VARCHAR(10),
	priority VARCHAR(7),
	CONSTRAINT labevents_labeventid_pk PRIMARY KEY (labevent_id)
) ;

CREATE TABLE labevents_1 ( CHECK ( labevent_id >= 0 AND labevent_id < 12500000 )) INHERITS (labevents);
CREATE TABLE labevents_2 ( CHECK ( labevent_id >= 12500000 AND labevent_id < 25000000 )) INHERITS (labevents);
CREATE TABLE labevents_3 ( CHECK ( labevent_id >= 25000000 AND labevent_id < 37500000 )) INHERITS (labevents);
CREATE TABLE labevents_4 ( CHECK ( labevent_id >= 37500000 AND labevent_id < 50000000 )) INHERITS (labevents);
CREATE TABLE labevents_5 ( CHECK ( labevent_id >= 50000000 AND labevent_id < 62500000 )) INHERITS (labevents);
CREATE TABLE labevents_6 ( CHECK ( labevent_id >= 62500000 AND labevent_id < 75000000 )) INHERITS (labevents);
CREATE TABLE labevents_7 ( CHECK ( labevent_id >= 75000000 AND labevent_id < 87500000 )) INHERITS (labevents);
CREATE TABLE labevents_8 ( CHECK ( labevent_id >= 87500000 AND labevent_id < 100000000 )) INHERITS (labevents);
CREATE TABLE labevents_9 ( CHECK ( labevent_id >= 100000000 AND labevent_id < 112500000 )) INHERITS (labevents);
CREATE TABLE labevents_10 ( CHECK ( labevent_id >= 112500000 AND labevent_id < 125000000 )) INHERITS (labevents);



CREATE OR REPLACE FUNCTION labevents_insert_trigger()
RETURNS TRIGGER AS $$
BEGIN
IF ( NEW.labevent_id >= 0 AND NEW.labevent_id < 12500000 ) THEN INSERT INTO labevents_1 VALUES (NEW.*);
ELSIF ( NEW.labevent_id >= 12500000 AND NEW.labevent_id < 25000000 ) THEN INSERT INTO labevents_2 VALUES (NEW.*);
ELSIF ( NEW.labevent_id >= 25000000 AND NEW.labevent_id < 37500000 ) THEN INSERT INTO labevents_3 VALUES (NEW.*);
ELSIF ( NEW.labevent_id >= 37500000 AND NEW.labevent_id < 50000000 ) THEN INSERT INTO labevents_4 VALUES (NEW.*);
ELSIF ( NEW.labevent_id >= 50000000 AND NEW.labevent_id < 62500000 ) THEN INSERT INTO labevents_5 VALUES (NEW.*);
ELSIF ( NEW.labevent_id >= 62500000 AND NEW.labevent_id < 75000000 ) THEN INSERT INTO labevents_6 VALUES (NEW.*);
ELSIF ( NEW.labevent_id >= 75000000 AND NEW.labevent_id < 87500000 ) THEN INSERT INTO labevents_7 VALUES (NEW.*);
ELSIF ( NEW.labevent_id >= 87500000 AND NEW.labevent_id < 100000000 ) THEN INSERT INTO labevents_8 VALUES (NEW.*);
ELSIF ( NEW.labevent_id >= 100000000 AND NEW.labevent_id < 112500000 ) THEN INSERT INTO labevents_9 VALUES (NEW.*);
ELSIF ( NEW.labevent_id >= 112500000 AND NEW.labevent_id < 125000000 ) THEN INSERT INTO labevents_10 VALUES (NEW.*);
ELSE
	INSERT INTO labevents_null VALUES (NEW.*);
END IF;
RETURN NULL;
END;
$$
LANGUAGE plpgsql;

    CREATE TRIGGER insert_labevents_trigger
    BEFORE INSERT ON labevents
    FOR EACH ROW EXECUTE PROCEDURE labevents_insert_trigger();

--------------------------------------------------------
--  DDL for Table MICROBIOLOGYEVENTS
--  microevent_id, micro_specimen_id and comments not mentioned 
--------------------------------------------------------

DROP TABLE IF EXISTS MICROBIOLOGYEVENTS CASCADE;
CREATE TABLE MICROBIOLOGYEVENTS
(
	microevent_id INT NOT NULL,
	subject_id INT NOT NULL,
	hadm_id INT ,
	micro_specimen_id INT NOT NULL,
	chartdate TIMESTAMP(0) NOT NULL,
	charttime TIMESTAMP(0) ,
	spec_itemid INT NOT NULL,
	spec_type_desc VARCHAR(100) NOT NULL,
	test_seq INT NOT NULL,
	storedate TIMESTAMP(0) ,
	storetime TIMESTAMP(0) ,
	test_itemid INT NOT NULL,
	test_name VARCHAR(100) NOT NULL,
	org_itemid INT ,
	org_name VARCHAR(100) ,
	isolate_num SMALLINT ,
	quantity VARCHAR(50) ,
	ab_itemid INT ,
	ab_name VARCHAR(30) ,
	dilution_text VARCHAR(10) ,
	dilution_comparison VARCHAR(20) ,
	dilution_value DOUBLE PRECISION ,
	interpretation VARCHAR(5) ,
	comments VARCHAR(5),
	CONSTRAINT mbe_microevent_id_pk PRIMARY KEY (microevent_id)
) ;


--------------------------------------------------------
--  DDL for Table PHARMACY
--------------------------------------------------------

DROP TABLE IF EXISTS PHARMACY CASCADE;
CREATE TABLE PHARMACY
(
	subject_id INT NOT NULL,
	hadm_id INT NOT NULL,
	pharmacy_id INT NOT NULL,
	poe_id VARCHAR(25) ,
	starttime TIMESTAMP(0) ,
	stoptime TIMESTAMP(0) ,
	medication VARCHAR(100) ,
	proc_type VARCHAR(50) NOT NULL,
	status VARCHAR(50) NOT NULL,
	entertime TIMESTAMP(0) NOT NULL,
	verifiedtime TIMESTAMP(0) ,
	route VARCHAR(30),
	frequency VARCHAR(30) ,
	disp_sched VARCHAR(100) ,
	infusion_type VARCHAR(15) ,
	sliding_scale VARCHAR(5) ,
	lockout_interval VARCHAR(50) ,
	basal_rate  DOUBLE PRECISION,
	one_hr_max  VARCHAR(30), 
	doses_per_24_hrs DOUBLE PRECISION ,
	duration DOUBLE PRECISION,
	duration_interval VARCHAR(50) ,
	expiration_val INT ,
	expiration_unit VARCHAR(50) ,
	expirationdate TIMESTAMP(0) ,
	dispensation VARCHAR(50) ,
	fill_quantity VARCHAR(30),
	CONSTRAINT pharmacy_pharmacy_pk PRIMARY KEY (pharmacy_id)
) ;


--------------------------------------------------------
--  DDL for Table POE
--------------------------------------------------------

DROP TABLE IF EXISTS POE CASCADE;
CREATE TABLE POE
(
	poe_id VARCHAR(25) NOT NULL,
	poe_seq INT NOT NULL,
	subject_id INT NOT NULL,
	hadm_id INT NOT NULL,
	ordertime TIMESTAMP(0) NOT NULL,
	order_type VARCHAR(25),
	order_subtype VARCHAR(50) ,
	transaction_type VARCHAR(15),
	discontinue_of_poe_id VARCHAR(25) ,
	discontinued_by_poe_id VARCHAR(25) ,
	order_status VARCHAR(15) ,
	CONSTRAINT poe_poe_id_pk PRIMARY KEY (poe_id)
) ;

--------------------------------------------------------
--  DDL for Table POE_DETAIL
--------------------------------------------------------

DROP TABLE IF EXISTS POE_DETAIL CASCADE;
CREATE TABLE POE_DETAIL
(
	poe_id VARCHAR(25) NOT NULL,
	poe_seq INT NOT NULL,
	subject_id INT NOT NULL,
	field_name VARCHAR(255),
	field_value TEXT
) ;


--------------------------------------------------------
--  DDL for Table PRESCRIPTIONS
--------------------------------------------------------

DROP TABLE IF EXISTS PRESCRIPTIONS CASCADE;
CREATE TABLE PRESCRIPTIONS
(
	subject_id INT NOT NULL,
	hadm_id INT NOT NULL,
	pharmacy_id INT NOT NULL,
	starttime TIMESTAMP(0) ,
	stoptime TIMESTAMP(0) ,
	drug_type VARCHAR(10) NOT NULL,
	drug VARCHAR(100) ,
	gsn VARCHAR(250) , 
	ndc VARCHAR(20) ,
	prod_strength VARCHAR(120) ,
	form_rx  VARCHAR(10),
	dose_val_rx VARCHAR(50) ,
	dose_unit_rx VARCHAR(50) ,
	form_val_disp VARCHAR(30) ,
	form_unit_disp VARCHAR(30) ,
	doses_per_24_hrs DOUBLE PRECISION ,
	route VARCHAR(30)
) ;

--------------------------------------------------------
--  DDL for Table PROCEDURES_ICD
--------------------------------------------------------

DROP TABLE IF EXISTS PROCEDURES_ICD CASCADE;
CREATE TABLE PROCEDURES_ICD
(
	subject_id INT NOT NULL,
	hadm_id INT NOT NULL,
	seq_num INT,
	icd_code CHAR(7),
	icd_version INT
) ;

--------------------------------------------------------
--  DDL for Table SERVICES
--------------------------------------------------------

DROP TABLE IF EXISTS SERVICES CASCADE;
CREATE TABLE SERVICES
(
	subject_id INT NOT NULL,
	hadm_id INT NOT NULL,
	transfertime TIMESTAMP(0) NOT NULL,
	prev_service VARCHAR(20) ,
	curr_service VARCHAR(20) NOT NULL
) ;

--------------------------------------------------------
--  DDL for Table D_ITEMS
--------------------------------------------------------

DROP TABLE IF EXISTS D_ITEMS CASCADE;
CREATE TABLE D_ITEMS
(
	itemid INT NOT NULL,
	label VARCHAR(200) NOT NULL,
	abbreviation VARCHAR(100) NOT NULL,
	linksto VARCHAR(50) NOT NULL,
	category VARCHAR(100) NOT NULL,
	unitname VARCHAR(100),
	param_type VARCHAR(30) NOT NULL,
	lownormalvalue DOUBLE PRECISION,
	highnormalvalue DOUBLE PRECISION,
	CONSTRAINT ditems_itemid_unique UNIQUE (itemid),
	CONSTRAINT ditems_itemid_pk PRIMARY KEY (itemid)
) ;

--------------------------------------------------------
--  DDL for Table CHARTEVENTS
--------------------------------------------------------

DROP TABLE IF EXISTS CHARTEVENTS CASCADE;
CREATE TABLE CHARTEVENTS
(
	subject_id INT NOT NULL,
	hadm_id INT NOT NULL,
	stay_id INT NOT NULL,
	charttime TIMESTAMP(0) NOT NULL,
	storetime TIMESTAMP(0) ,
	itemid INT NOT NULL,
	value VARCHAR(160) ,
	valuenum DOUBLE PRECISION,
	valueuom VARCHAR(20),
	warning SMALLINT NOT NULL
) ;

CREATE TABLE chartevents_1 ( CHECK ( itemid >= 220000 AND itemid < 221000 )) INHERITS (chartevents);
CREATE TABLE chartevents_2 ( CHECK ( itemid >= 221000 AND itemid < 222000 )) INHERITS (chartevents);
CREATE TABLE chartevents_3 ( CHECK ( itemid >= 222000 AND itemid < 223000 )) INHERITS (chartevents);
CREATE TABLE chartevents_4 ( CHECK ( itemid >= 223000 AND itemid < 224000 )) INHERITS (chartevents);
CREATE TABLE chartevents_5 ( CHECK ( itemid >= 224000 AND itemid < 225000 )) INHERITS (chartevents);
CREATE TABLE chartevents_6 ( CHECK ( itemid >= 225000 AND itemid < 226000 )) INHERITS (chartevents);
CREATE TABLE chartevents_7 ( CHECK ( itemid >= 226000 AND itemid < 227000 )) INHERITS (chartevents);
CREATE TABLE chartevents_8 ( CHECK ( itemid >= 227000 AND itemid < 228000 )) INHERITS (chartevents);
CREATE TABLE chartevents_9 ( CHECK ( itemid >= 228000 AND itemid < 229000 )) INHERITS (chartevents);
CREATE TABLE chartevents_10 ( CHECK ( itemid >= 229000 AND itemid < 230000 )) INHERITS (chartevents);


CREATE OR REPLACE FUNCTION chartevents_insert_trigger()
RETURNS TRIGGER AS $$
BEGIN
IF ( NEW.itemid >= 220000 AND NEW.itemid < 221000 ) THEN INSERT INTO chartevents_1 VALUES (NEW.*);
ELSIF ( NEW.itemid >= 221000 AND NEW.itemid < 222000 ) THEN INSERT INTO chartevents_2 VALUES (NEW.*);
ELSIF ( NEW.itemid >= 222000 AND NEW.itemid < 223000 ) THEN INSERT INTO chartevents_3 VALUES (NEW.*);
ELSIF ( NEW.itemid >= 223000 AND NEW.itemid < 224000 ) THEN INSERT INTO chartevents_4 VALUES (NEW.*);
ELSIF ( NEW.itemid >= 224000 AND NEW.itemid < 225000 ) THEN INSERT INTO chartevents_5 VALUES (NEW.*);
ELSIF ( NEW.itemid >= 225000 AND NEW.itemid < 226000 ) THEN INSERT INTO chartevents_6 VALUES (NEW.*);
ELSIF ( NEW.itemid >= 226000 AND NEW.itemid < 227000 ) THEN INSERT INTO chartevents_7 VALUES (NEW.*);
ELSIF ( NEW.itemid >= 227000 AND NEW.itemid < 228000 ) THEN INSERT INTO chartevents_8 VALUES (NEW.*);
ELSIF ( NEW.itemid >= 228000 AND NEW.itemid < 229000 ) THEN INSERT INTO chartevents_9 VALUES (NEW.*);
ELSIF ( NEW.itemid >= 229000 AND NEW.itemid < 230000 ) THEN INSERT INTO chartevents_10 VALUES (NEW.*);
ELSE
	INSERT INTO chartevents_null VALUES (NEW.*);
END IF;
RETURN NULL;
END;
$$
LANGUAGE plpgsql;

    CREATE TRIGGER insert_chartevents_trigger
    BEFORE INSERT ON chartevents
    FOR EACH ROW EXECUTE PROCEDURE chartevents_insert_trigger();

--------------------------------------------------------
--  DDL for Table DATETIMEEVENTS
--------------------------------------------------------

DROP TABLE IF EXISTS DATETIMEEVENTS CASCADE;
CREATE TABLE DATETIMEEVENTS
(
	subject_id INT NOT NULL,
	hadm_id INT,
	stay_id INT,
	charttime TIMESTAMP(0) NOT NULL,
	storetime TIMESTAMP(0) NOT NULL,
	itemid INT NOT NULL,
	value TIMESTAMP(0) NOT NULL,
	valueuom VARCHAR(50) NOT NULL,
	warning SMALLINT NOT NULL
) ;


--------------------------------------------------------
--  DDL for Table ICUSTAYS
--------------------------------------------------------

DROP TABLE IF EXISTS ICUSTAYS CASCADE;
CREATE TABLE ICUSTAYS
(
	subject_id INT NOT NULL,
	hadm_id INT NOT NULL,
	stay_id INT NOT NULL,
	first_careunit VARCHAR(50) NOT NULL,
	last_careunit VARCHAR(50) NOT NULL,
	intime TIMESTAMP(0) NOT NULL,
	outtime TIMESTAMP(0),
	los DOUBLE PRECISION,
	CONSTRAINT icustay_stayid_unique UNIQUE (stay_id),
	CONSTRAINT icustay_stayid_unique PRIMARY KEY (stay_id)
) ;

--------------------------------------------------------
--  DDL for Table INPUTEVENTS
--------------------------------------------------------

DROP TABLE IF EXISTS INPUTEVENTS CASCADE;
CREATE TABLE INPUTEVENTS
(
	subject_id INT NOT NULL,
	hadm_id INT NOT NULL,
	stay_id INT NOT NULL,
	starttime TIMESTAMP(0) NOT NULL,
	endtime TIMESTAMP(0) NOT NULL,
	storetime TIMESTAMP(0) NOT NULL,
	itemid INT NOT NULL,
	amount DOUBLE PRECISION NOT NULL,
	amountuom VARCHAR(30) NOT NULL,
	rate DOUBLE PRECISION,
	rateuom VARCHAR(30),
	orderid INT NOT NULL,
	linkorderid INT NOT NULL,
	ordercategoryname VARCHAR(100) NOT NULL,
	secondaryordercategoryname VARCHAR(100),
	ordercomponenttypedescription VARCHAR(200) NOT NULL,
	ordercategorydescription VARCHAR(50) NOT NULL,
	patientweight DOUBLE PRECISION NOT NULL,
	totalamount DOUBLE PRECISION,
	totalamountuom VARCHAR(50),
	isopenbag SMALLINT NOT NULL,
	continueinnextdept SMALLINT NOT NULL,
	cancelreason SMALLINT NOT NULL,
	statusdescription VARCHAR(30) NOT NULL,
	originalamount DOUBLE PRECISION NOT NULL,
	originalrate DOUBLE PRECISION NOT NULL
) ;

--------------------------------------------------------
--  DDL for Table OUTPUTEVENTS
--------------------------------------------------------

DROP TABLE IF EXISTS OUTPUTEVENTS CASCADE;
CREATE TABLE OUTPUTEVENTS
(
	subject_id INT NOT NULL,
	hadm_id INT NOT NULL,
	stay_id INT NOT NULL,
	charttime TIMESTAMP(0) NOT NULL,
	storetime TIMESTAMP(0) NOT NULL,
	itemid INT NOT NULL,
	value DOUBLE PRECISION NOT NULL,
	valueuom VARCHAR(30) NOT NULL
) ;

--------------------------------------------------------
--  DDL for Table PROCEDUREEVENTS
--------------------------------------------------------

DROP TABLE IF EXISTS PROCEDUREEVENTS CASCADE;
CREATE TABLE PROCEDUREEVENTS
(
	subject_id INT NOT NULL,
	hadm_id INT NOT NULL,
	stay_id INT NOT NULL,
	starttime TIMESTAMP(0) NOT NULL,
	endtime TIMESTAMP(0) NOT NULL,
	storetime TIMESTAMP(0) NOT NULL,
	itemid INT NOT NULL,
	value DOUBLE PRECISION NOT NULL,
	valueuom VARCHAR(30) NOT NULL,
	location VARCHAR(30),
	locationcategory VARCHAR(30),
	orderid INT NOT NULL,
	linkorderid INT NOT NULL,
	ordercategoryname VARCHAR(100) NOT NULL,
	secondaryordercategoryname VARCHAR(100),
	ordercategorydescription VARCHAR(50) NOT NULL,
	patientweight DOUBLE PRECISION NOT NULL,
	totalamount DOUBLE PRECISION,
	totalamountuom VARCHAR(50),
	isopenbag SMALLINT NOT NULL,
	continueinnextdept SMALLINT NOT NULL,
	cancelreason SMALLINT NOT NULL,
	statusdescroption VARCHAR(30) NOT NULL,
	comments_date TIMESTAMP(0),
	originalamount DOUBLE PRECISION NOT NULL,
	originalrate DOUBLE PRECISION NOT NULL
) ;

