function eduCourseHelp(page)
% Open documentation
if nargin < 1
    page = 'GettingStarted';
end
TE = MATLABCourseforEducatorsExtender;
comp = computer;
if comp == "GLNXA64"
    TE.doc(page + ".mlx");
else
    TE.doc(page);
end