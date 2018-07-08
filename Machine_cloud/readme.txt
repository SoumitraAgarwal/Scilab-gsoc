README : Machine Learning toolbox
====================================

Description
------------------------------------

This toolbox tries to bring all machine learning features in one place for Scilab. This does not have any dependencies and thus is named the 'Standalone Machine Learning Toolbox'. To use the toolbox one needs to call the dependent function from the macro. Each macro is named as the algorithm/preprocessing it covers. The usage can be understood from demos which are titled (<algorithm>_Demo(<number>).sce)

====================================

Usage
------------------------------------

The following section describes the usage of each Macro in the toolbox 

1. hotEncode(x) : 

	- input x is a column vector of strings without blanks
	- output is a matrix of 0s and 1s with each column as an indicator to a set of values in x

------------------------------------

2. affinityCluster(x, centres, iterations)

	- input x is a matrix with each row corresponding to each data entry
	- input centres is the number of desired clusters
	- input iterations correspond to the number of iterations performed to optimize the cluster
	- output is a vector of flags (0, 1, 2, ... centres - 1) corresponding to family of each data point

------------------------------------

3. binarize(x)

	- input x is a column vector of real values without blanks
	- output is a column vector threshold to 0/1 (i.e. binarised)

------------------------------------

4. rebalanceOver(x, y)

	- input x corresponds to feature matrix without blanks
	- input y corresponds to target vector without blanks (and imbalanced classes)
	- output [x, y] corresponds to class rebalanced matrices via random oversampling 
------------------------------------

5. rebalanceCluster(x, y)

	- input x corresponds to feature matrix without blanks
	- input y corresponds to target vector without blanks (and imbalanced classes)
	- output [x, y] corresponds to class rebalanced matrices via clustered oversampling

------------------------------------

6. decisionTreeFit(x, y)

	- input x corresponds to feature matrix without blanks
	- input y corresponds to target vector without blanks
	- output [questions,flag] correspond to the trained model (refer decisionTreePredict for usage)

------------------------------------

7. decisionTreePredict(x, questions, flag)
	
	- input x corresponds to feature matrix without blanks for testing
	- input questions and flag are obtained as model parameters from decisionTreeFit()
	- output is a vector corresponding to predicted values (used for classification)

	Note : For regression refer regressionTree

------------------------------------

8. elasticRegressionTrain(x, y, rate, iter, lambda1, lambda2)

	- input x corresponds to feature matrix without blanks
	- input y corresponds to target vector without blanks
	- input rate corresponds to rate of learning
	- input iter corresponds to the number of iterations for descent
	- lambda1 and lambda2 are model parameters for ridge and lasso respectively
	- outut theta corresponds to the trained model (refer elasticRegressionPredict for usage)

------------------------------------

9. elasticRegressionPredict(x, theta)
	
	- input x corresponds to feature matrix without blanks for testing
	- input theta is the trained model obtained from 8.
	- output is a vector of predicted values

------------------------------------

10. ensemble(pred1, pred2, y, increment)
	
	- input pred1 is the predicted value (corresponding to a target) by 1st model
	- input pred2 is the predicted value (corresponding to the same target) by 2nd model
	- input y is the target vector
	- input increment corresponds to the minimum error count of weights
	- output is the final predicted value vector

------------------------------------

11. kmeansCluster(x, centres)

	- input x corresponds to feature matrix without blanks
	- input centres is the number of desired clusters
	- output is a vector of flags corresponding to the family of each data point via kmeans

------------------------------------

12. KmediodsCluster(x, centres)

	- input x corresponds to feature matrix without blanks
	- input centres is the number of desired clusters
	- output is a vector of flags corresponding to the family of each data point via kmediods

------------------------------------

13. knn(x, y, xtest, neighbours)

	- input x corresponds to feature matrix without blanks
	- input y corresponds to target vector without blanks
	- input xtest corresponds to the feature matrix of the test set without blanks
	- input neighbours corresponds to the number of neighbours chosen for KNN
	- output is the predicted vector for xtest

------------------------------------

14. LARSRegressionTrain(x, y, iter, rate)

	- input x corresponds to feature matrix without blanks
	- input y corresponds to target vector without blanks
	- input rate corresponds to rate of learning
	- input iter corresponds to the number of iterations for descent
	- outut theta corresponds to the trained model (refer LARSRegressionPredict for usage)

------------------------------------

15. LARSRegressionPredict(x, theta)
	
	- input x corresponds to feature matrix without blanks for testing
	- input theta is the trained model obtained from 14.
	- output is a vector of predicted values

------------------------------------

16. linearRegressionTrain(x, y)

	- input x corresponds to feature matrix without blanks
	- input y corresponds to target vector without blanks
	- output [a, b] correspond to the trained model (refer linearRegressionPredict for usage)

------------------------------------

17. linearRegressionPredict(x, a, b)
	
	- input x corresponds to feature matrix without blanks for testing
	- input [a, b] are the trained model obtained from 16.
	- output is a vector of predicted values

------------------------------------

18. logisticRegressionTrain(x, y, iter, rate)

	- input x corresponds to feature matrix without blanks
	- input y corresponds to target vector without blanks
	- input rate corresponds to rate of learning
	- input iter corresponds to the number of iterations for descent
	- outut theta corresponds to the trained model (refer logisticRegressionPredict for usage)

------------------------------------

19. logisticRegressionPredict(x, theta)
	
	- input x corresponds to feature matrix without blanks for testing
	- input theta is the trained model obtained from 18.
	- output is a vector of predicted values

------------------------------------

20. missingMean(x)

	- input x is a column vector
	- output is the column vector with missing values replaced with means for x

------------------------------------

21. missingMedian(x)

	- input x is a column vector
	- output is the column vector with missing values replaced with medians for x

------------------------------------

22. naiveBayes(x, y)

	- input x corresponds to feature matrix without blanks
	- input y corresponds to target vector without blanks
	- output is the probability matrix (refer naiveBayesGaussian for usage)

------------------------------------

23. naiveBayesGaussian(x, y, probMat, testx)

	- input x corresponds to feature matrix without blanks
	- input y corresponds to target vector without blanks
	- input testx corresponds to test feature matrix
	- input probMat is the output of naiveBayes(x, y)
	- output is the predicted target via gaussian naive bayes
------------------------------------

22. naiveMultBayes(x, y)

	- input x corresponds to feature matrix without blanks
	- input y corresponds to target vector without blanks
	- output is the probability matrix (refer naiveMultBayesGaussian for usage)

------------------------------------

23. naiveMultBayesGaussian(x, y, probMat, testx)

	- input x corresponds to feature matrix without blanks
	- input y corresponds to target vector without blanks
	- input testx corresponds to test feature matrix
	- input probMat is the output of naiveBayes(x, y)
	- output is the predicted target via multinomial naive bayes

------------------------------------

24. neuralNetworkTrain(x, y, hiddenLayers, batchSize, iter, rate)
	
	- input x corresponds to feature matrix without blanks
	- input y corresponds to target vector without blanks
	- input hiddenLayers corresponds to a vector corresponding to number of nodes in each layer
	- input batchSize corresponds to the number of etries for SGD
	- input rate corresponds to rate of learning
	- input iter corresponds to the number of iterations for descent
	- output theta corresponds to the trained model (stored in a local dir)

------------------------------------

25. neuralNetworkPredict(x, theta, hiddenLayers)

	- input x corresponds to feature matrix without blanks for testing
	- input theta obtained from 24.
	- input hiddenLayers same as 24.
	- output is a set of predicted values

------------------------------------

26. normalize(x)

	- input x is a column vector of real values without blanks
	- output is a column vector with mean 0 and variance 1 normalization

------------------------------------

27. PCA(x)
	
	- input x is the feature matrix for which PCA is to be performed
	- output is the matrix with each column as the principal component in that order

------------------------------------

28. perceptronTrain(x, y, iter, rate)

	- input x corresponds to feature matrix without blanks
	- input y corresponds to target vector without blanks
	- input rate corresponds to rate of learning
	- input iter corresponds to the number of iterations for descent
	- outut theta corresponds to the trained model (refer perceptronPredict for usage)

------------------------------------

29. perceptronPredict(x, theta)
	
	- input x corresponds to feature matrix without blanks for testing
	- input theta is the trained model obtained from 28.
	- output is a vector of predicted values

------------------------------------

30. PolynomialRegressionTrain(x, y, degree)

	- input x corresponds to feature matrix without blanks
	- input y corresponds to target vector without blanks
	- input degree corresponds to the degree of the function to be fit
	- outut theta corresponds to the trained model (refer PolynomialRegressionTrain for usage)

------------------------------------

31. PolynomialRegressionPredict(x, theta)

	- input x corresponds to feature matrix without blanks for prediction
	- input theta is the trained model obtained from 31.
	- output is a vector of predicted values

------------------------------------

32. randomForest(x, y, trees, samplesize, xtest)

	- input x corresponds to feature matrix without blanks
	- input y corresponds to target vector without blanks
	- input trees corresponds to the number of trees in forest
	- input sampleSize corresponds to the number of entries given per sample
	- input xtest corresponds to the feature matrix of the test set without blanks
	- output is a vector of predicted targets

------------------------------------

33. regressionTreeTrain(x, y, entryThreshold)

	- input x corresponds to feature matrix without blanks
	- input y corresponds to target vector without blanks
	- input entrThreshold corresponds to the number of entries at which a node stops growing
	- output is the directory for the stored model

------------------------------------

34. regressionTreePredict(startNode, x, directory)

	- input startNode is the node at which prediction must start
	- input x corresponds to feature matrix without blanks for prediction
	- input director is the directory for the stored model
	- output is a vector of predicted targets

------------------------------------

35. ridgeRegressionTrain(x, y, rate, iter, lambda)

	- input x corresponds to feature matrix without blanks
	- input y corresponds to target vector without blanks
	- input rate corresponds to rate of learning
	- input iter corresponds to the number of iterations for descent
	- input lambda is the model parameter for ridge
	- outut theta corresponds to the trained model (refer ridgeRegressionPredict for usage)
------------------------------------

36. ridgeRegressionPredict(x, theta)
	
	- input x corresponds to feature matrix without blanks for testing
	- input theta is the trained model obtained from 35.
	- output is a vector of predicted values

------------------------------------

37. scale(x)

	- input x is a column vector of real values without blanks
	- output is a column vector rescaled between 0 and 1

------------------------------------

38. spectralCluster(x, centres)

	- input x corresponds to feature matrix without blanks
	- input centres is the number of desired clusters
	- output is a vector of flags corresponding to the family of each data point via spectral cluster

------------------------------------

39. supportVectorclassificationTrain(x, y, rate, iter, lambda, alpha)

	- input x corresponds to feature matrix without blanks
	- input y corresponds to target vector without blanks
	- input rate corresponds to rate of learning
	- input iter corresponds to the number of iterations for descent
	- input lambda and alpha are the model parameters
	- outut [theta, b] corresponds to the trained model (refer supportVectorclassificationPredict for usage)

------------------------------------

40. supportVectorclassificationPredict(x, theta, b)

	- input x corresponds to feature matrix without blanks for testing
	- input [theta, b] is the trained model obtained from 39.
	- output is a vector of predicted values

------------------------------------

41. supportVectorRegressionTrain(x, y, rate, iter, lambda, alpha)

	- input x corresponds to feature matrix without blanks
	- input y corresponds to target vector without blanks
	- input rate corresponds to rate of learning
	- input iter corresponds to the number of iterations for descent
	- input lambda and alpha are the model parameters
	- outut [theta, b] corresponds to the trained model (refer supportVectorRegressionPredict for usage)

------------------------------------

42. supportVectorRegressionPredict(x, theta, b)

	- input x corresponds to feature matrix without blanks for testing
	- input [theta, b] is the trained model obtained from 41.
	- output is a vector of predicted values

------------------------------------

43. trainTestSplit(x, y, trainsize)

	- input x corresponds to feature matrix without blanks
	- input y corresponds to target vector without blanks
	- input trainsize (0 - 1) corresponds to the fraction of training set
	- output [trainX, testX, trainY, testY] correspond to the training and testing feature and target

------------------------------------
====================================