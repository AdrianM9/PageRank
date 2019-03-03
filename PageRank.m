% Mirea Teodor-Adrian, 313CA

function [R1 R2] = PageRank(nume, d, eps)
  % Functia calculeaza indicii PageRank prin cei doi algoritmi si gradul de
  % apartenenta al unei pagini. Scrierea se face in fisierul de iesire 
  % nume.out.
  % Intrari:
  %	-> nume: numele fisierului din care se citeste;
  %	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue
  %       navigarea (0.85 in cele mai multe cazuri);
  %	-> eps: eroarea care apare in algoritm.
  % Iesiri:
  %	-> R1: vectorul de PageRank-uri acordat pentru fiecare pagina obtinut prin
  %        algoritmul Iterative;
  %	-> R2: vectorul de PageRank-uri acordat pentru fiecare pagina obtinut prin
  %        algoritmul Algebraic.
  
  
  % Preiau toate datele de care voi avea nevoie.
  [N, A, val1, val2] = MatriceAdiacenta_si_Valori(nume);
  
  % Deschid fisierul de iesire cu numele aferent.
  output = fopen(strcat(nume, '.out'), 'w');
  
  fprintf(output, "%d\n", N);
  
  % Calculez indicele PageRank folosind algoritmul Iterative.
  R1 = Iterative(N, A, d, eps);
  fprintf(output, "%.6f\n", R1);
  fprintf(output, "\n");
  
  % Calculez indicele PageRank folosind algoritmul Algebraic.
  R2 = Algebraic(N, A, d);
  fprintf(output, "%.6f\n", R2);
  fprintf(output, "\n");
  
  % Sortez descrescator vectorul si retin in vectorul poz pozitia din vectorul
  % initial de la care provine fiecare element din vectorul sortat.
  [PR1, poz] = sort(R2, 'descend');
  
  % Afisez rezultatele obtinute in urma aplicarii algoritmului de determinare
  % al gradului de apartenenta al fiecarei pagini.
  for i = 1: N
    fprintf(output, "%d %d %.6f\n", i, poz(i), Apartenenta(PR1(i), val1, val2));
  endfor
  
  fclose(output);
  
endfunction
