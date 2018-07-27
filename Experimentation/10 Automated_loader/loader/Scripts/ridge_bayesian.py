# Ridge Bayesian Regression
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

# Fitting Simple Linear Regression to the Training set
from sklearn import linear_model
regressor = linear_model.BayesianRidge(parameters)
regressor.fit(X, y)

pickle.dump(regressor, open(homedir + "/attributes.p", "wb"), protocol = 2)