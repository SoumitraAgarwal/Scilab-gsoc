// Demo script

pic 	 				= 'attributes.p'
M 						= csvRead('Salary_Data.csv');
M(or(isnan(M),'c'),:) = [];

X 						= M(:, 1)

chdir('..')
toolbox_basedir 		= pwd()
chdir('tests')

getd(toolbox_basedir + '/macros')

machinePredict(pic, X, toolbox_basedir);
