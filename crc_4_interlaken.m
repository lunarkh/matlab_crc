function out = crc_4_interlaken(message, check)
%--settings-------
% width   = 4
% poly    = 0x3
% init    = 0xf
% refin   = false
% refout  = false
% xorout  = 0xf
% check   = 0xb for ASCII:"123456789"
% residue = 0x2
% name    = "CRC-4/INTERLAKEN"
% Class: academic
% Reference from named polynomial in Prof. Koopman's CRC Polynomial Zoo.
% The Interlaken Alliance (7 October 2008), Interlaken Protocol Definition, version 1.2
% - Definition: Width, Poly (Section 5.3.4.2, p.23)
% - Definition: Init, RefIn, RefOut, XorOut (Appendix B, p.48)

crc.width   = 4;
crc.poly    = [0 0 1 1];% x^3 + x^1 + x^0 (0x3)
crc.init    = true(1,length(crc.poly));% [1 1 1 1];% (0xf)
crc.residue = [0 0 1 0];% (0x2)
crc.refin   = false;
crc.refout  = false;
crc.xorout  = true(1,length(crc.poly));% [1 1 1 1];% (0xf)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out =  binaryVectorToHex(crc.calc_bin);

end
