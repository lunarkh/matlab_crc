function out = crc_16_spi_fujitsu(message, check)
%--settings-------
% width   = 16
% poly    = 0x1021
% init    = 0x1d0f
% refin   = false
% refout  = false
% xorout  = 0x0000
% check   = 0xe5cc for ASCII:"123456789"
% residue = 0x0000
% name    = "CRC-16/SPI-FUJITSU"
% Class: attested
% Alias: CRC-16/AUG-CCITT
% Init value is equivalent to an augment of 0xFFFF prepended to the message.
% Fujitsu Semiconductor (10 October 2007), FlexRay ASSP MB88121B User's Manual
% - Definition: Width, Poly, Init (Section 2.5.1, p.153)
% Lammert Bies (August 2011), CRC calculator
% - Implementation
% PVL Team (25 October 2008), CRC .NET control, version 14.0.0.0
% - Implementation
% Berndt M. Gammel (29 October 2006), Matpack 1.9.1 class MpCRC documentation
% - All parameters (except Residue)

crc.width   = 16;
crc.poly    = [0 0 0 1   0 0 0 0   0 0 1 0   0 0 0 1];% x^16 + x^12 + x^5 + x^0 (0x1021)
crc.init    = [0 0 0 1   1 1 0 1   0 0 0 0   1 1 1 1];% (0x1d0f)
crc.residue = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.refin   = false;
crc.refout  = false;
crc.xorout  = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.init, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out = dec2hex(bin2dec(num2str((crc.calc_bin))),4);

end
