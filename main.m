clc;% clear command window
% for check https://crccalc.com/
message = '313233343536373839';% ASCII:"123456789"
% message = '41424344434146454641434531323334';% ASCII:"ABCDCAFEFACE1234"

disp(" message = " + message + " hex"); disp(" ");
crc_less_16;% crc less than 16
crc_equal_16_and_less_32;% crc equals 16 and les than 32
crc_equal_32_and_over;% crc equals 32 and more
