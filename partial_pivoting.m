function [out] = partial_pivoting(A, b, i)
	
	%%% Function to perform partial pivoting on input matrix A
	%%% and vector b (of linear system Ax = b) for row 'i'
	
	out = [A, b];
	% Check if partial pivoting is actually required
	if (abs(A(i, i)) == max(abs(A(:, i))))
		disp('Partial pivoting is not required as pivotal element is already maximum in its column');
		return;
	endif
	
	% find the index of maximum value in 'i'th column
	[_, idx] = max(abs(A(:, i)));
	
	% swap the 2 rows in A and b i.e. in out
	temp = out(i, :);
	out(i, :) = out(idx, :);
	out(idx, :) = temp;
	
	return;
endfunction
