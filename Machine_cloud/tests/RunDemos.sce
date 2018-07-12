getd('../macros')
scripts = listfiles('../demos')
numfiles = size(scripts)
for i = 1:numfiles(1)
	script = scripts(i);
	disp('Running ' + string(i) + ' of ' + string(numfiles(1)) + ' : ' + script)
	if(strcmp('Datasets', script) ~= 0)
		exec('../demos/' + script, -1)
	end

	disp('Complete')
end