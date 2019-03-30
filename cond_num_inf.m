function [condition_num] = cond_num_inf(A)
	
	%%% This function returns an estimate of the condition number of A w.r.t. 
	%%% the infinity norm, if matrix is diagonally dominant.
	%%% Inputs : 
	%%% A = matrix of size (n, n)
	%%% Outputs : 
	%%% condition_num = Esimated upper bound for the Condition Number of matrix A
	%%% or a string 'Not calculated' if matrix is not diagonally dominant.
	
	n = size(A)(1);
	delta = Inf;
	% Find delta if matrix A is diagonally dominant, otherwise delta will remain Inf
	for i = 1 : n
		% compute difference between absolute value of diagonal element and 
		% sum of absolute values of remaining elements of that row
		temp1 = abs(A(i, i));
		temp2 = sum(abs(A(i, :))) - temp1;
		% disp(temp1);
		% disp(temp2);
		if ((temp1 - temp2) < delta && temp1 > temp2)
			delta = temp1 - temp2;
		endif
	endfor

	if (delta == Inf)
		disp('The matrix A is not diagonally dominant');
		condition_num = 'Not calculated';
		return;
	else
		disp(delta);
	endif
endfunction