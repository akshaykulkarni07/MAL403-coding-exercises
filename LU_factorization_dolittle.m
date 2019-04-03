function [out] = LU_factorization_dolittle(A)
	%%% LU decomposition of non-singular matrix using Doolittle method
	%%% Input : A = matrix to be decomposed
	%%% Output : [L, U] = L and U matrices concatenated
	n = size(A)(1);
	L = eye(n);
	U = zeros(n, n);
	for j = 1 : n
		% kth row of upper triangle matrix 
		for k = j : n
			sum_ = 0;
			for i = 1 : j - 1
				sum_ += (L(j, i) * U(i, k));
			end
			U(j, k) = A(j, k) - sum_;
		end
		% kth column of lower triangular matrix 
		for k = j : n
			sum_ = 0;
			for i = 1 : j - 1
				sum_ += (L(k, i) * U(i, j));
			end
			L(k, j) = (A(k, j) - sum_) / U(j, j);
		end
	end
	out = [L, U];
	return;
endfunction