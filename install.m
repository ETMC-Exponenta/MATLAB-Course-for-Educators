function install
% Generated with Toolbox Extender https://github.com/ETMC-Exponenta/ToolboxExtender
open('MATLABCourseForEducatorsProject.prj');
dev_on
dev.test('', false);
% Post-install commands
close(currentProject)
cd('..');
% Add your post-install commands below
eduCourseHelp();