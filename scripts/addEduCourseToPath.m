function addEduCourseToPath(add)
if nargin < 1
    add = true; % else remove
end
p = eduCoursePrefs;
dirpath = p.coursepath;
if isfolder(dirpath)
    fs = split(genpath(dirpath), ';'); % get subfolders
    fs = fs(~contains(rmmissing(fs), {'work'})); % filter folders
    if add
        addpath(fs{:}); % add folders to path
    else
        rmpath(fs{:}); % remove folders from path
    end
else
    if add
        error('Course files folder is not found')
    end
end