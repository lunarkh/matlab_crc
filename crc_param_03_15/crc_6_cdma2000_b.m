function out = crc_6_cdma2000_b(message, check)
%--settings-------
% width   = 6
% poly    = 0x07
% init    = 0x3f
% refin   = false
% refout  = false
% xorout  = 0x00
% check   = 0x3b for ASCII:"123456789"
% residue = 0x00
% name    = "CRC-6/CDMA2000-B"
% Class: academic
% 3rd Generation Partnership Project 2 (3GPP2) (September 2009), Physical layer standard for cdma2000 spread spectrum systems, revision E, version 1.0
% - Definition: Width, Poly (Section 2.1.3.1.4.1.6, pp.2-97–8)
% - Full description (Section 2.1.3.1.4.1, p.2-95)
% - Shift register diagram (Figure 2.1.3.1.4.1.6-1, p.2-98)
% Agilent Technologies, Advanced Design System 2008 Update 2, CDMA2K_CRC_Coder module documentation (courtesy of the Internet Archive)
% - Full description

crc.width   = 6;
crc.poly    = [0 0   0 1 1 1];% x^6 + x^2 + x^1 + x^0 (0x07)
crc.init    = true(1,length(crc.poly));% [1 1   1 1 1 1];% (0x3f)
crc.residue = false(1,length(crc.poly));% [0 0   0 0 0 0];% (0x00)
crc.refin   = false;
crc.refout  = false;
crc.xorout  = false(1,length(crc.poly));% [0 0   0 0 0 0];% (0x00)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out = dec2hex(bin2dec(num2str((crc.calc_bin))),2);

end
