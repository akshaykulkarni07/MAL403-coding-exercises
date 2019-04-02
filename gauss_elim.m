function [solution] = gauss_elim(A, b)
	
	% Avoiding invalid dimensions case
	if (size(A)(1) ~= size(b)(1))
		disp('Check matrix dimensions');
		solution = 'Check matrix dimensions and try again';
		return;
	endif
	
	n = size(A)(1);
	x = zeros(n, 1);
	
	for i = 1 : n
		% if pivotal element is zero, then use trivial pivoting 
		if (A(i, i) == 0)
			A, b = trivial_pivoting(A, b, i);
		endif	
		
		% define row multipliers
		m = zeros(n, 1);
		m(i + 1 : n, 1) = A(i + 1 : n, i) / A(i, i);
		
		% update A and b
		for j = i + 1 : n
			A(j, :) -= m(j, 1) * A(i, :);
			b(j, 1) -= m(j, 1) * b(i, 1);
		endfor	
	endfor
	solution = solve_linear_system(A, b);
	return;
endfunction