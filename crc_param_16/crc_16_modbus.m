function out = crc_16_modbus(message, check)
%--settings-------
% width   = 16
% poly    = 0x8005
% init    = 0xFFFF
% refin   = true
% refout  = true
% xorout  = 0x0000
% check   = 0x4B37 for ASCII:"123456789"
% residue = 0x0000
% name    = "CRC-16/MODBUS"
% Class: attested
% Alias: MODBUS
% CRC presented low byte first.
% MODICON Inc. (June 1996), Modbus Protocol Reference Guide, Rev. J
% - Algorithm (pp.112–3)
% - Code: C (pp.113–5)

crc.width   = 16;
crc.poly    = [1 0 0 0   0 0 0 0   0 0 0 0   0 1 0 1];% x^16 + x^15 + x^2 + x^0 (0x8005)
crc.init    = true(1,length(crc.poly));% [1 1 1 1   1 1 1 1   1 1 1 1   1 1 1 1];% (0xFFFF)
crc.residue = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.refin   = true;
crc.refout  = true;
crc.xorout  = false(1,length(crc.poly));% [0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0];% (0x0000)
crc.mode    = check;
if(check)% CRC presented low byte first. (14)                                                     % [data crc*] -> [data crc`]
    len = length(message);                                                                        % - crc* = [1_MSB 1_LSB 0_MSB 0_LSB]
    crc.message = [message(1:(len-4)) message(len-1) message(len) message(len-3) message(len-2)]; % - crc` = [0_MSB 0_LSB 1_MSB 1_LSB]
else
    crc.message = message;
end
crc.calc_bin = crc_uni(crc.width, crc.poly, crc.init, crc.init, crc.refin, crc.refout, crc.xorout, crc.mode, crc.message);

out =  binaryVectorToHex(crc.calc_bin);

end
