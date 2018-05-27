// Macro for Kmeans -- Scilab 

function dist = getDistance(point1, point2)

	n1 = length(point1)
	dist = 0
	for i = 1:n1
		dist = dist + (point1(i)-point2(i))^2;
	end
	dist = sqrt(dist);

endfunction

function flags = kmeansCluster(x, centres)
	
	n 		= length(x(:,1));
	index 	= round(n.*rand(1,centres));
	points  = [];
	flags 	= [];
	for i = 1:centres
		
		points	= [points; x(index(i), :)];

	end

	for i = 1:n

		mindistance = -1;
		minindex	= -1;

		for j = 1:centres
			if(minindex == -1)
				mindistance = getDistance(x(i, :), points(1, :));
				minindex = 1;
			
			elseif(getDistance(x(i, :), points(j, :)) < mindistance)
				mindistance = getDistance(x(i, :), points(j, :));
				minindex = j;

			end
		end

		flags = [flags, minindex];
		points(minindex, :) = (i.*points(minindex, :) + x(i, :))./(i + 1);
	end
endfunction