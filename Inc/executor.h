
#ifndef EXECUTOR_H
#define EXECUTOR_H
#include <stdlib.h>

typedef struct s_tree {
  char *cmd;        // El comando a ejecutar, por ejemplo, "ls", "grep"
  char *flags;      // Las banderas o argumentos del comando
  int infile;       // Archivo de entrada (por ejemplo, descriptor de archivo)
  int outfile;      // Archivo de salida (por ejemplo, descriptor de archivo)
  int bin_operator; // Operador binario (por ejemplo, `|` o `&&` o `||`)
  struct s_tree *left;  // Puntero al hijo izquierdo
  struct s_tree *right; // Puntero al hijo derecho
} t_tree;

#endif // EXECUTOR_H
