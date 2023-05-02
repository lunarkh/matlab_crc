function out = crc_8_wcdma(message, check)
%--settings-------
% width   = 8
% poly    = 0x9b
% init    = 0x00
% refin   = true
% refout  = true
% xorout  = 0x00
% check   = 0x25 for ASCII:"123456789"
% residue = 0x00
% name    = "CRC-8/WCDMA"
% Class: third-party
% Andrew Richardson (17 March 2005), WCDMA Design Handbook,
% Cambridge University Press, ISBN 0-521-82815-5 (embedded content)
% - Definition: Width, Poly, Residue (Section 7.1.3, Table 7.3, p.223)
% - Shift register diagram (Figure 7.4, p.223)
% Prof. Philip Koopman, Tridib Chakravarty (June 2004),
% Cyclic Redundancy Code (CRC) Polynomial Selection for Embedded Networks
% - Assessment of polynomial performance (as 0xCD or WCDMA-8)
% "Max" (26 October 2009), Computer Interfacing Forum topic 1431 (courtesy of the Internet Archive)
% - 46 codewords (selection)
%   00001148
%   00012077
%   80800012
%   00001021​01002200​0A002D00​00000000​00460A20
%   00001021​01012300​0A002800​00000000​00460A54
%   00001021​01012500​0A002900​00000000​00460A4B
%   40001020​0B01001A​000A0001​00000000​00800900​1F01F393
%   40001020​0B01001F​000A0001​00000000​00000900​1F01F3F7
%   40001020​0B010020​000A0001​00000000​00000900​1F01F331
%   40001107​083829B4​1903
%   40001107​08482668​2180
%   40001107​085C2934​17A8
% - 1 non-matching codeword
%   00001268 ≠ …8B
% Unique effective solution of codeword set

crc.width   = 8;
crc.poly    = [1 0 0 1   1 0 1 1];% x^8 + x^7 + x^4 + x^3 + x^1 + x^0 (0x9b)
crc.init    = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0];% (0x00)
crc.residue = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0];% (0x00)
crc.refin   = true;
crc.refout  = true;
crc.xorout  = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0];% (0x00)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out =  binaryVectorToHex(crc.calc_bin);

end
