function out = crc_16_genibus(message, check)
%--settings-------
% width   = 16
% poly    = 0x1021
% init    = 0xffff
% refin   = false
% refout  = false
% xorout  = 0xffff
% check   = 0xd64e for ASCII:"123456789"
% residue = 0x1d0f
% name    = "CRC-16/GENIBUS"
% Class: attested
% Alias: CRC-16/DARC, CRC-16/EPC, CRC-16/EPC-C1G2, CRC-16/I-CODE
% Used in standardised RFID tags. Presented high byte first.
% EPCglobal Inc™ (4 September 2018), EPC UHF Gen2 Air Interface Protocol: EPC™ Radio-Frequency Identity Protocols Generation-2 UHF RFID Standard, release 2.1
% - Definition: Width, Poly, Init, Residue (Table 6-11, p.33)
% - Definition: RefIn, Residue (Annex F.2, p.143)
% - Shift register circuit diagram (Figure F-2, p.144)
% - Transmission order, implying RefIn and RefOut (Section 6.3.1.4, p.33)
% - 7 codewords (Table F-2, pp.144–5)
%   0000E2F0
%   08001111​CCAE
%   10001111​2222968F
%   18001111​22223333​78F6
%   20001111​22223333​4444C241
%   28001111​22223333​44445555​2A91
%   30001111​22223333​44445555​66661835
% Philips Semiconductors (30 January 2004), SL2 ICS11 Product Specification, revision 3.0 (courtesy of the Internet Archive)
% - Definition: Width, Poly, Init, Residue (Section 10.2, p.26)
% - Code: C (Section 10.3.2, pp.30–32)
% - Worked example (as code trace) (Section 10.3.2, p.32)
% ETSI EN 300 751 version 1.2.1 (January 2003)
% - Definition: Width, Poly (Section 11.2.5, p.68)
% - 1 codeword (Section 11.2.5, p.68)
%   40214142​4387F5
% PVL Team (25 October 2008), CRC .NET control, version 14.0.0.0
% - Implementation
% Hee-Bok Kang et al. (December 2008), High Security FeRAM-Based EPC C1G2 UHF (860 MHz-960 MHz) Passive RFID Tag Chip, ETRI Journal, Volume 30 Number 6
% - 2 codewords (p.830)
%   10100000​00010000​00000000​00000010​10000010​10001
%   3000319F​60A35627​6E28F14F​DC9C5DB4
% "Geert" (7 December 2007), Computer Interfacing Forum topic 216 (courtesy of the Internet Archive)
% - Quoted definition for GENIbus: Width, Poly, Init, XorOut
% - 2 codewords cited for GENIbus
%   10012002​0C823E00​39821500​64820900​FA910A
%   07200102​C302101A​901C
% Scott McLaughlin (24 September 2008), Computer Interfacing Forum topic 907 (courtesy of the Internet Archive)
% - Reported definition for TI Tag-It: full (except Check, Residue)
% - 4 codewords cited for TI Tag-It
%   00000000​01000000​00010110​00111100​10111
%   00000000​01010000​00000000​00001100​01011000​11010000​00010110​11010001​11001
%   11000000​01010000​00000000​00000110​00101100​01101000​00001000​00010001​11110010​01111011​01000101​11000000​11000001
%   00000001​01010000​00000000​00001100​01011000​11010000​00011000​00111000​00000101​01010101​01010110​00100110​00111
% Unique effective solution of codeword set

crc.width   = 16;
crc.poly    = [0 0 0 1   0 0 0 0   0 0 1 0   0 0 0 1];% x^16 + x^12 + x^5 + x^0 (0x1021)
crc.init    = true(1,length(crc.poly));% [1 1 1 1   1 1 1 1   1 1 1 1   1 1 1 1];% (0xffff)
crc.residue = [0 0 0 1   1 1 0 1   0 0 0 0   1 1 1 1];% (0x1d0f)
crc.refin   = false;
crc.refout  = false;
crc.xorout  = true(1,length(crc.poly));% [1 1 1 1   1 1 1 1   1 1 1 1   1 1 1 1];% (0xffff)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out = dec2hex(bin2dec(num2str((crc.calc_bin))),4);

end
