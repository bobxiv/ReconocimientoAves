function [name, prob]=reconocer(y,fm)
	load 'plantillas.dat'
	
	npajaros=length(data);
	diferencia=zeros(npajaros,1);
	silaba = CortarSilabas(y,fm);
	if !length(silaba)
		error('No se pudo reconocer ninguna silaba');
	end
	nsilabas=length(silaba);
	for s=1:nsilabas
		vc = analizar(silaba{s}, fm);
		for b=1:npajaros
			nplantillas=length(data{b})-1;
			mindiff=inf;
			for p=1:nplantillas
				d=comparar(vc,data{b}{p+1});
				mindiff = min(d,mindiff);
			end
			diferencia(b)+=mindiff;
		end
	end
	#prob = max(diferencia) - diferencia;
	#if( sum(prob) != 0 )
	#	prob /= sum(prob);
	#else
	#	prob += 1/length(prob);
	#end
	prob=1-diferencia/sum(diferencia);
	[prob,name] = max(prob);
	name=data{name}{1};
endfunction
