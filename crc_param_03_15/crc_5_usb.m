function out = crc_5_usb(message, check)
%--settings-------
% width   = 5
% poly    = 0x05
% init    = 0x1f
% refin   = true
% refout  = true
% xorout  = 0x1f
% check   = 0x19 for ASCII:"123456789"
% residue = 0x06
% name    = "CRC-5/USB"
% Class: third-party
% Anonymous (10 July 1997), "Cyclic Redundancy Checks in USB" (Draft) (courtesy of the Internet Archive)
% - Definition: Width, Poly, Init, XorOut (p.2)
% - Definition: Residue (p.3)
% - Code: Perl (pp.3–4)
% - 4 codewords (p.5)
%   10101000​11110111
%   01011100​10111100
%   00001110​01001110
%   10000000​00010111

crc.width   = 5;
crc.poly    = [0 0 1 0 1];% x^5 + x^2 + x^0 (0x15)
crc.init    = true(1,length(crc.poly));% [1 1 1 1 1];% (0x1f)
crc.residue = [0 0 1 1 0];% (0x06)
crc.refin   = true;
crc.refout  = true;
crc.xorout  = true(1,length(crc.poly));% [1 1 1 1 1];% (0x00)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out = dec2hex(bin2dec(num2str((crc.calc_bin))),2);

end
