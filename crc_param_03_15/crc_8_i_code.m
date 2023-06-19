function out = crc_8_i_code(message, check)
%--settings-------
% width   = 8
% poly    = 0x1d
% init    = 0xfd
% refin   = false
% refout  = false
% xorout  = 0x00
% check   = 0x7e for ASCII:"123456789"
% residue = 0x00
% name    = "CRC-8/I-CODE"
% Class: attested
% Philips Semiconductors (30 January 2004), SL2 ICS11 Product Specification, revision 3.0 (courtesy of the Internet Archive)
% - Definition: Width, Poly, Init (Section 10.1, p.26)
% - Code: C (Section 10.3.1, pp.27–9)
% - Worked example (as code trace) (Section 10.3.1, p.29)

crc.width   = 8;
crc.poly    = [0 0 0 1   1 1 0 1];% x^8 + x^4 + x^3 + x^2 + x^0 (0x1d)
crc.init    = [1 1 1 1   1 1 0 1];% (0xfd)
crc.residue = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0];% (0x00)
crc.refin   = false;
crc.refout  = false;
crc.xorout  = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0];% (0x00)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out = dec2hex(bin2dec(num2str((crc.calc_bin))),2);

end
