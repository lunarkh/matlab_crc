function out = crc_16_ibm_3740(message, check)
%--settings-------
% width   = 16
% poly    = 0x1021
% init    = 0xFFFF
% refin   = false
% refout  = false
% xorout  = 0x0000
% check   = 0x29B1 for ASCII:"123456789"
% residue = 0x0000
% name    = "CRC-16/IBM-3740"
% Class: attested
% Alias: CRC-16/AUTOSAR, CRC-16/CCITT-FALSE
% An algorithm commonly misidentified as CRC-CCITT.
% CRC-CCITT customarily refers to the LSB-first form of the algorithm in ITU-T Recommendation V.41 (see CRC-16/KERMIT);
% its MSB-first counterpart is CRC-16/XMODEM.
% AUTOSAR (25 November 2021), AUTOSAR Classic Platform release R21-11, Specification of CRC Routines

crc.width   = 16;
crc.poly    = [0 0 0 1   0 0 0 0   0 0 1 0   0 0 0 1];% x^16 + x^12 + x^5 + x^0 (0x1021)
crc.init    = true(1,length(crc.poly));% [1 1 1 1   1 1 1 1   1 1 1 1   1 1 1 1];% (0xFFFF)
crc.residue = true(1,length(crc.poly));% [1 1 1 1   1 1 1 1   1 1 1 1   1 1 1 1];% (0xFFFF)
crc.refin   = false;
crc.refout  = false;
crc.xorout  = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out =  binaryVectorToHex(crc.calc_bin);

end
