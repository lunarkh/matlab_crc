function out = crc_8_tech_3250(message, check)
%--settings-------
% width   = 8
% poly    = 0x1d
% init    = 0xff
% refin   = true
% refout  = true
% xorout  = 0x00
% check   = 0x97 for ASCII:"123456789"
% residue = 0x00
% name    = "CRC-8/TECH-3250"
% Class: attested
% Alias: CRC-8/AES, CRC-8/EBU
% Reference from StackOverflow question by "ZeroDefect" (18 June 2012)
% European Broadcasting Union (8 June 2004), Tech 3250: Specification of the digital audio interface, 3rd edition
% - Definition: Width, Poly, Init (Section 4, p.12)
% - Shift register diagrams (Appendix 1, p.17)
% - 2 codewords (Appendix 1, pp.17–18)
%   3D020000​02000000​00000000​00000000​00000000​0000009B
%   01000000​00000000​00000000​00000000​00000000​00000032

crc.width   = 8;
crc.poly    = [0 0 0 1   1 1 0 1];% x^8 + x^4 + x^3 + x^2 + x^0 (0x1d)
crc.init    = true(1,length(crc.poly));% [1 1 1 1   1 1 1 1];% (0xff)
crc.residue = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0];% (0x00)
crc.refin   = true;
crc.refout  = true;
crc.xorout  = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0];% (0x00)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out =  binaryVectorToHex(crc.calc_bin);

end
