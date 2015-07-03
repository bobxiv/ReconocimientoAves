function cost=DTW(s, t)
	n=length(s);
	m=length(t);
	DTW=ones(n,m)*inf;
	cost=0;
	DTW(1,1) = 0;
	for i=2:n
		for j=2:m
			cost=abs(s(i) - t(j));
			DTW(i, j) = cost + min(DTW(i-1,j), min(DTW(i  , j-1),DTW(i-1, j-1)));
		end
	end
endfunction;