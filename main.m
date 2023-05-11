clc;% clear command window
% for check https://crccalc.com/
% https://www.lddgo.net/en/encrypt/crc
message = '313233343536373839';% ASCII:"123456789"
% message = '41424344434146454641434531323334';% ASCII:"ABCDCAFEFACE1234"

disp(" message = " + message + " hex"); disp(" ");

addpath(genpath('.\crc_param_03_15'));
addpath(genpath('.\crc_param_03_15_lut'));
crc_scr_3_15;% crc less than 16

addpath(genpath('.\crc_param_16'));
addpath(genpath('.\crc_param_16_lut'));
crc_scr_16;% crc equals 16 and les than 32

addpath(genpath('.\crc_param_17_82'));
addpath(genpath('.\crc_param_17_82_lut'));
crc_scr_17_82;% crc equals 32 and more
