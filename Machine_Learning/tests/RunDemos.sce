getd('../macros')
scripts = dir('../demos')
numfiles = length(scripts)
disp(scripts)
for i = 3:numfiles
	script = scripts.name(i);
	disp('Running ' + script)
	if(strcmp('Datasets/', script) ~= 0)
		exec('../demos/' + script, -1)
	end
end