function out = crc_16_gsm(message, check)
%--settings-------
% width   = 16
% poly    = 0x1021
% init    = 0x0000
% refin   = false
% refout  = false
% xorout  = 0xffff
% check   = 0xce3c for ASCII:"123456789"
% residue = 0x1d0f
% name    = "CRC-16/GSM"
% Class: attested
% ETSI TS 100 909 version 8.9.0 (January 2005)
% - Full mathematical description (Section 5.1.2.2, p.67 — Section 5.1.3.2, p.69 — Section 5.1.4.2, p.70)
% ECMA standard ECMA-130, edition 2 (June 1996) — ISO/IEC 10149:1995
% - Definition: Width, Poly, XorOut, RefOut (Section 22.3.6, p.23)
% Andreas Mueller et al. (15 May 2018), cdrdao 1.2.4, modules cdrdao-1.2.4/dao/SubChannel.cc, cdrdao-1.2.4/dao/PQSubChannel16.cc
% - Code: C++
% Stanislav Brabec (26 January 2018), CD-disassembler 0.1 (gzipped tar archive), module cddisasm-0.1/cddisasm.c
% - Code: C
% Stanislav Brabec (17 January 2014), CD-disassembler homepage
% - 2 codewords
%   01010100​00000000​02005A28
%   035D24E3​58020001​0034D0F2

crc.width   = 16;
crc.poly    = [0 0 0 1   0 0 0 0   0 0 1 0   0 0 0 1];% x^16 + x^12 + x^5 + x^0 (0x1021)
crc.init    = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.residue = [0 0 0 1   1 1 0 1   0 0 0 0   1 1 1 1];% (0x1d0f)
crc.refin   = false;
crc.refout  = false;
crc.xorout  = true(1,length(crc.poly));% [1 1 1 1   1 1 1 1   1 1 1 1   1 1 1 1];% (0xffff)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out =  binaryVectorToHex(crc.calc_bin);

end
