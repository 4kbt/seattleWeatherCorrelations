monthAverages = zeros(12,1);

for m = 1:12
	monthAverages(m) = mean( d ( d(:,2) == m, 5) );
end

individualMonths = [];
for y = (min(d(:,1))):(max(d(:,1))-1)
	for m = 1:12

		%Compute it
		a = mean( d( ( d(:,1) == y & d(:,2) == m  ) , 5 ) ) ;
		
		%Aggregate it
		individualMonths = [individualMonths ; y m a ];
	end
end

meanSubtractedMonths = individualMonths;
for m = 1:12
	mDex = individualMonths(:,2) == m;
	meanSubtractedMonths(mDex,3)  = individualMonths(mDex,3)- monthAverages(m);
end

hold on
for m = 1:10

	plot(   meanSubtractedMonths( meanSubtractedMonths(:,2) == m, 3),
		meanSubtractedMonths( meanSubtractedMonths(:,2) == (m+2), 3), '+' )
end
hold off

xlabel('March temperature anomaly');
ylabel('April temperature anomaly');
axis("square")
grid on
