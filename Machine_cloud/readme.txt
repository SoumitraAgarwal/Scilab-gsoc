README : Machine Learning toolbox
====================================

Description
------------------------------------

This toolbox has a collection off functions that help you register and use pre-written python scripts or your custom machine learning scripts on the cloud. It work after installing some pre-requisite scripts onto your user on the server, adding your key to the metadata for the server and installing the dependencies (PIMS) onto your machine. One can then use the cloud for a machine lerning experience on the fly. The pre-installed scripts are :

decision_tree_classification.py
decision_tree_regression.py
heirarchial_clustering.py
kmeans_clustering.py
knn_classification.py
linear_regression.py
logistic_regression.py
multiple_linear_regression.py
naive_bayes_GaussianNB.py
naive_bayes_MultinomialNB.py
principal_component_analysis.py
random_forest_classification.py
support_vector_regression.py

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

3. machineLearn(modelName, data, username, ip, password, toolbox_dir)

The machine learn command is the most basic command and requires the user to write down the
model to use, the data matrix in the required form and the username, ip and password.

	- input modelName is the name of the pre-defined model you want to train (refer server scripts)
	- input data is a data matrix in the pre-defined format
	- input username is your username on the server machine
	- input password is your password you used at time of registeration (or changed hence)
	- input ip is the server ip
	- input toolbox_dir is the directory of the toolbox

	- output is the status of your training with the attributes file copied to your runtime directory

------------------------------------

4. machineLearnURL(modelName, url, preprocessing, username, ip, password, toolbox_dir)

This command enables you to download the dataset directly onto the server. You need to write down
a preprocessing script in this case which outputs the dataset into the required format

	- input modelName is the name of the pre-defined model you want to train (refer server scripts)
	- input url is a url of your dataset
	- input preprocessing is the name of the script that converts the ddataset into the pre-defined format
	- input username is your username on the server machine
	- input password is your password you used at time of registeration (or changed hence)
	- input ip is the server ip
	- input toolbox_dir is the directory of the toolbox

	- output is the status of your training with the attributes file copied to your runtime directory

------------------------------------

5. machineLearnCustom(script, data, username, ip, password, toolbox_dir)

This command is to be used when you want to run a custom script on the server. The inputs to this
are the script, data, username, ip, password. The script is the python script stored with the name
(without the extension).

	- input script is the name of the script you want to train (refer server scripts)
	- input data is a the name of your dataset
	- input username is your username on the server machine
	- input password is your password you used at time of registeration (or changed hence)
	- input ip is the server ip
	- input toolbox_dir is the directory of the toolbox

	- output is the status of your training with the attributes file copied to your runtime directory


------------------------------------

6. machineLearnCustomURL(script, url, preprocessing, username, ip, password, toolbox_dir)

This command is the equivalent of machineLearnURL with a custom script in place. The inputs are the
custom script, data url, preprocessing script, userrname, ip, password.

	- input script is the name of the script you want to train (refer server scripts)
	- input url is a url of your dataset
	- input preprocessing is the name of the script that converts the ddataset into the pre-defined format
	- input username is your username on the server machine
	- input password is your password you used at time of registeration (or changed hence)
	- input ip is the server ip
	- input toolbox_dir is the directory of the toolbox

	- output is the status of your training with the attributes file copied to your runtime directory

------------------------------------
====================================

Server scripts
------------------------------------

Each of the following bullets defines the input format to the pre-defined scripts and how each attributes file is packed

------------------------------------

1. decision_tree_classification.py

	Input format : 

	- Last but one colums represent the feature matrix X
	- Last column represents the target Y

	Attributes file :

	The attributes file is a list of the following in order :

	- predicted y value of a test split
	- confusion matrix
	- classifier feature importances 
	- classifier classes 
	- classifier max features 
	- classifier n features
	- classifier n classes 
	- classifier n_outputs
	- classifier tree

(refer sklearn documentation for usage)

------------------------------------

2. decision_tree_regression.py

	Input format : 

	- Last but one colums represent the feature matrix X
	- Last column represents the target Y

	Attributes file :

	The attributes file is a list of the following in order :

	- predicted y value of a test split
	- confusion matrix
	- regressor feature importances 
	- regressor classes 
	- regressor max features 
	- regressor n features
	- regressor n classes 
	- regressor n_outputs
	- regressor tree

(refer sklearn documentation for usage)
------------------------------------

3. heirarchial_clustering.py
	
	Input format : 

	- The complete matrix represents the feature matrix X

	Attributes file :

	The attributes file is a list of the following in order :

	- predicted y value of a test split
	- heirarchial labels
	- heirarchial  n leaver
	- heirarchial n components

(refer sklearn documentation for usage)
------------------------------------
4. kmeans_clustering.py

	Input format : 

	- The complete matrix represents the feature matrix X

	Attributes file :

	The attributes file is a list of the following in order :

	- predicted y value of a test split
	- kmeans centres
	- kmeans inertia

(refer sklearn documentation for usage)
------------------------------------
5. knn_classification.py
	
	Input format : 

	- Last but one colums represent the feature matrix X
	- Last column represents the target Y

	Attributes file :

	- The classifier (use classifier.predict in python later)

------------------------------------
6. linear_regression.py

	Input format : 

	- Last but one colums represent the feature matrix X
	- Last column represents the target Y

	Attributes file :

	The attributes file is a list of the following in order :

	- predicted y value of a test split
	- confusion matrix
	- regressor feature importances 
	- regressor classes 
	- regressor max features 
	- regressor n features
	- regressor n classes 
	- regressor n_outputs
	- regressor tree

(refer sklearn documentation for usage)
------------------------------------
7. logistic_regression.py

	Input format : 

	- Last but one colums represent the feature matrix X
	- Last column represents the target Y

	Attributes file :

	The attributes file is a list of the following in order :

	- predicted y value of a test split
	- regressor coefficient
	- regressor intercept
	- regressor iterations

(refer sklearn documentation for usage)
------------------------------------
8. multiple_linear_regression.py

	Input format : 

	- Last but one colums represent the feature matrix X
	- Last column represents the target Y

	Attributes file :

	The attributes file is a list of the following in order :

	- predicted y value of a test split
	- regressor coefficient
	- regressor residues
	- regressor intercept

(refer sklearn documentation for usage)
------------------------------------
9. naive_bayes_GaussianNB.py

	Input format : 

	- Last but one colums represent the feature matrix X
	- Last column represents the target Y

	Attributes file :

	The attributes file is a list of the following in order :

	- predicted y value of a test split
	- confusion matrix
	- prior
	- count
	- theta
	- sigma

(refer sklearn documentation for usage)
------------------------------------
10. naive_bayes_MultinomialNB.py

	Input format : 

	- Last but one colums represent the feature matrix X
	- Last column represents the target Y

	Attributes file :

	The attributes file is a list of the following in order :

	- model (use model.predict)

(refer sklearn documentation for usage)
------------------------------------
11. principal_component_analysis.py


	Input format : 

	- Last but one colums represent the feature matrix X
	- Last column represents the target Y

	Attributes file :

	The attributes file is a list of the following in order :

	- model

(refer sklearn documentation for usage)
------------------------------------
12. random_forest_classification.py


	Input format : 

	- Last but one colums represent the feature matrix X
	- Last column represents the target Y

	Attributes file :

	The attributes file is a list of the following in order :

	- classifier (use classifier.predict)

------------------------------------
13. support_vector_regression.py

	Input format : 

	- Last but one colums represent the feature matrix X
	- Last column represents the target Y

	Attributes file :

	The attributes file is a list of the following in order :

	- model (use model.predict)

(refer sklearn documentation for usage)
------------------------------------
