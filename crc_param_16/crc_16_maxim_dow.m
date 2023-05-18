function out = crc_16_maxim_dow(message, check)
%--settings-------
% width   = 16
% poly    = 0x8005
% init    = 0x0000
% refin   = true
% refout  = true
% xorout  = 0xffff 
% check   = 0x44c2 for ASCII:"123456789"
% residue = 0xb001
% name    = "CRC-16/MAXIM-DOW"
% Class: attested
% Alias: CRC-16/MAXIM
% Maxim Integrated (8 August 2012), DS1921G Datasheet
% - Definition: Width, Poly, Init, XorOut (p.32)
% - Shift register diagram (p.34)
% Maxim Integrated (22 August 2012), Application Note 27 (PDF, HTML)
% - Definition: Init (p.10)
% - Shift register diagram (p.11)
% - Code: 8051 assembler (pp.12–16)
% - Worked example (p.15)

crc.width   = 16;
crc.poly    = [1 0 0 0   0 0 0 0   0 0 0 0   0 1 0 1];% x^16 + x^15 + x^2 + x^0 (0x8005)
crc.init    = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.residue = [1 0 1 1   0 0 0 0   0 0 0 0   0 0 0 1];% (0xb001)
crc.refin   = true;
crc.refout  = true;
crc.xorout  = true(1,length(crc.poly));% [1 1 1 1   1 1 1 1   1 1 1 1   1 1 1 1];% (0xffff)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out =  binaryVectorToHex(crc.calc_bin);

end
