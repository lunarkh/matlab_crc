function out = crc_3_rohc(message, check)
%--settings-------
% width   = 3
% poly    = 0x3
% init    = 0x7
% refin   = true
% refout  = true
% xorout  = 0x0
% check   = 0x6 for ASCII:"123456789"
% residue = 0x0
% name    = "CRC-3/ROHC"
% Class: academic
% IETF RFC 3095 (July 2001)
%  - Definition: Width, Poly, Init (Section 5.9.2, pp.125–6)
% Andreas Vernersson et al. (26 May 2003), rohc 1.0 module rohc-1.0/rohc/src/c_util.c
%  - Code: C

crc.width   = 3;
crc.poly    = [0 1 1];% x^3 + x^1 + x^0 (0x3)
crc.init    = true(1,length(crc.poly));% [1 1 1];% (0x7)
crc.residue = [0 0 0];% (0x0)
crc.refin   = true;
crc.refout  = true;
crc.xorout  = false(1,length(crc.poly));% [0 0 0];% (0x0)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out =  binaryVectorToHex(crc.calc_bin);

end
