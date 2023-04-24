function out = crc_32_aixm(message, check)
%--settings-------
% width   = 32
% poly    = 0x814141AB
% init    = 0x00000000
% refin   = false
% refout  = false
% xorout  = 0x00000000
% check   = 0x3010BF7F for ASCII:"123456789"
% residue = 0x00000000
% name    = "CRC-32/AIXM"
% Class: attested
% Alias: CRC-32Q
% Used for aeronautical data. Recognised by the ICAO.
% EUROCONTROL (20 March 2006), AIXM Primer 4.5
% - Definition: Width, Poly, Init, XorOut, RefIn (Section 6.2, pp.23–5)
% - Flowchart (p.24)
% - Code: Java (Appendix B, pp.41–5)
%   - 8 codewords (Table 6.1, p.25)
%     - 34383036​33374EA5​A7C704
%     - 30313633​34313145​A1AE5741
%     - 34383036​33374E30​31363334​313145A1​BA30EE
%     - 3738326C​297100
%     - 34383036​33374E30​31363334​31314537​38326A25​9F4E
%     - 34362E37​266D25C1
%     - 34383036​33374E30​31363334​31314534​362E372F​866D6D
%     - 34383036​33374E30​31363334​31314537​38323436​2E375E5D​C940

crc.width   = 32;
crc.poly = [1 0 0 0   0 0 0 1  ... % x^32+x^28+x^27+x^26+x^25+...   (0x81)
            0 1 0 0   0 0 0 1  ... % x^23+x^22+x^20+x^19+x^18+...   (0x41)
            0 1 0 0   0 0 0 1  ... % x^14+x^13+x^11+x^10+x^9+x^8... (0x41)
            1 0 1 0   1 0 1 1];    % x^6+x^0                        (0xAB) -> (0x814141AB)
crc.init    = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0  ...
                                        %  0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x00000000)
crc.residue = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0  ...
                                        %  0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x00000000)
crc.refin   = false;
crc.refout  = false;
crc.xorout  = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0  ...
                                        %  0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x00000000)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out =  binaryVectorToHex(crc.calc_bin);

end
