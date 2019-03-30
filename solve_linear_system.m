function [solution] = solve_linear_system(A, b)
	%%% Solves a linear system Ax = b
	%%% Inputs :
	%%% A = matrix of size (n, n)
	%%% b = matrix of size (n, 1)
	%%% Outputs : 
	%%% solution = all solutions
	
	% Avoiding invalid dimensions case
	if (size(A)(1) ~= size(b)(1))
		disp('Check matrix dimensions');
		solution = 'Check matrix dimensions and try again';
		return;
	endif
	
	% In case A is a diagonal matrix
	n = size(A)(1);
	x = zeros(n, 1);
	if (isdiag(A))
		for i = 1 : n
			x(i, 1) = b(i, 1) / A(i, i);
		endfor
		solution = x;
		return;
	endif
endfunction