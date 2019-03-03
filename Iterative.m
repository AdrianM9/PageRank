% Mirea Teodor-Adrian, 313CA

function R = Iterative(N, A, d, eps)
  % Functia care calculeaza matricea R folosind algoritmul iterativ.
  % Intrari:
  %	-> N: numarul de noduri al grafului;
  % -> A: matricea de adiaenta a grafului;
  %	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue
  %       navigarea (0.85 in cele mai multe cazuri);
  %	-> eps: eroarea care apare in algoritm.
  % Iesiri:
  %	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
  
  
  % Formez direct matricea K^-1.
  K_inv = diag(1./sum(A'));
  
  % Generez matricea M si initiez vectorii R si R0. R0 va fi vectorul de la
  % pasul t, iar R vectorul de la pasul t+1.
  M = (K_inv * A)';
  R = 1/N * ones(N, 1);
  R0 = zeros(N, 1);
  
  % Execut algortimul de formare al vectorului R.
  while norm(R - R0) >= eps
    R0 = R;
    R = d*M*R0 + (1-d)/N * ones(N, 1);
  endwhile
  
  % Returnez vectorul de la iteratia anterioara, intrucat el este cel cautat.
  R = R0;
  
endfunction
