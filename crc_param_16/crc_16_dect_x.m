function out = crc_16_dect_x(message, check)
%--settings-------
% width   = 16
% poly    = 0x0589
% init    = 0x0000
% refin   = false
% refout  = false
% xorout  = 0x0000
% check   = 0x007f for ASCII:"123456789"
% residue = 0x0589
% name    = "CRC-16/DECT-X"
% Class: attested
% Alias: X-CRC-16
% The single codeword is supported by the implementation confirming CRC-16/DECT-R,
% defined identically apart from XorOut in the same standard. Used in DECT B-fields.
% ETSI EN 300 175-3 version 2.5.1 (August 2013)
% - Definition: Residue; full mathematical description (Section 6.2.5.4, pp.99–101)
% - Performance of polynomial (Annex B, p.297)
% "Nick" (27 November 2010), StackOverflow submitted question
% - 1 codeword
%   A37029

crc.width   = 16;
crc.poly    = [0 0 0 0   0 1 0 1   1 0 0 0   1 0 0 1];% x^16 + x^10 + x^8 + x^7 + x^3 + x^0 (0x0589)
crc.init    = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.residue = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.refin   = false;
crc.refout  = false;
crc.xorout  = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out =  binaryVectorToHex(crc.calc_bin);

end
