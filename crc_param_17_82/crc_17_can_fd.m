function out = crc_17_can_fd(message, check)
%--settings-------
% width   = 17
% poly    = 0x1685b
% init    = 0x00000
% refin   = false
% refout  = false
% xorout  = 0x00000
% check   = 0x04f03 for ASCII:"123456789"
% residue = 0x00000
% name    = "CRC-17/CAN-FD"
% Class: academic
% Robert Bosch GmbH (17 April 2012), CAN with Flexible Data-Rate: Specification, version 1.0 (courtesy of the Internet Archive)
% - Full definition (except Check); pseudocode (Section 3.2.1, pp.13–14)

crc.width   = 17;
crc.poly    = [1   0 1 1 0   1 0 0 0   0 1 0 1   1 0 1 1];% x^17 + x^16 + x^14 + x^13 + x^11 + x^6 + x^4 + x^3 + x^1 + x^0 (0x1685b)
crc.init    = false(1,length(crc.poly));% [0   0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x00000)
crc.residue = false(1,length(crc.poly));% [0   0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x00000)
crc.refin   = false;
crc.refout  = false;
crc.xorout  = false(1,length(crc.poly));% [0   0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x00000)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out = dec2hex(bin2dec(num2str((crc.calc_bin))),5);

end
