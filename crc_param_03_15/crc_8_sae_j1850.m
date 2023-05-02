function out = crc_8_sae_j1850(message, check)
%--settings-------
% width   = 8
% poly    = 0x1d
% init    = 0xff
% refin   = false
% refout  = false
% xorout  = 0xff
% check   = 0x4b for ASCII:"123456789"
% residue = 0xc4
% name    = "CRC-8/SAE-J1850"
% Class: attested
% SAE Standard J1850 (15 May 1994), Excerpt (courtesy of Michael Wolf, AVRFreaks)
% - Definition: Width, Poly, Init, XorOut, Residue (Section 5.4.1, p.14)
% - 7 codewords (Table 1, p.15)
%   00000000​59
%   F2018337
%   0FAA0055​79
%   00FF5511​B8
%   332255AA​BBCCDDEE​FFCB
%   926B558C
%   FFFFFFFF​74
% AUTOSAR (25 November 2021), AUTOSAR Classic Platform release R21-11, Specification of CRC Routines
% - Comprehensive primer on CRC theory (Section 7.1, pp.19–22)
% - All parameters (Section 7.2.1.1, p.24)
% - 7 codewords (same as in SAE Standard J1850) (Section 7.2.1.1, p.24)
% "knivmannen" (24 May 2010), StackOverflow submitted question
% - 5 codewords
%   55FF0000​ECFF601F
%   55FF0000​F0FFA038
%   660BEAFF​BFFFC0CA
%   5E18EAFF​B7FF60BD
%   F6301600​FCFE1081
% Unique effective solution of codeword set

crc.width   = 8;
crc.poly    = [0 0 0 1   1 1 0 1];% x^8 + x^4 + x^3 + x^2 + x^0 (0x1d)
crc.init    = true(1,length(crc.poly));% [1 1 1 1   1 1 1 1];% (0xff)
crc.residue = [1 1 0 0   0 1 0 0];% (0xc4)
crc.refin   = false;
crc.refout  = false;
crc.xorout  = true(1,length(crc.poly));% [1 1 1 1   1 1 1 1];% (0xff)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out =  binaryVectorToHex(crc.calc_bin);

end
