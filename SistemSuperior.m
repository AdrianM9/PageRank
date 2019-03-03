% Mirea Teodor-Adrian, 313CA

function x = SistemSuperior(U, y)
  % Functia rezolva un sistem superior triunghiular.
  % Intrari:
  %	-> U: matricea coeficientilor sistemului;
  %	-> y: vectorul coloana al termenilor liberi.
  % Iesiri:
  %	-> x: vectorul coloana cu valorile necunoscutelor.
  
  
  N = length(U);
  
  % Sistemul se rezolva prin substitutie de la ultima linie pana la prima.
  for i = N: -1: 1
    rez = y(i);
    if i ~= N
      rez = rez - U(i, i+1: N)*x(i+1: N);
    endif
    x(i,1) = rez/U(i,i);
  endfor
  
endfunction
