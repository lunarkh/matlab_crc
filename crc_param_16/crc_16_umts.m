function out = crc_16_umts(message, check)
%--settings-------
% width   = 16
% poly    = 0x8005
% init    = 0x0000
% refin   = false
% refout  = false
% xorout  = 0x0000
% check   = 0xfee8 for ASCII:"123456789"
% residue = 0x0000
% name    = "CRC-16/UMTS"
% Class: attested
% Alias: CRC-16/BUYPASS, CRC-16/VERIFONE
% Reported for the multi-threaded portion of the Buypass transaction processing network.
% Verifone, Inc. (May 1995), TCLOAD Reference Manual (courtesy of the Internet Archive)
% - Definition: Poly. CRC byte order, implying RefIn and RefOut (Section 4, p.4-1)
% 3rd Generation Partnership Project (3GPP) TS 25.427 version 17.0.0 (April 2022) (zipped MS Word document) — ETSI TS 125 427 version 17.0.0 (April 2022)
% - Definition: Width, Poly, Init, XorOut (Section 7.2.1, p.40)
% - Definition: RefIn, RefOut (Section 6.1.1, p.20; Section 7.2.1.1, p.40)
% PVL Team (25 October 2008), CRC .NET control, version 14.0.0.0
% - Implementation
% Emil Lenchak, Texas Instruments, Inc. (June 2018), CRC Implementation With MSP430
% - All parameters (except Residue) (Section 4.6, p.6)
% Thomas Schmidt, Microchip Technology Inc. (20 May 2000), "CRC Generating and Checking"
% - Description (p.4)
% - Shift register diagram (Figure 1, p.3)
% - Code: 16C54B assembler (Appendix A, pp.7–11; Appendix B, pp.12–22)
% Michael Niedermayer, Aurélien Jacobs et al. (4 April 2022), FFmpeg 5.0.1 (XZ compressed tarfile), module ffmpeg-5.0.1/libavutil/tests/crc.c
% - 1 codeword
%   1999 bytes (i+i*i) plus 1FBB
% "Joshua" (31 May 2008), Computer Interfacing Forum topic 530 (courtesy of the Internet Archive)
% - 2 codewords
%   0384901B​56
%   03848400​00123031​41313330​30323031​33303031​1C393030​62BF
% Michael Junker (26 October 2009), Computer Interfacing Forum topic 1432 (courtesy of the Internet Archive)
% - 7 codewords (7-bit payload characters)
%   01100110​01110101​10000011​00000110​01100111​01011000​01101000​11101010​0 (source: 331D3030​331D30 + 53716)
%   01101000​01110101​10000011​00000110​01100111​01011000​01111000​11100100​1 (source: 341D3030​331D30 + 61897)
%   01101010​01110101​10000011​00000110​01100111​01011000​00001000​11100111​1 (source: 351D3030​331D30 + 04559)
%   01101100​01110101​10000011​00000110​01100111​01011000​01011000​11100000​0 (source: 361D3030​331D30 + 45504)
%   01100110​01110101​10100011​00000110​00000111​01011000​00101000​11100011​0 (source: 331D3430​301D30 + 20934)
%   01100110​01110101​10000011​00000111​00100111​01011000​01101000​11111011​0 (source: 331D3030​391D30 + 53750)
%   01100010​01110101​10000011​00010110​00000111​01011000​00001001​10101000​1 (source: 311D3031​301D30 + 04945)
% Unique effective solution of codeword set

crc.width   = 16;
crc.poly    = [1 0 0 0   0 0 0 0   0 0 0 0   0 1 0 1];% x^16 + x^15 + x^2 + x^0 (0x8005)
crc.init    = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.residue = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.refin   = false;
crc.refout  = false;
crc.xorout  = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.init, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out = dec2hex(bin2dec(num2str((crc.calc_bin))),4);

end
