function [out] = LU_factorization_crout(A)
	%%% LU decomposition using Crout's method
	%%% Input : A = matrix to be decomposed
	%%% Output : [L, U] = L and U matrices concatenated
	n = size(A)(1);
	L = zeros(n, n);
	U = eye(n);	
	for j = 1 : n
		% kth column of lower triangular matrix
		for k = j : n
			sum_ = 0;
			for i = 1 : j - 1
				sum_ = sum_ + (L(k, i) * U(i, j));
			end
			L(k, j) = (A(k, j) - sum_);
		end
		% kth row of upper trianglular matrix
		for k = j : n
			sum_ = 0;
			for i = 1 : j - 1
				sum_ = sum_ + (L(j, i) * U(i, k));
			end
			U(j, k) = (A(j, k) - sum_) / L(j, j);
		end
	end
	out = [L, U];
endfunction