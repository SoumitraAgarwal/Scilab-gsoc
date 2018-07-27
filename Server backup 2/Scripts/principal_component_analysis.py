# PCA

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
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


# Applying PCA
from sklearn.decomposition import PCA
pca = PCA(parameters)
X = pca.fit_transform(X)


pickle.dump(X ,open("/home/soumitra/attributes.p", "wb"), protocol = 2 )