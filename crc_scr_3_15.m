
disp(" CRC-3/GSM");% ASCII:"123456789" crc_check:"0x4"
crc_hex = crc_3_gsm(message, false);          disp(" - calc  = 0x" + crc_hex);
crc_hex = crc_3_gsm([message crc_hex], true); disp(" - check = 0x" + crc_hex); disp(" ");

disp(" CRC-3/ROHC");% ASCII:"123456789" crc_check:"0x6"
crc_hex = crc_3_rohc(message, false); disp(" - calc  = 0x" + crc_hex); disp(" ");

disp(" CRC-4/G-704");% ASCII:"123456789" crc_check:"0x7"
crc_hex = crc_4_g_704(message, false); disp(" - calc  = 0x" + crc_hex); disp(" ");

disp(" CRC-4/INTERLAKEN");% ASCII:"123456789" crc_check:"0xb"
crc_hex = crc_4_interlaken(message, false); disp(" - calc  = 0x" + crc_hex); disp(" ");

disp(" CRC-5/EPC-C1G2");% ASCII:"123456789" crc_check:"0x00"
crc_hex = crc_5_epc_c1g2(message, false); disp(" - calc  = 0x" + crc_hex); disp(" ");

disp(" CRC-5/G-704");% ASCII:"123456789" crc_check:"0x07"
crc_hex = crc_5_g_704(message, false); disp(" - calc  = 0x" + crc_hex);
crc_hex = crc_5_g_704([message crc_hex], true); disp(" - check = 0x" + crc_hex); disp(" ");

disp(" CRC-5/USB");% ASCII:"123456789" crc_check:"0x19"
crc_hex = crc_5_usb(message, false); disp(" - calc  = 0x" + crc_hex); disp(" ");

disp(" CRC-6/CDMA2000-A");% ASCII:"123456789" crc_check:"0x0d"
crc_hex = crc_6_cdma2000_a(message, false); disp(" - calc  = 0x" + crc_hex); disp(" ");

disp(" CRC-6/CDMA2000-B");% ASCII:"123456789" crc_check:"0x3b"
crc_hex = crc_6_cdma2000_b(message, false); disp(" - calc  = 0x" + crc_hex); disp(" ");

disp(" CRC-6/DARC");% ASCII:"123456789" crc_check:"0x26"
crc_hex = crc_6_darc(message, false); disp(" - calc  = 0x" + crc_hex);
crc_hex = crc_6_darc([message crc_hex], true); disp(" - check = 0x" + crc_hex); disp(" ");

disp(" CRC-6/G-704. Alias: CRC-6/ITU");% ASCII:"123456789" crc_check:"0x06"
crc_hex = crc_6_g_704(message, false);          disp(" - calc  = 0x" + crc_hex);
crc_hex = crc_6_g_704([message crc_hex], true); disp(" - check = 0x" + crc_hex); disp(" ");

disp(" CRC-6/GSM");% ASCII:"123456789" crc_check:"0x13"
crc_hex = crc_6_gsm(message, false); disp(" - calc  = 0x" + crc_hex); disp(" ");

disp(" CRC-7/MMC");% ASCII:"123456789" crc_check:"0x75"
crc_hex = crc_7_mmc(message, false); disp(" - calc  = 0x" + crc_hex); disp(" ");

disp(" CRC-7/ROHC");% ASCII:"123456789" crc_check:"0x53"
crc_hex = crc_7_rohc(message, false); disp(" - calc  = 0x" + crc_hex); disp(" ");

disp(" CRC-7/UMTS");% ASCII:"123456789" crc_check:"0x61"
crc_hex = crc_7_umts(message, false); disp(" - calc  = 0x" + crc_hex); disp(" ");

disp(" CRC-8/AUTOSAR");% ASCII:"123456789" crc_check:"0xdf"
crc_hex = crc_8_autosar(message, false); disp(" - calc  = 0x" + crc_hex); disp(" ");

disp(" CRC-8/BLUETOOTH");% ASCII:"123456789" crc_check:"0x26"
crc_hex = crc_8_bluetooth(message, false); disp(" - calc  = 0x" + crc_hex);
crc_hex = crc_8_bluetooth([message crc_hex], true); disp(" - check = 0x" + crc_hex); disp(" ");
