FROM metabase/metabase:v0.39.2

LABEL Author="Airton Lira <airtonlirajr@gmail.com>"

RUN cd /plugins && wget "https://github.com/fhsgoncalves/metabase-sparksql-databricks-driver/releases/download/1.0.0/sparksql-databricks.metabase-driver.jar"

ENTRYPOINT ["./app/run_metabase.sh" ]