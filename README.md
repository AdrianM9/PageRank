# PageRank
The program computes the PageRank method on graphs.

*(Code and Readme are written in **Romanian language**)*

Prima functie care se apeleaza este PageRank. Dupa preluarea datelor din
fisierul de intrare si stocarea lor in memorie, calculez indiciele PageRank
prin cei doi algoritm.

De citirea si stocarea datelor se ocupa functia MatriceAdiacenta_si_Valori,
returnand datele in numerele N, val1, val2 si matricea A. De prelucrarea si
afisarea de rezultate se ocupa celelalte functii, care vor fi prezentate in
ordinea apelarii la executia codului.

Atat in functia Iterative, cat si in Algebraic, intrucat nu este nevoie de
matricea K, formez direct matricea K^-1. Gradul de iesire al unei pagini i este
suma elementelor de pe linia i. Functia sum returneaza un vector cu suma
elementelor pe coloane, de aceea am transpus matricea A, ca sa obtin intr-un
vector suma elementelor pe linii a matricei A. Cum matricea K este diagonala,
rezulta ca inversa ei este tot o matrice diagonala cu K^-1(i, i) = 1/K(i, i).
Tot acest proces se poate rezolva intr-o scurta linie de cod datorita
vectorizarii din Matlab.

In cadrul apelarii functiei Iterative, dupa formarea matricei K^-1, se
calculeaza matricea M si se incepe gasirea vectorului R folosind recurenta si
conditia de oprire date.

Apelul functiei Algebraic presupune, dupa formarea matricelor K^-1 si M,
gasirea vectorului R dupa o formula ce implica inversa unei matrice (I-dM). Cum
procesul este costisitor, am inversat matricea prin intermediul algoritmului
Gram-Schmidt usor modificat si prin intermediul rezolvarii sistemelor superior
triunghiulare.

Algoritmul Gram-Schmidt putin modificat presupune gasirea matricelor
Q(ortogonala) si R(superior triunghiulara) astfel incat A=QR. Se porneste cu
Q=A, R initial nu are importanta. Algoritmul este bazat pe vectorizari. Dupa
factorizarea matricei A in Q si R determin inversa ei prin rezolvarea
sistemelor superior triunghiulare date de cele doua matrice noi obtinute.
Pentru aceasta, am implementat functia SistemSuperior care rezolva prin
substitutie sistemul, mergand de la ultima linie pana la prima (substitutie
inapoi). Iarasi am profitat de vectorizarile Matlab-ului si am evitat folosirea
instructiunilor de tipul for.

Cei doi vectori obtinuti din functiile Iterative si Algebraic, sunt afisati
imediat dupa obtinere, urmand apoi sa se sorteze descrescator vectorul si sa se
calculeze gradul de apartenenta al fiecarei pagini, de acest lucru ocupandu-se
functia Apartenenta.

Functia Apartenenta verifica mai intai unde se plaseaza x intre intervalele
[0, val1), [val1, val2] si (val2, 1]. Daca se afla in primul sau ultimul,
cunosc foarte bine gradul de apartenenta: 0, respectiv 1. Daca x se afla in
intervalul [val1, val2] si val1 este diferit de val2, se calculeaza a si b
astfel incat functia sa fie continua, rezultand formulele scrise in cod. Daca
val1 = val2, la determinarea lui a si b as primi warning-ul "division by zero"
si gradul de apartenenta ar fi infinit, total incorect, de aceea am impus
conditia ca a si b sa se calculeze doar daca val1 si val2 sunt diferite. In
cazul in care sunt egale, nu ramane decat de ales fie 0, fie 1, eu am ales 0.
	Dupa afisarea gradelor de apartenenta si inchiderea fisierului de iesire se
termina executia codului.

Toate calculele, vectorizarile, toti algoritmii, in concluzie, tot codul a
fost scris pentru a functiona cu situatiile impuse:
- matricea A va fi mereu patratica (de aceea peste tot am folosit N si nu NxM);
- matricea K este inversabila;
- val1 si val2 sunt introduse corect;
- si multe alte detalii.

Asadar, nu am facut diverse verificari inainte de anumite portiuni din cod,
mergand pe premiza ca datele sunt introduse corect si exista cu siguranta o
solutie a problemei. De asemenea m-am folosit de functia length pentru a prelua
maixmul dintre numarul de coloane si de linii al matricei A (adica acelasi
numar pentru ca A este patratica) si nu de functia size.

O modificare adusa temei pentru a scadea timpul de executie a fost sa nu
mai citesc in mai multe functii, ci doar in MatriceAdiacenta_si_Valori, iar
toate datele citite sunt intoarse in functia PageRank de unde trimit ca
parametri informatiile de care au nevoie celelalte functii.
