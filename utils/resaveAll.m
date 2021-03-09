function [] = resaveAll()
% resaves all .mat files in /data so that it is in the correct format for partial loading
directory = "data";
files = dir(fullfile(directory, '*.mat'));

for i = 1:length(files)
  baseFileName = files(i).name;
  fullFileName = fullfile(directory, baseFileName);
  resave(fullFileName)
end

end