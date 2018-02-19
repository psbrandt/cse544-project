# CSE 544 Final Project
> ### Differential Privacy in the OMOP CDM

## Setup

The experiments are done using [Jupyter](http://jupyter.org/) notebooks. Make sure it's installed, and also
install [Jupyter Widgets](https://ipywidgets.readthedocs.io/en/latest/user_install.html):

```
conda install -c conda-forge ipywidgets
```

When you run Jupyter, add the `postgres` user password as an environment variable:

```
PGPASSWORD=s3cr3t jupyter notebook
```

Running Jupyter from this (the `experiments`) directory probably makes the most sense.
