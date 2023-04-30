function out_bin = crc_uni(width, poly, init, residue, refin, refout, xorout, check, message)
% width   -> number of check bits for crc-6-itu = '6', for crc-16 = '16'etc
% poly    -> polynomial ...
%         ... for x^6+X^1+x^0 = 00 0011 msb bit '1' not use...
%         ... for x^16+X^12+X^5+X^0 = 0001 0000 0010 0001 msb bit '1' not use
% init    -> shift register init value for calculate crc
% residue -> shift register init value for check crc
% refin   -> reflect every byte
% refout  -> reflect bit array before xorout
% xorout  -> xor out message from func
% init    -> shift register init value for genertate crc
% check   -> true-check crc in message, false-generate crc
% message -> input data char '0123456789abcdef' - HEX value, not ASCII

info_len = length(message);
vbit = 4;%hex(4bit)

bit_vector = false(1, (vbit*info_len));
for i = 1:info_len
    if(refin)
        if(mod(i,2) == 1)
            temp = 1;
        else
            temp = -1;
        end
        bit_vector(1, (1+(vbit*(i-1))):vbit*i) = flip(decimalToBinaryVector(hex2dec(message(i+temp)), vbit));
    else
        bit_vector(1, (1+(vbit*(i-1))):vbit*i) = decimalToBinaryVector(hex2dec(message(i)), vbit);
    end
end

if(check)
    bit_vector = [bit_vector false(1, width)];
    cur_value = xor(residue,bit_vector(1:width));
else
    bit_vector = [bit_vector false(1, width)];
    cur_value = xor(init,bit_vector(1:width));
end

for i = 1+width:length(bit_vector)
    if(cur_value(1))%look at '1' MSB
        cur_value(1:width) = [cur_value(2:width) bit_vector(i)];% ( message << 1)
        cur_value = xor(cur_value, poly);
    else
        cur_value(1:width) = [cur_value(2:width) bit_vector(i)];% ( message << 1)
    end
end

if(refout)
    cur_value = flip(cur_value);
end

out_bin = xor(cur_value(1:1:length(cur_value)), xorout);

end
