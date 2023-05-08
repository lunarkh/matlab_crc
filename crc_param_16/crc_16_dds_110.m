function out = crc_16_dds_110(message, check)
%--settings-------
% width   = 16
% poly    = 0x8005
% init    = 0x800d
% refin   = false
% refout  = false
% xorout  = 0x0000
% check   = 0x9ecf for ASCII:"123456789"
% residue = 0x0000
% name    = "CRC-16/DDS-110"
% Class: attested
% Used in the ELV DDS 110 function generator. Init value is equivalent to
% an augment of 0xFFFF prepended to the message.
% ELV Elektronik AG (March 2008), Software-Schnittstelle der Funktionsgeneratoren
% DDS 10/DDS 110 (in German; courtesy of the Internet Archive)
% - Definition: Width, Poly, CRC byte order (p.67)
% - 1 codeword (escaped according to the text) (p.67)
%   02001082​00731082​F7FE (source: 02000200​731082FE​F7)
% "wortel", "Gammatester" (19 July 2009), Computer Interfacing Forum topic 1372 (courtesy of the Internet Archive)
% - All parameters (except Check, Residue) ("Gammatester")
% - 3 codewords ("wortel")
%   02001082​007800ED​96
%   02001082​0078016D​93
%   02000500​6600057A​586435
% Unique effective solution of codeword set

crc.width   = 16;
crc.poly    = [1 0 0 0   0 0 0 0   0 0 0 0   0 1 0 1];% x^16 + x^15 + x^2 + x^0 (0x8005)
crc.init    = [1 0 0 0   0 0 0 0   0 0 0 0   1 1 0 1];% (0x800d)
crc.residue = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.refin   = false;
crc.refout  = false;
crc.xorout  = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out =  binaryVectorToHex(crc.calc_bin);

end
