% Mirea Teodor-Adrian, 313CA

function [N, A, val1, val2] = MatriceAdiacenta_si_Valori(nume)
  % Functia calculeaza matricea de adiacenta a grafului si determina cele 3
  % valori N, val1 si val2.
  % Intrari: 
  %	-> nume: denumirea fisierului din care se citesc datele.
  % Iesiri:
  %	-> N: numarul de noduri al grafului;
  % -> A: matricea de adiaenta a grafului;
  % -> val1: prima valoare pentru cerinta 3;
  % -> val2: a doua valoare pentru cerinta 3.
  
  
  input = fopen(nume, 'r');
  
  N = fscanf(input, "%d", 1);
  A = zeros(N);
  
  for i = 1: N
    % Citesc in vectorul nod numarul nodului si numarul sau de vecini. Cum i
    % deja itereaza nodurile grafului, voi folosi doar nod(2), adica numarul
    % de vecini.
    nod = fscanf(input, "%d", 2);
    vecini = fscanf(input, "%d", nod(2));
    A(i, vecini) = 1;
  endfor
  
  % Observatia 2 de la cerinta 1 (unei pagini nu i se ia in calcul link-ul
  % catre ea insasi).
  A = A - diag(diag(A));
  
  % Citesc cele 2 valori.
  val1 = fscanf(input, "%f", 1);
  val2 = fscanf(input, "%f", 1);
  
  fclose(input);
  
endfunction
