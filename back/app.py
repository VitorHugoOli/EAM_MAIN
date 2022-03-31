import json

from flask import Flask
from flask import request
from flask_cors import cross_origin
import joblib
import pickle
import xgboost as xgb
import pandas as pd

app = Flask(__name__)


class PredRecive:
    def __init__(self, latitude, longitude, date, microplastic, u, v, ug, vg):
        self.longitude = longitude
        self.latitude = latitude
        self.date = date
        self.microplastic = microplastic
        self.u = u
        self.v = v
        self.ug = ug
        self.vg = vg


def get_ocean(row):
    if (-60 <= row['lat'] <= 69) and (-83 <= row['lon'] <= 20):
        return 'ocean_2'
    elif (-60 <= row['lat'] <= 58) and ((128 <= row['lon'] < 181) or (-180 <= row['lon'] <= -67)):
        return 'ocean_3'
    elif (-60 <= row['lat'] <= 31) and (20 <= row['lon'] <= 146):
        return 'ocean_0'
    elif (51 <= row['lat'] <= 90) and (-180 <= row['lon'] <= 180):
        return 'Artic'
    elif (-85 <= row['lat'] <= -60) and (-180 <= row['lon'] <= 180):
        return 'Southern Ocean'
    elif (30 <= row['lat'] <= 45) and (6 <= row['lon'] <= 36):
        return 'Mediterranean'


@app.route('/prediction', methods=['POST', 'OPTIONS'])
@cross_origin('*')
def hello_world():  # put application's code here
    try:
        data = json.loads(request.data, object_hook=lambda d: PredRecive(**d))

        loaded_model = joblib.load('modelWithOceanCat.pickle')

        ocean_row = {'lat': data.latitude, 'lon': data.longitude}
        selec_ocean = get_ocean(ocean_row)

        ocean_0 = 0
        ocean_1 = 0
        ocean_2 = 0

        if selec_ocean == 'ocean_0':
            ocean_0 = 1
        elif selec_ocean == 'ocean_1':
            ocean_1 = 1
        elif selec_ocean == 'ocean_2':
            ocean_2 = 1

        df = pd.DataFrame([[data.latitude, data.longitude, data.u, data.v, data.ug, data.vg, ocean_0, ocean_1, ocean_2, data.microplastic]],
                          columns=['lat', 'lon', 'u', 'v', 'ug', 'vg', 'ocean_0', 'ocean_1', 'ocean_2', 'num_MP_samples'])

        print(df)

        result = loaded_model.predict(df)

        print(result[0])

        return json.dumps({'mp_microplastic': str(result[0])})
    except Exception as e:
        print(e)
        return 'error', 500


if __name__ == '__main__':
    app.run()
