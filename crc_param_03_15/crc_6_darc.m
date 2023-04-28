function out = crc_6_darc(message, check)
%--settings-------
% width   = 6
% poly    = 0x19
% init    = 0x00
% refin   = true
% refout  = true
% xorout  = 0x00
% check   = 0x26 for ASCII:"123456789"
% residue = 0x00
% name    = "CRC-6/DARC"
% Class: attested
% ETSI EN 300 751 version 1.2.1 (January 2003)
% - Definition: Width, Poly (Section 11.2, pp.67–8)
% - Definition: RefIn, RefOut (Section 12, pp.69–70)
% - 3 codewords (Section 11.2, pp.67–8)
%   10010100​11000100
%   01010011​00011101
%   00001100​01000000​00100000​00101101
% - See section 12 for details of the transmission order.
% reveng -m CRC-6/DARC -X -c 2923 CAB8 300204B4 → 00 00 00
% reveng -m CRC-6/DARC -a 1 -A 8 -r -X -c 10010100​11 01010011​00 00001100​01000000​00100000​00 → 20 B8 B4
% Unique effective solution of codeword set

crc.width   = 6;
crc.poly    = [0 1   1 0 0 1];% x^6 + x^4 + x^3 + x^0 (0x19)
crc.init    = false(1,length(crc.poly));% [0 0   0 0 0 0];% (0x00)
crc.residue = false(1,length(crc.poly));% [0 0   0 0 0 0];% (0x00)
crc.refin   = true;
crc.refout  = true;
crc.xorout  = false(1,length(crc.poly));% [0 0   0 0 0 0];% (0x00)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out =  binaryVectorToHex(crc.calc_bin);

end
