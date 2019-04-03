function [out] = heuristic_estimate_cond_num_two(A)
	%%% heuristic method to find estimate of an condition number w.r.t. 2-norm
	%%% Input : A = square matrix whose condition number is to be estimated
	%%% Outputs : [a_2_norm, a_inv_norm, est_cond_no]
	%%% where a_2_norm is the estimated 2-norm of A
	%%% a_inv_norm is the estimated 2-norm of inverse(A)
	%%% and est_cond_no is the estimated condition number of A w.r.t. 2-norm
	
	% Initialize all variables needed
	n = size(A)(1);
	x1 = zeros(n, 1);
	x2 = x1;
	y1 = x1;
	y2 = x1;
	
	% Estimation of 2-norm of A
	x1(1) = 1;
	y1(1) = A(1, 1);
	for i = 2 : n
		s1 = 0;
		for j = 1 : i - 1
			s1 = s1 + A(i, j) * x1(j);
		endfor
		if abs(A(i, i) + s1) > abs(A(i, i) - s1)
			x1(i) = 1;
		else
			x1(i) = -1;
		endif
		y1(i) = A(i, i) * x1(i) + s1;
	endfor
	a_2_norm = norm(y1) / sqrt(n);

	% Estimation of 2-norm of inverse(A)
	x2(1) = 1;
	y2(1) = 1 / A(1, 1);
	for i = 2 : n - 1
		s2 = 0;
		for j = 1 : i - 1
			s2 = s2 + A(i, j) * y2(j);
		end
		y2(i) = -(s2 + sign(s2)) / A(i, i);
	end
	a_inv_norm = norm(y2) / sqrt(n);
	est_cond_no = a_2_norm * a_inv_norm;
	out = [a_2_norm, a_inv_norm, est_cond_no];
endfunction