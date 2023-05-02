
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

disp(" CRC-8/CDMA2000");% ASCII:"123456789" crc_check:"0xda"
crc_hex = crc_8_cdma2000(message, false); disp(" - calc  = 0x" + crc_hex); disp(" ");

disp(" CRC-8/DARC");% ASCII:"123456789" crc_check:"0x15"
crc_hex = crc_8_darc(message, false); disp(" - calc  = 0x" + crc_hex);
crc_hex = crc_8_darc([message crc_hex], true); disp(" - check = 0x" + crc_hex); disp(" ");

disp(" CRC-8/DVB-S2");% ASCII:"123456789" crc_check:"0xbc"
crc_hex = crc_8_dvb_s2(message, false); disp(" - calc  = 0x" + crc_hex);
crc_hex = crc_8_dvb_s2([message crc_hex], true); disp(" - check = 0x" + crc_hex); disp(" ");

disp(" CRC-8/GSM-A");% ASCII:"123456789" crc_check:"0x37"
crc_hex = crc_8_gsm_a(message, false); disp(" - calc  = 0x" + crc_hex);
crc_hex = crc_8_gsm_a([message crc_hex], true); disp(" - check = 0x" + crc_hex); disp(" ");

disp(" CRC-8/GSM-B");% ASCII:"123456789" crc_check:"0x94"
crc_hex = crc_8_gsm_b(message, false); disp(" - calc  = 0x" + crc_hex); disp(" ");

disp(" CRC-8/HITAG");% ASCII:"123456789" crc_check:"0xb4"
crc_hex = crc_8_hitag(message, false); disp(" - calc  = 0x" + crc_hex); disp(" ");

disp(" CRC-8/I-432-1");% ASCII:"123456789" crc_check:"0xa1"
crc_hex = crc_8_i_432_1(message, false); disp(" - calc  = 0x" + crc_hex); disp(" ");

disp(" CRC-8/I-CODE");% ASCII:"123456789" crc_check:"0x7e"
crc_hex = crc_8_i_code(message, false); disp(" - calc  = 0x" + crc_hex); disp(" ");

disp(" CRC-8/LTE");% ASCII:"123456789" crc_check:"0xea"
crc_hex = crc_8_lte(message, false); disp(" - calc  = 0x" + crc_hex);
crc_hex = crc_8_lte([message crc_hex], true); disp(" - check = 0x" + crc_hex); disp(" ");

disp(" CRC-8/MAXIM-DOW");% ASCII:"123456789" crc_check:"0xa1"
crc_hex = crc_8_maxim_dow(message, false); disp(" - calc  = 0x" + crc_hex);
crc_hex = crc_8_maxim_dow([message crc_hex], true); disp(" - check = 0x" + crc_hex); disp(" ");

disp(" CRC-8/MIFARE-MAD");% ASCII:"123456789" crc_check:"0x99"
crc_hex = crc_8_mifare_mad(message, false); disp(" - calc  = 0x" + crc_hex); disp(" ");

disp(" CRC-8/NRSC-5");% ASCII:"123456789" crc_check:"0xf7"
crc_hex = crc_8_nrsc_5(message, false); disp(" - calc  = 0x" + crc_hex); disp(" ");

disp(" CRC-8/OPENSAFETY");% ASCII:"123456789" crc_check:"0x3e"
crc_hex = crc_8_opensafety(message, false); disp(" - calc  = 0x" + crc_hex);
crc_hex = crc_8_opensafety([message crc_hex], true); disp(" - check = 0x" + crc_hex); disp(" ");

disp(" CRC-8/ROHC");% ASCII:"123456789" crc_check:"0xd0"
crc_hex = crc_8_rohc(message, false); disp(" - calc  = 0x" + crc_hex); disp(" ");

disp(" CRC-8/SAE-J1850");% ASCII:"123456789" crc_check:"0x4b"
crc_hex = crc_8_sae_j1850(message, false); disp(" - calc  = 0x" + crc_hex); disp(" ");

disp(" CRC-8/SMBUS");% ASCII:"123456789" crc_check:"0xf4"
crc_hex = crc_8_smbus(message, false); disp(" - calc  = 0x" + crc_hex);
crc_hex = crc_8_smbus([message crc_hex], true); disp(" - check = 0x" + crc_hex); disp(" ");
