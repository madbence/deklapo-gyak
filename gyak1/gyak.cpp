//1.
int csupa01(int N) {
  if(N == 0)   return true;
  if(N%10 > 1) return false;
               return csupa01(N/10);
}

//2.
int osztok(int N, int I, int C) {
  if(I == N)   return C;
  if(N%I == 0) return osztok(N, I+1, C+1);
               return osztok(N, I+1, C);
}

int osztok(int N) {
  return osztok(N, 1, 0);
}

//3.
int lnko(int A, int B, int I) {
  if(A%I == 0)
  if(B%I == 0) return I;
               return lnko(A, B, I-1);
}

int lnko(int A, int B) {
  return lnko(A, B, A);
}

//4.
int lnko2(int A, int B) {
  if(B == 0) return A;
             return lnko2(B, A%B);
}

//5.
int length(list L, int I) {
  if(L == nil) return I;
  return length(tl(L), I+1);
}

int length(list L) {
  return length(L, 0);
}

//6.
list revapp(list L1, list L2) {
  if(L1 == nil) return L2;
                return revapp(tl(L1), cons(hd(L1), L2));
}

list reverse(list L) {
  return revapp(L, nil);
}

list lista_noveltje(list L, list R) {
  if(L == nil) return R;
               return lista_noveltje(tl(L), cons(hd(L) + 1, R));
}

list lista_noveltje(list L) {
  return lista_noveltje(reverse(L), nil);
}

//7.
//lehetett volna sima hd(reverse(L)) is
int last(list L) {
  if(tl(L) == nil) return hd(L);
                   return last(tl(L));
}

//8.
list insert_nth(list L, int N, int E, int I, list R) {
  if(N == I) return revapp(R, cons(E, L));
             return insert_nth(tl(L), N, E, I+1, cons(hd(L), R));
}

list insert_nth(list L, int N, int E) {
  return insert_nth(L, N, E, 0, nil);
}

//9.
int nth1(list L, int N, int I) {
  if(N == I) return hd(L);
             return nth1(tl(L), N, I+1);
}

int nth1(list L, int N) {
  return nth1(L, N, 1);
}

//10.
list take(list L, int N, int I, list R) {
  if(N == I) return R;
             return take(tl(L), N, I+1, cons(hd(L), R));
}

list take(list L, int N) {
  return reverse(take(L, N, 0, nil));
}

//11.
list drop(list L, int N, int I) {
  if(N == I) return L;
             return drop(tl(L), N, I+1);
}

list drop(list L, int N) {
  return drop(L, N, 0);
}

//12.

list sublist(list L, int M, int N, int I, list R) {
  if(I == M+N) return R;
  if(I <    N) return sublist(tl(L), M, N, I+1, R);
               return sublist(tl(L), M, N, I+1, cons(hd(L), R));
}

list sublist(list L, int M, int N) {
  return reverse(sublist(L, M, N, 0, nil));
}

list sublist2(list L, int M, int N) {
  return take(drop(L, N), M);
}

//13.
list parban(list L, list R) {
  if(tl(L)     ==   nil) return R;
  if(hd(tl(L)) == hd(L)) return parban(tl(L), cons(hd(L), R));
                         return parban(tl(L), R);
}

list parban(list L) {
  return reverse(parban(L, nil));
}

//14.

int inc(int N) { return N+1; }

list map(fun1 F, list L, list R) {
  if(L == nil) return R;
               return map(F, tl(L), cons(F(hd(L)), R));
}

list map(fun1 F, list L) {
  return reverse(map(F, L, nil));
}

list lista_noveltje2(list L) {
  return map(inc, L);
}

//15.

int add(int A, int B) { return A+B; }

int foldl(fun2 F, int A, list L) {
  if(L == nil) return A;
               return foldl(F, F(A, hd(L)), tl(L));
}

int sum(list L) {
  return foldl(add, 0, L);
}

//16.

int addOne(int A, int B) {
  return A+1;
}

int length2(list L) {
  return foldl(addOne, 0, L);
}

//17.

int returnSecond(int A, int B) {
  return B;
}

int last2(list L) {
  return foldl(returnSecond, 0, L);
}

//18.

int addSq(int A, int B) {
  return A + B*B;
}

int sumsq(list L) {
  return foldl(addSq, 0, L);
}

//19.

int sq(int A) { return A*A; }

int sumsq2(list L) {
  return foldl(add, 0, map(sq, L));
}

