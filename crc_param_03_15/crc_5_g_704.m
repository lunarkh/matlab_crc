function out = crc_5_g_704(message, check)
%--settings-------
% width   = 5
% poly    = 0x15
% init    = 0x00
% refin   = true
% refout  = true
% xorout  = 0x00
% check   = 0x07 for ASCII:"123456789"
% residue = 0x00
% name    = "CRC-5/G-704"
% Class: academic
% Alias: CRC-5/ITU
% ITU-T Recommendation G.704 (October 1998)
% - Definition: Residue; full mathematical description (Section 2.2.3.2, pp.8–9)
% - Shift register diagram (Annex A.2, p.36)

crc.width   = 5;
crc.poly    = [1 0 1 0 1];% x^5 + x^4 + x^2 + x^0 (0x15)
crc.init    = false(1,length(crc.poly));% [0 0 0 0 0];% (0x00)
crc.residue = false(1,length(crc.poly));% [0 0 0 0 0];% (0x00)
crc.refin   = true;
crc.refout  = true;
crc.xorout  = false(1,length(crc.poly));% [0 0 0 0 0];% (0x00)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out = dec2hex(bin2dec(num2str((crc.calc_bin))),2);

end
