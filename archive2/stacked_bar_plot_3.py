import matplotlib.pyplot as plt

breeds = ['Sahiwal', 'Red_sindhi', 'Kankrej', 'Tharparkar', 'Gir']
syntenic = [563253969, 565678522, 535517359, 503032529, 413340872]
translocation = [14915611, 17111694, 35009980, 56227464, 144005419]
inversion = [3125028, 5317975, 2298345, 2647949, 2688837]
duplication_loss = [1132860, 1360229, 1301825, 1467263, 3826393]
ref_specific = [44075019, 37917050, 55178141, 69070685, 94807344]

min_syntenic = min(syntenic) * 0.6
syntenic = [max(i-min_syntenic, 0) for i in syntenic]

x = range(len(breeds))
fig, ax = plt.subplots()
ax.barh(x, syntenic, color='b')
ax.barh(x, translocation, left=syntenic, color='g')
ax.barh(x, inversion, left=[i+j for i,j in zip(syntenic, translocation)], color='r')
ax.barh(x, duplication_loss, left=[i+j+k for i,j,k in zip(syntenic, translocation, inversion)], color='y')
ax.barh(x, ref_specific, left=[i+j+k+l for i,j,k,l in zip(syntenic, translocation, inversion, duplication_loss)], color='purple')
plt.yticks(x, breeds)
plt.xlabel('Length (mbp)')
#plt.legend(['Syntenic', 'Translocation', 'Inversion', 'Duplication loss', 'Ref. specific'])
plt.show()
