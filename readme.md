# CSE 544 Final Project
> ### Differential Privacy in the OMOP CDM

## Setup

A lot of the following is based off [these instructions](https://github.com/OHDSI/ETL-CMS/blob/master/python_etl/README.md), and most
of the SQL comes from [here](https://github.com/OHDSI/ETL-CMS/tree/master/SQL).

### Prerequisites

#### PostgreSQL

Make sure you have [PostgreSQL](https://www.postgresql.org/download/) installed and running somewhere. I used the following to spin it up in Docker:

```
docker create volume cse544-project
docker run --name cse544-project -p 5432:5432 -v ${PWD}:/data -v cse544-project:/var/lib/postgresql/data -e POSTGRES_PASSWORD=postgres -d postgres:10.1-alpine
```

#### Data 

Download the 20% of [SynPUF](https://www.cms.gov/Research-Statistics-Data-and-Systems/Downloadable-Public-Use-Files/SynPUFs/DE_Syn_PUF.html) dataset [here](ftp://ftp.ohdsi.org/synpuf/1.0.1/synpuf_1.zip) (~113k patients, 920MB compressed) and extract the CSV files into the `data` directory:

```
wget ftp://ftp.ohdsi.org/synpuf/1.0.1/synpuf_1.zip
unzip synpuf_1.zip -d data
```

Note we are using SynPUF `v1.0.1`.

#### Metadata

Download the vocabularies (shortcut shown after manual way).

#### Manual Way

Following step 3 [here](https://github.com/OHDSI/ETL-CMS/blob/master/python_etl/README.md#3-download-cdmv5-vocabulary-files):

[Register](http://athena.ohdsi.org/auth/register) at [athena.ohdsi.org](http://athena.ohdsi.org). Note
that if your password doesn't meet the following requirements, the site will just fail silently:

* Password must be at least 10 characters in length
* Password must contain at least 1 uppercase characters
* Password must contain at least 1 digit characters
* ~~Password must contain at least 1 non-alphanumeric characters~~

I tried to use <kbd>&</kbd> and it fell over. It only worked when I _removed_ all non-alphanumeric characters 🤦🏻‍️.

Then, go to [**Download**](http://athena.ohdsi.org/vocabulary/list) and select only the first 8 vocabularies,
excluding #7 (NDFT) and get the ZIP file. Or bypass their "security" and download the ZIP file
I already assembled using the link below.

#### ☝🏼 Miss me with that noise

```
wget -O vocab.zip http://athena.ohdsi.org/api/v1/vocabularies/zip/24c823f7-2e79-4a51-abd6-315c945aa098
```

#### Prepare Vocabularies

Whichever way you got the ZIP file, extract it into `vocab` directory:

```
unzip vocab.zip -d vocab
```

We also have to manually merge the CPT codes into `CONCEPT.csv`:

```
cd vocab
java -jar cpt4.jar 5
```

### Loading data

For simplicty, we'll do everything in a new database called `cdm`, and we'll use the `public` schema to
avoid having to prefix every table with the schema name every time. We will also use the `postgres` (admin) user
so we don't have to grant permissions.

#### Create Schema

Drop into the Postgres shell:

```
psql -U postgres -h localhost
```

Create the database:

```
create database cdm;
```

Connect to the new database:

```
\c cdm;
```

Create the tables:

```
\i /data/sql/create_CDMv5_tables.sql
```

:bulb: You will likely have to change the path to the SQL file.

#### Load Vocabularies

Edit the [`load_CDMv5_vocabulary.sql`](sql/load_CDMv5_vocabulary.sql) file so that it contains the correct abolute paths to your CSV files, then:

```
\i /data/sql/load_CDMv5_vocabulary.sql
```

This will take a few minutes.

:bulb: You will likely have to change the path to the SQL file.

#### Load Data

Edit the [`load_CDMv5_synpuf.sql`](sql/load_CDMv5_synpuf.sql) file so that it contains the correct abolute paths to your CSV files, then:


```
\i /data/sql/load_CDMv5_synpuf.sql
```

This will take a few minutes.

:bulb: You will likely have to change the path to the SQL file.

#### Create Constraints & Indices

Run the following two scripts to create the contraints and indices:

```
\i /data/sql/create_CDMv5_constraints.sql
```

and

```
\i /data/sql/create_CDMv5_indices.sql
```

This takes a while, and there are some errors that I'm ignoring for now.

:bulb: You will likely have to change the path to the SQL files.

#### ERA Tables

There is a section [here](https://github.com/OHDSI/ETL-CMS/blob/master/python_etl/README.md#8-create-era-tables) about creating
more tables, but that probably isn't necessary for now.
