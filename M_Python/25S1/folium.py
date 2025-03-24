import time
import random
import pyspark
import tqdm
import folium
import numba
import webbrowser


# def add(b, c):
#     a = b + c
#     return a
#
# print(add(92,12))

m = folium.Map(location  = [32.6875, 118.9997], zoom_start= 12)
folium.Marker(
    location  = [32.6875, 118.9997],
    popup = 'Tianchang City\n企业数：28000\n百强城市排名: 66',
    icon = folium.Icon(color="blue", icon="cloud")
).add_to(m)

m.save("tianchang_map.html")

print("地图已生成，请在浏览器中打开 tianchang_map.html")
