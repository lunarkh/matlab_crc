function out = crc_15_mpt1327(message, check)
%--settings-------
% width   = 15
% poly    = 0x6815
% init    = 0x0000
% refin   = false
% refout  = false
% xorout  = 0x0001
% check   = 0x2566 for ASCII:"123456789"
% residue = 0x6815
% name    = "CRC-15/MPT1327"
% Class: attested
% MX-COM reference from Koopman and Chakravarty (2004).
% UK Radiocommunications Agency (20 June 1997), MPT 1327:
% A signalling standard for trunked private land mobile radio systems,
% 3rd edition (courtesy of UK National Archives)
% - Full mathematical description (Section 3.2.3, p.3-3)
% - Error control properties (Appendix 2, p.A2-1)
% - 1 codeword (Section 5.1.1, p.5-3; Appendix 3, p.A3-1)
%   10101010​10101010​11000100​11010100​00000000​00000000​00000000​00000001​01010101​01010101​10001001​101011
% "whiteox11" (28 December 2011), "mpt1327 decoding" (video, embedded content; courtesy of YouTube)
% - Transcript confirming implementation with 25 codewords (selection)
%   10011111​11010010​10110100​11110011​11111011​01000100​01001111​0010110
%   10101001​11000101​01100000​10100000​11011100​01101100​11101011​1011101
%   10011111​11010001​01001010​01110010​01101001​01011000​10010010​1110000
%   10011010​01000111​11000100​01101000​00001010​10101010​10111111​0011100
%   10101011​10010110​10110100​00110010​01011110​10100000​11000010​0000100
% "radiowavemaniac" (21 November 2012), "RTL-SDR Trunkview Decoder MPT1327" (video, embedded content; courtesy of YouTube)
% - Transcript confirming implementation with 10 codewords
%   10001010​00001100​00001100​01110010​00001000​01111000​11111100​0110000
%   10001110​00001100​00001100​01110000​00010000​00000000​00001101​0100110
%   10010011​01110000​11010100​01000011​11111111​10010000​00101110​1110100
%   10010011​01100111​10011100​01000011​11111111​10010000​01100110​0110101
%   10010011​01100111​10011100​11010010​01100001​01111100​01010000​1100011
%   10010011​11111111​11100100​01011101​10011110​01111000​10101111​1101011
%   10010011​00001011​11100100​00100101​10011110​01110000​11100100​0011011
%   10010011​00001011​11100100​00100001​10011110​01100000​00100011​0011011
%   10010011​01100110​10100100​01000011​11111111​10010000​01101111​1000111
%   10010011​01100110​10110100​01000011​11111111​10010000​10111111​0001110
% MX-COM, Inc. (17 August 1998), Error detection and correction of MPT1327
% formatted messages using MX429A or MX809 devices (courtesy of the Internet Archive)
% - Full mathematical description (Section 1.2.1, p.1)
% - Worked example (Section 1.2.2, p.2)
% - Code: C (Section 1.2.3, p.3)
% reveng -m CRC-15/MPT1327 -t -X -c 9FD2B4F3​FB44 → 4F2C
% Unique effective solution of codeword set

crc.width   = 15;
crc.poly    = [1 1 0   1 0 0 0   0 0 0 1   0 1 0 1];% x^15 + x^14 + x^13 + x^11 + x^4 + x^2 + x^0(0x6815)
crc.init    = false(1,length(crc.poly));% [0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.residue = [1 1 0   1 0 0 0   0 0 0 1   0 1 0 1];% (0x6815)
crc.refin   = false;
crc.refout  = false;
crc.xorout  = [0 0 0   0 0 0 0   0 0 0 0   0 0 0 1];% (0x0001)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out = dec2hex(bin2dec(num2str((crc.calc_bin))),4);

end
