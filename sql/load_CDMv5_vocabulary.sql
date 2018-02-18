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

\COPY concept FROM '/data/vocab/CONCEPT.csv' WITH DELIMITER E'	' CSV HEADER QUOTE E'\b';
\COPY concept_ancestor FROM '/data/vocab/CONCEPT_ANCESTOR.csv' WITH DELIMITER E'	' CSV HEADER QUOTE E'\b';
\COPY concept_class FROM '/data/vocab/CONCEPT_CLASS.csv' WITH DELIMITER E'	' CSV HEADER QUOTE E'\b';
\COPY concept_relationship FROM '/data/vocab/CONCEPT_RELATIONSHIP.csv' WITH DELIMITER E'	' CSV HEADER QUOTE E'\b';
DELETE FROM concept_relationship WHERE invalid_reason is not null;
\COPY concept_synonym FROM '/data/vocab/CONCEPT_SYNONYM.csv' WITH DELIMITER E'	' CSV HEADER QUOTE E'\b';
\COPY domain FROM '/data/vocab/DOMAIN.csv' WITH DELIMITER E'	' CSV HEADER QUOTE E'\b';
\COPY relationship FROM '/data/vocab/RELATIONSHIP.csv' WITH DELIMITER E'	' CSV HEADER QUOTE E'\b';
\COPY vocabulary FROM '/data/vocab/VOCABULARY.csv' WITH DELIMITER E'	' CSV HEADER QUOTE E'\b';
\COPY drug_strength FROM '/data/vocab/DRUG_STRENGTH.csv' WITH DELIMITER E'	' CSV HEADER QUOTE E'\b';
