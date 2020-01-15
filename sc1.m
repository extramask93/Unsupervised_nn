load dane1.txt
we = dane1;
[W,WB] = calcClusters(we,4,50); %wyœwietl pocz¹tkowe wagi sieci4
plot(we(:,1),we(:,2),'b+', WB(:,1),WB(:,2),'go');% wykreœl dane (+) i punkty odpowiadaj¹ce
hold on
plot(we(:,1),we(:,2),'b+', W(:,1),W(:,2),'ro') %wykreœl dane (+) i punkty odpowiadaj¹ce
hold off %wagom sieci (o)