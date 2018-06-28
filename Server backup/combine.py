import pandas as pd
import os

files 		= os.listdir('DataSnippets')
mainData 	= pd.read_csv('DataSnippets/' + files[0])
toAdd 		= len(files)
for i in range(1, toAdd):
	mainData = pd.concat([mainData, pd.read_csv('DataSnippets/' + files[i])])

mainData.to_csv('Shared/Salary_Data.csv')