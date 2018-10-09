classdef Dev < handle
    % Useful functions for developers
    
    properties
        pname % project name
        fname % name of project file
        v % project version
    end
    
    methods
        function obj = Dev(pname)
            %DEV Constructor
            if nargin < 1
                fs = dir('./*.prj');
                fname = fs(1).name;
                [~, pname] = fileparts(fname);
            end
            obj.pname = pname;
            obj.fname = pname + ".prj";
            obj.v = matlab.addons.toolbox.toolboxVersion(obj.fname);
        end
        
        function deploy(obj, v)
            % Deploy toolbox for specified version
            if nargin > 1
                matlab.addons.toolbox.toolboxVersion(obj.fname, v);
                obj.v = v;
            end
            obj.seticons();
            matlab.addons.toolbox.packageToolbox(obj.fname, obj.pname);
            obj.echo('has been deployed');
        end
        
        function push(obj, v)
            % Commit and push project of specified version
            if nargin > 1
                matlab.addons.toolbox.toolboxVersion(obj.fname, v);
                obj.v = v;
            end
            commitcmd = sprintf('git commit -m v%s', obj.v);
            system('git add .');
            system(commitcmd);
            system('git push');
            obj.echo('has been pushed');
        end
        
        function tag(obj, v)
            % Tag git project for specified version
            if nargin > 1
                matlab.addons.toolbox.toolboxVersion(obj.fname, v);
                obj.v = v;
            end
            tagcmd = sprintf('git tag -a v%s -m v%s', obj.v, obj.v);
            system(tagcmd);
            system('git push --tags')
            obj.echo('has been tagged');
        end
        
        function echo(obj, msg)
            % Display service message
            fprintf('%s v%s %s\n', obj.pname, obj.v, msg);
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
        
        function seticons(obj)
            % Set icons to app
            xmlfile = 'DesktopToolset.xml';
            oldtxt = '<icon filename="matlab_app_generic_icon_' + string([16; 24]) + '"/>';
            newtxt = '<icon path="./" filename="icon_' + string([16; 24]) + '.png"/>';
            if isfile(xmlfile) && isfolder('resources')
                if all(isfile("resources/icon_" + [16 24] + ".png"))
                    txt = obj.readtxt(xmlfile);
                    if contains(txt, oldtxt)
                        txt = replace(txt, oldtxt, newtxt);
                        obj.writetxt(txt, xmlfile);
                    end
                end
            end
        end
        
    end
end

