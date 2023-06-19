function out = crc_8_maxim_dow(message, check)
%--settings-------
% width   = 8
% poly    = 0x31
% init    = 0x00
% refin   = true
% refout  = true
% xorout  = 0x00
% check   = 0xa1 for ASCII:"123456789"
% residue = 0x00
% name    = "CRC-8/MAXIM-DOW"
% Class: academic
% Reference from named polynomial in Prof. Koopman's CRC Polynomial Zoo.
% 3rd Generation Partnership Project (3GPP) TS 36.212 version 17.1.0 (March 2022) (zipped MS Word document) — ETSI TS 136 212 version 17.1.0 (April 2022)
% - Definition: Width, Poly, Init, XorOut, Residue (Section 5.1.1, pp.10–11)
% - Attachment relation, defining RefIn ^ RefOut (Section 5.1.1, p.11)
% 3rd Generation Partnership Project (3GPP) TS 36.321 version 16.6.0 (September 2021) (zipped MS Word document) — ETSI TS 136 321 version 16.6.0 (October 2021)
% - Referenced from TS 136 212 section 5.2.2.1, p.23
% - Definition: RefIn, RefOut (Section 6.1.1, p.88)

crc.width   = 8;
crc.poly    = [0 0 1 1   0 0 0 1];% x^8 + x^5 + x^4 + x^0 (0x31)
crc.init    = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0];% (0x00)
crc.residue = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0];% (0x00)
crc.refin   = true;
crc.refout  = true;
crc.xorout  = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0];% (0x00)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out = dec2hex(bin2dec(num2str((crc.calc_bin))),2);

end
