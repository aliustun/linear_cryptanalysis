% Ali Üstün
% Istanbul Technical University

% In this project, a 4 round SPN networks created.
% I will have 3 different networks. 
% In first networks SBox defined as seen below,
% 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | A | B | C | D | E | F
% 1 | 9 | 6 | D | 7 | 3 | 5 | F | 2 | C | E | A | 4 | B | 8 | 0
% and in second and third networks SBox defined as seen below, 
% 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | A | B | C | D | E | F
% 0 | 1 | 9 | 6 | D | 7 | 3 | 5 | F | 2 | C | E | A | 4 | B | 8 
%  We have also created a permutation network as seen below,
% 15 | 14 | 13 | 12 | 11 | 10 | 9 | 8 | 7  | 6 | 5 | 4  | 3  | 2 | 1 | 0
% 15 | 11 | 7  | 3  | 14 | 10 | 6 | 2 | 13 | 9 | 5 | 1  | 12 | 8 | 4 | 0
% Our third network does not have a permutation network. 

clear;clc;
master_key = '1001011100101110'; 
key = bin2dec(master_key);

% Plain Text
plain_text = 'YURUYENAMELELERUSTUNDEYERYEROTOMOBILLASTIGIIZLERIUZANANASFALTBUNLARINHEPSIMEVCUDIYETLERINDENMEMNUNGORUNUYORLARDIHERSEYHERSEYIOLDUGUGIBIKABULETMEKTEYDISUHALDEBANADAYAPACAKBASKABIRSEYKALMIYORDUTAMBUSIRADAYANIMDANHIZLABIROTOMOBILGECTIBASIMICEVIRIPBAKTIGIMZAMANCAMINARKASINDAKICEHREYITANIDIGIMIZANNETTIMNITEKIMARABABESONADIMGITTIKTENSONRADURDUKAPISIACILDIMEKTEPARKADASLARIMDANHAMDIBASINIUZATMISBENICAGIRIYORDUSOKULDUMNEREYEGIDIYORSUNDIYESORDUHICGEZINIYORUMGELBIZEGIDELIMCEVABIMIBEKLEMEDENBANAYANINDAYERACTIYOLDAANLATTIGINAGORECALISTIGISIRKETINBAZIFABRIKALARINIDOLASMAKTANGELIYORDUGELECEGIMIEVETELGRAFLABILDIRMISTIMHERHALDEHAZIRLIKYAPMISLARDIRYOKSASENIDAVETETMEYECESARETEDEMEZDIMDEDI';
% Here we know that, 2 characters mean 16-bits so i will select 2
% characters every time when encrypting.

SBox1_constant = containers.Map({'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'},...
                                {'1','9','6','D','7','3','5','F','2','C','E','A','4','B','8','0'});
                            
SBox1_i_constant = containers.Map({'1','9','6','D','7','3','5','F','2','C','E','A','4','B','8','0'},...
                                  {'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'});                            

SBox2_constant = containers.Map({'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'},...
                                {'0','1','9','6','D','7','3','5','F','2','C','E','A','4','B','8'});
                            
SBox2_i_constant = containers.Map({'0','1','9','6','D','7','3','5','F','2','C','E','A','4','B','8'},...
                                  {'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'});
                            
SBox_T_constant = containers.Map({'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'},...
                                 {'E','4','D','1','2','F','B','8','3','A','6','C','5','9','0','7'});

% first SPN network, 
cipher1 = '';
for i = 1 : size(plain_text,2)/2
    text = typecast(uint8(plain_text(2*(i)-1:2*i)),'uint16');
    cipher1 = [cipher1, char(typecast(SPNModel1(text,key,4,SBox1_constant),'uint8'))];
end

% second SPN network
cipher2 = '';
for i = 1 : size(plain_text,2)/2
    text = typecast(uint8(plain_text(2*(i)-1:2*i)),'uint16');
    cipher2 = [cipher2, char(typecast(SPNModel2(text,key,4,SBox2_constant),'uint8'))];
end

% third SPN network
cipher3 = '';
for i = 1 : size(plain_text,2)/2
    text = typecast(uint8(plain_text(2*(i)-1:2*i)),'uint16');
    cipher3 = [cipher3, char(typecast(SPNModel3(text,key,4,SBox2_constant),'uint8'))];
end
