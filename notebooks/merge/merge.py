import dask.dataframe as dd
import pandas as pd
from dask.distributed import Client

currents = dd.read_parquet('/Users/vitorhugo/Desktop/facu.nosync/PER_4/EAM/TPs/main/data/currents_2017_2018.parquet', chunksize=10000)
micro = dd.read_parquet('/Users/vitorhugo/Desktop/facu.nosync/PER_4/EAM/TPs/main/data/microplastic.parquet', chunksize=10000)
micro.time = dd.to_datetime(micro.time, unit='s')
currents.time = dd.to_datetime(currents.time, unit='D', origin=pd.Timestamp('1990-01-01'))
mp_current = dd.merge(micro, currents, on=['time', 'lat', 'lon'])
print("start writing")
mp_current.to_parquet('mp_current.parquet', compute=True)
print("end writing")
# print("start writing - 2")
# filter_mp.to_parquet('mp_current_2018.parquet', compute=True)
# print("end writing - 2")
