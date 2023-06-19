function out = crc_4_g_704(message, check)
%--settings-------
% width   = 4
% poly    = 0x3
% init    = 0x0
% refin   = true
% refout  = true
% xorout  = 0x0
% check   = 0x7 for ASCII:"123456789"
% residue = 0x0
% name    = "CRC-4/G-704"
% Class: academic
% Alias: CRC-4/ITU
% ITU-T Recommendation G.704 (October 1998)
% - Full mathematical description (Section 2.3.3.5, p.12)
% - Shift register diagram (Annex A.3, p.36)

crc.width   = 4;
crc.poly    = [0 0 1 1];% x^4 + x^1 + x^0 (0x3)
crc.init    = false(1,length(crc.poly));% [0 0 0 0];% (0x0)
crc.residue = [0 0 0 0];% (0x0)
crc.refin   = true;
crc.refout  = true;
crc.xorout  = false(1,length(crc.poly));% [0 0 0 0];% (0x0)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out = dec2hex(bin2dec(num2str((crc.calc_bin))),2);

end
