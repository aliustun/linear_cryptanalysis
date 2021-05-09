% Ali Üstün
% Istanbul Technical University

function [keySchedule] = lfsr_key_schedule(masterKey,roundNum)
% Key Schedule Array created with this function
%   Using LFSR; 
%   k_(i,15) = k_(i-1, 0) xor k_(i-1, 2) xor k_(i-1, 4) xor k_(i-1, 5)
%   and k_(i, j) = k_(i-1, j+1) functions.
%   Here, masterKey is 16-bits long and keySchedule is roundNum times
%   16-bits long.  

    keySchedule = uint16(zeros(1, roundNum+1));
    keySchedule(1) = masterKey;
    
    masterKey_tmp = '0000000000000000';
%     key creation
    for i = 1: roundNum 
%         add zeros to the beginning of the string to equailize into
%         16-bits
        masterKey_tmp = dec2bin(keySchedule(i), 16);

%         New key creation
        new_key = '0000000000000000';
%         Here, xor operation realized
        new_key(16-15) = '0' + xor(xor(xor(bin2dec(masterKey_tmp(16-0)), bin2dec(masterKey_tmp(16-2))), bin2dec(masterKey_tmp(16-4))), bin2dec(masterKey_tmp(16-5)));
        
        for k = 0:14
            new_key(16-k) = masterKey_tmp(15-k);
        end
        
        keySchedule(i+1) = bin2dec(new_key);
    end

end

