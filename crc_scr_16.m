
disp(" CRC-16/ARC. Alias: ARC, CRC-16, CRC-16/LHA, CRC-IBM");% ASCII:"123456789" crc_check:"0xbb3d"
crc_hex = crc_16_arc(message, false); disp(" - calc  = 0x" + crc_hex);  disp(" ");

disp(" CRC-16/CDMA2000");% ASCII:"123456789" crc_check:"0x4c06"
crc_hex = crc_16_cdma2000(message, false); disp(" - calc  = 0x" + crc_hex); disp(" ");

disp(" CRC-16/CMS");% ASCII:"123456789" crc_check:"0xaee7"
crc_hex = crc_16_cms(message, false); disp(" - calc  = 0x" + crc_hex); disp(" ");

disp(" CRC-16/DDS-110");% ASCII:"123456789" crc_check:"0x9ecf"
crc_hex = crc_16_dds_110(message, false); disp(" - calc  = 0x" + crc_hex); disp(" ");

disp(" CRC-16/DECT-R. Alias: R-CRC-16");% ASCII:"123456789" crc_check:"0x007e"
crc_hex = crc_16_dect_r(message, false); disp(" - calc  = 0x" + crc_hex); disp(" ");

disp(" CRC-16/DECT-X. Alias: X-CRC-16");% ASCII:"123456789" crc_check:"0x007f"
crc_hex = crc_16_dect_x(message, false);          disp(" - calc  = 0x" + crc_hex);
crc_hex = crc_16_dect_x([message crc_hex], true); disp(" - check = 0x" + crc_hex); disp(" ");

disp(" CRC-16/DNP");% ASCII:"123456789" crc_check:"0xea82"
crc_hex = crc_16_dnp(message, false); disp(" - calc  = 0x" + crc_hex); disp(" ");

disp(" CRC-16/EN-13757");% ASCII:"123456789" crc_check:"0xc2b7"
crc_hex = crc_16_en_13757(message, false); disp(" - calc  = 0x" + crc_hex); disp(" ");

disp(" CRC-16/GENIBUS. Alias: CRC-16/DARC, CRC-16/EPC, CRC-16/EPC-C1G2, CRC-16/I-CODE");% ASCII:"123456789" crc_check:"0xd64e"
crc_hex = crc_16_genibus(message, false); disp(" - calc  = 0x" + crc_hex); disp(" ");

disp(" CRC-16/GSM");% ASCII:"123456789" crc_check:"0xce3c"
crc_hex = crc_16_gsm(message, false); disp(" - calc  = 0x" + crc_hex); disp(" ");

disp(" CRC-16/IBM-3740. Alias: CRC-16/AUTOSAR, CRC-16/CCITT-FALSE");% ASCII:"123456789" crc_check:"0x29b1"
crc_hex = crc_16_ibm_3740(message, false);                disp(" - calc      = 0x" + crc_hex);
crc_hex_lut = crc_16_ibm_3740_lut(message);               disp(" - calc lut  = 0x" + crc_hex_lut);
crc_hex = crc_16_ibm_3740([message crc_hex], true);       disp(" - check     = 0x" + crc_hex);
crc_hex_lut = crc_16_ibm_3740_lut([message crc_hex_lut]); disp(" - check lut = 0x" + crc_hex_lut); disp(" ");

disp(" CRC-16/IBM-SDLC. Alias: CRC-16/ISO-HDLC, CRC-16/ISO-IEC-14443-3-B, CRC-16/X-25, CRC-B, X-25");% ASCII:"123456789" crc_check:"0x906e"
crc_hex = crc_16_ibm_sdlc(message, false);          disp(" - calc  = 0x" + crc_hex); disp(" ");

disp(" CRC-16/ISO-IEC-14443-3-A. Alias: CRC-A");% ASCII:"123456789" crc_check:"0xbf05"
crc_hex = crc_16_iso_iec_14443_3_a(message, false);          disp(" - calc  = 0x" + crc_hex); disp(" ");

disp(" CRC-16/MODBUS. Alias: MODBUS");% ASCII:"123456789" crc_check:"0x4b37"
crc_hex = crc_16_modbus(message, false);          disp(" - calc  = 0x" + crc_hex);
crc_hex = crc_16_modbus([message crc_hex], true); disp(" - check = 0x" + crc_hex); disp(" ");
