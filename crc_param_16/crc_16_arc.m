function out = crc_16_arc(message, check)
%--settings-------
% width   = 16
% poly    = 0x8005
% init    = 0x0000
% refin   = true
% refout  = true
% xorout  = 0x0000
% check   = 0xbb3d for ASCII:"123456789"
% residue = 0x0000
% name    = "CRC-16/ARC"
% Class: attested
% Alias: ARC, CRC-16, CRC-16/LHA, CRC-IBM
% AUTOSAR (25 November 2021), AUTOSAR Classic Platform release R21-11, Specification of CRC Routines
% - Comprehensive primer on CRC theory (Section 7.1, pp.19–22)
% - All parameters (Section 7.2.2.2, p.26)
% - 7 codewords (Section 7.2.2.2, pp.26–7)
%   00000000​0000
%   F20183E1​C2
%   0FAA0055​E30B
%   00FF5511​CF6C
%   332255AA​BBCCDDEE​FF98AE
%   926B554E​E2
%   FFFFFFFF​0194
% System Enhancement Associates (24 October 1986), ARC 5.20
% - Implementation
% Haruyasu Yoshizaki (10 January 1996), LHA 2.55E
% - Implementation
% Rahul Dhesi (19 April 1996), ZOO 2.1a
% - Implementation
% Lammert Bies (August 2011), CRC calculator
% - Implementation
% PVL Team (25 October 2008), CRC .NET control, version 14.0.0.0
% - Implementation (CRC16_arc)
% Dr Ross N. Williams (19 August 1993), "A Painless Guide to CRC Error Detection Algorithms"
% - All parameters (except Residue)
% Emil Lenchak, Texas Instruments, Inc. (June 2018), CRC Implementation With MSP430
% - All parameters (except Residue) (Section 4.6, p.6)
% Altera Corporation (April 1999), crc MegaCore Function Data Sheet, version 2 (courtesy of the Internet Archive)
% - All parameters (except Residue) (p.6)
% Unique effective solution of codeword set

crc.width   = 16;
crc.poly    = [1 0 0 0   0 0 0 0   0 0 0 0   0 1 0 1];% x^16 + x^15 + x^2 + x^0 (0x8005)
crc.init    = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.residue = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.refin   = true;
crc.refout  = true;
crc.xorout  = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out =  binaryVectorToHex(crc.calc_bin);

end
