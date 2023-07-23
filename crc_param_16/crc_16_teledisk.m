function out = crc_16_teledisk(message, check)
%--settings-------
% width   = 16
% poly    = 0xa097
% init    = 0x0000
% refin   = false
% refout  = false
% xorout  = 0x0000
% check   = 0x0fb3 for ASCII:"123456789"
% residue = 0x0000
% name    = "CRC-16/TELEDISK"
% Class: confirmed
% Used in the Teledisk disc archive format. DECnet and CRCK allegedly use a Sick-type algorithm but with this polynomial.
% Will Kranz (8 December 2002), wteledsk 1.01
% - Implementation
% Will Kranz (8 December 2002), wteledsk 1.01 module src/tdcrc.c
% - Code: C

crc.width   = 16;
crc.poly    = [1 0 1 0   0 0 0 0   1 0 0 1   0 1 1 1];% x^16 + x^15 + x^13 + x^7 + x^4 + x^2 + x^1 + x^0 (0xa097)
crc.init    = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.residue = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.refin   = false;
crc.refout  = false;
crc.xorout  = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.init, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out = dec2hex(bin2dec(num2str((crc.calc_bin))),4);

end
