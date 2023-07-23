function out = crc_16_riello(message, check)
%--settings-------
% width   = 16
% poly    = 0x1021
% init    = 0xb2aa
% refin   = true
% refout  = true
% xorout  = 0x0000
% check   = 0x63d0 for ASCII:"123456789"
% residue = 0x0000
% name    = "CRC-16/PROFIBUS"
% Class: third-party
% Reported for a Riello Dialog UPS.
% "Snamprogetti" (17 April 2009), Computer Interfacing Forum topic 1305 (courtesy of the Internet Archive)
% - Definition: Width, Poly, Init
% - Algorithm reported to be CRC-CCITT, implying RefIn and RefOut.
% - 1 codeword
%   20225253​30308790
% Created: 18 April 2009

crc.width   = 16;
crc.poly    = [0 0 0 1   0 0 0 0   0 0 1 0   0 0 0 1];% x^16 + x^12 + x^5 + x^0 (0x1021)
crc.init    = [1 0 1 1   0 0 1 0   1 0 1 0   1 0 1 0];% (0xb2aa)
crc.residue = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.refin   = true;
crc.refout  = true;
crc.xorout  = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.init, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out = dec2hex(bin2dec(num2str((crc.calc_bin))),4);

end
