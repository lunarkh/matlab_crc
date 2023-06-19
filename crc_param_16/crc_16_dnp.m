function out = crc_16_dnp(message, check)
%--settings-------
% width   = 16
% poly    = 0x3d65
% init    = 0x0000
% refin   = true
% refout  = true
% xorout  = 0xffff
% check   = 0xea82 for ASCII:"123456789"
% residue = 0x66c5
% name    = "CRC-16/DNP"
% Class: confirmed
% Lammert Bies (August 2011), CRC calculator
% - Implementation

crc.width   = 16;
crc.poly    = [0 0 1 1   1 1 0 1   0 1 1 0   0 1 0 1];% x^16 + x^13 + x^12 + x^11 + x^10 + x^8 + x^6 + x^5 + x^2 + x^0 (0x3d65)
crc.init    = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.residue = [0 1 1 0   0 1 1 0   1 1 0 0   0 1 0 1];% (0x66c5)
crc.refin   = true;
crc.refout  = true;
crc.xorout  = true(1,length(crc.poly));% [1 1 1 1   1 1 1 1   1 1 1 1   1 1 1 1];% (0xffff)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out = dec2hex(bin2dec(num2str((crc.calc_bin))),4);

end
