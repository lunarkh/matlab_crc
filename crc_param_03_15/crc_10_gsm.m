function out = crc_10_gsm(message, check)
%--settings-------
% width   = 10
% poly    = 0x175
% init    = 0x000
% refin   = false
% refout  = false
% xorout  = 0x3ff
% check   = 0x12a for ASCII:"123456789"
% residue = 0x0c6
% name    = "CRC-10/GSM"
% Class: academic
% ETSI TS 100 909 version 8.9.0 (January 2005)
% - Full mathematical description (Section 4.7, p.65)

crc.width   = 10;
crc.poly    = [0 1   0 1 1 1   0 1 0 1];% x^10 + x^8 + x^6 + x^5 + x^4 + x^2 + x^0(0x175)
crc.init    = false(1,length(crc.poly));% [0 0   0 0 0 0   0 0 0 0];% (0x000)
crc.residue = [0 0   1 1 0 0   0 1 1 0];% (0x0c6)
crc.refin   = false;
crc.refout  = false;
crc.xorout  = true(1,length(crc.poly));% [1 1   1 1 1 1   1 1 1 1];% (0x3ff)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out = dec2hex(bin2dec(num2str((crc.calc_bin))),4);

end
