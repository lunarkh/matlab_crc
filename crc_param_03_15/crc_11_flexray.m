function out = crc_11_flexray(message, check)
%--settings-------
% width   = 11
% poly    = 0x385
% init    = 0x01a
% refin   = false
% refout  = false
% xorout  = 0x000
% check   = 0x5a3 for ASCII:"123456789"
% residue = 0x000
% name    = "CRC-11/FLEXRAY"
% Class: attested
% Alias: CRC-11
% FlexRay Consortium (October 2010), FlexRay Communications System Protocol Specification, version 3.0.1 (courtesy of nlrp Benchmark)
% - Definition: Width, Poly, Init, RefOut (Section 4.2.8, pp.114–5)
% - Pseudocode (Section 4.5, pp.118–9)
% FlexRay Consortium (October 2010), FlexRay Protocol Conformance Test Specification, version 3.0.1 (courtesy of nlrp Benchmark)
% - 1 codeword (Section 2.7.5, p.681)
%   11000000​00010000​00010000​0100110
% Robert Bosch GmbH (3 December 2007), E-Ray FlexRay IP Module, Application Note 001: Wakeup (embedded content; courtesy of Yumpu)
% - 3 codewords (Section 4.4.3, pp.27–30; researched by Vivek Rajan)
%   11000000​00001000​10000010​0011011
%   11000000​00010000​10000110​0000100
%   00000000​00011000​10001011​1010010

crc.width   = 11;
crc.poly    = [0 1 1   1 0 0 0   0 1 0 1];% x^11 + x^9 + x^8 + x^7 + x^4 + x^2 + x^0(0x385)
crc.init    = [0 0 0   0 0 0 1   1 0 1 0];% (0x01a)
crc.residue = false(1,length(crc.poly));% [0 0 0   0 0 0 0   0 0 0 0];% (0x000)
crc.refin   = false;
crc.refout  = false;
crc.xorout  = false(1,length(crc.poly));% [0 0 0   0 0 0 0   0 0 0 0];% (0x000)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out =  binaryVectorToHex(crc.calc_bin);

end
