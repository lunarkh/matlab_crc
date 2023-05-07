function crc = crc_16_ibm_3740_lut(message)
%--settings-------
% width   = 16
% poly    = 0x1021
% init    = 0xFFFF
% refin   = false
% refout  = false
% xorout  = 0x0000
% check   = 0x29B1 for ASCII:"123456789"
% residue = 0x0000
% name    = "CRC-16/IBM-3740"
% Class: attested
% Alias: CRC-16/AUTOSAR, CRC-16/CCITT-FALSE
% An algorithm commonly misidentified as CRC-CCITT.
% CRC-CCITT customarily refers to the LSB-first form of the algorithm in ITU-T Recommendation V.41 (see CRC-16/KERMIT);
% its MSB-first counterpart is CRC-16/XMODEM.
% AUTOSAR (25 November 2021), AUTOSAR Classic Platform release R21-11, Specification of CRC Routines

info_len = length(message);
vbit = 4;%hex(4bit)

bit_vector = false(1, (vbit*info_len));
for i = 1:info_len
    bit_vector(1, (1+(vbit*(i-1))):vbit*i) = decimalToBinaryVector(hex2dec(message(i)), vbit);
end

crc_t  = true(1, 16); %init = 0xFFFF

crc_tbl = (['0000' '1021' '2042' '3063' '4084' '50A5' '60C6' '70E7' ...%8
            '8108' '9129' 'A14A' 'B16B' 'C18C' 'D1AD' 'E1CE' 'F1EF' ...%16
            '1231' '0210' '3273' '2252' '52B5' '4294' '72F7' '62D6' ...%24
            '9339' '8318' 'B37B' 'A35A' 'D3BD' 'C39C' 'F3FF' 'E3DE' ...%32
            '2462' '3443' '0420' '1401' '64E6' '74C7' '44A4' '5485' ...%40
            'A56A' 'B54B' '8528' '9509' 'E5EE' 'F5CF' 'C5AC' 'D58D' ...%48
            '3653' '2672' '1611' '0630' '76D7' '66F6' '5695' '46B4' ...%56
            'B75B' 'A77A' '9719' '8738' 'F7DF' 'E7FE' 'D79D' 'C7BC' ...%64
            '48C4' '58E5' '6886' '78A7' '0840' '1861' '2802' '3823' ...%72
            'C9CC' 'D9ED' 'E98E' 'F9AF' '8948' '9969' 'A90A' 'B92B' ...%80
            '5AF5' '4AD4' '7AB7' '6A96' '1A71' '0A50' '3A33' '2A12' ...%88
            'DBFD' 'CBDC' 'FBBF' 'EB9E' '9B79' '8B58' 'BB3B' 'AB1A' ...%96
            '6CA6' '7C87' '4CE4' '5CC5' '2C22' '3C03' '0C60' '1C41' ...%104
            'EDAE' 'FD8F' 'CDEC' 'DDCD' 'AD2A' 'BD0B' '8D68' '9D49' ...%112
            '7E97' '6EB6' '5ED5' '4EF4' '3E13' '2E32' '1E51' '0E70' ...%120
            'FF9F' 'EFBE' 'DFDD' 'CFFC' 'BF1B' 'AF3A' '9F59' '8F78' ...%128
            '9188' '81A9' 'B1CA' 'A1EB' 'D10C' 'C12D' 'F14E' 'E16F' ...%136
            '1080' '00A1' '30C2' '20E3' '5004' '4025' '7046' '6067' ...%144
            '83B9' '9398' 'A3FB' 'B3DA' 'C33D' 'D31C' 'E37F' 'F35E' ...%152
            '02B1' '1290' '22F3' '32D2' '4235' '5214' '6277' '7256' ...%160
            'B5EA' 'A5CB' '95A8' '8589' 'F56E' 'E54F' 'D52C' 'C50D' ...%168
            '34E2' '24C3' '14A0' '0481' '7466' '6447' '5424' '4405' ...%176
            'A7DB' 'B7FA' '8799' '97B8' 'E75F' 'F77E' 'C71D' 'D73C' ...%184
            '26D3' '36F2' '0691' '16B0' '6657' '7676' '4615' '5634' ...%192
            'D94C' 'C96D' 'F90E' 'E92F' '99C8' '89E9' 'B98A' 'A9AB' ...%200
            '5844' '4865' '7806' '6827' '18C0' '08E1' '3882' '28A3' ...%208
            'CB7D' 'DB5C' 'EB3F' 'FB1E' '8BF9' '9BD8' 'ABBB' 'BB9A' ...%216
            '4A75' '5A54' '6A37' '7A16' '0AF1' '1AD0' '2AB3' '3A92' ...%224
            'FD2E' 'ED0F' 'DD6C' 'CD4D' 'BDAA' 'AD8B' '9DE8' '8DC9' ...%232
            '7C26' '6C07' '5C64' '4C45' '3CA2' '2C83' '1CE0' '0CC1' ...%240
            'EF1F' 'FF3E' 'CF5D' 'DF7C' 'AF9B' 'BFBA' '8FD9' '9FF8' ...%248
            '6E17' '7E36' '4E55' '5E74' '2E93' '3EB2' '0ED1' '1EF0' ]);%256

for i = 1:8:length(bit_vector)
    table_index = bitxor(crc_t(1:8), bit_vector(i:i+7));% index calculator
    start_index = binaryVectorToDecimal(table_index) + 1;% ^
    table_val = zeros(1,16);

    for j = 1:4% hex 2 bin array
        table_val(1, (1+(vbit*(j-1))):vbit*j) = decimalToBinaryVector(hex2dec(crc_tbl((((start_index*4)-3)+(j-1)))), vbit);
    end

    crc_t = ([crc_t(9:16) 0 0 0 0 0 0 0 0]);% (crc_t << 8)
    crc_t = xor(crc_t, table_val);% crc16 xor table
end

crc = binaryVectorToHex(xor(crc_t, false(1,16)));% xorout = 0xFFFFFFFF
