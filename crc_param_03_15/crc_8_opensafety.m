function out = crc_8_opensafety(message, check)
%--settings-------
% width   = 8
% poly    = 0x2f
% init    = 0x00
% refin   = false
% refout  = false
% xorout  = 0x00
% check   = 0x3e for ASCII:"123456789"
% residue = 0x00
% name    = "CRC-8/OPENSAFETY"
% Class: attested
% Ethernet POWERLINK Standardisation Group (18 October 2018), OpenSAFETY Safety Profile Specification Working Draft Proposal, version 1.5.2
% - Full description (Section 5.1.2.6, pp.43–4)
% - Error detection capability (Section 8.1, p.182)
% - Code: C (Appendix 1, pp.196–9)
% - 1 codeword (Appendix 1, l.3519, pp.196–7)
%   23C80834​11223344​55667788​3C
% Roland Knall (6 February 2012), openSAFETY communication using Ethernet Powerlink V2 as transport protocol (PCAP file) (courtesy of Wireshark Wiki)
% - Transcript confirming implementation (selected codewords)
%   02A80600​00606500​06A11C
%   03A80001​00006065​0006A131
%   03A80600​00606500​07211D
%   02A80001​00006065​0007211D
%   04A80600​00606500​021393
%   05A80001​00006065​00021350
%   01AC0600​00606500​0721AF
%   00AC0003​00006065​000721B5
% Prof. Philip Koopman, Tridib Chakravarty (June 2004), Cyclic Redundancy Code (CRC) Polynomial Selection for Embedded Networks
% - Assessment of polynomial performance (as 0x97 or C2)
% Unique effective solution of codeword set

crc.width   = 8;
crc.poly    = [0 0 1 0   1 1 1 1];% x^8 + x^5 + x^3 + x^2 + x^1 + x^0 (0x2f)
crc.init    = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0];% (0x00)
crc.residue = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0];% (0x00)
crc.refin   = false;
crc.refout  = false;
crc.xorout  = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0];% (0x00)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out =  binaryVectorToHex(crc.calc_bin);

end
