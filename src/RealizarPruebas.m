db=5;
cd '../prueba';
muestra = ls;
cd '../src';
	
nm=length(muestra(:,1));
data=cell;
for k=1:nm
	printf('Archivo %i/%i: %s\n', k, nm, strcat('../prueba/',muestra(k,:)));
	[s,fm]=wavread(strcat('../prueba/',muestra(k,:)));
	
	ruido=randn(length(s),1);
	a = sqrt((1/10)^( db/10 ))*(y'*y)/(ruido'*ruido);
	s += ruido*a;   
	
	[na, pr]=reconocer(s, fm);
	printf('	Pajaro identificado: %s\n', na);
	printf('	Probabilidad: %f\n', pr);
end
	
		
				
				
				
				
			
