function out = crc_8_autosar(message, check)
%--settings-------
% width   = 8
% poly    = 0x2f
% init    = 0xff
% refin   = false
% refout  = false
% xorout  = 0xff
% check   = 0xdf for ASCII:"123456789"
% residue = 0x42
% name    = "CRC-8/AUTOSAR"
% Class: attested
% AUTOSAR (25 November 2021), AUTOSAR Classic Platform release R21-11, Specification of CRC Routines
% - Comprehensive primer on CRC theory (Section 7.1, pp.19–22)
% - All parameters (Section 7.2.1.2, p.25)
% - 7 codewords (Section 7.2.1.2, p.25)
%   00000000​12
%   F20183C2
%   0FAA0055​C6
%   00FF5511​77
%   332255AA​BBCCDDEE​FF11
%   926B5533
%   FFFFFFFF​6C
% Unique effective solution of codeword set

crc.width   = 8;
crc.poly    = [0 0 1 0   1 1 1 1];% x^8 + x^5 + x^3 + x^2 + x^1 + x^0 (0x2f)
crc.init    = true(1,length(crc.poly));% [1 1 1 1   1 1 1 1];% (0xff)
crc.residue = [0 1 0 0   0 0 1 0];% (0x42)
crc.refin   = false;
crc.refout  = false;
crc.xorout  = true(1,length(crc.poly));% [1 1 1 1   1 1 1 1];% (0xff)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out = dec2hex(bin2dec(num2str((crc.calc_bin))),2);

end
