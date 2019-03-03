% Mirea Teodor-Adrian, 313CA

function R = Algebraic(N, A, d)
  % Functia care calculeaza vectorul PageRank folosind varianta algebrica de
  % calcul.
  % Intrari:
  %	-> N: numarul de noduri al grafului;
  % -> A: matricea de adiaenta a grafului;
  %	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o
  % pagina urmatoare.
  % Iesiri:
  %	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
  
  
  % Formez direct matricea K^-1.
  K_inv = diag(1./sum(A'));
  
  % Generez matricea M si calculez vectorul R, folosind algoritmul Gram-Schmidt
  % pentru inversarea matricei I-dM.
  M = (K_inv * A)';
  R = GramSchmidt(eye(N)-d*M) * (1-d)/N*ones(N, 1);
  
endfunction
