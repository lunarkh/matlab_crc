function out = crc_16_mcrf4xx(message, check)
%--settings-------
% width   = 16
% poly    = 0x1021
% init    = 0xffff
% refin   = true
% refout  = true
% xorout  = 0x0000 
% check   = 0x6f91 for ASCII:"123456789"
% residue = 0x0000
% name    = "CRC-16/MCRF4XX"
% Class: attested
% Youbok Lee, PhD, Microchip Technology Inc. (16 July 2001), "CRC Algorithm for MCRF45X Read/Write Device"
% - Definition: Width, Poly (reverse form) (p.1)
% - Shift register diagram (p.1)
% - Flowchart (p.2)
% - Worked example (p.3)
% - Code: C (pp.4–5)
% Piers Desrochers, PICList MassMind, "A quick guide to CRC"
% - Description
% - Worked example
% William H. Press, Brian P. Flannery, Saul A. Teukolsky, William T. Vetterling (1992),
% Numerical recipes in C: The art of scientific computing, 2nd ed., Cambridge University Press, ISBN 0-521-43108-5
% - All parameters (except Check) (p.898)
% - Code: C (pp.900–1)
% - 2 codewords (p.898)
%   54261B
%   4361744D​6F757365​39383736​35343332​316EF5
% "kilobravo" (16 June 2008), Computer Interfacing Forum topic 578 (courtesy of the Internet Archive)
% - 2 codewords
%   3A7164D9
%   3A916A3E
% Unique effective solution of codeword set

crc.width   = 16;
crc.poly    = [0 0 0 1   0 0 0 0   0 0 1 0   0 0 0 1];% x^16 + x^12 + x^5 + x^0 (0x1021)
crc.init    = true(1,length(crc.poly));% [1 1 1 1   1 1 1 1   1 1 1 1   1 1 1 1];% (0xffff)
crc.residue = false(1,length(crc.poly));% (0x0000)
crc.refin   = true;
crc.refout  = true;
crc.xorout  = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out = dec2hex(bin2dec(num2str((crc.calc_bin))),4);
end
