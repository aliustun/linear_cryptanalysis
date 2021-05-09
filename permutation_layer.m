% Ali Üstün
% Istanbul Technical University

% 15 | 14 | 13 | 12 | 11 | 10 | 9 | 8 | 7  | 6 | 5 | 4  | 3  | 2 | 1 | 0
% 15 | 11 | 7  | 3  | 14 | 10 | 6 | 2 | 13 | 9 | 5 | 1  | 12 | 8 | 4 | 0
function [permutated] = permutation_layer(input)
% This function applies a permutation layer on a given 16-bits value
% 15 | 14 | 13 | 12 | 11 | 10 | 9 | 8 | 7  | 6 | 5 | 4  | 3  | 2 | 1 | 0
% 15 | 11 | 7  | 3  | 14 | 10 | 6 | 2 | 13 | 9 | 5 | 1  | 12 | 8 | 4 | 0
% permutation table can be seen above. 
% input should be maximum 16-bits long

    permutated_tmp = '0000000000000000';

    temp = dec2bin(input,16);

    permutated_tmp(16-0) = temp(16-0);
    permutated_tmp(16-1) = temp(16-4);
    permutated_tmp(16-2) = temp(16-8);
    permutated_tmp(16-3) = temp(16-12);
    permutated_tmp(16-4) = temp(16-1);
    permutated_tmp(16-5) = temp(16-5);
    permutated_tmp(16-6) = temp(16-9);
    permutated_tmp(16-7) = temp(16-13);
    permutated_tmp(16-8) = temp(16-2);
    permutated_tmp(16-9) = temp(16-6);
    permutated_tmp(16-10) = temp(16-10);
    permutated_tmp(16-11) = temp(16-14);
    permutated_tmp(16-12) = temp(16-3);
    permutated_tmp(16-13) = temp(16-7);
    permutated_tmp(16-14) = temp(16-11);
    permutated_tmp(16-15) = temp(16-15);
    
    permutated = bin2dec(permutated_tmp);

end

