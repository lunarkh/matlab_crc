function out = crc_11_umts(message, check)
%--settings-------
% width   = 11
% poly    = 0x307
% init    = 0x000
% refin   = false
% refout  = false
% xorout  = 0x000
% check   = 0x061 for ASCII:"123456789"
% residue = 0x000
% name    = "CRC-11/UMTS"
% Class: academic
% Reference from named polynomial in Prof. Koopman's CRC Polynomial Zoo.
% 3rd Generation Partnership Project (3GPP) TS 25.427 version 17.0.0 (April 2022) (zipped MS Word document) — ETSI TS 125 427 version 17.0.0 (April 2022)
% - Definition: Width, Poly, Init, XorOut (Section 7.2.1, p.40)
% - Definition: RefIn, RefOut (Section 6.1.1, p.20; Section 7.2.1.1, pp.40–1)

crc.width   = 11;
crc.poly    = [0 1 1   0 0 0 0   0 1 1 1];% x^11 + x^9 + x^8 + x^2 + x^1 + x^0(0x307)
crc.init    = false(1,length(crc.poly));% [0 0 0   0 0 0 0   0 0 0 0];% (0x000)
crc.residue = false(1,length(crc.poly));% [0 0 0   0 0 0 0   0 0 0 0];% (0x000)
crc.refin   = false;
crc.refout  = false;
crc.xorout  = false(1,length(crc.poly));% [0 0 0   0 0 0 0   0 0 0 0];% (0x000)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out =  binaryVectorToHex(crc.calc_bin);

end
