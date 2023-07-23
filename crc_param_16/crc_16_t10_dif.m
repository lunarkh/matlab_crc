function out = crc_16_t10_dif(message, check)
%--settings-------
% width   = 16
% poly    = 0x8bb7
% init    = 0x0000
% refin   = false
% refout  = false
% xorout  = 0x0000
% check   = 0xd0db for ASCII:"123456789"
% residue = 0x0000
% name    = "CRC-16/T10-DIF"
% Class: attested
% Used in the SCSI Data Integrity Field. XorOut = 0xBADB is proposed to mark known bad blocks.
% Gerald Houlder, INCITS Technical Committee T10 (2 May 2003), End-to-End Data Protection Proposal
% - Definition: Poly, Init (p.6)
% - Shift register diagram (p.18)
% George O. Penokie, INCITS Technical Committee T10 (22 October 2003), Simplified End-to-End Data Protection
% - Definition: Residue; full mathematical description (Sections 4.5.3–4.5.4, pp.4–5)
% - 5 codewords (Section 4.5.6, p.6)
%   00000000​00000000​00000000​00000000​00000000​00000000​00000000​00000000​0000
%   FFFFFFFF​FFFFFFFF​FFFFFFFF​FFFFFFFF​FFFFFFFF​FFFFFFFF​FFFFFFFF​FFFFFFFF​A293
%   00010203​04050607​08090A0B​0C0D0E0F​10111213​14151617​18191A1B​1C1D1E1F​0224
%   FFFF0000​00000000​00000000​00000000​00000000​00000000​00000000​00000000​21B8
%   FFFEFDFC​FBFAF9F8​F7F6F5F4​F3F2F1F0​EFEEEDEC​EBEAE9E8​E7E6E5E4​E3E2E1E0​A0B7
% Ralph Weber, John Lohmeyer, INCITS Technical Committee T10 (20 August 2003), Minutes of Data Integrity Study Group - Aug 19-20, 2003
% - Definition: Init, XorOut (Item 4.6, p.3)
% - Acceptance of previous two documents (Item 4.7, p.3)
% Pat Thaler, INCITS Technical Committee T10 (28 August 2003), 16-bit CRC polynomial selection
% - Properties of polynomial
% Martin K. Petersen, Oracle Corporation (2007); Tim Chen, Intel Corporation (2013), Linux module crypto/crct10dif_common.c
% - Code: C

crc.width   = 16;
crc.poly    = [1 0 0 0   1 0 1 1   1 0 1 1   0 1 1 1];% x^16 + x^15 + x^11 + x^9 + x^8 + x^7 + x^5 + x^4 + x^2 + x^1 + x^0 (0x8bb7)
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
