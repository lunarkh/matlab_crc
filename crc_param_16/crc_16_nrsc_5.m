function out = crc_16_nrsc_5(message, check)
%--settings-------
% width   = 16
% poly    = 0x080b
% init    = 0xffff
% refin   = true
% refout  = true
% xorout  = 0x0000
% check   = 0xa066 for ASCII:"123456789"
% residue = 0x0000
% name    = "CRC-16/NRSC-5"
% Class: attested
% Class: attested
% Implemented in standard NRSC-5-D as a 16-bit CRC truncated (punctured) to 12 bits.
% The upper 4 bits, the last to leave the shift register, are discarded.
% Init = 0xFFFF implements the algorithm prescribed by iBiquity on 80-bit PDUs. 
% Substitute Init = 0x39C8 if skipping 8 leading zeroes, Init = 0x849D
% if skipping all 12 leading zeroes and processing only the 68 message bits.
% In any case Init = 0x0000, XorOut = 0x4955 is equivalent.
% iBiquity Digital Corporation (23 August 2011), HD Radio™ Air Interface Design Description:
% Station Information Service Transport, rev. J (courtesy of National Radio Systems Committee)
% - Definition: Poly (mantissa only); method (Section 4.10, p.38)
% - Incorporated by normative reference into National Radio Systems Committee standard NRSC-5-D.
% Andrew Wesie (9 June 2017), NRSC-5 receiver for rtl-sdr, file nrsc5/support/sample.xz (XZ compressed raw radio recording, 22 MB)
% - Recording confirming implementation with 28 codewords (4 bits extrapolated; selection)
%   000048BB​ABA0329A​0A0A2671 (source: 00001010​00001010​10011010​00110010​10100000​10101011​10111011​01001000​00000001​00100110)
%   0030C8D3​D37379D9​1E0A7B40 (source: 00001010​00011110​11011001​01111001​01110011​11010011​11010011​11001000​00110000​01111011)
%   0010C097​A920F31B​240A2D1D (source: 00001010​00100100​00011011​11110011​00100000​10101001​10010111​11000000​00011101​00101101)
%   00200882​E861D03C​3C0AEB71 (source: 00001010​00111100​00111100​11010000​01100001​11101000​10000010​00001000​00100001​11101011)
%   00100000​DC69FABC​4E0AB6CD (source: 00001010​01001110​10111100​11111010​01101001​11011100​00000000​00000000​00011101​10110110)
%   00001500​4000809E​54456AC7 (source: 01000101​01010100​10011110​10000000​00000000​01000000​00000000​00010101​00000111​01101010)
%   00200008​FA7E849E​54454B82 (source: 01000101​01010100​10011110​10000100​01111110​11111010​00001000​00000000​00100010​01001011)
%   00100074​4280849E​54457C5C (source: 01000101​01010100​10011110​10000100​10000000​01000010​01110100​00000000​00011100​01111100)
% Andrew Wesie, Clayton Smith et al. (17 April 2018), NRSC-5 receiver for rtl-sdr, module nrsc5/src/pids.c
% - Code: C

crc.width   = 16;
crc.poly    = [0 0 0 0   1 0 0 0   0 0 0 0   1 0 1 1];% x^16 + x^11 + x^3 + x^1 + x^0 (0x080b)
crc.init    = true(1,length(crc.poly));% [1 1 1 1   1 1 1 1   1 1 1 1   1 1 1 1];% (0xffff)
crc.residue = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.refin   = true;
crc.refout  = true;
crc.xorout  = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.mode    = check;
if(check)% CRC presented low byte first. (14)                                                     % [data crc*] -> [data crc`]
    len = length(message);                                                                        % - crc* = [1_MSB 1_LSB 0_MSB 0_LSB]
    crc.message = [message(1:(len-4)) message(len-1) message(len) message(len-3) message(len-2)]; % - crc` = [0_MSB 0_LSB 1_MSB 1_LSB]
else
    crc.message = message;
end
crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.init, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out = dec2hex(bin2dec(num2str((crc.calc_bin))),4);

end
