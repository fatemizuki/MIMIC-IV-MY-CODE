-- -------------------------------------------------------------------------------
--
-- Load data into the MIMIC-IV
-- Adapted from https://github.com/MIT-LCP/mimic-code/blob/master/buildmimic/postgres/postgres_load_data.sql
--
-- -------------------------------------------------------------------------------


--------------------------------------------------------
--  Load Data for Table ADMISSIONS
--------------------------------------------------------

\copy ADMISSIONS FROM 'admissions.csv' DELIMITER ',' CSV HEADER NULL ''

--------------------------------------------------------
--  Load Data for Table PATIENTS
--------------------------------------------------------

\copy PATIENTS from 'patients.csv' delimiter ',' csv header NULL ''

--------------------------------------------------------
--  Load Data for Table TRANSFERS
--------------------------------------------------------

\copy TRANSFERS from 'transfers.csv' delimiter ',' csv header NULL ''

--------------------------------------------------------
--  Load Data for Table D_HCPCS
--------------------------------------------------------

\copy D_HCPCS from 'd_hcpcs.csv' delimiter ',' csv header NULL ''

--------------------------------------------------------
--  Load Data for Table D_ICD_DIAGNOSES
--------------------------------------------------------

\copy D_ICD_DIAGNOSES from 'd_icd_diagnoses.csv' delimiter ',' csv header NULL ''

--------------------------------------------------------
--  Load Data for Table D_ICD_PROCEDURES
--------------------------------------------------------

\copy  D_ICD_PROCEDURES from 'd_icd_procedures.csv' delimiter ',' csv header NULL ''

--------------------------------------------------------
--  Load Data for Table D_LABITEMS
--------------------------------------------------------

\copy  D_LABITEMS from 'd_labitems.csv' delimiter ',' csv header NULL ''

--------------------------------------------------------
--  Load Data for Table DIAGNOSES_ICD
--------------------------------------------------------

\copy DIAGNOSES_ICD from 'diagnoses_icd.csv' delimiter ',' csv header NULL ''

--------------------------------------------------------
--  Load Data for Table DRGCODES
--------------------------------------------------------

\copy DRGCODES from 'drgcodes.csv' delimiter ',' csv header NULL ''

--------------------------------------------------------
--  Load Data for Table EMAR_DETAIL
--------------------------------------------------------

\copy EMAR_DETAIL from 'emar_detail.csv' delimiter ',' csv header NULL ''

--------------------------------------------------------
--  Load Data for Table EMAR
--------------------------------------------------------

\copy EMAR from 'emar.csv' delimiter ',' csv header NULL ''

--------------------------------------------------------
--  Load Data for Table HCPCSEVENTS
--------------------------------------------------------

\copy HCPCSEVENTS from 'hcpcsevents.csv' delimiter ',' csv header NULL ''

--------------------------------------------------------
--  Load Data for Table LABEVENTS
--------------------------------------------------------

\copy LABEVENTS from 'labevents.csv' delimiter ',' csv header NULL ''

--------------------------------------------------------
--  Load Data for Table MICROBIOLOGYEVENTS
--------------------------------------------------------

\copy MICROBIOLOGYEVENTS from 'microbiologyevents.csv' delimiter ',' csv header NULL ''

--------------------------------------------------------
--  Load Data for Table PHARMACY
--------------------------------------------------------

\copy PHARMACY from 'pharmacy.csv' delimiter ',' csv header NULL ''

--------------------------------------------------------
--  Load Data for Table POE_DETAIL
--------------------------------------------------------

\copy POE_DETAIL from 'poe_detail.csv' delimiter ',' csv header NULL ''

--------------------------------------------------------
--  Load Data for Table POE
--------------------------------------------------------

\copy POE from 'poe.csv' delimiter ',' csv header NULL ''

--------------------------------------------------------
--  Load Data for Table PRESCRIPTIONS
--------------------------------------------------------

\copy PRESCRIPTIONS from 'prescriptions.csv' delimiter ',' csv header NULL ''

--------------------------------------------------------
--  Load Data for Table PROCEDURES_ICD
--------------------------------------------------------

\copy PROCEDURES_ICD from 'procedures_icd.csv' delimiter ',' csv header NULL ''

--------------------------------------------------------
--  Load Data for Table SERVICES
--------------------------------------------------------

\copy SERVICES from 'services.csv' delimiter ',' csv header NULL ''

--------------------------------------------------------
--  Load Data for Table INPUTEVENTS
--------------------------------------------------------

\copy INPUTEVENTS from 'inputevents.csv' delimiter ',' csv header NULL ''

--------------------------------------------------------
--  Load Data for Table OUTPUTEVENTS
--------------------------------------------------------

\copy OUTPUTEVENTS from 'outputevents.csv' delimiter ',' csv header NULL ''

--------------------------------------------------------
--  Load Data for Table DATETIMEEVENTS
--------------------------------------------------------

\copy DATETIMEEVENTS from 'datetimeevents.csv' delimiter ',' csv header NULL ''

--------------------------------------------------------
--  Load Data for Table ICUSTAYS
--------------------------------------------------------

\copy ICUSTAYS from 'icustays.csv' delimiter ',' csv header NULL ''

--------------------------------------------------------
--  Load Data for Table CHARTEVENTS
--------------------------------------------------------

\copy CHARTEVENTS from 'chartevents.csv' delimiter ',' csv header NULL ''

--------------------------------------------------------
--  Load Data for Table D_ITEMS
--------------------------------------------------------

\copy D_ITEMS from 'd_items.csv' delimiter ',' csv header NULL ''

--------------------------------------------------------
--  Load Data for Table PROCEDUREEVENTS
--------------------------------------------------------

\copy PROCEDUREEVENTS from 'procedureevents.csv' delimiter ',' csv header NULL ''
