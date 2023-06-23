function out = crc_16_opensafety_b(message, check)
%--settings-------
% width   = 16
% poly    = 0x755b
% init    = 0x0000
% refin   = false
% refout  = false
% xorout  = 0x0000
% check   = 0x20fe for ASCII:"123456789"
% residue = 0x0000
% name    = "CRC-16/OPENSAFETY-B"
% Class: attested
% The single codeword is supported by the codewords confirming CRC-8/OPENSAFETY, defined identically apart from Width, Poly in the same standard.
% Ethernet POWERLINK Standardisation Group (18 October 2018), OpenSAFETY Safety Profile Specification Working Draft Proposal, version 1.5.2
% - Full description (Section 5.1.2.6, pp.43–4)
% - Error detection capability (Section 8.1, p.182)
% - Code: C (Appendix 1, pp.196–9)
% - 1 codeword (Appendix 1, l.3530, pp.196–7)
%   22C81256​30112233​44556677​887031
% Prof. Philip Koopman, Tridib Chakravarty (June 2004), Cyclic Redundancy Code (CRC) Polynomial Selection for Embedded Networks
% - Assessment of polynomial performance (as 0xBAAD)

crc.width   = 16;
crc.poly    = [0 1 1 1   0 1 0 1   0 1 0 1   1 0 1 1];% x^16 + x^14 + x^13 + x^12 + x^10 + x^8 + x^6 + x^4 + x^3 + x^1 + x^0 (0x755b)
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
