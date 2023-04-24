function out = crc_3_gsm(message, check)
%--settings-------
% width   = 3
% poly    = 0x3
% init    = 0x0
% refin   = false
% refout  = false
% xorout  = 0x7
% check   = 0x4 for ASCII:"123456789"
% residue = 0x2
% name    = "CRC-3/GSM"
% Class: academic
% ETSI TS 100 909 version 8.9.0 (January 2005)
% - Full mathematical description (Section 3.1.2.1, p.18 — Section 3.2.1, p.20)

crc.width   = 3;
crc.poly    = [0 1 1];% x^3 + x^1 + x^0 (0x3)
crc.init    = false(1,length(crc.poly));% [0 0 0];% (0x0)
crc.residue = [0 1 0];% (0x2)
crc.refin   = false;
crc.refout  = false;
crc.xorout  = true(1,length(crc.poly));% [1 1 1];% (0x7)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out =  binaryVectorToHex(crc.calc_bin);

end
