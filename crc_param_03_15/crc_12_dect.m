function out = crc_12_dect(message, check)
%--settings-------
% width   = 12
% poly    = 0x80f
% init    = 0x000
% refin   = false
% refout  = false
% xorout  = 0x000
% check   = 0xf5b for ASCII:"123456789"
% residue = 0x000
% name    = "CRC-12/DECT"
% Class: academic
% Alias: X-CRC-12
% ETSI EN 300 175-3 version 2.5.1 (August 2013)
% - Definition: Residue; full mathematical description (Section 6.2.5.4, pp.99–101)

crc.width   = 12;
crc.poly    = [1 0 0 0   0 0 0 0   1 1 1 1];% x^12 + x^11 + x^4  + x^3 + x^1 + x^0(0x80f)
crc.init    = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0];% (0x000)
crc.residue = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0];% (0x000)
crc.refin   = false;
crc.refout  = false;
crc.xorout  = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0];% (0x000)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out =  binaryVectorToHex(crc.calc_bin);

end
