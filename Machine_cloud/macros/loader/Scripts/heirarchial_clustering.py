# Hierarchical Clustering

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
X = time

# Fitting Hierarchical Clustering to the dataset
from sklearn.cluster import AgglomerativeClustering
hc = AgglomerativeClustering(parameters)
y_hc = hc.fit_predict(X)

pickle.dump(y_hc ,open(homedir + "/attributes.p", "wb"), protocol = 2 )
