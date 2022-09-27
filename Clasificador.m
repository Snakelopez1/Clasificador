%*Image Analysis*
%*3CV3*
clc 
clear all 
close all 
warning off all 


%variables para saber el color del objeto y fondo
FONDO = 0;
OBJETO = 1;
o = [0.8500 0.3250 0.0980];%color naranja
%leer imagen
%imageI = input('Inserte nombre de imagen: ','s');
a = (imread("Bases Sossa/IMAG068.BMP"));
b = a;
[m,n] = size(a);
%CONSEGUIMOS UMBRAL E IMAGEN EN BLANCO Y NEGRO
umb = graythresh(a);
a = im2bw(a,umb);
%variable para contar objetos
obj=0;
%Quita grupos de bits pequeños que pueden ser confundidos con objetos
a = bwareaopen(a,9);
%variable auxiliar para contar objetos
bw = a;
aux=bw;

propied= regionprops(a,'Centroid','BoundingBox','Area','MajoraxisLength','MinoraxisLength','Circularity','Perimeter');

obj = length(propied)
display("Total de objetos encontrados")
display(obj)
%Conseguimos propiedades de la imagen
figure,imshow(b);
hold on
%display(length(propied));
%leer matriz con los datos de los objeto
%por orden
% Rondana
% Tornillo
% Gancho
% Alcayata
% Cola de pato

rondana =0;
tornillo = 0;
gancho = 0;
alcayata = 0;
colaPato = 0;

%datos leidos
%Area,MajorAxisLength, MinorAxisLength, Circularity,Perimeter

contador = obj;
%recorremos imagen y sus objetos
for i=1:contador
    %vector con propiedades
    obj = [propied(i).Area propied(i).MajorAxisLength propied(i).MinorAxisLength propied(i).Circularity propied(i).Perimeter] ;
    caja=propied(i).BoundingBox;
    %matriz para guardar los resultados de similitudes
 
%clasificador euclidiano
    cd1 = [421.000000,103.564641,26.926714,0.114909,214.570000; 
        390.000000,97.010761,24.801822,0.115805,205.719000;
        384.000000,104.951405,27.144945,0.110680,208.803000;
        409.000000,105.182941,27.101174,0.101214,225.344000;
        464.000000,106.505007,27.308153,0.120654,219.833000;
        374.000000,101.162683,27.116801,0.104428,212.145000;
        412.000000,104.503993,26.875899,0.105781,221.233000;
        460.000000,106.403020,27.186294,0.117290,222.000000;
        375.000000,101.242707,27.192726,0.100710,216.314000;
        393.000000,104.747954,26.900631,0.097843,224.666000;
        350.000000,105.149211,27.384793,0.092513,218.041000;
        387.000000,97.896879,25.201515,0.118519,202.566000;
        454.000000,106.564163,27.139679,0.115752,222.008000;
        385.000000,104.392977,27.223489,0.099517,220.489000;
        344.000000,105.036516,27.213556,0.089914,219.265000;
        374.000000,98.539900,25.570822,0.113258,203.707000;
        445.000000,105.385338,27.312166,0.116106,219.461000;
        571.000000,80.133466,29.846051,0.118845,245.715000;
        339.000000,106.002879,27.258071,0.089152,218.595000;
        373.000000,97.484995,25.445270,0.114222,202.574000;
        446.000000,105.445405,27.418912,0.116070,219.742000;
        565.000000,80.272463,29.661381,0.117336,245.988000;
        340.000000,105.745938,27.263743,0.090970,216.718000;
        366.000000,98.289507,25.212824,0.112409,202.276000];
        
    cd2 = [1044.000000,58.403837,30.460593,0.619943,145.472000;
        935.000000,54.248075,29.150279,0.642846,135.194000;
        1021.000000,58.868746,29.644814,0.625266,143.247000;
        1045.000000,58.591338,30.430833,0.617163,145.869000;
        911.000000,52.962156,29.410482,0.642197,133.515000;
        945.000000,57.355396,28.940377,0.612449,139.247000;
        937.000000,54.654337,29.145940,0.636018,136.063000;
        1043.000000,59.002620,30.019980,0.620056,145.389000;
        911.000000,52.932543,29.408762,0.644028,133.325000;
        940.000000,57.278207,28.891350,0.598706,140.463000;
        943.000000,54.666845,29.129477,0.644555,135.591000;
        1036.000000,59.030863,30.005040,0.608739,146.241000;
        938.000000,54.735793,29.071684,0.643803,135.310000;
        1037.000000,58.992016,30.117668,0.616489,145.389000;
        937.000000,54.725104,29.082528,0.632480,136.443000;
        1037.000000,59.042162,30.038144,0.616489,145.389000;
        935.000000,54.136652,29.256535,0.652705,134.169000;
        1105.000000,59.416881,31.488386,0.628079,148.689000;
        934.000000,54.136824,29.238612,0.653780,133.987000;
        1103.000000,59.316854,31.473133,0.634190,147.837000;
        937.000000,54.244149,29.215910,0.647781,134.822000;
        1109.000000,59.527838,31.386412,0.630353,148.689000;
        971.000000,57.475731,30.138318,0.605289,141.982000;
        910.000000,54.165365,28.904461,0.632149,134.498000];

    cd3 = [528.000000,78.301539,28.769767,0.115597,239.579000;
        524.000000,76.194009,30.201815,0.115071,239.215000;
        528.000000,78.301539,28.769767,0.115597,239.579000;
        490.000000,73.243638,29.084135,0.229523,163.791000;
        490.000000,73.243638,29.084135,0.229523,163.791000;
        467.000000,69.360153,28.955130,0.223690,161.972000;
        531.000000,78.588191,28.539186,0.117507,238.298000;
        467.000000,69.912357,28.539713,0.228307,160.326000;
        535.000000,77.957808,28.467365,0.117655,239.043000;
        524.000000,74.672609,29.890213,0.237062,166.663000;
        462.000000,69.831515,28.603712,0.225769,160.359000;
        518.000000,77.782617,28.487387,0.115206,237.702000;
        457.000000,69.562269,29.132434,0.221221,161.120000;
        522.000000,77.987748,28.266004,0.115060,238.769000;
        469.000000,69.619780,28.906982,0.226240,161.401000;
        524.000000,74.156073,29.880796,0.117438,236.792000;
        525.000000,74.796539,29.962078,0.240304,165.693000;
        481.000000,72.920044,28.547370,0.117566,226.744000;
        482.000000,73.211978,28.597116,0.116229,228.282000;
        524.000000,74.156073,29.880796,0.117438,236.792000;
        524.000000,74.156073,29.880796,0.117438,236.792000;
        524.000000,74.156073,29.880796,0.117438,236.792000;
        482.000000,73.211978,28.597116,0.116229,228.282000;
        482.000000,73.211978,28.597116,0.116229,228.282000];

    cd4 = [627.000000,31.607203,30.634697,0.952913,90.931000;
        627.000000,31.607203,30.634697,0.952913,90.931000;
        701.000000,33.670015,32.912223,0.934461,97.092000;
        627.000000,31.607203,30.634697,0.952913,90.931000;
        627.000000,31.607203,30.634697,0.952913,90.931000;
        701.000000,33.670015,32.912223,0.934461,97.092000;
        593.000000,31.380256,29.708795,0.953759,88.392000;
        637.000000,32.323291,31.274828,0.945107,92.031000;
        707.000000,33.444263,32.975368,0.943897,97.018000;
        596.000000,31.381960,29.762855,0.926406,89.914000;
        638.000000,32.295592,31.421193,0.944722,92.122000;
        716.000000,33.656834,32.805742,0.961812,96.720000;
        595.000000,31.354245,29.745477,0.953047,88.574000;
        637.000000,32.385440,31.297329,0.941380,92.213000;
        718.000000,33.860221,32.756765,0.960879,96.902000;
        592.000000,31.373702,29.688738,0.918329,90.005000;
        638.000000,32.427478,31.141125,0.946591,92.031000;
        712.000000,33.703858,32.688767,0.952850,96.902000;
        589.000000,31.325928,29.601959,0.949279,88.301000;
        713.000000,33.770624,32.731011,0.957782,96.720000;
        590.000000,31.397901,29.575403,0.950891,88.301000;
        587.000000,31.186312,29.576114,0.946056,88.301000;
        661.000000,32.696674,31.399551,0.953115,93.354000;
        665.000000,32.846430,32.184875,0.940459,94.264000;
        588.000000,31.357726,29.610189,0.949624,88.210000];

    cd5 = [345.000000,54.867229,10.052236,0.289539,122.366000;
        296.000000,53.907893,9.729169,0.335737,105.257000;
        377.000000,54.965687,10.888901,0.259550,135.103000;
        364.000000,54.896329,10.347956,0.364311,112.052000;
        313.000000,49.615892,10.515455,0.311098,112.442000;
        354.000000,54.640091,10.662448,0.247585,134.043000;
        356.000000,54.802783,10.196520,0.380162,108.479000;
        305.000000,49.632531,10.234983,0.231599,128.643000;
        367.000000,54.758455,10.403845,0.309427,122.084000;
        358.000000,54.965295,10.215527,0.363223,111.291000;
        299.000000,49.377041,10.462256,0.219000,130.984000;
        319.000000,50.985403,9.758335,0.340751,108.463000;
        353.000000,55.247239,10.310746,0.291271,123.408000;
        319.000000,50.985403,9.758335,0.340751,108.463000;
        353.000000,55.247239,10.310746,0.291271,123.408000;
        377.000000,54.965687,10.888901,0.259550,135.103000;
        364.000000,54.896329,10.347956,0.364311,112.052000;
        313.000000,49.615892,10.515455,0.311098,112.442000;
        377.000000,54.965687,10.888901,0.259550,135.103000;
        364.000000,54.896329,10.347956,0.364311,112.052000;
        313.000000,49.615892,10.515455,0.311098,112.442000;
        377.000000,54.965687,10.888901,0.259550,135.103000;
        364.000000,54.896329,10.347956,0.364311,112.052000;
        313.000000,49.615892,10.515455,0.311098,112.442000;
        367.000000,54.758455,10.403845,0.309427,122.084000;
        358.000000,54.965295,10.215527,0.363223,111.291000;
        299.000000,49.377041,10.462256,0.219000,130.984000;
        367.000000,54.758455,10.403845,0.309427,122.084000;
        358.000000,54.965295,10.215527,0.363223,111.291000;
        299.000000,49.377041,10.462256,0.219000,130.984000;
        367.000000,54.758455,10.403845,0.309427,122.084000;
        358.000000,54.965295,10.215527,0.363223,111.291000;
        299.000000,49.377041,10.462256,0.219000,130.984000];

% calculo de medias
    medias{5} ={};
    md1 = mean(cd1(:,1));
    md2 = mean(cd1(:,2));
    md3 = mean(cd1(:,3));
    md4 = mean(cd1(:,4));
    md5 = mean(cd1(:,5));
    medias{1} = [md1;md2;md3;md4;md5];

    md1 = mean(cd2(:,1));
    md2 = mean(cd2(:,2));
    md3 = mean(cd2(:,3));
    md4 = mean(cd2(:,4));
    md5 = mean(cd2(:,5));
    medias{2} = [md1;md2;md3;md4;md5];

    md1 = mean(cd3(:,1));
    md2 = mean(cd3(:,2));
    md3 = mean(cd3(:,3));
    md4 = mean(cd3(:,4));
    md5 = mean(cd3(:,5));
    medias{3} = [md1;md2;md3;md4;md5];

    md1 = mean(cd4(:,1));
    md2 = mean(cd4(:,2));
    md3 = mean(cd4(:,3));
    md4 = mean(cd4(:,4));
    md5 = mean(cd4(:,5));
    medias{4} = [md1;md2;md3;md4;md5];

    md1 = mean(cd5(:,1));
    md2 = mean(cd5(:,2));
    md3 = mean(cd5(:,3));
    md4 = mean(cd5(:,4));
    md5 = mean(cd5(:,5));
    medias{5} = [md1;md2;md3;md4;md5];


vector=[propied(i).Area propied(i).MajorAxisLength propied(i).MinorAxisLength propied(i).Circularity propied(i).Perimeter]';

aux4{5} = {};
for ii = 1:5
    aux4{ii} = norm(medias{ii} - vector);
end
distancias = cell2mat(aux4);
minimo = min(distancias);
dato=find(distancias==minimo);


%se termina clasificador



    %Rondana
    if dato == 4
        text(propied(i).Centroid(1),propied(i).Centroid(2),'Rondana','Color',o);
        rectangle('Position',[caja(1),caja(2),caja(3),caja(4)],'Edgecolor',o,'Linewidth',2)
        rondana =rondana+1;

        
    %Tornillo
    elseif dato == 5
        text(propied(i).Centroid(1),propied(i).Centroid(2),'Tornillo','Color','r');
        rectangle('Position',[caja(1),caja(2),caja(3),caja(4)],'Edgecolor','r','Linewidth',2)
        tornillo = tornillo+1;
        
        
    elseif dato == 3
        text(propied(i).Centroid(1),propied(i).Centroid(2),'Gancho','Color','m');
        rectangle('Position',[caja(1),caja(2),caja(3),caja(4)],'Edgecolor','m','Linewidth',2)
        gancho = gancho +1;

        
    elseif dato == 1
        text(propied(i).Centroid(1),propied(i).Centroid(2),'Alcayata','Color','c');
        rectangle('Position',[caja(1),caja(2),caja(3),caja(4)],'Edgecolor','c','Linewidth',2)
        alcayata = alcayata+1;

    
    elseif dato == 2
        text(propied(i).Centroid(1),propied(i).Centroid(2),'ColaPato','Color','b');
        rectangle('Position',[caja(1),caja(2),caja(3),caja(4)],'Edgecolor','b','Linewidth',2)
        colaPato = colaPato+1;
       
    end
end

%similitudes
obj = contador;
base = fopen('Base.txt', 'r');

%datos leidos
%Area,MajorAxisLength, MinorAxisLength, Circularity,Perimeter
formatSpec = '%s %d %d %d %d %d %d';
%sizeA = [7 Inf];
A = textscan(base,formatSpec,144);
aux_imag{length(A{1,2})}={};
aux_puntaje{length(A{1,2})}={};
for i=1:length(A{1,2})
    puntaje = -1;
    puntaje = 1;
    obj_b = A{1,2}(i);
    alcayata_b = A{1,3}(i);
    colaPato_b = A{1,4}(i);
    gancho_b = A{1,5}(i);
    rondana_b = A{1,6}(i);
    tornillo_b = A{1,7}(i);
    %puntaje objetos
    
    %puntaje alcayata
    if alcayata == alcayata_b
        puntaje = puntaje + (alcayata_b);

    elseif alcayata < alcayata_b
        puntaje = puntaje - (alcayata_b-alcayata);
    else
        puntaje = puntaje - (alcayata-alcayata_b);
    end
    %puntaje colaPato
    if colaPato == colaPato_b
        puntaje = puntaje + (colaPato_b);

    elseif colaPato < colaPato_b
        puntaje = puntaje - (colaPato_b-colaPato);
    else
        puntaje = puntaje - (colaPato-colaPato_b);
    end
    %puntaje gancho
    if gancho == gancho_b
        puntaje = puntaje + (gancho_b);

    elseif gancho < gancho_b
        puntaje = puntaje - (gancho_b-gancho);
    else
        puntaje = puntaje - (gancho-gancho_b);
    end
    %puntaje rondana
    if rondana == rondana_b
        puntaje = puntaje + (rondana_b);

    elseif rondana < rondana_b
        puntaje = puntaje - (rondana_b-rondana);
    else
        puntaje = puntaje - (gancho-rondana_b);
    end
    %puntaje tornillo
    if tornillo == tornillo_b
        puntaje = puntaje + (tornillo_b);

    elseif tornillo < tornillo_b
        puntaje = puntaje - (tornillo_b-tornillo);
    else
        puntaje = puntaje - (tornillo-tornillo_b);
    end
    
    aux_imag{i} =i;
    aux_puntaje{i}=puntaje;
end

%iteracion bubble sort para arreglar las distancias minimas con las clases

    for i =0:length(A{1,2})-1
        for j=1:length(A{1,2})-i-1
            if(aux_puntaje{j}<aux_puntaje{j+1})
                aux = aux_puntaje{j};
                aux_puntaje{j} = aux_puntaje{1+j};
                aux_puntaje{j+1} = aux;
                aux2 = aux_imag{j};
                aux_imag{j}=aux_imag{j+1};
                aux_imag{j+1}=aux2;
            end
        end
    end
    figure,imshow("Bases Sossa/"+A{1,1}(aux_imag{1}));
    figure,imshow("Bases Sossa/"+A{1,1}(aux_imag{2}));
    figure,imshow("Bases Sossa/"+A{1,1}(aux_imag{3}));
    figure,imshow("Bases Sossa/"+A{1,1}(aux_imag{4}));
    figure,imshow("Bases Sossa/"+A{1,1}(aux_imag{5}));
    figure,imshow("Bases Sossa/"+A{1,1}(aux_imag{6}));



[n m] = size(A);
fclose(base);



