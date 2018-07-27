# Regression Template

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

# Splitting the dataset into the Training set and Test set
"""from sklearn.cross_validation import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, random_state = 0)"""

# Feature Scaling
"""
from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X= sc_X.fit_transform(X)
sc_y = StandardScaler()
y = sc_y.fit_transform(y)"""

# Fitting the Regression Model to the dataset
# Create your regressor here
from sklearn.tree import DecisionTreeRegressor
regressor = DecisionTreeRegressor(parameters)
regressor.fit(X, y)

pickle.dump(regressor,open(homedir + "/attributes.p", "wb"), protocol = 2 )