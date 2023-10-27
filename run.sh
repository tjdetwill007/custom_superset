#!/bin/bash


(
    source /home/venv/bin/activate
    pip install psycopg2-binary
    export FLASK_APP=superset
    superset run -h 0.0.0.0 -p 8088 --with-threads --reload --debugger  
)