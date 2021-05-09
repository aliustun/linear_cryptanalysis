% Ali Üstün
% Istanbul Technical University

function [cipherText] = SPNModel2(plainText,key, round, sbox)
% SBox model defined below is implemented here. plainText and key are
% 16-bits long.
% SBox - SBox2
% 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | A | B | C | D | E | F
% 0 | 1 | 9 | 6 | D | 7 | 3 | 5 | F | 2 | C | E | A | 4 | B | 8 
% Permutation Layer
% 15 | 14 | 13 | 12 | 11 | 10 | 9 | 8 | 7  | 6 | 5 | 4  | 3  | 2 | 1 | 0
% 15 | 11 | 7  | 3  | 14 | 10 | 6 | 2 | 13 | 9 | 5 | 1  | 12 | 8 | 4 | 0

    keySchedule = lfsr_key_schedule(key, round);
    text = plainText;
    
    for i = 1 : round - 1
        subtext = bitxor(keySchedule(i), text);
        subtext = SBox(subtext,sbox);
        subtext = permutation_layer(subtext);
        text = subtext;
    end
    
    subtext = bitxor(keySchedule(round), text);
    subtext = SBox(subtext,sbox);
    subtext = bitxor(keySchedule(round+1), text);
    
    cipherText = subtext;

end

