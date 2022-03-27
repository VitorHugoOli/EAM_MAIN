import xarray as xr
from os import listdir
from os.path import isfile, join

mypath = '/Users/vitorhugo/Desktop/facu.nosync/PER_4/EAM/TPs/main/data/Sea_surface/'
onlyfiles = [f for f in listdir(mypath) if isfile(join(mypath, f))]
onlyfiles = [f for f in onlyfiles if f.endswith('.nc')]
onlyfilesfull = [mypath + f for f in onlyfiles]
onlyfiles2017 = [f for f in onlyfilesfull if ('2017' in f) or ('2018' in f)]
currents = xr.open_mfdataset(onlyfiles2017, engine='netcdf4')
print("End of loading")
ddf = currents.to_dataframe()
print("End of converting to dataframe")
ddf.dropna(inplace=True)
print("End of dropping na")
ddf.to_parquet('currents_2017_2018.parquet')
print("End of saving")
