classdef Dev < Tools
    % Useful functions for developers
    
    methods
        function obj = Dev()
            %DEV Constructor
            obj = obj@Tools();
        end
        
        function deploy(obj, pv)
            % Deploy toolbox for specified version
            if nargin > 1
                matlab.addons.toolbox.toolboxVersion(obj.pname, pv);
                obj.pv = pv;
            end
            obj.seticons();
            name = strrep(obj.name, ' ', '-');
            matlab.addons.toolbox.packageToolbox(obj.pname, name);
            obj.echo('has been deployed');
        end
        
        function push(obj, pv)
            % Commit and push project of specified version
            if nargin > 1
                matlab.addons.toolbox.toolboxVersion(obj.pname, pv);
                obj.pv = pv;
            end
            commitcmd = sprintf('git commit -m v%s', obj.pv);
            system('git add .');
            system(commitcmd);
            system('git push');
            obj.echo('has been pushed');
        end
        
        function tag(obj, pv)
            % Tag git project for specified version
            if nargin > 1
                matlab.addons.toolbox.toolboxVersion(obj.pname, pv);
                obj.pv = pv;
            end
            tagcmd = sprintf('git tag -a v%s -m v%s', obj.pv, obj.pv);
            system(tagcmd);
            system('git push --tags')
            obj.echo('has been tagged');
        end
        
        function echo(obj, msg)
            % Display service message
            fprintf('%s v%s %s\n', obj.name, obj.pv, msg);
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

