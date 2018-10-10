classdef Tools < handle
    % Let you control version of installed toolbox and update it from
    % GitHub origin
    
    properties
        name % project name
        pname % name of project file
        origin % GitHub link
        pv % project version
        cv % current installed version
        iv % latest version form internet
        root % root dir
        builder % builder version
    end
    
    methods
        function obj = Tools()
            % Tools Constructor
            conf = ToolboxConfig();
            obj.name = conf.name;
            obj.pname = conf.pname;
            obj.origin = erase(conf.origin, '.git');
            obj.root = fileparts(mfilename('fullpath'));
            obj.builder = conf.builder;
            if ~isempty(obj.pname)
                obj.pv = obj.gpv();
            end
            obj.gcv();
        end
        
        function [pname, fname] = getname(obj)
            % Get project name
            pname = obj.pname;
            if isempty(pname)
                fs = dir('./*.prj');
                if ~isempty(fs)
                    fname = fs(1).name;
                    [~, pname] = fileparts(fname);
                else
                    pname = '';
                end
            end
            obj.pname = pname;
            if ~isempty(pname)
                obj.fname = [pname '.prj'];
            end
        end
        
        function pv = gpv(obj)
            % Get project version
            if isfile(obj.pname)
                pv = matlab.addons.toolbox.toolboxVersion(obj.pname);
            else
                pv = '';
            end
            obj.pv = pv;
        end
        
        function cv = gcv(obj)
            % Get current installed version
            tbx = matlab.addons.toolbox.installedToolboxes;
            tbx = struct2table(tbx, 'AsArray', true);
            idx = strcmp(tbx.Name, obj.name);
            cv = tbx.Version(idx);
            if isscalar(cv)
                cv = char(cv);
            end
            obj.cv = cv;
        end
        
        function [iv, r] = giv(obj)
            % Get internet version from GitHub
            iname = string(extractAfter(obj.origin, 'https://github.com/'));
            url = "https://api.github.com/repos/" + iname + "/releases/latest";
            try
                r = webread(url);
                iv = r.tag_name;
                iv = erase(iv, 'v');
            catch e
                iv = '';
            end
            obj.iv = iv;
            r = '';
        end
        
        function [cv, iv, r] = ver(obj, echo)
            % Get local version
            if nargin < 2
                echo = true;
            end
            cv = obj.gcv();
            if echo
                if isempty(cv)
                    fprintf('%s is not installed\n', obj.name);
                else
                    fprintf('Installed version: %s\n', cv);
                end
            end
            % Get latest version
            [iv, r] = obj.giv();
            if echo
                fprintf('Latest version: %s\n', iv);
                if isequal(cv, iv)
                    fprintf('You use the latest version\n');
                else
                    fprintf('* Update is available: %s->%s *\n', cv, iv);
                    fprintf('To update run update command\n');
                end
            end
        end
        
        function yes = isonline(~)
            % Check connection to internet is available
            try
                java.net.InetAddress.getByName('google.com');
                yes = true;
            catch e
                yes = false;
            end
        end
        
        function install(obj, r)
            % Download and install latest version from web
            if nargin < 2
                [~, ~, r] = obj.ver(0);
            end
            fprintf('* Installation of %s is started *\n', obj.name);
            fprintf('Installing the latest version: v%s...\n', obj.iv);
            dpath = tempname;
            mkdir(dpath);
            fpath = fullfile(dpath, r.assets.name);
            websave(fpath, r.assets.browser_download_url);
            res = matlab.addons.install(fpath);
            fprintf('%s v%s has been installed\n', res.Name{1}, res.Version{1});
            delete(fpath);
        end
        
        function update(obj)
            % Update installed version to latest
            [~, ~, r] = obj.ver();
            if obj.isupdate()
                obj.install(r);
            end
        end
        
        function yes = isupdate(obj)
            % Check that update is available
            obj.ver(0);
            yes = ~isempty(obj.iv) & ~isequal(obj.cv, obj.iv);
        end
        
        function doc(obj)
            % Open getting started manual
            docpath = fullfile(obj.root, 'doc', 'GettingStarted.html');
            web(docpath);
        end
        
        function examples(obj)
            % cd to Examples dir
            expath = fullfile(obj.root, 'examples');
            cd(expath);
        end
        
        function txt = readtxt(~, fpath)
            % Read text from file
            f = fopen(fpath, 'r', 'n', 'windows-1251');
            txt = fread(f, '*char')';
            fclose(f);
        end
        
        function txt = writetxt(~, txt, fpath)
            % Wtite text to file
            fid = fopen(fpath, 'w', 'n', 'windows-1251');
            fwrite(fid, unicode2native(txt, 'windows-1251'));
            fclose(fid);
        end
            
    end
end

