# Simple Linear Regression
# Importing the libraries
import numpy as np
import pickle

# Importing the dataset
dataset = open(workdir + "/data", 'r')
mat 	= dataset.readlines()
time = []
for row in mat:
	pres = row.split()
	pres = [float(ro) for ro in pres]
	time.append(pres)

time = np.array(time)
X = time

# Fitting Simple Linear Regression to the Training set
model	 	= pickle.load(open(workdir + "/model.p", "rb" ))
y_pred		= model.predict(X)

pickle.dumps(ypred, open(homedir + "/ypred.p", "wb"), protocol = 2)