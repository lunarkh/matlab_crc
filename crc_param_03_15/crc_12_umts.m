function out = crc_12_umts(message, check)
%--settings-------
% width   = 12
% poly    = 0x80f
% init    = 0x000
% refin   = false
% refout  = true
% xorout  = 0x000
% check   = 0xdaf for ASCII:"123456789"
% residue = 0x000
% name    = "CRC-12/GSM"
% Class: academic
% Alias: CRC-12/3GPP
% The crossed-endian definition is unusual but explicit. Researched by "markw_be" at the Computer Interfacing Forum.
% 3rd Generation Partnership Project (3GPP) TS 25.212 version 16.0.0 (July 2020)
% (zipped MS Word document) — ETSI TS 125 212 version 16.0.0 (September 2020)
% - Mathematical description, defining Width, Poly, Init, Residue (Section 4.2.1.1, pp.19–20)
% - Attachment relation, defining RefIn ^ RefOut (Section 4.2.1.2, p.20)

crc.width   = 12;
crc.poly    = [1 0 0 0   0 0 0 0   1 1 1 1];% x^12 + x^11 + x^3 + x^2 + x^1 + x^0(0x80f)
crc.init    = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0];% (0x000)
crc.residue = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0];% (0x000)
crc.refin   = false;
crc.refout  = true;
crc.xorout  = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0];% (0x000)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out =  binaryVectorToHex(crc.calc_bin);

end
