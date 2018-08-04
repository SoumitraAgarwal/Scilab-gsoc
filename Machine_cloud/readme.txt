README : Machine Learning toolbox
====================================

Description
------------------------------------

This toolbox has a collection off functions that help you register and use pre-written python scripts or your custom machine learning scripts on the cloud. It work after installing some pre-requisite scripts onto your user on the server, adding your key to the metadata for the server and installing the dependencies (PIMS) onto your machine. One can then use the cloud for a machine lerning experience on the fly. The pre-installed scripts are :

binarize
decision_tree_classification
decision_tree_regression
function_transform
heirarchial_clustering
impute
incremental_PCA
kernel_PCA
kmeans_clustering
knn_classification
lass_LARS
lasso_regression
linear_regression
logistic_regression
min_max_scale
multiple_linear_regression
naive_bayes_GaussianNB
naive_bayes_MultinomialNB
nearest_centroid
nearest_neighbours
normalize
one_hot_encode
PCA
polynomial_features
preceptron_learning
predictor
principal_component_analysis
quantile_transform
random_forest_classification
ridge_bayesian
ridge_cross_validation
ridge_regression
scale
stochastic_gradient_descent
support_vector_classification
support_vector_linear_svc
support_vector_regression

Each of these scripts has a pre-defined data format that you need to give as input, and a pre-defined output format which is saved as attributes.p onto your local machine.

====================================

Usage
------------------------------------

The following section describes the usage of each function in the main macro in the toolbox 

1. register(username, password, ip, toolbox_basedir) : 

	- input username is your username on the server machine
	- input password is the password you want to set at time of registration
	- input ip is the server ip you want to register at
	- input toolbox_basedir is the directory of the toolbox

	- output is the status of your registration

------------------------------------

2. passwordChange(username, oldpassword, newpassword, ip, toolbox_basedir)

	- input username is your username on the server machine
	- input oldpassword is the password you have currently
	- input newpassword is the password you want to set
	- input ip is the server ip
	- input toolbox_basedir is the directory of the toolbox

	- output is the status of your password change

------------------------------------

3. machineLearn(modelName, data, toolbox_basedir, parameters)

The machine learn command is the most basic command and requires the user to write down the
model to use, the data matrix in the required form and the parameters

	- input modelName is the name of the pre-defined model you want to train (refer server scripts)
	- input data is a data matrix in the pre-defined format
	- input toolbox_dir is the directory of the toolbox
	- input parameters is the set of parameters given to the scikit learn function in string

	- output is the status of your training with the attributes file copied to your runtime directory

------------------------------------

4. machineLearnURL(modelName, preprocessing, toolbox_basedir, parameters)

This command enables you to download the dataset directly onto the server. You need to write down a preprocessing script in this case which outputs the dataset into the required format

	- input modelName is the name of the pre-defined model you want to train (refer server scripts)
	- input preprocessing is the name of the script that converts the ddataset into the pre-defined format
	- input toolbox_dir is the directory of the toolbox
	- input parameters is the set of parameters given to the scikit learn function in string

	- output is the status of your training with the attributes file copied to your runtime directory

(make sure you have downloaded the dataset using 7. machineLearnURLDownload())
------------------------------------

5. machineLearnCustom(script, data, username, ip, password, toolbox_dir)

This command is to be used when you want to run a custom script on the server. The inputs to this are the script, data and the toolbox_dir. The script is the python script stored with the name (without the extension).

	- input script is the name of the script you want to train (refer server scripts)
	- input data is a the name of your dataset
	- input toolbox_dir is the directory of the toolbox

	- output is the status of your training with the attributes file copied to your runtime directory


------------------------------------

6. machineLearnCustomURL(script, url, preprocessing, username, ip, password, toolbox_dir)

This command is the equivalent of machineLearnURL with a custom script in place. The inputs are the custom script, preprocessing script and the toolbox_dir.

	- input script is the name of the script you want to train (refer server scripts)
	- input preprocessing is the name of the script that converts the ddataset into the pre-defined format
	- input toolbox_dir is the directory of the toolbox

	- output is the status of your training with the attributes file copied to your runtime directory

(make sure you have downloaded the dataset using 7. machineLearnURLDownload())

------------------------------------

7. machineLearnURLDownload(url, toolbox_basedir)

This command is used to download a dataset onto the server which is later used in 4, 6. The inputs are the url and the toolbox_dir.

	- input url is the url where the data is saved
	- input toolbox_dir is the directory of the toolbox

	- output is the status of the download

------------------------------------

8. loader(toolbox_basedir)

This command, essentially a utility command is used on initialization. This loads all the required scripts onto the server with other reuqired flow scripts.

	- input toolbox_dir is the directory of the toolbox

	- output is the status of the load

------------------------------------

9. machinePredict(pic, data, toolbox_basedir)

This command is used to test a model on a feature set or get the prediction. The inputs are pic, data and toolbox_basedir.

	- input pic is the name of the pickle file created using the training functions
	- input data is the packed feature set
	- input toolbox_basedirdir is the directory of the toolbox

	- output is the status of the prediction

====================================

Server scripts
------------------------------------

Each of the following bullets defines the input format to the pre-defined scripts and how each attributes file is packed

------------------------------------

- The input to each learning file is the dataset packed in (X,y) format where X is the feature set and y is the target
- The input to each of the preprocessing script is just X

- The output of each of the learning script is a pickle file which has the model (completed using the fit/fit_transform function)
- The output of each of the preprocessing script is a pickle file with the processed dataset as instructed

(refer sklearn documentation for usage)
------------------------------------
====================================

Examples

Linear regression from scratch using the cloud mechanism
-------------------------

M = csvRead(<Name of your dataset>)
M(or(isnan(M),'c'),:) = []

data 					= M
toolbox_basedir 		= <Toolbox directory>
model_name 				= <Name of the server model> (like 'linear_regression' here)
parameters 				= <Set of parameters> (like 'fit_intercept=False')

machineLearn(model_name, data, toolbox_basedir, parameters)

----------------------------------

PCA from scratch using the cloud machanism
----------------------------------

M = csvRead(<Name of your dataset>)
M(or(isnan(M),'c'),:) = []

X 						= M(:,<column range for features>)
data 					= X
toolbox_basedir 		= <Toolbox directory>
model_name 				= <Name of the server model> (like 'PCA' here)
parameters 				= <Set of parameters> (like 'n_components=5, copy=False')

machineLearn(model_name, data, toolbox_basedir, parameters)
----------------------------------

These examples store the required pickle file in the same directory as the script

======================================

One can run this toolbox on any cloud computing suite as long as the following steps are followed prior to it:

1. Install anaconda on the server (or alternatively numpy, pandas and scikit-learn)
2. Add the public key to the metadata of the server
3. Run the loader function (as stated above)
4. Run the register function 

This was tested on a Google Cloud Platform machine
---------------------------------------