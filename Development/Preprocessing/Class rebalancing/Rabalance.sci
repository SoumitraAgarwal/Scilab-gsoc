// Macro for rebalancing classes of dataset -- Scilab 

function [x, y] = rebalanceOver(x, y)

	classVal 	= tabul(y)
	classNumber = max(real(classVal(:, 2)))
	numClasses 	= length(classVal(:, 1))
	mainMat 	= [x, y]
	features 	= length(x(1,:))

	for i = 1:numClasses
		classData = mainMat(find(mainMat(:, features + 1) == classVal(i, 1)), :)
		thisClass = real(classVal(i, 2))
		for j = thisClass:classNumber - 1
			mainMat = [mainMat; classData(1 + (thisClass-1)*rand(), :)]
		end
	end 	
	
	x = mainMat(:,1:features)
	y = mainMat(:, features + 1)
endfunction


// Subroutine to get distance between two points
function dist = getDistance(point1, point2)

	n1 = length(point1)
	dist = 0
	for i = 1:n1
		dist = dist + (point1(i)-point2(i))^2;
	end
	dist = sqrt(dist);

endfunction

// Function to return flags for category of each data point
function flags = kmeansCluster(x, centres)
	
	n 		= length(x(:,1));
	index 	= round(n.*rand(1,centres));
	points  = [];
	flags 	= [];

	// Get a set of random centres
	for i = 1:centres
		
		points	= [points; x(index(i), :)];

	end

	for i = 1:n

		mindistance = -1;
		minindex	= -1;

		// Find the closest centre to the data point

		for j = 1:centres
			if(minindex == -1)
				mindistance = getDistance(x(i, :), points(1, :));
				minindex = 1;
			
			elseif(getDistance(x(i, :), points(j, :)) < mindistance)
				mindistance = getDistance(x(i, :), points(j, :));
				minindex = j;

			end
		end

		// Update the centre with the new data point
		flags = [flags, minindex];
		points(minindex, :) = (i.*points(minindex, :) + x(i, :))./(i + 1);
	end
endfunction


function [x, y] = rebalanceCluster(x, y, centres)
	classVal 	= tabul(y)
	classNumber = max(real(classVal(:, 2)))
	numClasses 	= length(classVal(:, 1))
	mainMat 	= [x, y]
	features 	= length(x(1,:))
	classFlags 	= []
	maxCluster 	= 0

	for i = 1:numClasses
		classData 	= mainMat(find(mainMat(:, features + 1) == classVal(i, 1)), :)
		flags 		= kmeansCluster(classData(:, 1:features), centres)

		for k = 1:centres
			clusterData = classData(find(flags == k))
			thisClass 	= length(clusterData(:, 1))
			for j = thisClass:classNumber - 1
				mainMat = [mainMat; classData(1 + (thisClass-1)*rand(), :)]
			end
		end
	end 	
	
	x = mainMat(:,1:features)
	y = mainMat(:, features + 1)


endfunction


