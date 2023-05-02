function out = crc_8_smbus(message, check)
%--settings-------
% width   = 8
% poly    = 0x07
% init    = 0x00
% refin   = false
% refout  = false
% xorout  = 0x00
% check   = 0xf4 for ASCII:"123456789"
% residue = 0x00
% name    = "CRC-8/SMBUS"
% Class: attested
% Alias: CRC-8
% The System Management Interface Forum, Inc. (3 August 2000),
% System Management Bus (SMBus) Specification, version 2.0
% - Definition: Width, Poly, RefIn, RefOut (Section 4.2, p.19; Section 5.4.1.3, p.27)
% The System Management Interface Forum, Inc. (14 June 2005), CRC-8 Calculator
% - Implementation
% PVL Team (25 October 2008), CRC .NET control, version 14.0.0.0
% - Implementation
% John Milios, USAR Systems, Inc. (22 April 1999), Firmware CRC-8 implementations for SMBus
% (courtesy of the System Management Interface Forum, Inc.)
% - Definition: Width, Poly (p.5)
% - Worked example (p.6)
% - Code: 6805 assembler (pp.14,18)
% Michael Niedermayer, Aurélien Jacobs et al. (4 April 2022),
% FFmpeg 5.0.1 (XZ compressed tarfile), module ffmpeg-5.0.1/libavutil/tests/crc.c
% - 1 codeword
%   1999 bytes (i+i*i) plus E3

crc.width   = 8;
crc.poly    = [0 0 0 0   0 1 1 1];% x^8 + x^2 + x^1 + x^0 (0x07)
crc.init    = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0];% (0x00)
crc.residue = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0];% (0x00)
crc.refin   = false;
crc.refout  = false;
crc.xorout  = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0];% (0x00)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out =  binaryVectorToHex(crc.calc_bin);

end
