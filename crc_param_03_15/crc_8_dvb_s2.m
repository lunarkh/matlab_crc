function out = crc_8_dvb_s2(message, check)
%--settings-------
% width   = 8
% poly    = 0xd5
% init    = 0x00
% refin   = false
% refout  = false
% xorout  = 0x00
% check   = 0xbc for ASCII:"123456789"
% residue = 0x00
% name    = "CRC-8/DVB-S2"
% Class: attested
% The single codeword is supported by the codewords confirming CRC-6/DARC, defined identically apart from Poly in the same standard.
% ETSI EN 300 751 version 1.2.1 (January 2003)
% - Definition: Width, Poly (Section 11.2.3, p.68)
% - Definition: RefIn, RefOut (Section 12, pp.69–70)
% - 1 codeword (Section 11.2.3, p.68)
%   00000001​00000011​11010111
% - See section 12 for details of the transmission order.

crc.width   = 8;
crc.poly    = [1 1 0 1   0 1 0 1];% x^8 + x^7 + x^6 + x^4 + x^2 + x^0 (0xd5)
crc.init    = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0];% (0x00)
crc.residue = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0];% (0x00)
crc.refin   = false;
crc.refout  = false;
crc.xorout  = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0];% (0x00)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out = dec2hex(bin2dec(num2str((crc.calc_bin))),2);

end
