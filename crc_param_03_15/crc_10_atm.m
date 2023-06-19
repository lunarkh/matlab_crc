function out = crc_10_atm(message, check)
%--settings-------
% width   = 10
% poly    = 0x233
% init    = 0x000
% refin   = false
% refout  = false
% xorout  = 0x000
% check   = 0x199 for ASCII:"123456789"
% residue = 0x000
% name    = "CRC-10/ATM"
% Class: attested
% Alias: CRC-10, CRC-10/I-610
% Used in Asynchronous Transfer Mode AAL 3/4 and OAM cells.
% Note there are 6 padding zero bits between each of the 46-byte
% information fields and their respective CRCs.
% ITU-T Recommendation I.610 (February 1999)
% - Full mathematical description (Section 10.1, p.40)
% - 2 codewords (Appendix I, p.67)
%   116A6A6A​6A6A6A6A​6A6A6A6A​6A6A6A6A​6A6A6A6A​6A6A6A6A​6A6A6A6A​6A6A6A6A​6A6A6A6A​6A6A6A6A​6A6A6A6A​6A6A00AF
%   1801AAAA​AAAAFFFF​FFFFFFFF​FFFFFFFF​FFFFFFFF​FFFF6A6A​6A6A6A6A​6A6A6A6A​6A6A6A6A​6A6A6A6A​6A6A6A6A​6A6A02AC
% Broadband Forum Technical Committee (March 1999), Traffic Management
% Specification, version 2.1 (courtesy of the Internet Archive)
% - Full mathematical description (Section 5.10.3.1, p.47)
% Charles M. Heard, Generating and Checking CRC-10 in ATM AAL 3/4 or
% OAM Cells (courtesy of the Internet Archive)
% - Definition: Width, Poly
% - Code: C
% - 7 codewords (selection; first four attributed to Angie Tso, Telecommunications Techniques Corp.)
%   0A0B0C0D​0E0F0000​00000000​00000000​00000000​00000000​00000000​00000000​00000000​00000000​00000000​000001F6
%   11111111​11111111​11110000​00000000​00000000​00000000​00000000​00000000​00000000​00000000​00000000​0000016B
%   FFFFFFFF​FFFFFFFF​FFFFFFFF​FFFFFFFF​FFFFFFFF​FFFFFFFF​FFFFFFFF​FFFFFFFF​FFFFFFFF​FFFFFFFF​FFFFFFFF​FFFF030F
%   12345678​90123456​78901234​56789012​34567890​12345678​90123456​78901234​56789012​34567890​12345678​901202ED
%   106A6A6A​6A6A6A6A​6A6A6A6A​6A6A6A6A​6A6A6A6A​6A6A6A6A​6A6A6A6A​6A6A6A6A​6A6A6A6A​6A6A6A6A​6A6A6A6A​6A6A03B9
%   18010000​0000FFFF​FFFFFFFF​FFFFFFFF​FFFFFFFF​FFFF0000​00000000​00000000​00000000​00006A6A​6A6A6A6A​6A6A004A

crc.width   = 10;
crc.poly    = [1 0   0 0 1 1   0 0 1 1];% x^10 + x^9 + x^5 + x^4 + x^1 + x^0 (0x233)
crc.init    = false(1,length(crc.poly));% [0 0   0 0 0 0   0 0 0 0];% (0x000)
crc.residue = false(1,length(crc.poly));% [0 0   0 0 0 0   0 0 0 0];% (0x000)
crc.refin   = false;
crc.refout  = false;
crc.xorout  = false(1,length(crc.poly));% [0 0   0 0 0 0   0 0 0 0];% (0x000)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out = dec2hex(bin2dec(num2str((crc.calc_bin))),4);

end
