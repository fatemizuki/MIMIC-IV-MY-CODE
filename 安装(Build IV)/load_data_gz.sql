-------------------------------------------
-- from shaou77
-------------------------------------------


\cd datadir
\copy ADMISSIONS FROM PROGRAM 'gzip -dc ADMISSIONS.csv.gz' DELIMITER ',' CSV HEADER NULL ''
\copy PATIENTS from PROGRAM 'gzip -dc patients.csv.gz' delimiter ',' csv header NULL ''
\copy TRANSFERS from PROGRAM 'gzip -dc transfers.csv.gz' delimiter ',' csv header NULL ''
\copy D_HCPCS from PROGRAM 'gzip -dc d_hcpcs.csv.gz' delimiter ',' csv header NULL ''
\copy D_ICD_DIAGNOSES from PROGRAM 'gzip -dc d_icd_diagnoses.csv.gz' delimiter ',' csv header NULL ''
\copy D_ICD_PROCEDURES from PROGRAM 'gzip -dc d_icd_procedures.csv.gz' delimiter ',' csv header NULL ''
\copy D_LABITEMS from PROGRAM 'gzip -dc d_labitems.csv.gz' delimiter ',' csv header NULL ''
\copy DIAGNOSES_ICD from PROGRAM 'gzip -dc diagnoses_icd.csv.gz' delimiter ',' csv header NULL ''
\copy DRGCODES from PROGRAM 'gzip -dc drgcodes.csv.gz' delimiter ',' csv header NULL ''
\copy EMAR_DETAIL from PROGRAM 'gzip -dc emar_detail.csv.gz' delimiter ',' csv header NULL ''
\copy EMAR from PROGRAM 'gzip -dc emar.csv.gz' delimiter ',' csv header NULL ''
\copy HCPCSEVENTS from PROGRAM 'gzip -dc hcpcsevents.csv.gz' delimiter ',' csv header NULL ''
\copy LABEVENTS from PROGRAM 'gzip -dc labevents.csv.gz' delimiter ',' csv header NULL ''
\copy MICROBIOLOGYEVENTS from PROGRAM 'gzip -dc microbiologyevents.csv.gz' delimiter ',' csv header NULL ''
\copy PHARMACY from PROGRAM 'gzip -dc pharmacy.csv.gz' delimiter ',' csv header NULL ''
\copy POE_DETAIL from PROGRAM 'gzip -dc poe_detail.csv.gz' delimiter ',' csv header NULL ''
\copy POE from PROGRAM 'gzip -dc poe.csv.gz' delimiter ',' csv header NULL ''
\copy PRESCRIPTIONS from PROGRAM 'gzip -dc prescriptions.csv.gz' delimiter ',' csv header NULL ''
\copy PROCEDURES_ICD from PROGRAM 'gzip -dc procedures_icd.csv.gz' delimiter ',' csv header NULL ''
\copy SERVICES from PROGRAM 'gzip -dc services.csv.gz' delimiter ',' csv header NULL ''
\copy INPUTEVENTS from PROGRAM 'gzip -dc inputevents.csv.gz' delimiter ',' csv header NULL ''
\copy OUTPUTEVENTS from PROGRAM 'gzip -dc outputevents.csv.gz' delimiter ',' csv header NULL ''
\copy DATETIMEEVENTS from PROGRAM 'gzip -dc datetimeevents.csv.gz' delimiter ',' csv header NULL ''
\copy ICUSTAYS from PROGRAM 'gzip -dc icustays.csv.gz' delimiter ',' csv header NULL ''
\copy CHARTEVENTS from PROGRAM 'gzip -dc chartevents.csv.gz' delimiter ',' csv header NULL ''
\copy D_ITEMS from PROGRAM 'gzip -dc d_items.csv.gz' delimiter ',' csv header NULL ''
\copy PROCEDUREEVENTS from PROGRAM 'gzip -dc procedureevents.csv.gz' delimiter ',' csv header NULL ''
