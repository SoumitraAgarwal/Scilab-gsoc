# Naive Bayes

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

# Fitting Naive Bayes to the Training set
from sklearn.naive_bayes import GaussianNB
classifier = GaussianNB(parameters)
classifier.fit(X, y)


pickle.dump(classifier,open(homedir + "/attributes.p", "wb"), protocol = 2 )    
