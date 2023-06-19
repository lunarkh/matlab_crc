function out = crc_7_umts(message, check)
%--settings-------
% width   = 7
% poly    = 0x45
% init    = 0x00
% refin   = false
% refout  = false
% xorout  = 0x00
% check   = 0x61 for ASCII:"123456789"
% residue = 0x00
% name    = "CRC-7/UMTS"
% Class: academic
% Reference from named polynomial in Prof. Koopman's CRC Polynomial Zoo.
% 3rd Generation Partnership Project (3GPP) TS 25.427 version 17.0.0 (April 2022) (zipped MS Word document) — ETSI TS 125 427 version 17.0.0 (April 2022)
% - Definition: Width, Poly, Init, XorOut (Section 7.2.1, p.40)
% - Definition: RefIn, RefOut (Section 6.1.1, p.20; Section 7.2.1.1, pp.40–1)

crc.width   = 7;
crc.poly    = [1 0 0   0 1 0 1];% x^7 + x^6 + x^2 + x^0 (0x45)
crc.init    = false(1,length(crc.poly));% [0 0 0   0 0 0 0];% (0x00)
crc.residue = false(1,length(crc.poly));% [0 0 0   0 0 0 0];% (0x00)
crc.refin   = false;
crc.refout  = false;
crc.xorout  = false(1,length(crc.poly));% [0 0 0   0 0 0 0];% (0x00)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out = dec2hex(bin2dec(num2str((crc.calc_bin))),2);

end
