load dane1.txt
we = dane1;
[W,WB] = calcClusters(we,4,50); %wyświetl początkowe wagi sieci4
plot(we(:,1),we(:,2),'b+', WB(:,1),WB(:,2),'go');% wykreśl dane (+) i punkty odpowiadające
hold on
plot(we(:,1),we(:,2),'b+', W(:,1),W(:,2),'ro') %wykreśl dane (+) i punkty odpowiadające
hold off %wagom sieci (o)