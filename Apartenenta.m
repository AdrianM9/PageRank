% Mirea Teodor-Adrian, 313CA

function y = Apartenenta(x, val1, val2)
  % Functia care calculeaza gradul de apartenenta al paginii cu PageRank-ul x.
  % Intrari:
  %	-> x: PageRank-ul paginii careia i se calculeaza gradul de apartenenta (se
  %       stie ca 0 <= x <= 1);
  % -> val1: prima valoare pentru cerinta 3;
  % -> val2: a doua valoare pentru cerinta 3.
  % Iesiri:
  %	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
  
  
  % Daca x = val1 = val2 , nu se poate afla gradul de apartenenta dintre 0 si 1,
  % asa ca se va returna 0 in acest caz. 
  % In cazul in care val1 ~= val2, formulele sunt deduse analitic foarte usor:
  % (a*val1 + b = 0  si  a*val2 + b = 1).
  if x < val1
    y = 0;
  elseif x > val2
    y = 1;
  else
    if val1 ~= val2
      a = 1/(val2 - val1);
      b = -val1/(val2-val1);
      y = a*x + b;
    else
      y = 0;
    endif
  endif
  
endfunction
