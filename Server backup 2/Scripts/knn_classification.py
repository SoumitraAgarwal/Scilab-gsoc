# K-Nearest Neighbors (K-NN)
# Classification template

# Importing the libraries
import numpy as np
import pickle
import pandas as pd

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

# Fitting classifier to the Training set
from sklearn.neighbors import KNeighborsClassifier 
classifier = KNeighborsClassifier(parameters)
classifier.fit(X, y)

# Export results to pickle file
pickle.dump(classifier,open(homedir + "/attributes.p", "wb"), protocol = 2 )