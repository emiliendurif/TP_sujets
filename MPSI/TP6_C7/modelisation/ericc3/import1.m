%% Import data from text file.
% Script for importing data from the following text file:
%
%    C:\Users\canar\OneDrive\Google Drive\CPGEDesc\3 - TP sup\Axnum\BFV100VI.csv
%
% To extend the code to different selected data or a different text file,
% generate a function instead of a script.

% Auto-generated by MATLAB on 2016/11/30 02:43:09

%% Initialize variables.
%filename = 'essais/essai_horizontal1.csv';
filename = 'essais/essai_pos1_kp1000000.csv';
delimiter = ';';
startRow = 5;

%% Format for each line of text:
%   column1: double (%f)
%	column2: double (%f)
%   column3: double (%f)
%	column4: double (%f)
%   column5: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%f%f%f%f%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to the format.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'HeaderLines' ,startRow-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Allocate imported array to column variable names
theta = dataArray{:, 1};
Um = dataArray{:, 2};
omega = dataArray{:, 3};
Im = dataArray{:, 4};



%% Clear temporary variables
clearvars filename delimiter startRow formatSpec fileID dataArray ans;