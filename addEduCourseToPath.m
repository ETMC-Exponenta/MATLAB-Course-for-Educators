function addEduCourseToPath(add)
if nargin < 1
    add = true;
end
fs = split(genpath(fileparts(mfilename('fullpath'))), ';'); % get folders
fs = fs(~contains(rmmissing(fs), {'.git' 'work'})); % filter folders
if add
    addpath(fs{:}); % add folders to path
else
    rmpath(fs{:})
end