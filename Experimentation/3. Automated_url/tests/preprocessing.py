import pandas as pd
import numpy as np

data = pd.read_csv('Salary_Data.csv')
data = data.values
np.savetxt('data', data)