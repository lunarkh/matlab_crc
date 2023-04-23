function out = crc_5_epc_c1g2(message, check)
%--settings-------
% width   = 5
% poly    = 0x09
% init    = 0x09
% refin   = false
% refout  = false
% xorout  = 0x00
% check   = 0x00 for ASCII:"123456789"
% residue = 0x00
% name    = "CRC-5/EPC-C1G2"
% Class: attested
% Alias: CRC-5/EPC
% Used in standardised RFID tags.
% EPCglobal Inc™ (4 September 2018), EPC UHF Gen2 Air Interface Protocol: EPC™ Radio-Frequency Identity Protocols Generation-2 UHF RFID Standard, release 2.1
% - Definition: Width, Poly, Init, Residue (Table 6-12, p.34)
% - Definition: RefIn, Residue (Annex F.1, p.143)
% - Shift register circuit diagram (Figure F-1, p.143)
% - Transmission order, implying RefIn and RefOut (Section 6.3.1.4, p.33)
% Hee-Bok Kang et al. (December 2008), High Security FeRAM-Based EPC C1G2 UHF (860 MHz-960 MHz) Passive RFID Tag Chip, ETRI Journal, Volume 30 Number 6
% - 1 codeword (p.830)
%   10001001​00000010​000110
% "jgmh" (20 May 2009), Computer Interfacing Forum topic 1330 (courtesy of the Internet Archive)
% - 1 codeword
%   10000001​00000000​010011

crc.width   = 5;
crc.poly    = [0 1 0 0 1];% x^5 + x^3 + x^0 (0x09)
crc.init    = [0 1 0 0 1];% (0x09)
crc.residue = false(1,length(crc.poly));% [0 0 0 0 0];% (0x00)
crc.refin   = false;
crc.refout  = false;
crc.xorout  = false(1,length(crc.poly));% [0 0 0 0 0];% (0x00)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out =  binaryVectorToHex(crc.calc_bin);

end
