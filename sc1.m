load dane1.txt
we = dane1';
net = newc(minmax(we), 4); %utw�rz sie� z 4 neuronami
w = net.IW{1}; %wy�wietl pocz�tkowe wagi sieci4
plot(we(1,:),we(2,:),'b+', w(:,1),w(:,2),'go');% wykre�l dane (+) i punkty odpowiadaj�ce
hold on %wagom sieci (o)
net.trainParam.epochs = 50; %ustaw ilo�� epok uczenia
net = train(net, we); %uczenie sieci
w = net.IW{1}% wy�wietl wagi sieci po nauczeniu
plot(we(1,:),we(2,:),'b+', w(:,1),w(:,2),'ro') %wykre�l dane (+) i punkty odpowiadaj�ce
hold off %wagom sieci (o)
vec2ind( sim(net, [0.1; 0.1]) )