function out = crc_6_g_704(message, check)
%--settings-------
% width   = 6
% poly    = 0x03
% init    = 0x00
% refin   = true
% refout  = true
% xorout  = 0x00
% check   = 0x06 for ASCII:"123456789"
% residue = 0x00
% name    = "CRC-6/G-704"
% Class: academic
% Alias: CRC-6/ITU
% ITU-T Recommendation G.704 (October 1998)
% - Full mathematical description (Section 2.1.3.1.2, p.3)
% - Shift register diagram (Annex A.1, p.35)

crc.width   = 6;
crc.poly    = [0 0   0 0 1 1];% x^6 + x^1 + x^0 (0x3)
crc.init    = false(1,length(crc.poly));% [0 0   0 0 0 0];% (0x00)
crc.residue = false(1,length(crc.poly));% [0 0   0 0 0 0];% (0x00)
crc.refin   = true;
crc.refout  = true;
crc.xorout  = false(1,length(crc.poly));% [0 0   0 0 0 0];% (0x00)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out =  binaryVectorToHex(crc.calc_bin);

end
