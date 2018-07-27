# -*- coding: utf-8 -*-
"""
Created on Mon July 8 23:31:52 2017

@author: Mandar
"""

# Data Preprocessing Template

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


#Fitting mutilpls linear regreesion to training set
from sklearn.linear_model import LinearRegression
regressor = LinearRegression(parameters)
regressor.fit(X, y)


pickle.dump(regressor ,open(homedir + "attributes.p", "wb"), protocol = 2 )