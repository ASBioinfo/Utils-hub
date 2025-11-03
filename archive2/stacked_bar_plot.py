import matplotlib.pyplot as plt
import numpy as np

Breed = ['Sahiwal', 'Red_sindhi', 'Kankrej', 'Tharparkar', 'Gir']
Syntenic = [563253969, 565678522, 535517359, 503032529, 413340872]
Inversion = [3125028, 5317975, 2298347, 2647949, 2688837]
Translocation = [14915611, 17111694, 35009980, 56227464, 144005419]
Duplications = [1132860, 1360229, 1301825, 1467263, 3826393]
Not_aligned = [44075019, 37917050, 55178141, 69070685, 94807344]

Syntenic = [i/1e9 for i in Syntenic]
Inversion = [i/1e9 for i in Inversion]
Translocation = [i/1e9 for i in Translocation]
Duplications = [i/1e9 for i in Duplications]
Not_aligned = [i/1e9 for i in Not_aligned]

bar_l = np.arange(len(Breed))
bar_width = 0.2

fig, ax = plt.subplots(figsize=(10, 7))
ax.barh(bar_l, Syntenic, bar_width, label='Syntenic', color='blue')
ax.barh(bar_l, Inversion, bar_width, left=Syntenic, label='Inversion', color='red')
ax.barh(bar_l, Translocation, bar_width, left=[Syntenic[i]+Inversion[i] for i in range(5)], label='Translocation', color='purple')
ax.barh(bar_l, Duplications, bar_width, left=[Syntenic[i]+Inversion[i]+Translocation[i] for i in range(5)], label='Duplications', color='green')
ax.barh(bar_l, Not_aligned, bar_width, left=[Syntenic[i]+Inversion[i]+Translocation[i]+Duplications[i] for i in range(5)], label='Not_aligned', color='brown')

ax.set_yticks(bar_l)
ax.set_yticklabels(Breed)
ax.invert_yaxis()

#ax.legend()
ax.set_xlabel('Length (in billions)')

plt.tight_layout()
plt.show()
