function out = crc_7_rohc(message, check)
%--settings-------
% width   = 7
% poly    = 0x4f
% init    = 0x7f
% refin   = true
% refout  = true
% xorout  = 0x00
% check   = 0x53 for ASCII:"123456789"
% residue = 0x00
% name    = "CRC-7/ROHC"
% Class: academic
% IETF RFC 3095 (July 2001)
% - Definition: Width, Poly, Init (Section 5.9.2, pp.125–6)
% Andreas Vernersson et al. (26 May 2003), rohc 1.0 module rohc-1.0/rohc/src/c_util.c
% - Code: C

crc.width   = 7;
crc.poly    = [1 0 0   1 1 1 1];% x^7 + x^6 + x^3 + x^2 + x^1 + x^0 (0x4f)
crc.init    = true(1,length(crc.poly));% [1 1 1   1 1 1 1];% (0x7f)
crc.residue = false(1,length(crc.poly));% [0 0 0   0 0 0 0];% (0x00)
crc.refin   = true;
crc.refout  = true;
crc.xorout  = false(1,length(crc.poly));% [0 0 0   0 0 0 0];% (0x00)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out = dec2hex(bin2dec(num2str((crc.calc_bin))),2);

end
