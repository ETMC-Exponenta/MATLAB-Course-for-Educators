docdir = 'doc';
fs = struct2table(dir(fullfile(docdir, '*.mlx')));
for i = 1 : height(fs)
    [~, fname] = fileparts(fs.name{i});
    fpath = fullfile(fs.folder{i}, fs.name{i});
    htmlpath = fullfile(fs.folder{i}, fname + ".html");
    matlab.internal.liveeditor.openAndConvert(fpath, char(htmlpath));
end