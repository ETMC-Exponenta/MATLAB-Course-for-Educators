function install()
url = 'https://api.github.com/repos/ETMC-Exponenta/MATLAB-Course-for-Educators';
[~, name] = fileparts(url);
r = webread(url + "/releases/latest");
fprintf('Downloading %s %s\n', name, r.name);
websave(r.assets.name, r.assets.browser_download_url);
open(r.assets.name)
end