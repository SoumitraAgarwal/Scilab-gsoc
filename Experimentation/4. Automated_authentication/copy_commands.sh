export PATH="/home/soumitra/anaconda3/bin:$PATH"
rm attributes.p
cd Working
rm -rf *.csv
wget https://raw.githubusercontent.com/franklinwillemen/Machine_Learning/master/Regression/Simple_Linear_Regression/Salary_Data.csv
cd
cd $(jupyter --runtime-dir)
ls