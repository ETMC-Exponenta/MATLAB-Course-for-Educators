function fs = addMLCourseToPath
fs = split(genpath(fileparts(mfilename('fullpath'))), ';'); % get folders
fs = fs(~contains(rmmissing(fs), {'.git' 'work'})); % filter folders
addpath(fs{:}); % add folders to path