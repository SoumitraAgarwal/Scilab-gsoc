import os
from shutil import copy
import scilab2py

subdirs = ['Algorithms', 'Preprocessing']

for subdir in subdirs:
	macros = os.listdir('Development/' + subdir)
	for macro in macros:
		print(macro)
		files = os.listdir('Development/' + subdir + '/' + macro)
		for file in files:
			if(file[-3:] == 'sce'):
				pres 		= open('Development/' + subdir + '/' + macro + '/' + file, 'a+')
				content		= pres.read()
				pres.truncate()
				pres.close()
				pres 		= open('Development/' + subdir + '/' + macro + '/' + file, 'w+')
				datasets 	= os.listdir('Development/' + subdir + '/' + macro + '/Datasets')
				content 	= content.replace('Datasets/', '')
				content.replace('forestfires.csv','Datasets/forestfires.csv')
				print(content)
				if('weather.csv' in datasets):
					content 	= content.replace('train.csv', 'Datasets/weather.csv')
					content 	= content.replace('Summary of Weather.csv', 'Datasets/weather.csv')

				else:
					content 	= content.replace('train.csv', 'Datasets/titanic.csv')
				pres.write(content)

				pres.close()
				print('Testing ' + file + ' from ' + macro)
				# sci = scilab2py.Scilab2Py()
				# execcomm = '/home/soumitra/Desktop/Study/Projects/GSOC/Scilab-gsoc/Development/' + subdir + '/' + macro + '/' + file
				# sci.exec(execcomm, -1)