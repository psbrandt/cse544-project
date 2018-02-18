/*********************************************************************************
# Copyright 2016 Observational Health Data Sciences and Informatics
#
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
********************************************************************************/

\COPY CARE_SITE FROM '/data/data/care_site_1.csv' WITH DELIMITER E',' CSV HEADER QUOTE E'\b';
\COPY CONDITION_OCCURRENCE FROM '/data/data/condition_occurrence_1.csv' WITH DELIMITER E',' CSV HEADER QUOTE E'\b';
\COPY DEATH FROM '/data/data/death_1.csv' WITH DELIMITER E',' CSV HEADER QUOTE E'\b';
\COPY DEVICE_COST FROM '/data/data/device_cost_1.csv' WITH DELIMITER E',' CSV HEADER QUOTE E'\b';
\COPY DRUG_COST FROM '/data/data/drug_cost_1.csv' WITH DELIMITER E',' CSV HEADER QUOTE E'\b';
\COPY DRUG_EXPOSURE FROM '/data/data/drug_exposure_1.csv' WITH DELIMITER E',' CSV HEADER QUOTE E'\b';
\COPY DEVICE_EXPOSURE FROM '/data/data/device_exposure_1.csv' WITH DELIMITER E',' CSV HEADER QUOTE E'\b';
\COPY LOCATION FROM '/data/data/location_1.csv' WITH DELIMITER E',' CSV HEADER QUOTE E'\b';
\COPY MEASUREMENT FROM '/data/data/measurement_occurrence_1.csv' WITH DELIMITER E',' CSV HEADER QUOTE E'\b';
\COPY OBSERVATION FROM '/data/data/observation_1.csv' WITH DELIMITER E',' CSV HEADER QUOTE E'\b';
\COPY PERSON FROM '/data/data/person_1.csv' WITH DELIMITER E',' CSV HEADER QUOTE E'\b';
\COPY PROCEDURE_OCCURRENCE FROM '/data/data/procedure_occurrence_1.csv' WITH DELIMITER E',' CSV HEADER QUOTE E'\b';
\COPY PROCEDURE_COST FROM '/data/data/procedure_cost_1.csv' WITH DELIMITER E',' CSV HEADER QUOTE E'\b';
\COPY PROVIDER FROM '/data/data/provider_1.csv' WITH DELIMITER E',' CSV HEADER QUOTE E'\b';
\COPY SPECIMEN FROM '/data/data/specimen_1.csv' WITH DELIMITER E',' CSV HEADER QUOTE E'\b';
\COPY VISIT_COST FROM '/data/data/visit_cost_1.csv' WITH DELIMITER E',' CSV HEADER QUOTE E'\b';
\COPY VISIT_OCCURRENCE FROM '/data/data/visit_occurrence_1.csv' WITH DELIMITER E',' CSV HEADER QUOTE E'\b';
\COPY OBSERVATION_PERIOD FROM '/data/data/observation_period_1.csv' WITH DELIMITER E',' CSV HEADER QUOTE E'\b';
\COPY PAYER_PLAN_PERIOD FROM '/data/data/payer_plan_period_1.csv' WITH DELIMITER E',' CSV HEADER QUOTE E'\b';
