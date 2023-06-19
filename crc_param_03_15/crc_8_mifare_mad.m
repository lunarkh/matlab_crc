function out = crc_8_mifare_mad(message, check)
%--settings-------
% width   = 8
% poly    = 0x1d
% init    = 0xc7
% refin   = false
% refout  = false
% xorout  = 0x00
% check   = 0x99 for ASCII:"123456789"
% residue = 0x00
% name    = "CRC-8/MIFARE-MAD"
% Class: attested
% References courtesy of Sourceforge users "xavery" and Oleg Moiseenko.
% NXP Semiconductors (6 November 2018), Application note AN10787: MIFARE Application Directory (MAD), rev. 7.4
% - Definition: Width, Poly, Init (Section 3.7, pp.9–10)
% - 1 codeword (Table 11, p.10)
%   01010801​08010800​00000000​00040003​10031002​10021000​00000000​00113089
% Romain Tartière, Romuald Conty, et al. (29 June 2017), libfreefare module libfreefare/libfreefare/mad.c
% - Code: C
% Romain Tartière (29 June 2017), libfreefare module libfreefare/test/test_mad.c
% - 3 codewords (1 same as in AN10787)
%   0103E103​E103E103​E103E100​00000000​00000000​00000000​00000000​000000C4
%   0103E103​E103E103​E103E103​E1000000​00000000​00000000​00000000​000000AB
% Oleg Moiseenko (14 February 2019), CRC RevEng project discussion thread post
% - 1 codeword
%   00563D56​3C563C56​3C563C56​3C000000​00000000​00000000​00000000​00000030

crc.width   = 8;
crc.poly    = [0 0 0 1   1 1 0 1];% x^8 + x^4  + x^3  + x^2 + x^0 (0x1d)
crc.init    = [1 1 0 0   0 1 1 1];% (0xc7)
crc.residue = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0];% (0x00)
crc.refin   = false;
crc.refout  = false;
crc.xorout  = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0];% (0x00)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out = dec2hex(bin2dec(num2str((crc.calc_bin))),2);

end
