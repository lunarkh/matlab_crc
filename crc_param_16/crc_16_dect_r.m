function out = crc_16_dect_r(message, check)
%--settings-------
% width   = 16
% poly    = 0x0589
% init    = 0x0000
% refin   = false
% refout  = false
% xorout  = 0x0001
% check   = 0x007e for ASCII:"123456789"
% residue = 0x0589
% name    = "CRC-16/DECT-R"
% Class: attested
% Alias: R-CRC-16
% Used in DECT A-fields.
% ETSI EN 300 175-3 version 2.5.1 (August 2013)
% - Full mathematical description (Section 6.2.5.2, p.99)
% - Performance of polynomial (Annex B, p.297)
% Thomas Pircher (6 February 2019), pycrc 0.9.2
% - Implementation
% Pavel Yazev (9 September 2015), gr-dect2 module gr-dect2/lib/packet_decoder_impl.cc
% - Code: C++

crc.width   = 16;
crc.poly    = [0 0 0 0   0 1 0 1   1 0 0 0   1 0 0 1];% x^16 + x^10 + x^8 + x^7 + x^3 + x^0 (0x0589)
crc.init    = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.residue = [0 0 0 0   0 1 0 1   1 0 0 0   1 0 0 1];% (0x0589)
crc.refin   = false;
crc.refout  = false;
crc.xorout  = [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 1];% (0x0001)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out = dec2hex(bin2dec(num2str((crc.calc_bin))),4);

end
