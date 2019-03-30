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
	
	% In case A is a unitary matrix
	% Note : ' is the complex conjugate transpose operator in MATLAB or Octave
	if (A == A')
		for j = 1 : n
			x(j, 1) = conj(A(j, :)) * b;
		endfor
		solution = x;
		return;
	endif
	
	% In case A is an upper triangular matrix
	% Note : istriu is the function to determine whether input matrix is
	% upper triangular
	if (istriu(A))
		disp('A is upper triangular');
		x(n, 1) = b(n, 1) / A(n, n);
		for i = n - 1 : -1 : 1
			disp(i);
			sum = 0;
			for j = (i + 1) : n
				sum += A(i, j) * x(j, 1);
			endfor	
			x(i, 1) = (1 / A(i, i)) * (b(i, 1) - sum);
		endfor			
		solution = x;
		return;
	endif
endfunction