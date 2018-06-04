# Scilab-gsoc

Contribution to scilab for google summer of code 2018

## Sub-directories

### Community bonding

Work done during the community bonding period

### Development

Standalone Scilab Machine Learning Toolbox. Sub directories

#### Algorithms

This directory contains macros for machine learning algorithms with their usage

* Linear regression 

  * linearRegressionTrain(x, y) : Parameters x (feature matrix) and y (target vector) and returns [a, b] where they represent the line fit for a*x + b.

  * linearRegressionPredict(x, a, b) : Parameters x (test feature matrix) and [a, b] from linearRegressionTrain() to get predicted vector.

* Polynomial regression
  * PolynomialRegressionTrain(x, y, degree) : Parameters x (feature matrix), y (target vector) and degree of the curve to be fit to return model coefficient cf.

  * PolynomialRegressionPredict(x, cf) : Parameters x (test feature matrix) and cf from PolynomialRegressionTrain() to get predicted vector.

* Logistic regression
  * logisticRegressionTrain(x, y, rate, iter) : Parameters x (feature matrix), y (target vector), rate of learning and number of iterations to return model parameter theta

  * logisticRegressionPredict(x, theta) : Parameters x (test feature matrix) and theta from logisticRegressionTrain() to get predicted vector.

* Kmeans clustering
  * kmeansCluster(x, centres) : Parameters x (feature matrix) and number of centres (clusters) and returns the flag for the category of each data point

* Naive Bayes
  * naiveBayes(x, y) : Parameters x (feature matrix) and y (target vector) and returns the matrix of prior probabilities (of size of unique entries in y) as probMat

  * naiveBayesGaussian(x, y, probMat, xtest) : Parameters x (feature matrix), y (target vector), probMat (from naiveBayes) and xtest (the test matrix) and returns the predicted vector

* Decision Tree
  * decisionTreeFit(x, y) : Parameters x (feature matrix) and y (target vector) and returns [questions, flags] the set of questions (splitting criterion) and flags (leaf node have models)

  * decisionTreePredict(x, questions, flag) : Parameters x (feature matrix), questions and flag from decisionTreeFit() and get the predicted vector. 

#### Preprocessing

This directory contains macros for preprocessing datasets which include the following :

* Scale (Mean 0 and variance 1) 
* Normalize (0-1)
* Train test split

#### Visualisation

This directory contains scripts for plotting different models. The usage can be described as follows :

* visualizeFit(x, y, pred) : visualize the data points and predicted
* visualizeSplit(x, y, flags) : visualize the data points with the colour defined by flags

### Experimentation

Jupyter integration for python libraries availability within Scilab. The flow is explained as (from the scripts in Automated) :

* Script <algorithm.sci> is called from a directory on the local server. This script calls python_local.py.
* Script <python_local.py> clears all already running jupyter kernels and starts a new kernel in a nohup fashion, thus appending the output to nohup.out. After the kernel starts, the script copies the dataset and python script to the server to directory /home/<username>
* Then the script runs the <python_server.py> with the parameters of the running kernel obtained from <python_local.py>. 
* The script <python_server.py> then starts a connection to the kernel and runs the training script with the results stored in <attributes.p>
* Then our process returns back to <python_local.py> which then copies back the <attributes.p> pickle file in protocol 2. 
* Then <algorithm.sci> reads the pickle file and then uses it as and so required.

### Server backup

Files on the GCP server to ensure smooth running of the experimentation scripts