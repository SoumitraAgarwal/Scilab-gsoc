// Demo script for 1 hot encoding

// Data preparation
M = read_csv('Datasets/titanic.csv')
x = M(:, 12);
x = stripblanks(x)
x(or(isnan(x),'c'),:) = []
y = []
for i = 1:l(1)
	if(strcmp(x(i), '') ~= 0)
		y = [y;x(i)];
	end
end
x = y
[categories, encode] = hotEncode(x);
disp(categories);
disp(encode)