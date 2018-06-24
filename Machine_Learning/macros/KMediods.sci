// Macro for Kmediods -- Scilab 

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
function flags = KmediodsCluster(x, centres)
	
	n 		= length(x(:,1));
	index 	= round(1 + (n - 1).*rand(1,centres));
	points  = [];
	flags 	= [];

	// Get a set of random centres (mediods)

	for i = 1:centres
		points	= [points; x(index(i), :)];

	end

	mediodAssociated = []
	totalCost = 0;
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
		mediodAssociated = [mediodAssociated, minindex];
		totalCost = totalCost + mindistance;
	end

	// Iteratively change the centres and update

	previousCost = totalCost
	presentCost = totalCost;
	iterations = 0;
	while(1)

		numPoints = 1:n

		for i = 1:centres
			numPoints(index(i)) = %nan
		end
		
		numPoints = numPoints(~isnan(numPoints))

		for i = 1:centres
			for j = 1:n - centres

				itercost = 0;
				tempPoints = points
				nonMedoid = x(numPoints(j), :)
				tempPoints(i, :) = nonMedoid;
				mindistance = -1;
				minindex	= -1;

				// Find the closest centre to the data point

				for l = 1:n
					for k = 1:centres
						if(minindex == -1)
							mindistance = getDistance(x(l, :), tempPoints(1, :));
							minindex = 1;
						
						elseif(getDistance(x(l, :), tempPoints(k, :)) < mindistance)
							mindistance = getDistance(x(l, :), tempPoints(k, :));
							minindex = j;

						end
					end

					itercost = itercost + mindistance;
				end

				if(itercost < presentCost)
					presentCost = itercost;
					points = tempPoints;
					temp = index(i)
					index(i) = numPoints(j)
					numPoints(j) = index(i)
				end
			end
		end

		if(presentCost >= previousCost)
			break
		end

		iterations = iterations + 1;
		previousCost = presentCost;
		presentCost = 0;
	end

	
	// Get the flags for the updated mediods
	flags = []
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
	end

endfunction