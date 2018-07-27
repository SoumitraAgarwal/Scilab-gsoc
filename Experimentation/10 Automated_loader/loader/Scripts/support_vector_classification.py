
# Importing the libraries
import numpy as np
import pickle

# Importing the dataset
dataset = open(workdata, 'r')
mat 	= dataset.readlines()
time = []
for row in mat:
	pres = row.split()
	pres = [float(ro) for ro in pres]
	time.append(pres)

time = np.array(time)

X = time[:, :-1]
y = time[:, -1]

# Fitting SVR Tto the dataset
# create our regressor
from sklearn import svm
regressor = svm.SVC(parameters)
regressor.fit(X, y) #SINCE PROBLEM is non linear we are using poly or rbf kernel

pickle.dump(regressor ,open(homedir + "/attributes.p", "wb"), protocol = 2 )    