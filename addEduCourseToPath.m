function addEduCourseToPath(add)
if nargin < 1
    add = true;
end
dir = fullfile(fileparts(mfilename('fullpath')), 'EduCourseFiles'); % get files folder
fs = split(genpath(dir), ';'); % get subfolders
fs = fs(~contains(rmmissing(fs), {'.git' 'work'})); % filter folders
if add
    addpath(fs{:}); % add folders to path
else
    rmpath(fs{:})
end