
disp(" CRC-32/AIXM. Alias: CRC-32Q");% ASCII:"123456789" crc_check:"0x3010BF7F"
crc_hex = crc_32_aixm(message, false);          disp(" - calc  = 0x" + crc_hex);
crc_hex = crc_32_aixm([message crc_hex], true); disp(" - check = 0x" + crc_hex); disp(" ");

disp(" CRC-32/ISCSI. Alias: CRC-32/BASE91-C, CRC-32/CASTAGNOLI, CRC-32/INTERLAKEN, CRC-32C");% ASCII:"123456789" crc_check:"0xE3069283"
crc_hex = crc_32_iscsi(message, false);  disp(" - calc      = 0x" + crc_hex);
crc_lut_hex = crc_32_iscsi_lut(message); disp(" - calc lut  = 0x" + crc_lut_hex); disp(" ");

disp(" CRC-32/ISO-HDLC. Alias: CRC-32, CRC-32/ADCCP, CRC-32/V-42, CRC-32/XZ, PKZIP");% ASCII:"123456789" crc_check:"0xCBF43926"
crc_lut_hex = crc_32_iso_hdlc_lut(message); disp(" - calc lut = 0x" + crc_lut_hex); disp(" ");
