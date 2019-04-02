function [out] = partial_pivoting(A, b, i)
	
	%%% Function to perform partial pivoting on input matrix A
	%%% and vector b (of linear system Ax = b) for row 'i'
	
	out = [A, b];
	% Check if partial pivoting is actually required
	if (abs(A(i, i)) == max(abs(A(:, i))))
		disp('Partial pivoting is not required as pivotal element is already maximum in its column');
		return;
	endif
	
	n = size(A)(1);
	
	% find the index of maximum value in 'i'th column
	[_, idx] = max(abs(A(i : n, i)));
	% since we only compared the rows below current row,
	% the index needs to be compensated to be used with 
	% complete matrix
	idx += (i - 1);
	
	% swap the 2 rows in A and b i.e. in out
	% but once again (redundantly) check whether idx is more than 'i'
	% i.e. check if row is lower than current row
	if (idx > i)
		temp = out(i, :);
		out(i, :) = out(idx, :);
		out(idx, :) = temp;
	endif
	return;
endfunction
