#include <stdio.h>

int addition(int a, int b)
{
 int somme = 0;
 
 somme = a+b;
 
 return somme;
}

void main()
{
  int nbr1, nbr2, resultat;
  printf("Entrez nbr1: ");
  scanf("%d",&nbr1);
  printf("Entrez nbr2: ");
  scanf("%d",&nbr2);
  resultat = addition(nbr1,nbr2);
  
  printf("Le resultat est %d",resultat);
  
}

