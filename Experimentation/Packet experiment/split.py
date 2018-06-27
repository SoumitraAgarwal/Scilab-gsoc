import os
import sys
import pandas as pd

numfile = range(1,11)
for numfiles in numfile:
	os.mkdir('Linear_Regression/DataSnippets' + str(numfiles))
	data = pd.read_csv('Linear_Regression/Salary_Data.csv')
	dataSize = len(data)
	for i in range(numfiles):
		temp = data.iloc[i*dataSize/numfiles: (i + 1)*dataSize/numfiles, :]
		print(numfiles)
		temp.to_csv('Linear_Regression/DataSnippets' + str(numfiles) + '/' + str(i) + '.csv', index = False)