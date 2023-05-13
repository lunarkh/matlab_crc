function out = crc_16_iso_iec_14443_3_a(message, check)
%--settings-------
% width   = 16
% poly    = 0x1021
% init    = 0xc6c6
% refin   = true
% refout  = true
% xorout  = 0x0000
% check   = 0xbf05 for ASCII:"123456789"
% residue = 0x0000
% name    = "CRC-16/ISO-IEC-14443-3-A"
% Class: attested
% Alias: CRC-A
% Used in contactless IC cards.
% ISO/IEC FCD 14443-3 (24 November 2008)
% - Definition: Init, XorOut (Section 6.2.4, p.11)
% - Citation for rest of algorithm: ISO/IEC 13239 (see CRC-16/IBM-SDLC)
% - 2 codewords (Annex B.1, p.49)
%   0000A01E
%   123426CF
% Adam Laurie (31 August 2010), crc16.c (C source text)
% - Code: C
% Adam Laurie (31 August 2010), comment on a Ridrix's Blog post
% - Code: C
% - 1 codeword
%   AABBCCDD​EE001122​7B09
% Flavio D. Garcia, et al. (October 2008), Dismantling MIFARE Classic, Proceedings of the Thirteenth European Symposium on Research in Computer Security (ESORICS 2008)
% - 6 codewords (Figure 2, p.100; Section 4.1, p.102, referencing ISO/IEC 14443; Figure 6, p.105)
%   9370C2A8​2DF4B3BA​A3
%   08B6DD
%   6030764A
%   500057CD
%   93700000​0000009C​D9
%   6000F57B
% Flavio D. Garcia, et al. (October 2008), Dismantling MIFARE Classic, slide presentation, ESORICS 2008 conference
% - 1 additional codeword (p.13)
%   93701DFB​E03335D3​55
% Unique effective solution of codeword set

crc.width   = 16;
crc.poly    = [0 0 0 1   0 0 0 0   0 0 1 0   0 0 0 1];% x^16 + x^12 + x^5 + x^0 (0x1021)
crc.init    = [1 1 0 0   0 1 1 0   1 1 0 0   0 1 1 0];% (0xc6c6)
crc.residue = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.refin   = true;
crc.refout  = true;
crc.xorout  = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out =  binaryVectorToHex(crc.calc_bin);

end
