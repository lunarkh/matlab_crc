function out = crc_15_can(message, check)
%--settings-------
% width   = 15
% poly    = 0x4599
% init    = 0x0000
% refin   = false
% refout  = false
% xorout  = 0x0000
% check   = 0x059e for ASCII:"123456789"
% residue = 0x0000
% name    = "CRC-15/CAN"
% Class: academic
% Alias: CRC-15
% Robert Bosch GmbH (September 1991), CAN 2.0 Specification (courtesy of GitHub)
% - Full definition (except Check) (Section 3.1.1, pp.13–14)
% - Pseudocode

crc.width   = 15;
crc.poly    = [1 0 0   0 1 0 1   1 0 0 1   1 0 0 1];% x^15 + x^14 + x^10 + x^8 + x^7 + x^4 + x^3 + x^0(0x4599)
crc.init    = false(1,length(crc.poly));% [0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.residue = false(1,length(crc.poly));% [0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.refin   = false;
crc.refout  = false;
crc.xorout  = false(1,length(crc.poly));% [0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out = dec2hex(bin2dec(num2str((crc.calc_bin))),4);

end
