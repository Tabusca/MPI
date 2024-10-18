clc
clear all
syms k;
coef =[0.88 18 0.738 0];
    poliPozitivi=0;
    n = length(coef);
    aux=0;
    tabel=zeros(n, ceil(n/2));

    tabel(1, 1:ceil(n/2))=coef(1:2:n);

    if mod(n,2)==0
        tabel(2, 1:ceil(n/2))=coef(2:2:n);
    else
        tabel(2, 1:ceil(n/2)-1)=coef(2:2:n-1);
        tabel(2, ceil(n/2))=0;
    end

    for i=3:n
        if tabel(i-1,:)==0
            for j=1:ceil(n/2)-1
                tabel(i-1,j) = (n-(j+aux))*tabel(i-2,j)
                aux=aux+1;
            end
        end
        for j = 1:ceil(n/2)-1
            tabel(i,j) = -((tabel(i-2,1)*tabel(i-1,j+1))-(tabel(i-1,1)*tabel(i-2,j+1)))/(tabel(i-1,1)+1.e-3);
        end
        
    end

    for i = 1:n-1
    if sign(tabel(i,1)) * sign(tabel(i+1,1)) == -1
        poliPozitivi=poliPozitivi+1;
    end
    end

tabel
poliPozitivi

    if poliPozitivi>0
        fprintf("=>Sistem instabil")
    else
        fprintf("=>Sistem stabil")
    end