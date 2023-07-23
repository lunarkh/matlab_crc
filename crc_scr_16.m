
disp("CRC-16/ARC. Alias: ARC, CRC-16, CRC-16/LHA, CRC-IBM");% ASCII:"123456789" crc_check:"0xbb3d"
crc_hex = crc_16_arc(message, false); disp(" - calc  = 0x" + crc_hex);  disp(" ");

disp("CRC-16/CDMA2000");% ASCII:"123456789" crc_check:"0x4c06"
crc_hex = crc_16_cdma2000(message, false); disp(" - calc  = 0x" + crc_hex); disp(" ");

disp("CRC-16/CMS");% ASCII:"123456789" crc_check:"0xaee7"
crc_hex = crc_16_cms(message, false); disp(" - calc  = 0x" + crc_hex); disp(" ");

disp("CRC-16/DDS-110");% ASCII:"123456789" crc_check:"0x9ecf"
crc_hex = crc_16_dds_110(message, false); disp(" - calc  = 0x" + crc_hex); disp(" ");

disp("CRC-16/DECT-R. Alias: R-CRC-16");% ASCII:"123456789" crc_check:"0x007e"
crc_hex = crc_16_dect_r(message, false); disp(" - calc  = 0x" + crc_hex); disp(" ");

disp("CRC-16/DECT-X. Alias: X-CRC-16");% ASCII:"123456789" crc_check:"0x007f"
crc_hex = crc_16_dect_x(message, false);          disp(" - calc  = 0x" + crc_hex);
crc_hex = crc_16_dect_x([message crc_hex], true); disp(" - check = 0x" + crc_hex); disp(" ");

disp("CRC-16/DNP");% ASCII:"123456789" crc_check:"0xea82"
crc_hex = crc_16_dnp(message, false); disp(" - calc  = 0x" + crc_hex); disp(" ");

disp("CRC-16/EN-13757");% ASCII:"123456789" crc_check:"0xc2b7"
crc_hex = crc_16_en_13757(message, false); disp(" - calc  = 0x" + crc_hex); disp(" ");

disp("CRC-16/GENIBUS. Alias: CRC-16/DARC, CRC-16/EPC, CRC-16/EPC-C1G2, CRC-16/I-CODE");% ASCII:"123456789" crc_check:"0xd64e"
crc_hex = crc_16_genibus(message, false); disp(" - calc  = 0x" + crc_hex); disp(" ");

disp("CRC-16/GSM");% ASCII:"123456789" crc_check:"0xce3c"
crc_hex = crc_16_gsm(message, false); disp(" - calc  = 0x" + crc_hex); disp(" ");

disp("CRC-16/IBM-3740. Alias: CRC-16/AUTOSAR, CRC-16/CCITT-FALSE");% ASCII:"123456789" crc_check:"0x29b1"
crc_hex = crc_16_ibm_3740(message, false);                disp(" - calc      = 0x" + crc_hex);
crc_hex_lut = crc_16_ibm_3740_lut(message);               disp(" - calc lut  = 0x" + crc_hex_lut);
crc_hex = crc_16_ibm_3740([message crc_hex], true);       disp(" - check     = 0x" + crc_hex);
crc_hex_lut = crc_16_ibm_3740_lut([message crc_hex_lut]); disp(" - check lut = 0x" + crc_hex_lut); disp(" ");

disp("CRC-16/IBM-SDLC. Alias: CRC-16/ISO-HDLC, CRC-16/ISO-IEC-14443-3-B, CRC-16/X-25, CRC-B, X-25");% ASCII:"123456789" crc_check:"0x906e"
crc_hex = crc_16_ibm_sdlc(message, false); disp(" - calc  = 0x" + crc_hex); disp(" ");

disp("CRC-16/ISO-IEC-14443-3-A. Alias: CRC-A");% ASCII:"123456789" crc_check:"0xbf05"
crc_hex = crc_16_iso_iec_14443_3_a(message, false); disp(" - calc  = 0x" + crc_hex); disp(" ");

disp("CRC-16/KERMIT. Alias: CRC-16/BLUETOOTH, CRC-16/CCITT, CRC-16/CCITT-TRUE, CRC-16/V-41-LSB, CRC-CCITT, KERMIT");% ASCII:"123456789" crc_check:"0x2189"
crc_hex = crc_16_kermit(message, false); disp(" - calc  = 0x" + crc_hex); disp(" ");

disp("CRC-16/LJ1200");% ASCII:"123456789" crc_check:"0xbdf4"
crc_hex = crc_16_lj1200(message, false);          disp(" - calc  = 0x" + crc_hex);
crc_hex = crc_16_lj1200([message crc_hex], true); disp(" - check = 0x" + crc_hex); disp(" ");

disp("CRC-16/M17");% ASCII:"123456789" crc_check:"0x772b"
crc_hex = crc_16_m17(message, false); disp(" - calc  = 0x" + crc_hex); disp(" ");

disp("CRC-16/MAXIM-DOW. Alias: CRC-16/MAXIM");% ASCII:"123456789" crc_check:"0x44c2"
crc_hex = crc_16_maxim_dow(message, false); disp(" - calc  = 0x" + crc_hex); disp(" ");

disp("CRC-16/MCRF4XX");% ASCII:"123456789" crc_check:"0x6f91"
crc_hex = crc_16_mcrf4xx(message, false); disp(" - calc  = 0x" + crc_hex); disp(" ");

disp("CRC-16/MODBUS. Alias: MODBUS");% ASCII:"123456789" crc_check:"0x4b37"
crc_hex = crc_16_modbus(message, false);          disp(" - calc  = 0x" + crc_hex);
crc_hex = crc_16_modbus([message crc_hex], true); disp(" - check = 0x" + crc_hex); disp(" ");

disp("CRC-16/NRSC-5");% ASCII:"123456789" crc_check:"0xa066"
crc_hex = crc_16_nrsc_5(message, false);          disp(" - calc  = 0x" + crc_hex);
crc_hex = crc_16_nrsc_5([message crc_hex], true); disp(" - check = 0x" + crc_hex); disp(" ");

disp("CRC-16/OPENSAFETY-A");% ASCII:"123456789" crc_check:"0x5d38"
crc_hex = crc_16_opensafety_a(message, false);          disp(" - calc  = 0x" + crc_hex);
crc_hex = crc_16_opensafety_a([message crc_hex], true); disp(" - check = 0x" + crc_hex); disp(" ");

disp("CRC-16/OPENSAFETY-B");% ASCII:"123456789" crc_check:"0x20fe"
crc_hex = crc_16_opensafety_b(message, false);          disp(" - calc  = 0x" + crc_hex);
crc_hex = crc_16_opensafety_b([message crc_hex], true); disp(" - check = 0x" + crc_hex); disp(" ");

disp("CRC-16/PROFIBUS. Alias: CRC-16/IEC-61158-2");% ASCII:"123456789" crc_check:"0xa819"
crc_hex = crc_16_profibus(message, false);          disp(" - calc  = 0x" + crc_hex); disp(" ");

disp("CRC-16/RIELLO");% ASCII:"123456789" crc_check:"0x63d0"
crc_hex = crc_16_riello(message, false);          disp(" - calc  = 0x" + crc_hex); disp(" ");

disp("CRC-16/SPI-FUJITSU. Alias: CRC-16/AUG-CCITT");% ASCII:"123456789" crc_check:"0xe5cc"
crc_hex = crc_16_spi_fujitsu(message, false);          disp(" - calc  = 0x" + crc_hex);
crc_hex = crc_16_spi_fujitsu([message crc_hex], true); disp(" - check = 0x" + crc_hex); disp(" ");

