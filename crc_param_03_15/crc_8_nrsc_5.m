function out = crc_8_nrsc_5(message, check)
%--settings-------
% width   = 8
% poly    = 0x31
% init    = 0xff
% refin   = false
% refout  = false
% xorout  = 0x00
% check   = 0xf7 for ASCII:"123456789"
% residue = 0x00
% name    = "CRC-8/NRSC-5"
% Class: attested
% iBiquity Digital Corporation (16 December 2016), HD Radio™ Air Interface Design Description: Audio Transport, rev. H (courtesy of National Radio Systems Committee)
% - Definition: Width, Poly (Section 5.2.3.2, p.33)
% - Incorporated by normative reference into National Radio Systems Committee standard NRSC-5-D.
% Andrew Wesie (9 June 2017), NRSC-5 receiver for rtl-sdr, file nrsc5/support/sample.xz (XZ compressed raw radio recording, 22 MB)
% - Recording confirming implementation with 587 codewords (selection)
%   5822EF63​9D240114​F25D007C​DA4208A1​CBBDE9DF​D73273A7​D1800030​38EB
%   B002F6E0​1BF5E00B​E3F6D054​50D23B70​273990D9​0ED77AED​F6EB803C​1AD30A68​5E0A009A
%   412C5659​98C49382​14C58005​800B09CA​BACB98B6​56DE98FB​199A1892​3DE06D59​2D2D399A​5CA72CFA​D96BC107​35E4774F​A06AFEAB​1726EF0F​471ABED7​04DA798D​EDABB16D​1A4F0D7B​7C49F65C​1EBE2D5D​E6EB16D8​BF2DB019​9F76D6C8​455C1C70​251B4290​CA669C00​AC529FC0​01400217​4006E686​0558EEF5​CBE4DEF9​94D1F642​156E48FA​68072E78​A7F1C88A​80DF0251​6B5672FF​F281780B​6200A3
%   896C6088​52750D2D​C9249055​5A448BA6​55686F62​F35A2F75​22C62EB1​31618814​68600683​310689
%   412C5700​68CB2362​DCCB2400​004416B4​2A5F9B2C​469A721D​106258A7​6D77C2F1​05C315DA​1257CAD1​232A4728​2475FB25​0171BCC0​94DE3C57​11A0B688​92F7A568​5CAB9788​1BFA8020​56600688​A08815EA​D3C069B6​8A952C00​058BD007​1DFD5F97​5D1CFD97​6FAE0A82​A1AF1636​E4687EE4​72C62F22​A96E3197​B8894385​2B128D04​89E911B8​5B840231​22176D06​70130348​DDD55441​6BB8852A​854364
%   0D0640C6​D800124B
%   89866AD8​12A05E80​34A3BBBA​AAB56AD4​FAD9894B​00300000​00007752
% Andrew Wesie, Clayton Smith et al. (25 October 2017), NRSC-5 receiver for rtl-sdr, module nrsc5/src/frame.c
% - Code: C
% Unique effective solution of codeword set

crc.width   = 8;
crc.poly    = [0 0 1 1   0 0 0 1];% x^8 + x^5 + x^4 + x^0 (0x31)
crc.init    = true(1,length(crc.poly));% [1 1 1 1   1 1 1 1];% (0xff)
crc.residue = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0];% (0x00)
crc.refin   = false;
crc.refout  = false;
crc.xorout  = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0];% (0x00)
crc.mode    = check;
crc.message = message;

crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.residue, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out =  binaryVectorToHex(crc.calc_bin);

end
