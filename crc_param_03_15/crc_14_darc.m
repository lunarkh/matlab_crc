function out = crc_14_darc(message, check)
%--settings-------
% width   = 14
% poly    = 0x0805
% init    = 0x0000
% refin   = true
% refout  = true
% xorout  = 0x0000
% check   = 0x082d for ASCII:"123456789"
% residue = 0x0000
% name    = "CRC-14/DARC"
% Class: attested
% The single codeword is supported by the codewords confirming CRC-6/DARC,
% defined identically apart from Poly in the same standard. The source presents the codeword in transmission order,
% whereas the codeword is composed of the bytes of data sent LSB first. The CRC mask is …FF 3F.
% ETSI EN 300 751 version 1.2.1 (January 2003)
% - Definition: Width, Poly (Section 11.1, p.67)
% - Definition: RefIn, RefOut (Section 12, pp.69–70)
% - 1 codeword (Section 11.1, p.67)
%   02000102​37205052​4F4A4543​54204D41​494E4D45​4E553B08 (source: 40008040​EC040A4A​F252A2C2​2A04B282​9272B2A2​72AADC10)
% - See section 12 for details of the transmission order.

crc.width   = 14;
crc.poly    = [0 0   1 0 0 0   0 0 0 0   0 1 0 1];% x^14 + x^11 + x^2 + x^0(0x0805)
crc.init    = false(1,length(crc.poly));% [0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.residue = false(1,length(crc.poly));% [0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.refin   = true;
crc.refout  = true;
crc.xorout  = false(1,length(crc.poly));% [0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out = dec2hex(bin2dec(num2str((crc.calc_bin))),4);

end
