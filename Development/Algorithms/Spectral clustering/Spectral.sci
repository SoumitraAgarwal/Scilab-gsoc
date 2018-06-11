// Macro for spectral -- Scilab 

// Subroutine to get distance between two points
function dist = getDistance(point1, point2)

	n1 = length(point1)
	dist = 0
	for i = 1:n1
		dist = dist + (point1(i)-point2(i))^2;
	end
	dist = sqrt(dist);

endfunction

// Function for heirarchial clustering for the given eigenvector
function flags = clusterHeirarchial(A, eigenvector, centres)
	
	entries 	= length(A(:, 1))
	modul 		= norm(eigenvector)
	flags 		= []
	components 	= []
	for i = 1:entries
		components = [components, A(i,:)*eigenvector/modul];
	end

	sortedComponents = gsort(components);
	medianValue = []
	
	for i = 1:(centres - 1)
		medianValue = [medianValue, sortedComponents(int(i*entries/centres))]
	end

	for i = 1:entries
		flag2 = 0;
		for j = 1:(centres - 1)
			if(components(i) > medianValue(j))
				flags = [flags, j - 1];
				flag2 = 1;
				break
			end
		end
		if(flag2 == 0)
			flags = [flags, centres - 1];
		end
	end

endfunction

// Function to return flags for category of each data point
function flags = spectralCluster(x, centres)
	
	points = length(x(:, 1))
	affinity = [];
	for i = 1:points
		rowAffinity = [];
		for j = 1:points
			rowAffinity = [rowAffinity, getDistance(x(j, :), x(i, :))];
		end
		affinity = [affinity; rowAffinity];
	end

	D = diag(sum(affinity, 2))
	A = D - affinity;
	[eigenvectors, eigenvalues] = spec(A);
	flags = clusterHeirarchial(A, eigenvectors(:, points - 1));
endfunction