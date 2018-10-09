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
    end
end

