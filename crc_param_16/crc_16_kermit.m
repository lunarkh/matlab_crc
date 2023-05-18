function out = crc_16_kermit(message, check)
%--settings-------
% width   = 16
% poly    = 0x1021
% init    = 0x0000
% refin   = true
% refout  = true
% xorout  = 0x0000
% check   = 0x2189 for ASCII:"123456789"
% residue = 0x0000
% name    = "CRC-16/KERMIT"

crc.width   = 16;
crc.poly    = [0 0 0 1   0 0 0 0   0 0 1 0   0 0 0 1];% x^16 + x^12 + x^5 + x^0 (0x1021)
crc.init    = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.residue = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.refin   = true;
crc.refout  = true;
crc.xorout  = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out =  binaryVectorToHex(crc.calc_bin);

end
