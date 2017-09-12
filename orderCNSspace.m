N = [50 100];
j = 1;
errorCNS = zeros(1,2);
%errorFTCS = zeros(1,5);
for i=N
    errorCNS(j) = cnscheme(i);
    %errorFTCS(j) = labsheet2_1_FTCS(i);
    j = j+1;
end

OrderCNS = log(errorCNS(1)/errorCNS(2))/log(2)
%OrderFTCS = log(errorFTCS(1)/errorFTCS(2))/log(2)