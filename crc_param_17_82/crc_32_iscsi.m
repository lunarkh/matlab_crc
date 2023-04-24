function out = crc_32_iscsi(message, check)
%--settings-------
% width   = 32
% poly    = 0x1EDC6F41
% init    = 0xFFFFFFFF
% refin   = true
% refout  = true
% xorout  = 0xFFFFFFFF
% check   = 0xE3069283 for ASCII:"123456789"
% residue = 0xB798B438
% name    = "CRC-32/ISCSI"
% Class: attested
% Alias: CRC-32/BASE91-C, CRC-32/CASTAGNOLI, CRC-32/INTERLAKEN, CRC-32C
% IETF RFC 7143 (April 2014)
% - Full definition (except Check) (Section 13.1, pp.230–1)
% The Interlaken Alliance (7 October 2008), Interlaken Protocol Definition, version 1.2
% - Definition: Width, Poly (Section 5.4.6, p.33)
% - Definition: Init, RefIn, RefOut, XorOut (Appendix B, p.48)
% Dipl. Inf. Johann F. Löfflmann (30 July 2006), Jacksum 1.7.0
% - Implementation
% Greg Cook (30 December 2018), Base91 level 1 version 3.01
% - Implementation
% - Full mathematical description
% - All parameters
% - Code: C
% Mark Bakke, Julian Satran, Venkat Rangan (May–June 2001), IP Storage Mailing List thread
% - All parameters (except Residue) (Bakke, Rangan)
% - Definition: Width, Poly, Init, XorOut (Satran)
% - Code: C (Rangan)
% - 3 codewords (Bakke)
%   - 00000000​00000000​00000000​00000000​00000000​00000000​00000000​00000000​AA36918A
%   - FFFFFFFF​FFFFFFFF​FFFFFFFF​FFFFFFFF​FFFFFFFF​FFFFFFFF​FFFFFFFF​FFFFFFFF​43ABA862
%   - 00010203​04050607​08090A0B​0C0D0E0F​10111213​14151617​18191A1B​1C1D1E1F​4E79DD46

crc.width   = 32;
crc.poly = [0 0 0 1   1 1 1 0  ... % x^32+x^28+x^27+x^26+x^25+...   (0x1E)
            1 1 0 1   1 1 0 0  ... % x^23+x^22+x^20+x^19+x^18+...   (0xDC)
            0 1 1 0   1 1 1 1  ... % x^14+x^13+x^11+x^10+x^9+x^8... (0x6F)
            0 1 0 0   0 0 0 1];    % x^6+x^0                        (0x41) -> (0x1EDC6F41)
crc.init    = true(1,length(crc.poly));% [1 1 1 1   1 1 1 1   1 1 1 1   1 1 1 1  ...
                                       %  1 1 1 1   1 1 1 1   1 1 1 1   1 1 1 1];% (0xFFFFFFFF)
crc.residue = [1 0 1 1   0 1 1 1 ... % (0xB7)
               1 0 0 1   1 0 0 0 ... % (0x98)
               1 0 1 1   0 1 0 0 ... % (0xB4)
               0 0 1 1   1 0 0 0];   % (0x38) -> (0xB798B438)

crc.refin   = true;
crc.refout  = true;
crc.xorout  = true(1,length(crc.poly));% [1 1 1 1   1 1 1 1   1 1 1 1   1 1 1 1  ...
                                       %  1 1 1 1   1 1 1 1   1 1 1 1   1 1 1 1];% (0xFFFFFFFF)
crc.mode    = check;
crc.message = message;

if(check)
    crc.poly = true(1,length(crc.poly));
end

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, ~crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out =  binaryVectorToHex(crc.calc_bin);

end
