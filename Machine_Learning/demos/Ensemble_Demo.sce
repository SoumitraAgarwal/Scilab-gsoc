// Demo for Ensemble classifier -- Scilab 

getd('../macros')

// Data preparation for gaussian
M = csvRead('Datasets/standard.csv')
x = M(:, [1,2,3,4,5,6,7,8]);
y = M(:, 9);

y(or(isnan(x),'c'),:) = []
x(or(isnan(x),'c'),:) = []

probMat = naiveBayes(x, y)
testx = x;
pred1 = naiveBayesGaussian(x, y, probMat, testx)

// Data preparation for multinomial
x 		= x(:, 1);
probMat = naiveMultBayes(x, y)
testx = x;
pred2 = naiveMultBayesGaussian(x, y, probMat, testx)

increment = 0.01
pred = ensemble(pred1, pred2, y, increment)
disp('Error through classifier 1 = ' + string(0.5*sqrt(norm(pred1 - y))))
disp('Error through classifier 2 = ' + string(0.5*sqrt(norm(pred2 - y))))
disp('Error through ensemble = ' + string(0.5*sqrt(norm(pred - y))))