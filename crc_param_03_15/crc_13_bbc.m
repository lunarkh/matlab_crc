function out = crc_13_bbc(message, check)
%--settings-------
% width   = 13
% poly    = 0x1cf5
% init    = 0x0000
% refin   = false
% refout  = false
% xorout  = 0x0000
% check   = 0x04fa for ASCII:"123456789"
% residue = 0x0000
% name    = "CRC-12/BBC"
% Class: attested
% S. R. Ely, D. T. Wright, British Broadcasting Corporation (March 1982),
% L.F. Radio-data: specification of the BBC experimental transmissions 1982
% - Full mathematical description (Section 5.3, pp.4–5)
% - Definition of bit order (Section 5.2, p.4)
% - Worked example (as generator matrix) (Figure 10, p.10)
% - 1 additional codeword (Appendix, p.10)
%   17777777​77776272​2 (octal)

crc.width   = 13;
crc.poly    = [1   1 1 0 0   1 1 1 1   0 1 0 1];% x^13 + x^12 + x^11 + x^10 + x^7 + x^6 + x^5 + x^4 + x^2 + x^0(0x1cf5)
crc.init    = false(1,length(crc.poly));% [0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.residue = false(1,length(crc.poly));% [0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.refin   = false;
crc.refout  = false;
crc.xorout  = false(1,length(crc.poly));% [0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x000)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out =  binaryVectorToHex(crc.calc_bin);

end
