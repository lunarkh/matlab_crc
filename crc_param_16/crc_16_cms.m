function out = crc_16_cms(message, check)
%--settings-------
% width   = 16
% poly    = 0x8005
% init    = 0xffff
% refin   = false
% refout  = false
% xorout  = 0x0000
% check   = 0xaee7 for ASCII:"123456789"
% residue = 0x0000
% name    = "CRC-16/CMS"
% Class: third-party
% Dainius Šimelevičius, Remi K. Mommsen et al. (16 December 2016), CERN CMS Online Software (XDAQ) release 14, Event Builder source package (RPM package), files daq/evb/include/evb/CRCCalculator.h, daq/evb/src/common/CRCCalculator.cc
% - All parameters (except Residue)
% - Code: C++
% "movilstore" (24 January 2011), Computer Interfacing Forum topic 1650 (courtesy of the Internet Archive)
% - Reference to application of algorithm on Samsung mobiles
% - 5 codewords
%   02000800​78110000​F00F0000​F7E0
%   02000800​5B110000​F00F0000​4725
%   02000800​50110000​F00F0000​F71F
%   02000800​24110000​F00F0000​3636
%   02000800​A6100000​F00F0000​141A
% "xtrusion" (28 November 2010), Computer Interfacing Forum topic 1627 (courtesy of the Internet Archive)
% - 12 codewords
%   02000800​34100000​B0090000​B725
%   02000800​29100000​B0090000​E76E
%   02000800​02100000​B0090000​D79B
%   02000800​05100000​B0090000​A789
%   02000800​78100000​B0090000​F696
%   00050900​00000000​30303030​00D55E
%   01000400​05100000​3793
%   02000800​34100000​F00F0000​3740
%   02000800​29100000​F00F0000​670B
%   02000800​02100000​F00F0000​57FE
%   02000800​05100000​F00F0000​27EC
%   02000800​78100000​F00F0000​76F3
% "Robert" ("xtrusion") (25 December 2010), Computer Interfacing Forum topic 1636 (courtesy of the Internet Archive)
% - 5 codewords
%   02000C00​30100000​9A010000​00000000​837B
%   02000C00​30100000​9A010000​9A010000​4B55
%   02000C00​30100000​9A010000​34030000​934E
%   02000C00​30100000​9A010000​CE040000​5B09
%   02000C00​30100000​9A010000​68060000​A311
% Unique effective solution of codeword set

crc.width   = 16;
crc.poly    = [1 0 0 0   0 0 0 0   0 0 0 0   0 1 0 1];% x^16 + x^15 + x^2 + x^0 (0x8005)
crc.init    = true(1,length(crc.poly));% [1 1 1 1   1 1 1 1   1 1 1 1   1 1 1 1];% (0xffff)
crc.residue = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.refin   = false;
crc.refout  = false;
crc.xorout  = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out =  binaryVectorToHex(crc.calc_bin);

end
