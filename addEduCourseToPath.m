function addEduCourseToPath(add)
if nargin < 1
    add = true; % else remove
end
dirname = 'EduCourseFiles';
if isfolder(dirname)
    fs = split(genpath(dirname), ';'); % get subfolders
    fs = fs(~contains(rmmissing(fs), {'work'})); % filter folders
    if add
        addpath(fs{:}); % add folders to path
    else
        rmpath(fs{:}); % remove folders from path
    end
else
    error('Course files folder is not found')
end