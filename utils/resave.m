function [] = resave(matfilePath)
% resaves a .mat file so that it is in the correct format for partial loading

clear global;
load(matfilePath);
save(matfilePath, '-v7.3');

end