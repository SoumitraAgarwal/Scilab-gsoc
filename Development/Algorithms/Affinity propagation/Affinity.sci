// Macro for affinity -- Scilab 

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
function flags = affinityCluster(x, centres, iterations)
	
	points = length(x(:, 1))
	affinity = [];
	for i = 1:points
		rowAffinity = [];
		for j = 1:points
			rowAffinity = [rowAffinity, -1*(getDistance(x(j, :), x(i, :))^2)];
		end
		affinity = [affinity; rowAffinity];
	end

	medianVal = median(affinity)
	for i = 1:points
		affinity(i, i) = medianVal;
	end
	responsibility = zeros(points, points)
	availability = zeros(points, points)
	
	for p = 1:iterations
		for i = 1:points
			for j = 1:points
				columnList = 1:points
				columnList(j) = %nan
				columnList = columnList(~isnan(columnList))
				responsibility(i,j) = affinity(i,j) - max(real(affinity(:, [columnList]) + availability(:, [columnList])));
			end
		end

		for i = 1:points
			for j = 1:points
				maxMat = [] 
				for k = 1:points
					if(k~=i && k~=j)
						maxMat = [maxMat, max(real([0, responsibility(k, j)]))]
					end
				end
				if(i ~= j)
					availability(i, j) = min(real([0, responsibility(j,j) + sum(maxMat)]))
				else
					availability(i, j) = sum(maxMat);
				end
			end
		end
		disp('Iteration complete ' + string(p))
	end

	resultMat = availability + responsibility;
	result = diag(availability + responsibility)

	sortedResults = gsort(result)
	indices = find(result >= sortedResults(centres))

	flags = []
	for i = 1:points
		bestindex = 1;
		bestVal = resultMat(i, indices(1))
		for j = 1:centres
			if(bestVal < resultMat(i, indices(j)))
				bestVal = resultMat(i, indices(j));
				bestindex = j;
			end
		end
		flags = [flags, bestindex];
	end
endfunction