function out = crc_16_ibm_sdlc(message, check)
%--settings-------
% width   = 16
% poly    = 0x1021
% init    = 0xffff
% refin   = true
% refout  = true
% xorout  = 0xffff
% check   = 0x906e for ASCII:"123456789"
% residue = 0xf0b8
% name    = "CRC-16/IBM-SDLC"
% Class: attested
% Alias: CRC-16/ISO-HDLC, CRC-16/ISO-IEC-14443-3-B, CRC-16/X-25, CRC-B, X-25
% HDLC is defined in ISO/IEC 13239. CRC_B is defined in ISO/IEC 14443-3.
% ITU-T Recommendation T.30 (September 2005)
% - Definition: Residue; full mathematical description (Section 5.3.7, p.78)
% ITU-T Recommendation V.42 (March 2002)
% - Definition: Residue; full mathematical description (Section 8.1.1.6.1, p.17)
% ITU-T Recommendation X.25 (October 1996)
% - Definition: Residue; full mathematical description (Section 2.2.7.4, p.9)
% - 4 codewords (Appendix I, p.145)
%   033F5BEC
%   01738357
%   013FEBDF
%   03733364
% IETF RFC 1331 (May 1992)
% - Code: C (Appendix B, pp.61–3)
% IETF RFC 1662 (July 1994)
% - Code: C (Appendix C.2, pp.19–21)
% William H. Press, Brian P. Flannery, Saul A. Teukolsky, William T. Vetterling (1992),
% Numerical recipes in C: The art of scientific computing, 2nd ed., Cambridge University Press, ISBN 0-521-43108-5
% - All parameters (except Check) (p.898)
% - Code: C (pp.900–1)
% - 2 codewords (p.898)
%   54D9E4 (source: 54261B)
%   4361744D​6F757365​39383736​35343332​31910A (source: 4361744D​6F757365​39383736​35343332​316EF5)
% Berndt M. Gammel (29 October 2006), Matpack 1.9.1 class MpCRC documentation
% - All parameters (except Residue)
% iBiquity Digital Corporation (14 December 2016), HD Radio™ Air Interface Design Description:
% Advanced Application Services Transport, rev. H (courtesy of National Radio Systems Committee)
% - 1 codeword (Figure 6-3, p.17)
%   21005100​00494433​03000000​00004A54​49543200​00000D00​0000416E​616C6F67​20426C75​65735450​45310000​000D0000​004A2E20​512E2050​75626C69​6354414C​42000000​12000000​54686520​4C6F7374​20536573​73696F6E​73F527
% ISO/IEC FCD 14443-3 (24 November 2008)
% - 3 codewords (Annex B.2, p.50)
%   000000CC​C6
%   0FAAFFFC​D1
%   0A123456​2CF6
% Unique effective solution of codeword set

crc.width   = 16;
crc.poly    = [0 0 0 1   0 0 0 0   0 0 1 0   0 0 0 1];% x^16 + x^12 + x^5 + x^0 (0x1021)
crc.init    = true(1,length(crc.poly));% [1 1 1 1   1 1 1 1   1 1 1 1   1 1 1 1];% (0xffff)
crc.residue = [1 1 1 1   0 0 0 0   1 0 1 1   1 0 0 0];% (0xf0b8)
crc.refin   = true;
crc.refout  = true;
crc.xorout  = true(1,length(crc.poly));% [1 1 1 1   1 1 1 1   1 1 1 1   1 1 1 1];% (0xffff)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out =  binaryVectorToHex(crc.calc_bin);

end
