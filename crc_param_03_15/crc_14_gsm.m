function out = crc_14_gsm(message, check)
%--settings-------
% width   = 14
% poly    = 0x202d
% init    = 0x0000
% refin   = false
% refout  = false
% xorout  = 0x3fff
% check   = 0x30ae for ASCII:"123456789"
% residue = 0x031e
% name    = "CRC-14/GSM"
% Class: academic
% ETSI TS 100 909 version 8.9.0 (January 2005)
% - Full mathematical description (Section 3.9.1.2, p.28 — 
%   Section 3.9.5.2, p.40 — Section 3.10.1.2, p.42 — Section 3.10.9.2, p.54)

crc.width   = 14;
crc.poly    = [1 0   0 0 0 0   0 0 1 0   1 1 0 1];% x^14 + x^13 + x^5 + x^3 + x^2 + x^0(0x202d)
crc.init    = false(1,length(crc.poly));% [0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.residue = [0 0   0 0 1 1   0 0 0 1   1 1 1 0];% (0x031e)
crc.refin   = false;
crc.refout  = false;
crc.xorout  = true(1,length(crc.poly));% [1 1   1 1 1 1   1 1 1 1   1 1 1 1];% (0x3fff)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out =  binaryVectorToHex(crc.calc_bin);

end
