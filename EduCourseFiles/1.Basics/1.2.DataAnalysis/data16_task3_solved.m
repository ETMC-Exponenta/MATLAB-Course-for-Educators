%% 1.2.16. ��������� ������
% *��������������� ������*
%
% �������� ����� �� ������������� ������ � ������������� ������ ����������� 
% ���������� �� ������� ������.
%
%% ������ ������
% 1. �������� ������ �� ����� |tempmonth.csv| � ���������� |T| ���� |table| 
% (���������: |readrable()|)
T = readtable('tempmonth.csv');
% 2. ��������� ������ �������������� ����������� (|TAVG|) �� ������� (|DATE|). 
% ���������� |h1| ������ ��������� �� ������ (���������: |plot()|)
h1 = plot(T.DATE, T.TAVG);
% �� ������� ����� �������� ��������� ������� ����������� � ������ �� ��������� 
% �����������.
%
%% ���������� ������
% ����� �������� �����, ����� ���������������� ������ ������ (��������� ������� 
% �������). ��� ����� � MATLAB ���� ���������� ������� |polyfit()|, |polyval()|
% 3. � ���������� |dur| �������� ������ �������, ���������� � ������� ������� 
% ��������� �� ������� �� ��������� ������� |DATE|. ������ ���������� ��������� 
% ������������ ������ ���� |duration| (���������: |-|, |(1)|)
dur = T.DATE - T.DATE(1);
% 4. � ������� |YEARS| ������� |T| �������� ������ ���������� ���, ������� 
% ���������� � ������� |dur| (���������: |years()|)
T.YEARS = years(dur);
%
%% ���������� ������
% 5. � ������� ������� |polyfit()| ��������������� ������ |TAVG| �� |YEARS| 
% ��������� ������ �������. ��������� �������� � ���������� |p| (���������: |polyfit(...,...,1)|)
p = polyfit(T.YEARS, T.TAVG, 1);
% �������� �� ������, ������ ��������� ������ �� ���� ���������. ��� ��� 
% ������������� �������� ������� �������?
% 6. � ������� ������� |polyval()| �������� ������ �������� ������������������� 
% ������� �� ������ |p| ��� ������� ������� |YEARS|. ��������� �������� � ������� 
% TT (���������: |polyval(...,...)|)
T.TT = polyval(p, T.YEARS);
% 7. ��������� ����� ������ |TT| �� |DATE|, ������� � �� ������ |h1|, ����������� 
% ����� (���������: |hold| ..., |plot()|). �� ������ ������ ������ ��������� ���������� 
% |h2|
hold on
h2 = plot(T.DATE, T.TT);
hold off
%
%% ������ ������
% 8. � ���������� |r| �������� �������� ��������� ������ |TT| (���������: |end|, 
% |1|)
r = T.TT(end) - T.TT(1);
% 9. � ���������� |t| �������� ��������� �������� ����� ������� � ����� 
% �� ������� |YEARS| (���������: |end|, |1|)
t = T.YEARS(end) - T.YEARS(1);
% ����� �������, �� ������, ��� ������� ����������� � ������ ������� �� 
% |r| �������� �� |t| ���.
% 10. �������� ����������� ����������� �������� � ���������� |v| (������/���)
v = r/t;
% _2018 � ���� ����������_