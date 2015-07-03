function d=comparar(a,b)
	[n,m]=size(a);
	d=0;
	v1 = []; v2=[];
	for k=1:n
		v1=a(k,:);
		v2=b(k,:);
		%d+=norm(v1-v2)/(norm(v1)+norm(v2));
		d = d + norm(v1-v2)/max(norm(v1),norm(v2));
		%d+=DTW(v1,v2);
		%d+=norm(v1-v2)/(norm(v1));
		%d+=norm(v1-v2)/k;
		%subplot(n,1,k); plot(1:length(v1), v1, 1:length(v1), v2);
	end
	d = d / n;
	%pause(2);
endfunction
