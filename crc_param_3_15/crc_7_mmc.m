function out = crc_7_mmc(message, check)
%--settings-------
% width   = 7
% poly    = 0x09
% init    = 0x00
% refin   = false
% refout  = false
% xorout  = 0x00
% check   = 0x75 for ASCII:"123456789"
% residue = 0x00
% name    = "CRC-6/GSM"
% Class: academic
% ETSI TS 100 909 version 8.9.0 (January 2005)
% - Full mathematical description (Section 3.9.4.3, pp.31–3 — Section 3.10.7.3, pp.47–9 — Section 4.6, p.64 — Section 5.3.2, p.95)

crc.width   = 7;
crc.poly    = [0 0 0   1 0 0 1];% x^7 + x^3 + x^0 (0x09)
crc.init    = false(1,length(crc.poly));% [0 0 0   0 0 0 0];% (0x00)
crc.residue = false(1,length(crc.poly));% [0 0 0   0 0 0 0];% (0x00)
crc.refin   = false;
crc.refout  = false;
crc.xorout  = false(1,length(crc.poly));% [0 0 0   0 0 0 0];% (0x00)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out =  binaryVectorToHex(crc.calc_bin);

end
