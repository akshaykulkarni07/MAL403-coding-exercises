function [out] = trivial_pivoting(A, b, i)
	
	%%% Function to perform trivial pivoting on input matrix A
	%%% and vector b (of linear system Ax = b) for row 'i'
	
	out = [A, b];
	% Check if trivial pivoting is actually needed
	if (A(i, i) ~= 0)
		disp('Trivial pivoting is not required as pivotal element is already non-zero');
		return;
	endif
	
	n = size(A)(1);
	for j = i + 1 : n
		% if any row found below 'i'th row has non-zero pivotal element,
		% swap that row with 'i'th row in both A and b
		if (A(j, j) ~= 0)
			temp = A(j, :);
			A(j, :) = A(i, :);
			A(i, :) = temp;
			temp1 =  b(j, 1);
			b(j, 1) = b(i, 1);
			b(i, 1) = temp1;
			out = [A, b];
			return;
		endif
	endfor
	
	% if not returned to calling function till now, it means there is no
	% row that has non-zero pivotal element, and trivial pivoting is not 
	% possible, so return error
	disp('Could not perform trivial pivoting since it is impossible.');
	return;
endfunction