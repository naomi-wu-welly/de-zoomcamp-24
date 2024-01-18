FROM python:3.9.1

# Install required Python packages
RUN pip install pandas sqlalchemy psycopg2 requests pyarrow fastparquet

WORKDIR /app
COPY ingest_data.py ingest_data.py 

ENTRYPOINT [ "python", "ingest_data.py" ]
