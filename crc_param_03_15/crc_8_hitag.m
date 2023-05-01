function out = crc_8_hitag(message, check)
%--settings-------
% width   = 8
% poly    = 0x1d
% init    = 0xff
% refin   = false
% refout  = false
% xorout  = 0x00
% check   = 0xb4 for ASCII:"123456789"
% residue = 0x00
% name    = "CRC-8/HITAG"
% Class: attested
% Contributed by Philippe Teuwen.
% Used in RFID applications.
% Philips Semiconductors (4 October 2001), HITAG core module hardware HTCM400 Product Specification (courtesy of Digi-Key Electronics)
% - Definition: Width, Poly, Init (Section 7.6.1, p.10)
% Philips Semiconductors (18 July 2006), HTS IC H32/HTS IC H56/HTS IC H48 transponder IC Product Specification, revision 3.1 (courtesy of Digi-Key Electronics)
% - Definition: Width, Poly, Init (Section 13.1, p.45 — Section 13.2.2, p.45)
% - Code: C (Section 13.3, p.46)
% - 1 codeword (Section 13.3, p.46)
%   00000001​01100011​01000000​01101101​10100100​11110 (source: 00000 + 2C680DB4​9E)
% "Sixkay" (July–August 2015), Proxmark3 community forum post
% - 1 codeword
%   CA9340FF​C6
% reveng -m CRC-8/HITAG -a 1 -A 8 -X -c 00000001​01100011​01000000​01101101​10100100​11110 11001010​10010011​01000000​11111111​11000110 → 00 00

crc.width   = 8;
crc.poly    = [0 0 0 1   1 1 0 1];% x^8 + x^4 + x^3 + x^2 + x^0 (0x1d)
crc.init    = true(1,length(crc.poly));% [1 1 1 1   1 1 1 1];% (0xff)
crc.residue = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0];% (0x00)
crc.refin   = false;
crc.refout  = false;
crc.xorout  = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0];% (0x00)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out =  binaryVectorToHex(crc.calc_bin);

end
