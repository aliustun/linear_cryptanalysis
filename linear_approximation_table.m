function [lin_app_table] = linear_approximation_table(SBox)
%LINEAR_APPROXIMATION_TABLE This function creates linear appoximation table
%   Here, SBox is given as table and then linear  approximation table is
%   created.

% Create a table
    probBias = zeros(16,16);
    
    
    for i = 0 : 15
        hex_i       = dec2hex(i, 1);
        sbox_in     = dec2bin(i,4);
        hex_o       = hex2dec(SBox(dec2hex(i)));
        sbox_out    = dec2bin(hex_o,4); 
        
        X4 = sbox_in(4);X3 = sbox_in(3); X2 = sbox_in(2); X1 = sbox_in(1);
        Y4 = sbox_out(4);Y3 = sbox_out(3); Y2 = sbox_out(2); Y1 = sbox_out(1);
        
        X4 = bin2dec(X4);X3 = bin2dec(X3);X2 = bin2dec(X2);X1 = bin2dec(X1);
        Y4 = bin2dec(Y4);Y3 = bin2dec(Y3);Y2 = bin2dec(Y2);Y1 = bin2dec(Y1);
        
%         Input and Output equations are defined
        equations_in = [0, X4, X3, xor(X4,X3), X2, xor(X2,X4), xor(X2,X3), xor(xor(X2,X3),X4), X1, xor(X1,X4),...
                        xor(X1,X3), xor(xor(X1,X3),X4), xor(X1,X2), xor(xor(X1,X2),X4), xor(xor(X1,X2),X3), xor(xor(xor(X1,X2),X3),X4)] ;

        equations_out = [0, Y4, Y3, xor(Y3,Y4), Y2, xor(Y2,Y4), xor(Y2,Y3), xor(xor(Y2,Y3),Y4), Y1, xor(Y1,Y4),...
                        xor(Y1,Y3), xor(xor(Y1,Y3),Y4), xor(Y1,Y2), xor(xor(Y1,Y2),Y4), xor(xor(Y1,Y2),Y3), xor(xor(xor(Y1,Y2),Y3),Y4)]  ;
%        Here Linear Approximation Table is created. 
        for x = 1: size(equations_in,2)
            for y = 1: size(equations_out,2)
                probBias(x,y) = probBias(x,y) + (equations_in(x)==equations_out(y));
            end
        end
    end
    
    lin_app_table = probBias -8;
    
end

