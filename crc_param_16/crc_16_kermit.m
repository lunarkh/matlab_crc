function out = crc_16_kermit(message, check)
%--settings-------
% width   = 16
% poly    = 0x1021
% init    = 0x0000
% refin   = true
% refout  = true
% xorout  = 0x0000
% check   = 0x2189 for ASCII:"123456789"
% residue = 0x0000
% name    = "CRC-16/KERMIT"
% Class: attested
% Alias: CRC-16/BLUETOOTH, CRC-16/CCITT, CRC-16/CCITT-TRUE, CRC-16/V-41-LSB, CRC-CCITT, KERMIT
% Used in Bluetooth error detection. Init=0x0000 is used in the Inquiry Response substate.
% Press et al. identify the CCITT algorithm with the one implemented in Kermit. 
% V.41 is endianness-agnostic, referring only to bit sequences, but the CRC appears reflected 
% when used with LSB-first modems. Ironically, the unreflected form is used in CRC-16/XMODEM.
% For the algorithm often misidentified as CCITT, see CRC-16/IBM-3740.
% ITU-T Recommendation V.41 (November 1988)
% - Definition: Residue; full mathematical description (Section 2, p.2)
% - Shift register diagrams (Appendix I, p.9)
% Frank da Cruz (June 1986), Kermit Protocol Manual, Sixth Edition (plain text)
% - Full definition (except Check) (Section 6.3)
% - Pseudocode (Section 6.3)
% Bluetooth SIG (13 July 2021), Bluetooth Specification, Core Version 5.3
% - Definition: Init (Section 2.B.1.2.1, p.422; Section 2.B.6.5.1.4, pp.477–9 —
%   Section 2.B.6.6.2, pp.486–90 — Section 2.B.7.1, p.493 — Section 2.B.8.4.3, pp.521–3)
% - Definition: Width, Poly, RefIn, RefOut, XorOut (Section 2.B.7.1.2, p.495)
% - Shift register diagram (Figure 2.B.7.6, p.495)
% Lammert Bies (August 2011), CRC calculator
% - Implementation
% PVL Team (25 October 2008), CRC .NET control, version 14.0.0.0
% - Implementation
% Aviation Data Systems (Aust) Pty Ltd. (13 June 2006), PC.ACARS-G ACARS client (PATS presentation) (courtesy of the Internet Archive)
% - Transcripts confirming implementation with 10 codewords
%   43AED6C8​ADD65143​1551B031​02D332B9​C1D65131​3732B583​F303
%   6DAEB9CD​ADCD524F​15C1C154​022FCD45​4C43C1D9​C1AEC154​31AEB9CD​ADCD524F​32B0B934​46C2C134​43B0B3B9​B9468348​61
%   CDAEB9CD​ADCD524F​54DF7F38​02D33231​C1CDC8B0​31343883​61A7
%   6D808080​80808080​15D35180​02B0B058​D3838236
%   CDAEB9CD​ADCD524F​15C2C1B9​024CB032​C1CDC8B0​3134382F​CD454C43​C1D9C1AE​C15431AE​B9CDADCD​524FC1B0​B9B53132​3443B3C4​B9B0B3C2​C1B53131​C2B9B0B0​C143B534​37313443​B0C437C1​34B6B543​34C1C432​B6B9B5B5​C1434343​3445B9C1​3831B543​38313234​3446C131​B332B0B9​34B9B0B3​B3C1B045​4534C438​374643B3​834483
%   6DAEB9CD​ADCD524F​B9DF7FD5​8391C6
%   43AED6C8​ADDA5843​D50DD0C1​524954D9​20BF8397​AC
%   43AED6C8​ADDA5843​15C831BC​0DD0C152​4954D920​BF8302D5
%   32AED6C8​ADDA58C2​15383137​02CD31B3​C15146B0​34B3B90D​8ACDD6C1​0D8A5146​C1B034B3​B92F31B0​AED6C8DA​58C2AECD​454C200D​8AC1C1B0​B5313720​20202020​83751B
%   6DAEB9D6​ADD3CD57​B5DF7F4A​839BC6
% Andrew Richardson (17 March 2005), WCDMA Design Handbook, Cambridge University Press,
% ISBN 0-521-82815-5 (embedded content)
% - Definition: Width, Poly, Residue (Section 7.1.3, Table 7.3, p.223)
% - Shift register diagram (Figure 7.4, p.223)
% William H. Press, Brian P. Flannery, Saul A. Teukolsky, William T. Vetterling (1992), Numerical recipes in C: The art of scientific computing, 2nd ed., Cambridge University Press, ISBN 0-521-43108-5
% - All parameters (except Check) (p.898)
% - Code: C (pp.900–1)
% - 2 codewords (p.898)
%   54A114
%   4361744D​6F757365​39383736​35343332​318DC2
% Atmel Corporation (30 March 2015), Application Note ATAN0086: Using Atmel ATA5577 in Animal
% Identification Application according to ISO11784/85 (courtesy of MCS Electronics)
% - 2 codewords (Figure 2-2, p.5; Figure 3-1, p.6)
%   10000000​00000000​00000000​00000000​00000011​10011111​00000000​00000001​00100010​01110100
%   10001110​11000100​11000110​00000010​00000011​10011111​00000000​00000001​01111100​11100100
% reveng -m CRC-16/KERMIT -i 0047 -X -c 4E010203​04050607​0809 → 6DD2
% reveng -m CRC-16/KERMIT -i 0047 -a 1 -X -c 01110100​10000000​01000000​11000000​00100000​10100000 → 11101100​00110110
% reveng -m CRC-16/KERMIT -i 0047 -a 1 -X -c 01110100​10000000​01000000​11000000​00100000​10100000​11 → 10110000​11011000
% Unique effective solution of codeword set

crc.width   = 16;
crc.poly    = [0 0 0 1   0 0 0 0   0 0 1 0   0 0 0 1];% x^16 + x^12 + x^5 + x^0 (0x1021)
crc.init    = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.residue = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.refin   = true;
crc.refout  = true;
crc.xorout  = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out = dec2hex(bin2dec(num2str((crc.calc_bin))),4);

end
