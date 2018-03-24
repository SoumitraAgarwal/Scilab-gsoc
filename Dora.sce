// Importing necessary python libraries 
pyImport pandas
pyImport Dora

dora 	= Dora()
pd 		= pandas;
df 		= pd.DataFrame([1, 2, 100,2, 200,1, 6, 5])
dora 	= dora.Dora(output = 0, data = df)
disp(dora.logs)