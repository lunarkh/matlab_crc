function out = crc_7_mmc(message, check)
%--settings-------
% width   = 7
% poly    = 0x09
% init    = 0x00
% refin   = false
% refout  = false
% xorout  = 0x00
% check   = 0x75 for ASCII:"123456789"
% residue = 0x00
% name    = "CRC-7/MMC"
% Class: academic
% Alias: CRC-7
% Used in the MultiMediaCard interface.
% Additional reference courtesy of Greg Nelson, Grammatech Inc.
% JEDEC Standard JESD84-A441 (March 2010) (registration required)
% - Full definition (Section 10.2, pp.157–8)
% - Shift register diagram (Figure 53, p.158)
% Linux contributors (14 January 2021), Linux module lib/crc7.c
% - Code: C
% Nokia Corporation (2008), Linux module drivers/net/wireless/ti/wl1251/spi.c
% - Definition: Init (l.104)

crc.width   = 7;
crc.poly    = [0 0 0   1 0 0 1];% x^7 + x^3 + x^0 (0x09)
crc.init    = false(1,length(crc.poly));% [0 0 0   0 0 0 0];% (0x00)
crc.residue = false(1,length(crc.poly));% [0 0 0   0 0 0 0];% (0x00)
crc.refin   = false;
crc.refout  = false;
crc.xorout  = false(1,length(crc.poly));% [0 0 0   0 0 0 0];% (0x00)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out =  binaryVectorToHex(crc.calc_bin);

end
