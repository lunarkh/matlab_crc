function out = crc_8_gsm_a(message, check)
%--settings-------
% width   = 8
% poly    = 0x1d
% init    = 0x00
% refin   = false
% refout  = false
% xorout  = 0x00
% check   = 0x37 for ASCII:"123456789"
% residue = 0x00
% name    = "CRC-8/GSM-A"
% Class: academic
% ETSI TS 100 909 version 8.9.0 (January 2005)
% - Full mathematical description (Section 3.1.1.1, pp.17–18)
% Michael Niedermayer, Aurélien Jacobs et al. (4 April 2022), FFmpeg 5.0.1 (XZ compressed tarfile), module ffmpeg-5.0.1/libavutil/tests/crc.c
% - 1 codeword
%   1999 bytes (i+i*i) plus D6

crc.width   = 8;
crc.poly    = [0 0 0 1   1 1 0 1];% x^8 + x^4 + x^3 + x^2 + x^0 (0x1d)
crc.init    = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0];% (0x00)
crc.residue = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0];% (0x00)
crc.refin   = false;
crc.refout  = false;
crc.xorout  = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0];% (0x00)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out = dec2hex(bin2dec(num2str((crc.calc_bin))),2);

end
