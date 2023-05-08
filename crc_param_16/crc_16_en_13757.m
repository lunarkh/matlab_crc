function out = crc_16_en_13757(message, check)
%--settings-------
% width   = 16
% poly    = 0x3d65
% init    = 0x0000
% refin   = false
% refout  = false
% xorout  = 0xffff
% check   = 0xc2b7 for ASCII:"123456789"
% residue = 0xa366
% name    = "CRC-16/EN-13757"
% Class: confirmed
% Used in the Wireless M-Bus protocol for remote meter reading.
% STACKFORCE GmbH (2014), Capt²web sniffer, wireless M-Bus monitor (courtesy of the Internet Archive)
% - Transcripts confirming implementation with at least 124 codewords (selection)
%   EE449ACE​01000080​2307AABC
%   7A4700E0​A535E79C​FAA94D07​B173BC10​1496
%   021CCB01​27DCF516​FF4EA8BC​0A485174​4D3D
%   438A680E​CFC8EAA7​F5D6476C​AD938EBF​88AF
%   259794C3​36C6FE96​01D99F81​B5EBDD9F​36B5
%   67FC406A​A1107F38​0CA349EB​2F1AD57A​D22A
%   7D8067CD​9D1076
%   D0F1E6C2​C3962E
%   384BABA9​53BCE5
%   70414545​C59920
%   F0649A4E​11111111​0000E9CA
%   A12F2F2F​2F2F2F2F​2F2F2F2F​2F2F2F2F​4A08
%   2F2F2F2F​2F2F2F2F​2F2F2F2F​2F2F2F2F​63D7
%   7A8D00E0​A503B192​2864C36F​29B37AF0​646A
%   D1391E97​9A44C456​786CBB99​CD6ECAAC​B373
% - In the Web interface packet view, the bytes of the A and M fields are displayed in reverse, compared to transmission order.
% Patrick Seem, Texas Instruments, Inc. (23 October 2008), AN067: Wireless MBUS Implementation with CC1101 and MSP430
% - Definition: Width, Poly, Init, XorOut (Section 5.4, p.9)
% - Describes synchronous transfer with MSBs sent first, implying RefIn and RefOut (Sections 7.2.1, 7.3.1, pp.13–14)
% Dr.-Ing. Thomas Weinzierl, Weinzierl Engineering GmbH (July 2005), Stack Implementation for KNX-RF (courtesy of the Internet Archive)
% - Definition: Poly (Section 2.3, p.3)
% - CRC byte order, implying RefIn and RefOut (Section 2.3, p.2, etc.)
% Radio link corresponds to Link A in AN067 (Section 2.2, p.2 vs. AN067 table 3, p.6)
% "Tim" (6 June 2004), Control.com forum post
% - Width, Poly cited for ISO/IEC 60870-5-2
% "MarcPo", "Gammatester" (30 September 2008), Computer Interfacing Forum topic 925 (courtesy of the Internet Archive)
% - All parameters (except Check, Residue) ("Gammatester")
% - 1 codeword ("MarcPo")
%   780B1343​65871E6D
% "Chris P." (27 April 2009), Computer Interfacing Forum topic 1315 (courtesy of the Internet Archive)
% - 1 codeword
%   07400001​AAAA0000​363E
% Unique effective solution of codeword set

crc.width   = 16;
crc.poly    = [0 0 1 1   1 1 0 1   0 1 1 0   0 1 0 1];% x^16 + x^13 + x^12 + x^11 + x^10 + x^8 + x^6 + x^5 + x^2 + x^0 (0x3d65)
crc.init    = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.residue = [1 0 1 0   0 0 1 1   0 1 1 0   0 1 1 0];% (0xa366)
crc.refin   = false;
crc.refout  = false;
crc.xorout  = true(1,length(crc.poly));% [1 1 1 1   1 1 1 1   1 1 1 1   1 1 1 1];% (0xffff)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out =  binaryVectorToHex(crc.calc_bin);

end
