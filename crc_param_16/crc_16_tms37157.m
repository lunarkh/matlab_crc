function out = crc_16_tms37157(message, check)
%--settings-------
% width   = 16
% poly    = 0x1021
% init    = 0x89ec
% refin   = true
% refout  = true
% xorout  = 0x0000
% check   = 0x26b1 for ASCII:"123456789"
% residue = 0x0000
% name    = "CRC-16/TMS37157"
% Class: attested
% Texas Instruments, Inc. (November 2009), TMS37157 datasheet
% - Full definition (except Check) (pp.39–40)
% - Shift register diagram (Figure 51, p.39)
% - Flowchart (Figure 52, p.40)
% "harper", "jacknad" (November 2010–January 2011), StackOverflow submitted question and answers
% - Definition: Init (reverse form) ("harper")
% - Code: C ("jacknad")
% - 3 codewords ("harper")
%   0225A6
%   02400000​0000A060​E7
%   02410000​0000A46F​A5
% "Petri" (4 May 2010), Texas Instruments, Inc. E2E™ Community forum post
% - 1 codeword
%   01AAAAAA​AAAADC25​AB
% Unique effective solution of codeword set

crc.width   = 16;
crc.poly    = [0 0 0 1   0 0 0 0   0 0 1 0   0 0 0 1];% x^16 + x^12 + x^5 + x^0 (0x1021)
crc.init    = [1 0 0 0   1 0 0 1   1 1 1 0   1 1 0 0];% (0x89ec)
crc.residue = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.refin   = true;
crc.refout  = true;
crc.xorout  = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.init, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out = dec2hex(bin2dec(num2str((crc.calc_bin))),4);

end
