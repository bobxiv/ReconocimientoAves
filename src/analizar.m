function caract = analizar(y, fm);

n = length(y);
lwin = 100; %largo ventana
gap =  round(lwin/3); %overlap
%Emin = 0.01*lwin*dot(y,y)/n;  %energia mínima de cada ventana

paso=lwin-gap;
Nwin = floor((n-gap)/paso); %numero de ventanas
Nmomentos=3;
ind2freq = fm/lwin; %coeficiente de conversion de indice en cada ventana a frecuencia 

s=zeros(lwin,1); %guarda la ventana
specs=s; %espectro de magnitud de la ventana
caract=zeros(Nmomentos,Nwin); 
ham = hamming(lwin);
% primer columna->centro de gravedad  de la frecuencia del espectro de cada ventana
% segunda columna-> nada
% tercera-> menos que nada

for iw=1:Nwin
	ini =(iw-1)*paso+1;
	fin =ini+lwin-1;
	s = y(ini:fin);
	s .*= ham;
	specs = abs(fft(s));

	specs = specs(1:ceil(lwin*min(.5,15000/fm))); 
	esp=(dot(specs, (0:length(specs)-1)) / sum(specs));  %esperanza = centro de masa
	caract(1,iw) = esp*ind2freq;
	suma = 1/sum(specs);
	for k=2:Nmomentos
		caract(k,iw) = dot(specs,((0:length(specs)-1)-esp).^k)*suma*ind2freq^k;
	end
end

aux=zeros(1,201);
for k=1:Nmomentos
	aux(k,:) = spline(0:(1/(Nwin-1)):1, caract(k,:), 0:0.005:1);	
	#subplot(3,1,2*k); plot( aux(k,:) );
end
caract=aux;
endfunction
