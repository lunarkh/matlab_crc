
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

disp(" CRC-6/G-704. Alias: CRC-6/ITU");% ASCII:"123456789" crc_check:"0x06"
crc_hex = crc_6_g_704(message, false);          disp(" - calc  = 0x" + crc_hex);
crc_hex = crc_6_g_704([message crc_hex], true); disp(" - check = 0x" + crc_hex); disp(" ");
