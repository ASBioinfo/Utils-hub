import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# Load the data from the file into a pandas DataFrame
df = pd.read_table('/home/sarwar/abhisek/script/Fig2b.txt')
sns.set(style="whitegrid")

#df = datasets[0]

f, ax = plt.subplots(figsize=(8, 8))

# Show each distribution with both violins and points
sns.violinplot(x="length",y="SV",data=df, inner="box", palette="rocket", cut=2, linewidth=3 ,scale="width" ,kind="violin")

sns.despine(left=True)

f.suptitle('distribution', fontsize=18, fontweight='bold')
ax.set_xlabel("length",size = 16,alpha=0.7)
ax.set_ylabel("SV",size = 16,alpha=0.7)


plt.show()
