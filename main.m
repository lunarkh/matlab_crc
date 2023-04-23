clc;% clear command window
% for check https://crccalc.com/

message = '313233343536373839';% ASCII:"123456789"
% message = '41424344434146454641434531323334';% ASCII:"ABCDCAFEFACE1234"

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

disp(" CRC-6/G-704. Alias: CRC-6/ITU");% ASCII:"123456789" crc_check:"0x06"
crc_hex = crc_6_g_704(message, false);          disp(" - calc  = 0x" + crc_hex);
crc_hex = crc_6_g_704([message crc_hex], true); disp(" - check = 0x" + crc_hex); disp(" ");

disp(" CRC-16/IBM-3740. Alias: CRC-16/AUTOSAR, CRC-16/CCITT-FALSE");% ASCII:"123456789" crc_check:"0x29B1"
crc_hex = crc_16_ibm_3740(message, false);                disp(" - calc      = 0x" + crc_hex);
crc_lut_hex = crc_16_ibm_3740_lut(message);               disp(" - calc lut  = 0x" + crc_lut_hex);
crc_hex = crc_16_ibm_3740([message crc_hex], true);       disp(" - check     = 0x" + crc_hex);
crc_lut_hex = crc_16_ibm_3740_lut([message crc_lut_hex]); disp(" - check lut = 0x" + crc_lut_hex); disp(" ");

disp(" CRC-16/MODBUS. Alias: MODBUS");% ASCII:"123456789" crc_check:"0x4B37"
crc_hex = crc_16_modbus(message, false);          disp(" - calc  = 0x" + crc_hex);
crc_hex = crc_16_modbus([message crc_hex], true); disp(" - check = 0x" + crc_hex); disp(" ");

disp(" CRC-32/AIXM. Alias: CRC-32Q");% ASCII:"123456789" crc_check:"0x3010BF7F"
crc_hex = crc_32_aixm(message, false);          disp(" - calc  = 0x" + crc_hex);
crc_hex = crc_32_aixm([message crc_hex], true); disp(" - check = 0x" + crc_hex); disp(" ");

disp(" CRC-32/ISCSI. Alias: CRC-32/BASE91-C, CRC-32/CASTAGNOLI, CRC-32/INTERLAKEN, CRC-32C");% ASCII:"123456789" crc_check:"0xE3069283"
crc_hex = crc_32_iscsi(message, false);  disp(" - calc      = 0x" + crc_hex);
crc_lut_hex = crc_32_iscsi_lut(message); disp(" - calc lut  = 0x" + crc_lut_hex); disp(" ");

disp(" CRC-32/ISO-HDLC. Alias: CRC-32, CRC-32/ADCCP, CRC-32/V-42, CRC-32/XZ, PKZIP");% ASCII:"123456789" crc_check:"0xCBF43926"
crc_lut_hex = crc_32_iso_hdlc_lut(message); disp(" - calc lut = 0x" + crc_lut_hex); disp(" ");
