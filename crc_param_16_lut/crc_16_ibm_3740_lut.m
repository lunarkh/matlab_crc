function crc = crc_16_ibm_3740_lut(message)
%--settings-------
% width   = 16
% poly    = 0x1021
% init    = 0xffff
% refin   = false
% refout  = false
% xorout  = 0x0000
% check   = 0x29B1 for ASCII:"123456789"
% residue = 0x0000 [correct 0xffff]
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
    bit_vector(1, (1+(vbit*(i-1))):vbit*i) = flip(de2bi(hex2dec(message(i)), vbit));
end

crc_t  = true(1, 16); %init = 0xffff

crc_tbl = (['0000' '1021' '2042' '3063' '4084' '50a5' '60c6' '70e7' ...%8
            '8108' '9129' 'a14a' 'b16b' 'c18c' 'd1ad' 'e1ce' 'f1ef' ...%16
            '1231' '0210' '3273' '2252' '52b5' '4294' '72f7' '62d6' ...%24
            '9339' '8318' 'b37b' 'a35a' 'd3bd' 'c39c' 'f3ff' 'e3de' ...%32
            '2462' '3443' '0420' '1401' '64e6' '74c7' '44a4' '5485' ...%40
            'a56a' 'b54b' '8528' '9509' 'e5ee' 'f5cf' 'c5ac' 'd58d' ...%48
            '3653' '2672' '1611' '0630' '76d7' '66f6' '5695' '46b4' ...%56
            'b75b' 'a77a' '9719' '8738' 'f7df' 'e7fe' 'd79d' 'c7bc' ...%64
            '48c4' '58e5' '6886' '78a7' '0840' '1861' '2802' '3823' ...%72
            'c9cc' 'd9ed' 'e98e' 'f9af' '8948' '9969' 'a90a' 'b92b' ...%80
            '5af5' '4ad4' '7ab7' '6a96' '1a71' '0a50' '3a33' '2a12' ...%88
            'dbfd' 'cbdc' 'fbbf' 'eb9e' '9b79' '8b58' 'bb3b' 'ab1a' ...%96
            '6ca6' '7c87' '4ce4' '5cc5' '2c22' '3c03' '0c60' '1c41' ...%104
            'edae' 'fd8f' 'cdec' 'ddcd' 'ad2a' 'bd0b' '8d68' '9d49' ...%112
            '7e97' '6eb6' '5ed5' '4ef4' '3e13' '2e32' '1e51' '0e70' ...%120
            'ff9f' 'efbe' 'dfdd' 'cffc' 'bf1b' 'af3a' '9f59' '8f78' ...%128
            '9188' '81a9' 'b1ca' 'a1eb' 'd10c' 'c12d' 'f14e' 'e16f' ...%136
            '1080' '00a1' '30c2' '20e3' '5004' '4025' '7046' '6067' ...%144
            '83b9' '9398' 'a3fb' 'b3da' 'c33d' 'd31c' 'e37f' 'f35e' ...%152
            '02b1' '1290' '22f3' '32d2' '4235' '5214' '6277' '7256' ...%160
            'b5ea' 'a5cb' '95a8' '8589' 'f56e' 'e54f' 'd52c' 'c50d' ...%168
            '34e2' '24c3' '14a0' '0481' '7466' '6447' '5424' '4405' ...%176
            'a7db' 'b7fa' '8799' '97b8' 'e75f' 'f77e' 'c71d' 'd73c' ...%184
            '26d3' '36f2' '0691' '16b0' '6657' '7676' '4615' '5634' ...%192
            'd94c' 'c96d' 'f90e' 'e92f' '99c8' '89e9' 'b98a' 'a9ab' ...%200
            '5844' '4865' '7806' '6827' '18c0' '08e1' '3882' '28a3' ...%208
            'cb7d' 'db5c' 'eb3f' 'fb1e' '8bf9' '9bd8' 'abbb' 'bb9a' ...%216
            '4a75' '5a54' '6a37' '7a16' '0af1' '1ad0' '2ab3' '3a92' ...%224
            'fd2e' 'ed0f' 'dd6c' 'cd4d' 'bdaa' 'ad8b' '9de8' '8dc9' ...%232
            '7c26' '6c07' '5c64' '4c45' '3ca2' '2c83' '1ce0' '0cc1' ...%240
            'ef1f' 'ff3e' 'cf5d' 'df7c' 'af9b' 'bfba' '8fd9' '9ff8' ...%248
            '6e17' '7e36' '4e55' '5e74' '2e93' '3eb2' '0ed1' '1ef0' ]);%256

for i = 1:8:length(bit_vector)
    table_index = bitxor(crc_t(1:8), bit_vector(i:i+7));% index calculator
    start_index = bin2dec(num2str(table_index)) + 1;% ^
    table_val = zeros(1,16);

    for j = 1:4% hex 2 bin array
        table_val(1, (1+(vbit*(j-1))):vbit*j) = flip(de2bi(hex2dec(crc_tbl((((start_index*4)-3)+(j-1)))), vbit));
    end

    crc_t = ([crc_t(9:16) 0 0 0 0 0 0 0 0]);% (crc_t << 8)
    crc_t = xor(crc_t, table_val);% crc16 xor table
end

crc = dec2hex(bin2dec(num2str(xor(crc_t, false(1,16)))),4);% xorout = 0x0000
