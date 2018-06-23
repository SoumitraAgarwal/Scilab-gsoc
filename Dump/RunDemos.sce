scripts = dir('Copy')
numfiles = length(scripts)
disp(scripts)
for i = 1:numfiles
	script = scripts.name(i);
	disp('Running ' + script)
	if(strcmp('Datasets/', script) ~= 0)
		exec('/home/soumitra/Desktop/Study/Projects/GSOC/Scilab-gsoc/Copy/' + script, -1)
	end
end