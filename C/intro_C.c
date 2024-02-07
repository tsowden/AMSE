#include <stdio.h> // Inclusion de la bibliothèque standard d'entrée/sortie pour printf et scanf

// Prototype de la fonction 'echange' qui indique au compilateur
// qu'une fonction 'echange' sera définie plus tard.
// Cette fonction prend deux pointeurs d'entiers en argument.
void echange(int* a, int* b);

// La fonction principale du programme - point d'entrée lors de l'exécution
int main(void) {
    int a, b; // Déclaration des variables entières a et b

    // Initialisation des variables a et b avec les valeurs 12 et 33 respectivement
    a = 12;
    b = 33;

    // Affichage des valeurs initiales de a et b
    printf("Avant echange: a = %d, b = %d\n", a, b);

    // Appel de la fonction 'echange' avec les adresses de a et b
    // Cela permet à la fonction 'echange' de modifier les valeurs de a et b
    echange(&a, &b);

    // Affichage des valeurs de a et b après l'échange
    printf("Apres echange: a = %d, b = %d\n", a, b);

    // Fin de la fonction 'main' avec le renvoi de la valeur 0
    // 0 est souvent utilisé pour indiquer que le programme s'est terminé avec succès
    return 0;
}

// Définition de la fonction 'echange' qui a été promise plus tôt.
// Cette fonction échange les valeurs des deux entiers pointés par 'a' et 'b'.
void echange(int* a, int* b) {
    int temp; // Déclaration d'une variable temporaire 'temp' pour l'échange

    temp = *a; // Sauvegarde de la valeur pointée par 'a' dans 'temp'
    *a = *b;   // Assignation de la valeur pointée par 'b' à l'endroit pointé par 'a'
    *b = temp; // Assignation de la valeur sauvegardée de 'a' (dans 'temp') à l'endroit pointé par 'b'
}
