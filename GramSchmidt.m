% Mirea Teodor-Adrian, 313CA

function B = GramSchmidt(A)
  % Functia calculeaza inversa matricii A folosind factorizari Gram-Schmidt.
  % Intrari:
  %	-> A: matricea (patratica) pentru care se va calcula inversa.
  % Iesiri:
  %	-> B: matricea inversa a matricei A.
  
  
  N = length(A);
  I = eye(N);
  Q = A;
  R = zeros(N);
  
  % Aplic algortimul Gram-Schmidt putin modificat pentru a determina Q si R.
  % Ideea secventei urmatoare de cod a plecat de la fisierul gram_scmod.m
  % disponibil pe cs.curs.pub.ro.
  for j = 1: N
    R(j, j) = norm(Q(:, j));
    Q(:, j) = Q(:, j)/R(j, j);
    for i = j+1: N
      R(j, i) = Q(:, j)' * Q(:, i);
      Q(:, i) = Q(:, i) - Q(:, j) * R(j, i);
    endfor
  endfor
  
  % Rezolv cele n sisteme de ecuatii folosind matricele Q si R.
  % A*B=I => Q*R*B=I => R*B=Q^(-1)*I, dar Q este ortogonala => R*B=Q'*I
  for j = 1: N
    B(:, j) = SistemSuperior(R, Q' * I(:, j));
  endfor
  
endfunction
