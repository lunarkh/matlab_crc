function out = crc_8_i_432_1(message, check)
%--settings-------
% width   = 8
% poly    = 0x07
% init    = 0x00
% refin   = false
% refout  = false
% xorout  = 0x55
% check   = 0xa1 for ASCII:"123456789"
% residue = 0xac
% name    = "CRC-8/I-432-1"
%Class: academic
% Alias: CRC-8/ITU
% Used as the Asynchronous Transfer Mode Header Error Control sequence (ATM HEC).
% Single bit errors in the 4-byte ATM header can be automatically corrected.
% ITU-T Recommendation I.432.1 (February 1999)
% - Full mathematical description (Section 7.3.2.2, p.5)
% - 2 trivial codewords (Section 7.3.2.2, p.6; Table 3, p.12)
%   00000000​00000000​00000000​00000000​01010101
%   00000000​00000000​00000000​00000001​01010010
% Broadband Forum Technical Committee (10 September 1993), User-Network Interface Specification,
% version 3.0 (compressed RTF) (courtesy of Faculty of Information Technology, Brno University of Technology, Czechia)
% - Full mathematical description (Section 2.2.6)

crc.width   = 8;
crc.poly    = [0 0 0 0   0 1 1 1];% x^8 + x^2 + x^1 + x^0 (0x07)
crc.init    = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0];% (0x00)
crc.residue = [1 0 1 0   1 1 0 0];% (0xac)
crc.refin   = false;
crc.refout  = false;
crc.xorout  = [0 1 0 1   0 1 0 1];% (0x55)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out = dec2hex(bin2dec(num2str((crc.calc_bin))),2);

end
