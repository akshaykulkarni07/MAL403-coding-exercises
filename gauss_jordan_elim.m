function [out] = gauss_jordan_elim(A, b)
	
	n = size(A)(1);
 	out = [A, b];
	% Avoiding invalid dimensions case
	if (size(A)(1) ~= size(b)(1))
		disp('Check matrix dimensions');
		solution = 'Check matrix dimensions and try again';
		return;
	endif
	
	for i = 1 : n
		% in case pivotal element is zero, use trivial pivoting
		if (A(i, i) == 0)
			out = trivial_pivoting(A, b, i);
			A = out(:, 1 : n);
			b = out(:, n + 1);
		endif
		
		% make the column 'i' all zeros except pivotal element
		% so calculate row multipliers
		m = zeros(n, 1);
		m(:, 1) = A(:, i) / A(i, i);
		% however, we don't want to make pivotal element to
		% become zero.
		m(i, 1) = 0;
		
		% update the matrix A and b
		for j = 1 : n
			A(j, :) -= m(j, 1) * A(i, :);
			b(j, 1) -= m(j, 1) * b(i, 1);
		endfor	
	endfor
 	for i = 1 : n
		% to make the pivotal element = one, we divide the current
		% row by the pivotal row
		b(i, 1) = b(i, 1) / A(i, i);
 		A(i, :) /= A(i, i);
	endfor
	out = [A, b];
	return;
endfunction