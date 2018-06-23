// Macro for K Nearest neighbours classification -- Scilab 

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
function pred = knn(x, y, xtest, k)
	
	n 		= length(x(:,1));
	maxDist = -1*ones(1, k);
	catDist = -1*ones(1, k);
	testent = length(xtest(:, 1));
	pred	= [];
	for i = 1:testent
		presentPoint = xtest(testent, :);
		for j = 1:n
			dist = getDistance(presentPoint, x(j, :));
			pres = y(j, 1);
			for l = 1:k
				if(maxDist(1, l)== -1)
					maxDist(1, l) = dist
					catDist(1, l) = pres;
				elseif(maxDist(1, l)> dist)
					temp = maxDist(1, l);
					maxDist(1, l) = dist;
					dist = temp;	
					temp = catDist(1, l);
					catDist(1, l) = pres;
					pres = temp;	
				end
			end
		end
		counts = tabul(catDist);

		categories 	= length(counts(:, 1));
		maxEnt 		= 0;
		maxPre 		= 0;
		for j = 1:categories
			if(counts(j, 2)>maxEnt)
				maxEnt = counts(j, 2);
				maxPre = counts(j, 1);
			end
		end
		pred = [pred, maxPre];
	end
endfunction