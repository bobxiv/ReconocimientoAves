ldiff=0.3;
cd '../muestras';
muestra = ls;
cd '../src';
	
nm=length(muestra(:,1));
data=cell;
for k=1:nm
	[s,fm]=wavread(strcat('../muestras/',muestra(k,:)));
	cd '../src';
	printf('\narchivo: %i / %i: %s\n',k,nm, strcat('../muestras/',muestra(k,:)));
	silaba = CortarSilabas(s,fm);
	plantilla=cell;
	nsil=[];
	ns=length(silaba);
	datapajaro={muestra(k,:)};
	for l=1:ns
		vc=analizar(silaba{l},fm);
		printf(' |---->	silaba: %i / %i:',l,ns);
		if( length(plantilla) )
			agrego=false;
			d=1;
			for m=1:length(plantilla)
				d=comparar(vc,plantilla{m});
				if( d < ldiff )
					plantilla{m}*=nsil(m);
					nsil(m)++;
					plantilla{m}+=vc;
					plantilla{m}/=nsil(m);
					agrego=true;
					break;
				end		
			end
			if( !agrego )
				plantilla={plantilla{:} vc};
				nsil=[nsil, 1];
				printf(' agrego (d=%f)\n', d);
			else		
				printf(' no agrego (d=%f)\n', d);
			end
		else
			plantilla={plantilla{:} vc};
			nsil=[nsil, 1];
			printf(' agrego (primero)\n');
		end
	end
	for l=1:length(plantilla)
		datapajaro={datapajaro{:} plantilla{l}};
	end
	data={data{:} datapajaro};
end
save 'plantillas.dat' data;
	
		
				
				
				
				
			
