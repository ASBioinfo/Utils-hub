import folium
import pandas as pd

# Read data from CSV file
df = pd.read_csv('/tmp/fadii.csv')  # Replace 'sampling_sites_data.csv' with your CSV file name

# Create a base map centered around Odisha, India
odisha_map_center = [20.94092, 85.20661]  # Odisha's approximate center coordinates
odisha_map = folium.Map(location=odisha_map_center, zoom_start=7)

# Highlight Odisha on the map
folium.Marker(
    location=odisha_map_center,
    popup='Odisha',
    icon=folium.Icon(color='green')
).add_to(odisha_map)

# Create a map centered around Balasore, Odisha
balasore_map_center = [21.4948, 86.9560]  # Balasore's approximate center coordinates
balasore_map = folium.Map(location=balasore_map_center, zoom_start=12)

# Highlight Balasore on the map
folium.Marker(
    location=balasore_map_center,
    popup='Balasore',
    icon=folium.Icon(color='blue')
).add_to(balasore_map)

# Create a map centered around Bichitrpur, Balasore with a higher zoom level
bichitrpur_map_center = [21.5074, 86.9653]  # Bichitrpur's approximate center coordinates
bichitrpur_map = folium.Map(location=bichitrpur_map_center, zoom_start=15)

# Highlight Bichitrpur on the map
folium.Marker(
    location=bichitrpur_map_center,
    popup='Bichitrpur',
    icon=folium.Icon(color='red')
).add_to(bichitrpur_map)

# Add markers for sampling stations on each map
for index, row in df.iterrows():
    folium.Marker(
        location=[row['Latitude'], row['Longitude']],
        popup=row['Sampling_Sites']
    ).add_to(odisha_map)
    folium.Marker(
        location=[row['Latitude'], row['Longitude']],
        popup=row['Sampling_Sites']
    ).add_to(balasore_map)
    folium.Marker(
        location=[row['Latitude'], row['Longitude']],
        popup=row['Sampling_Sites']
    ).add_to(bichitrpur_map)

# Save maps to HTML files
odisha_map.save('odisha_map.html')
balasore_map.save('balasore_map.html')
bichitrpur_map.save('bichitrpur_map.html')