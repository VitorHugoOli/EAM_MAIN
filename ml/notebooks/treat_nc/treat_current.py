import pandas as pd
import xarray as xr
from os import listdir
from os.path import isfile, join

mypath = '/Users/vitorhugo/Desktop/facu.nosync/PER_4/EAM/TPs/main/data/Sea_surface/'
onlyfiles = [f for f in listdir(mypath) if isfile(join(mypath, f))]

onlyfiles = [f for f in onlyfiles if f.endswith('.nc')]

# add full path to files
onlyfilesfull = [mypath + f for f in onlyfiles]


def concat_and_save(files, year):
    currents = xr.open_mfdataset(files, parallel=True, engine='netcdf4')
    print("End open_mfdataset")
    ddf = currents.to_dask_dataframe()
    print("End to_dask_dataframe")
    df:pd.DataFrame = ddf.dropna().compute()
    print("End dropna")
    df.to_parquet(f'/Users/vitorhugo/Desktop/facu.nosync/PER_4/EAM/TPs/main/data/compact_sea/currents_{year}.parquet')
    print("End to_pickle")


# Separate files by year
init_year = 2017
for i in range(init_year, 2020):
    print(f'Year {i}')
    files = [f for f in onlyfilesfull if str(i) in f]
    concat_and_save(files, i)

# concat_and_save()
