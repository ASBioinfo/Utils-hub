
import matplotlib.pyplot as plt
import pandas as pd

# Load the data from the file into a Pandas DataFrame
df = pd.read_csv("/home/sarwar/abhisek/script/sv.txt")

# Select the two columns to compare
col1 = df["length"]
col2 = df["SV"]

# Create the box plot
fig = plt.figure(figsize=(10, 5))

plt.boxplot([col1, col2], labels=["Column 1", "Column 2"])

plt.xlabel("Column")
plt.ylabel("Values")
plt.title("Box Plot Example")

plt.show()


