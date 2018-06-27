import os
import matplotlib.pyplot as plt

file 	= open('Linear_Regression/TimeMatrix', 'r')
mat 	= file.readlines()
time = []
for row in mat:
	pres = row.split()
	pres = [float(ro) for ro in pres]
	time.append(pres)

x = range(len(time[0]))
i = 1
for row in time:
	plt.plot(x, row, label = 'Divisions ' + str(i))
	i += 1

plt.legend()
plt.show()