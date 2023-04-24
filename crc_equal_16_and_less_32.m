
disp(" CRC-16/IBM-3740. Alias: CRC-16/AUTOSAR, CRC-16/CCITT-FALSE");% ASCII:"123456789" crc_check:"0x29B1"
crc_hex = crc_16_ibm_3740(message, false);                disp(" - calc      = 0x" + crc_hex);
crc_lut_hex = crc_16_ibm_3740_lut(message);               disp(" - calc lut  = 0x" + crc_lut_hex);
crc_hex = crc_16_ibm_3740([message crc_hex], true);       disp(" - check     = 0x" + crc_hex);
crc_lut_hex = crc_16_ibm_3740_lut([message crc_lut_hex]); disp(" - check lut = 0x" + crc_lut_hex); disp(" ");

disp(" CRC-16/MODBUS. Alias: MODBUS");% ASCII:"123456789" crc_check:"0x4B37"
crc_hex = crc_16_modbus(message, false);          disp(" - calc  = 0x" + crc_hex);
crc_hex = crc_16_modbus([message crc_hex], true); disp(" - check = 0x" + crc_hex); disp(" ");
