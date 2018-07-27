# K-Means Clustering

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
X = time

# Using the elbow method to find the optimal number of clusters
from sklearn.cluster import KMeans
kmeans = KMeans(parameters)
kmeans.fit(X)
    

 
# Export the results to pickle file
pickle.dump(kmeans,open(homedir + "/attributes.p", "wb"), protocol = 2 )