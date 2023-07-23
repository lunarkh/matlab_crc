function out = crc_16_usb(message, check)
%--settings-------
% width   = 16
% poly    = 0x8005
% init    = 0xffff
% refin   = true
% refout  = true
% xorout  = 0xffff
% check   = 0xb4c8 for ASCII:"123456789"
% residue = 0xb001
% name    = "CRC-16/USB"
% Class: third-party
% CRC appended low byte first.
% Anonymous (10 July 1997), "Cyclic Redundancy Checks in USB" (Draft) (courtesy of the Internet Archive)
% - Definition: Width, Poly, Init, XorOut (p.2)
% - Definition: Residue (p.3)
% - Code: Perl (p.4)
% - 2 codewords (p.6)
%   00010203​EF7A
%   23456789​0E1C

crc.width   = 16;
crc.poly    = [1 0 0 0   0 0 0 0   0 0 0 0   0 1 0 1];% x^16 + x^15 + x^2 + x^0 (0x8005)
crc.init    = true(1,length(crc.poly));% [1 1 1 1   1 1 1 1   1 1 1 1   1 1 1 1];% (0xffff)
crc.residue = [1 0 1 1   0 0 0 0   0 0 0 0   0 0 0 1];% (0xb001)
crc.refin   = true;
crc.refout  = true;
crc.xorout  = true(1,length(crc.poly));% [1 1 1 1   1 1 1 1   1 1 1 1   1 1 1 1];% (0xffff)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.init, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out = dec2hex(bin2dec(num2str((crc.calc_bin))),4);

end
