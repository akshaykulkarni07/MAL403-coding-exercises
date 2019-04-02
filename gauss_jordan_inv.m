function [out] = gauss_jordan_inv(A)
	
	n = size(A)(1);
 	A_inv = eye(n);
	out = [A, A_inv];
	% Avoiding invalid dimensions case
	if (size(A)(1) ~= size(A_inv)(1))
		disp('Check matrix dimensions');
		solution = 'Check matrix dimensions and try again';
		return;
	endif
	
	for i = 1 : n
		% in case pivotal element is zero, use trivial pivoting
		if (A(i, i) == 0)
			out = trivial_pivoting(A, A_inv, i);
			A = out(:, 1 : n);
			A_inv = out(:, n + 1 : (2 * n));
		endif
		
		% make the column 'i' all zeros except pivotal element
		% so calculate row multipliers
		m = zeros(n, 1);
		m(:, 1) = A(:, i) / A(i, i);
		% however, we don't want to make pivotal element to
		% become zero.
		m(i, 1) = 0;
		
		% update the matrices A and A_inv
		for j = 1 : n
			A(j, :) -= m(j, 1) * A(i, :);
			A_inv(j, :) -= m(j, 1) * A_inv(i, :);
		endfor	
	endfor
 	for i = 1 : n
		% to make the pivotal element = one, we divide the current
		% row by the pivotal row
		A_inv(i, :) = A_inv(i, :) / A(i, i);
 		A(i, :) /= A(i, i);
	endfor
	out = [A, A_inv];
	return;
endfunction