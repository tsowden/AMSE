#include <stdio.h> // Inclusion de la biblioth�que standard d'entr�e/sortie pour printf et scanf

// Prototype de la fonction 'echange' qui indique au compilateur
// qu'une fonction 'echange' sera d�finie plus tard.
// Cette fonction prend deux pointeurs d'entiers en argument.
void echange(int* a, int* b);

// La fonction principale du programme - point d'entr�e lors de l'ex�cution
int main(void) {
    int a, b; // D�claration des variables enti�res a et b

    // Initialisation des variables a et b avec les valeurs 12 et 33 respectivement
    a = 12;
    b = 33;

    // Affichage des valeurs initiales de a et b
    printf("Avant echange: a = %d, b = %d\n", a, b);

    // Appel de la fonction 'echange' avec les adresses de a et b
    // Cela permet � la fonction 'echange' de modifier les valeurs de a et b
    echange(&a, &b);

    // Affichage des valeurs de a et b apr�s l'�change
    printf("Apres echange: a = %d, b = %d\n", a, b);

    // Fin de la fonction 'main' avec le renvoi de la valeur 0
    // 0 est souvent utilis� pour indiquer que le programme s'est termin� avec succ�s
    return 0;
}

// D�finition de la fonction 'echange' qui a �t� promise plus t�t.
// Cette fonction �change les valeurs des deux entiers point�s par 'a' et 'b'.
void echange(int* a, int* b) {
    int temp; // D�claration d'une variable temporaire 'temp' pour l'�change

    temp = *a; // Sauvegarde de la valeur point�e par 'a' dans 'temp'
    *a = *b;   // Assignation de la valeur point�e par 'b' � l'endroit point� par 'a'
    *b = temp; // Assignation de la valeur sauvegard�e de 'a' (dans 'temp') � l'endroit point� par 'b'
}
