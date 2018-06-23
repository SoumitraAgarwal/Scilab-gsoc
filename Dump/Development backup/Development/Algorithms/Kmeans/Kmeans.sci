// Macro for Kmeans -- Scilab 

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