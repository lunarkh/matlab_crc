function out = crc_8_rohc(message, check)
%--settings-------
% width   = 8
% poly    = 0x07
% init    = 0xff
% refin   = true
% refout  = true
% xorout  = 0x00
% check   = 0xd0 for ASCII:"123456789"
% residue = 0x00
% name    = "CRC-8/ROHC"
% Class: academic
% IETF RFC 3095 (July 2001)
% - Definition: Width, Poly, Init, XorOut (Section 5.9.1, p.125)
% Andreas Vernersson et al. (26 May 2003), rohc 1.0 module rohc-1.0/rohc/src/c_util.c
% - Code: C

crc.width   = 8;
crc.poly    = [0 0 0 0   0 1 1 1];% x^8 + x^2 + x^1 + x^0 (0x07)
crc.init    = true(1,length(crc.poly));% [1 1 1 1   1 1 1 1];% (0xff)
crc.residue = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0];% (0x00)
crc.refin   = true;
crc.refout  = true;
crc.xorout  = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0];% (0x00)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out = dec2hex(bin2dec(num2str((crc.calc_bin))),2);

end
