import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# Load the data from the file into a pandas DataFrame
df = pd.read_table('/home/sarwar/abhisek/script/violin_plot.txt')

# Create the violin plot
sns.set(style="darkgrid")

f, ax = plt.subplots(figsize=(8, 8))

sns.violinplot(x='length', y='SV' ,data=df ,scale="width", palette="rocket", kind="violin" , size=6, aspect=.6 )
sns.despine(left=True)


#plt.xlim(-100, 100000)
# Show the plot
plt.show()

