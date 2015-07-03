function S=CortarSilabas(x)
	n=length(x);
	S={};
	
	%Emin = 4.0*lwin*dot(x,x)/n;  %energia mínima de cada ventana
	lwin=100;
	step=50;
	px = x.*x;
	Emin = 0.5*lwin*mean(px);  %energia mínima de cada ventana
	ini=1;
    fin=1;
	k=floor(lwin/2);
	pot=sum(px(1:lwin));
	
	%hold off;
	%plot(px);
	%refresh;
	%hold on;
	
	while k<(n-lwin/2)
		while( k < (n-lwin/2-step) && pot<Emin*1.2 )
			pot = pot - sum(px(ceil(k-lwin/2+1):ceil(k-lwin/2+step)));
			pot = pot + sum(px(ceil(k+lwin/2+1):ceil(k+lwin/2+step)));
			k = k + step;
		end
		ini=k;
		while( k < (n-lwin/2-step) && pot>Emin*0.8 )
			pot = pot - sum(px(ceil(k-lwin/2+1):ceil(k-lwin/2+step)));
			pot = pot + sum(px(ceil(k+lwin/2+1):ceil(k+lwin/2+step)));
			k = k + step;
		end
		if (k>=(n-lwin/2-step))
			break;
		end;
		fin=k;
		if (fin-ini) > 1000
			S={S{:} x(ini:fin)};
			%stem(ini,0.1,'r');
			%stem(fin,0.1, 'g');
			%refresh;
		end;				
	end
end
