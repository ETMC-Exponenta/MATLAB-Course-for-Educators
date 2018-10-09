function addEduCourseToPath(add)
if nargin < 1
    add = true; % else remove
end
dirname = 'EduCourseFiles';
dir = fullfile(fileparts(mfilename('fullpath')), dirname); % get files folder
fs = split(genpath(dir), ';'); % get subfolders
fs = fs(~contains(rmmissing(fs), {'work'})); % filter folders
if add
    addpath(fs{:}); % add folders to path
else
    rmpath(fs{:}); % remove folders from path
end