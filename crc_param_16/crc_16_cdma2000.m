function out = crc_16_cdma2000(message, check)
%--settings-------
% width   = 16
% poly    = 0xc867 
% init    = 0xffff
% refin   = false
% refout  = false
% xorout  = 0x0000
% check   = 0x4c06 for ASCII:"123456789"
% residue = 0x0000
% name    = "CRC-16/CDMA2000"
% Class: academic
% 3rd Generation Partnership Project 2 (3GPP2) (September 2009),
% Physical layer standard for cdma2000 spread spectrum systems, revision E, version 1.0
% - Definition: Width, Poly (Section 2.1.3.1.4.1.1, p.2-95)
% - Full description (Section 2.1.3.1.4.1, p.2-95)
% - Shift register diagram (Figure 2.1.3.1.4.1.1-1, p.2-95)
% Agilent Technologies, Advanced Design System 2008 Update 2,
% CDMA2K_CRC_Coder module documentation (courtesy of the Internet Archive)
% - Full description

crc.width   = 16;
crc.poly    = [1 1 0 0   1 0 0 0   0 1 1 0   0 1 1 1];% x^16 + x^15 + x^14 + x^11 + x^6 + x^5 + x^2 + x^1 + x^0 (0xc867)
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
