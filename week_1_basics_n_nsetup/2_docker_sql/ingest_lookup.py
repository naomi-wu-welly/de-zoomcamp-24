#!/usr/bin/env python
# coding: utf-8
from time import time
import pandas as pd
from sqlalchemy import create_engine

def main():
    user = 'root'
    password = 'root'
    host = 'localhost'
    port = 5432
    db = 'ny_taxi'
    table_name = 'zones'
    csv_name = 'data/taxi+_zone_lookup.csv'
    engine = create_engine(f'postgresql://{user}:{password}@{host}:{port}/{db}')
    df_zones = pd.read_csv(csv_name)
    t_start = time()
    df_zones.head(n=0).to_sql(name=table_name, con=engine, if_exists='replace')
    df_zones.to_sql(name=table_name, con=engine, if_exists='append')
    t_end = time()
    print('Took %.3f second' %(t_end - t_start))


if __name__ == '__main__':
    main()
