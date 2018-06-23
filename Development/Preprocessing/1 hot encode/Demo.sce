// Demo script for 1 hot encoding

getd('.')

// Data preparation
M = read_csv('Datasets/titanic.csv')
x = M(:, 12);
x(or(isnan(x),'c'),:) = []
[categories, encode] = hotEncode(x);
disp(categories);
disp(encode)