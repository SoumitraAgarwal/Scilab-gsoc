
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

# Fitting SVR Tto the dataset
# create our regressor
from sklearn.svm import SVR
regressor = SVR(parameters)
regressor.fit(X, y) #SINCE PROBLEM is non linear we are using poly or rbf kernel



#predicting a new result with Polynomial Regression
y_pred = sc_y.inverse_transform(regressor.predict(sc_X.transform(np.array([6.5])))) # since the regressor is feature scaled so we also need to feature scale 6.5
# now to get the real value of y_pred we need to inverse the scaler transform on y_pred

pickle.dump(regressor ,open("/home/soumitra/attributes.p", "wb"), protocol = 2 )    