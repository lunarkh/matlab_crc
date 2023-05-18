function out = crc_16_lj1200(message, check)
%--settings-------
% width   = 16
% poly    = 0x6f63
% init    = 0x0000
% refin   = false
% refout  = false
% xorout  = 0x0000
% check   = 0xbdf4 for ASCII:"123456789"
% residue = 0x0000
% name    = "CRC-16/LJ1200"
% Class: third-party
% Reference from named polynomial in Prof. Koopman's CRC Polynomial Zoo.
% Used in the LoJack vehicle tracking system.
% Dennis Sheirer (24 January 2015), SDRTrunk module sdrtrunk/src/main/java/io/github/dsheirer/edac/CRCLJ.java
% - Code: Java
% - Worked example (as generator matrix)

crc.width   = 16;
crc.poly    = [0 1 1 0   1 1 1 1   0 1 1 0   0 0 1 1];% x^16 + x^14 + x^13 + x^11 + x^10 + x^9 + x^8 + x^6 + x^5 + x^1 + x^0 (0x6f63)
crc.init    = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.residue = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.refin   = false;
crc.refout  = false;
crc.xorout  = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out =  binaryVectorToHex(crc.calc_bin);

end
