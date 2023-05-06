function out = crc_12_cdma2000(message, check)
%--settings-------
% width   = 12
% poly    = 0xf13
% init    = 0xfff
% refin   = false
% refout  = false
% xorout  = 0x000
% check   = 0xd4d for ASCII:"123456789"
% residue = 0x000
% name    = "CRC-12/CDMA2000"
% Class: academic
% 3rd Generation Partnership Project 2 (3GPP2) (September 2009), Physical layer standard for cdma2000 spread spectrum systems, revision E, version 1.0
% - Definition: Width, Poly (Section 2.1.3.1.4.1.2, p.2-95)
% - Full description (Section 2.1.3.1.4.1, p.2-95)
% - Shift register diagram (Figure 2.1.3.1.4.1.2-1, p.2-96)
% Agilent Technologies, Advanced Design System 2008 Update 2, CDMA2K_CRC_Coder module documentation (courtesy of the Internet Archive)
% - Full description

crc.width   = 12;
crc.poly    = [1 1 1 1   0 0 0 1   0 0 1 1];% x^12 + x^11 + x^10  + x^9 + x^8 + x^4 + x^1 + x^0(0xf13)
crc.init    = true(1,length(crc.poly));% [1 1 1 1   1 1 1 1   1 1 1 1];% (0xfff)
crc.residue = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0];% (0x000)
crc.refin   = false;
crc.refout  = false;
crc.xorout  = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0];% (0x000)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out =  binaryVectorToHex(crc.calc_bin);

end
