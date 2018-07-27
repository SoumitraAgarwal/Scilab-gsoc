
# Importing the libraries
import numpy as np
import pickle

# Importing the dataset
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

#Fitting dataset to logistic regression
from sklearn.linear_model import LogisticRegression
classifier = LogisticRegression(parameters)
classifier.fit(X, y)

pickle.dump(classifier,open(homedir + "/attributes.p", "wb"), protocol = 2 )    