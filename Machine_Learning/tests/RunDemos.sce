getd('../macros')
scripts = dir('../demos')
numfiles = size(scripts.name)(1)
disp(scripts)
for i = 1:numfiles
	script = scripts.name(i);
	disp('Running ' + string(i) + ' of ' + string(numfiles) + ' : ' + script)
	if(strcmp('Datasets', script) ~= 0 && strcmp('Models', script) ~= 0 )
		exec('../demos/' + script, -1)
	end

	disp('Complete')
end