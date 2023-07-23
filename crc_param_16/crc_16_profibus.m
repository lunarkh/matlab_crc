function out = crc_16_profibus(message, check)
%--settings-------
% width   = 16
% poly    = 0x1dcf
% init    = 0xffff
% refin   = false
% refout  = false
% xorout  = 0xffff
% check   = 0xa819 for ASCII:"123456789"
% residue = 0xe394
% name    = "CRC-16/PROFIBUS"
% Class: attested
% Alias: CRC-16/IEC-61158-2
% PROFIBUS International (March 1998), PROFIBUS Specification, Normative Parts, Edition 1.0, Part 9 (courtesy of the Internet Archive)
% - Transmission order, implying RefIn and RefOut (Part 9 Section 8.5.1, p.902)
% - Definition: Width, Poly, Init, Residue (Part 9 Section 8.8.4, pp.905–7)
% - Properties of polynomial (Part 9 Section 8.8.4, p.906)
% "Chetanya" (17 November 2011), Computer Interfacing Forum topic 1752 (courtesy of the Internet Archive)
% - Definition: Width, Poly, Init
% - 5 codewords
%   34AF21
%   011057E0
%   321000E3​7E82
%   331000E3​2A0F
%   26110100​00080A10​9739
% Unique effective solution of codeword set

crc.width   = 16;
crc.poly    = [0 0 0 1   1 1 0 1   1 1 0 0   1 1 1 1];% x^16 + x^12 + x^11 + x^10 + x^8 + x^7 + x^6 + x^3 + x^2 + x^1 + x^0 (0x1dcf)
crc.init    = true(1,length(crc.poly));% [1 1 1 1   1 1 1 1   1 1 1 1   1 1 1 1];% (0xffff)
crc.residue = [1 1 1 0   0 0 1 1   1 0 0 1   0 1 0 0];% (0xe394)
crc.refin   = false;
crc.refout  = false;
crc.xorout  = true(1,length(crc.poly));% [1 1 1 1   1 1 1 1   1 1 1 1   1 1 1 1];% (0xffff)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.init, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out = dec2hex(bin2dec(num2str((crc.calc_bin))),4);

end
