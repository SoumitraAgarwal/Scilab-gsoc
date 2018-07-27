# Decision Tree Classification

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

X_train = time[:, :-1]
y_train = time[:, -1]

# Fitting Decision Tree Classification to the Training set
from sklearn.tree import DecisionTreeClassifier
classifier = DecisionTreeClassifier(parameters)
classifier.fit(X_train, y_train)

pickle.dump(classifier,open(homedir + "/attributes.p", "wb"), protocol = 2 )