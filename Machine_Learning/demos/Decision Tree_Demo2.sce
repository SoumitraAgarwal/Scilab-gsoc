// Demo for decision tree -- Scilab 



// Data preparation
M = csvRead('forestfires.csv')
x = M(:,[5,6,7,8,9]);
y = M(:, 13);

y(or(isnan(x),'c'),:) = []
x(or(isnan(x),'c'),:) = []
n = length(y(:, 1))
for i = 1:n
	if(y(i)>0)
		y(i) = 1
	end
end

[questions,flag] 	= decisionTreeFit(x, y);
pred				= decisionTreePredict(x, questions, flag);
disp(0.5*norm(pred' - y))