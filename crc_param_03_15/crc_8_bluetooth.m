function out = crc_8_bluetooth(message, check)
%--settings-------
% width   = 8
% poly    = 0xa7
% init    = 0x00
% refin   = true
% refout  = true
% xorout  = 0x00
% check   = 0x26 for ASCII:"123456789"
% residue = 0x00
% name    = "CRC-8/BLUETOOTH"
% Class: attested
% Used in Bluetooth header error correction (HEC). Init=0x00 is used in the Inquiry Response substate.
% Bluetooth SIG (13 July 2021), Bluetooth Specification, Core Version 5.3
% - Definition: Init (Section 2.B.1.2.1, p.422; Section 2.B.6.4.6, p.474 — Section 2.B.6.5.1.4, pp.477–9 — Section 2.B.7.1, p.493 — Section 2.B.8.4.3, pp.521–3)
% - Definition: Width, Poly (Section 2.B.7.1.1, pp.493–4)
% - Definition: RefIn; shift register diagram (Figure 2.B.7.3, p.494)
% - Definition: Refin, RefOut, Residue (Figure 2.B.7.5, p.494)
% - 10 codewords (Section 2.G.4, p.899)
%   11000100​10100001​11
%   00100100​10010011​00
%   10100100​10010110​10
%   01100100​10010001​11
%   11100100​10010100​01
%   11011000​10011110​01
%   00111000​10101100​10
%   10111000​10101001​00
%   01111000​10101110​01
%   11111000​10101011​11

crc.width   = 8;
crc.poly    = [1 0 1 0   0 1 1 1];% x^8 + x^7 + x^5 + x^2 + x^1 + x^0 (0xa7)
crc.init    = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0];% (0x00)
crc.residue = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0];% (0x00)
crc.refin   = true;
crc.refout  = true;
crc.xorout  = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0];% (0x00)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out = dec2hex(bin2dec(num2str((crc.calc_bin))),2);

end
