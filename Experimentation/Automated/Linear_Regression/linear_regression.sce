pyImport pickle;
py = pyBuiltin();
pyImport numpy;

pyImport os.path
os = os.path;
pyImport time

txt = mgetl('../python_local.py')


// Running python script for connecting to remote Kernel
pyEvalStr(txt)

// path where the pickle file will be saved after training
file_path = "attributes.p";

// waiting for generation and saving of pickle file
while(~os.exists(file_path))
	time.sleep(1)
end

// checking whether file_path addresses the required file
if os.isfile(file_path) then
	attributes = pickle.load(py.open(file_path,"rb"));
else mprintf("%s file does not exist. Please check the file_path.",file_path)
end

// Learned Attributes from the trained models
y_pred = attributes(0)'
score = attributes(1)
coef_ = attributes(2)
intercept_ = attributes(3)

disp(score)