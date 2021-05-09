% Ali Üstün
% Istanbul Technical University

function [outText] = SBox(text,sbox)
% Functionality seen below is implemented. text is 16-bits long. 
% sbox dictionary is given and selected here.

% creates a hexadecimal array of bits
    temp = dec2hex(text,4);
    
	for i = 1:4
        temp(i) = sbox(temp(i));
    end
    
    outText = hex2dec(temp);     
end

