function out = crc_8_gsm_b(message, check)
%--settings-------
% width   = 8
% poly    = 0x49
% init    = 0x00
% refin   = false
% refout  = false
% xorout  = 0xff
% check   = 0x94 for ASCII:"123456789"
% residue = 0x53
% name    = "CRC-8/GSM-B"
% Class: academic
% ETSI TS 100 909 version 8.9.0 (January 2005)
% - Full mathematical description (Section 5.1.5.1.3, p.71 — 
%                                  Section 5.1.5.2.2, p.73 — 
%                                  Section 5.1.9.1.3, p.80 — 
%                                  Section 5.1.9.2.2, p.83 — 
%                                  Section 5.1.11.1.3, pp.86–7 —
%                                  Section 5.1.11.2.2, p.89)

crc.width   = 8;
crc.poly    = [0 1 0 0   1 0 0 1];% x^8 + x^6 + x^3 + x^0 (0x49)
crc.init    = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0];% (0x00)
crc.residue = [0 1 0 1   0 0 1 1];% (0x53)
crc.refin   = false;
crc.refout  = false;
crc.xorout  = true(1,length(crc.poly));% [1 1 1 1   1 1 1 1];% (0xff)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out =  binaryVectorToHex(crc.calc_bin);

end
