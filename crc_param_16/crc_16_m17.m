function out = crc_16_m17(message, check)
%--settings-------
% width   = 16
% poly    = 0x5935
% init    = 0xffff
% refin   = false
% refout  = false
% xorout  = 0x0000
% check   = 0x772b for ASCII:"123456789"
% residue = 0x0000
% name    = "CRC-16/M17"
% Class: attested
% Contributed by Mark Adler.
% M17 Project (8 Mar 2022), M17 protocol specification: Data link layer
% - Definition: Width, Poly, Init, RefIn, RefOut, Check
% - 3 codewords
%   FFFF
%   41206E
%   256 bytes (i) plus 1C31

crc.width   = 16;
crc.poly    = [0 1 0 1   1 0 0 1   0 0 1 1   0 1 0 1];% x^16 + x^14 + x^12 + x^11 + x^8 + x^7 + x^4 + x^2 + x^0 (0x5935)
crc.init    = true(1,length(crc.poly));% [1 1 1 1   1 1 1 1   1 1 1 1   1 1 1 1];% (0xffff)
crc.residue = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.refin   = false;
crc.refout  = false;
crc.xorout  = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out = dec2hex(bin2dec(num2str((crc.calc_bin))),4);

end
