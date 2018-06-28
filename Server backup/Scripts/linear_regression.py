# Simple Linear Regression
# Importing the libraries
import numpy as np
import pickle

# Importing the dataset
dataset = open('/home/soumitra/Working/data', 'r')
mat 	= dataset.readlines()
time = []
for row in mat:
	pres = row.split()
	pres = [float(ro) for ro in pres]
	time.append(pres)

time = np.array(time)
X = time[:, :-1]
y = time[:, 1]

# Splitting the dataset into the Training set and Test set
from sklearn.cross_validation import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size =0.33,random_state = 0)

# Fitting Simple Linear Regression to the Training set
from sklearn.linear_model import LinearRegression
regressor = LinearRegression()
regressor.fit(X_train, y_train)

# Predicting the Test set results
y_pred = regressor.predict(X_test)
coef_ = regressor.coef_
intercept_ = regressor.intercept_ 

# Score of prediction model
from sklearn.metrics import r2_score
score = r2_score(y_test, y_pred)
pickle.dump([y_pred, score, coef_, intercept_], open("/home/soumitra/attributes.p", "wb"), protocol = 2)