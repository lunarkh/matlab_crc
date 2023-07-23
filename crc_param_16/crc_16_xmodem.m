function out = crc_16_xmodem(message, check)
%--settings-------
% width   = 16
% poly    = 0x1021
% init    = 0x0000
% refin   = false
% refout  = false
% xorout  = 0x0000
% check   = 0x31c3 for ASCII:"123456789"
% residue = 0x0000
% name    = "CRC-16/XMODEM"
% Class: attested
% Alias: CRC-16/ACORN, CRC-16/LTE, CRC-16/V-41-MSB, XMODEM, ZMODEM
% The MSB-first form of the V.41 algorithm. For the LSB-first form see CRC-16/KERMIT. CRC presented high byte first.
% Used in the MultiMediaCard interface. In XMODEM and Acorn MOS the message bits are processed out of transmission order, compromising the guarantees on burst error detection.
% ITU-T Recommendation V.41 (November 1988)
% - Definition: Residue; full mathematical description (Section 2, p.2)
% - Shift register diagrams (Appendix I, p.9)
% 3rd Generation Partnership Project (3GPP) TS 36.212 version 17.1.0 (March 2022) (zipped MS Word document) — ETSI TS 136 212 version 17.1.0 (April 2022)
% - Definition: Width, Poly, Init, XorOut, Residue (Section 5.1.1, pp.10–11)
% - Attachment relation, defining RefIn ^ RefOut (Section 5.1.1, p.11)
% 3rd Generation Partnership Project (3GPP) TS 36.321 version 16.6.0 (September 2021) (zipped MS Word document) — ETSI TS 136 321 version 16.6.0 (October 2021)
%   Referenced from TS 136 212 section 5.2.2.1, p.23
% - Definition: RefIn, RefOut (Section 6.1.1, p.88)
% JEDEC Standard JESD84-A441 (March 2010) (registration required)
% - Full definition (Section 10.2, pp.157–8)
% - Shift register diagram (Figure 54, p.159)
% Acorn Computers Ltd (October 1984), BBC Microcomputer User Guide
% - Pseudocode (Chapter 35, p.369)
% Ward Christensen, Keith Petersen et al. (8 June 1982), XMODEM 5.0
% - Implementation (attributed to Paul Hansknecht)
% Acorn Computers Ltd (1981), Acorn MOS 1.20 (BBC Micro cassette format)
% - Implementation
% Lammert Bies (August 2011), CRC calculator
% - Implementation
% PVL Team (25 October 2008), CRC .NET control, version 14.0.0.0
% - Implementation
% Berndt M. Gammel (29 October 2006), Matpack 1.9.1 class MpCRC documentation
% - All parameters (except Residue)
% Altera Corporation (April 1999), crc MegaCore Function Data Sheet, version 2 (courtesy of the Internet Archive)
% - All parameters (except Residue) cited for ZMODEM (p.6)
% William H. Press, Brian P. Flannery, Saul A. Teukolsky, William T. Vetterling (1992), Numerical recipes in C: The art of scientific computing, 2nd ed., Cambridge University Press, ISBN 0-521-43108-5
% - All parameters (except Check) (p.898)
% - Code: C (pp.900–1)
% - 2 codewords (p.898)
%   541A71
%   4361744D​6F757365​39383736​35343332​31E556

crc.width   = 16;
crc.poly    = [0 0 0 1   0 0 0 0   0 0 1 0   0 0 0 1];% x^16 + x^12 + x^5 + x^0 (0x1021)
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
