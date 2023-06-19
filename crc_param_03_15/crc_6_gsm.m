function out = crc_6_gsm(message, check)
%--settings-------
% width   = 6
% poly    = 0x2f
% init    = 0x00
% refin   = false
% refout  = false
% xorout  = 0x3f
% check   = 0x13 for ASCII:"123456789"
% residue = 0x3a
% name    = "CRC-6/GSM"
% Class: academic
% ETSI TS 100 909 version 8.9.0 (January 2005)
% - Full mathematical description (Section 3.9.4.3, pp.31–3 — Section 3.10.7.3, pp.47–9 — Section 4.6, p.64 — Section 5.3.2, p.95)

crc.width   = 6;
crc.poly    = [1 0   1 1 1 1];% x^6 + x^5 + x^3 + x^2 + x^1 + x^0 (0x2f)
crc.init    = false(1,length(crc.poly));% [0 0   0 0 0 0];% (0x00)
crc.residue = [1 1   1 0 1 0];% (0x3a)
crc.refin   = false;
crc.refout  = false;
crc.xorout  = true(1,length(crc.poly));% [1 1   1 1 1 1];% (0x3f)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out = dec2hex(bin2dec(num2str((crc.calc_bin))),2);

end
