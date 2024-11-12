#include "../Inc/minishell.h"

int main(int ac, char **av, char **env) {

  t_tree **tree_data;
  char *input;
  char *full_input;

  // TODO(parser)
  char **my_env = ft_2D_array_dup(env);
  while (1) {
    printf("PROMT\n");
    // TODO (parser)
    input = readline();
    full_input = expander(input);
    tree_data = parser(full_input);

    // TODO(executor)
    while (tree_data) {
      if (tree_data->left)
        executor(tree_data->left);
      if (tree_data->right)
        executor(tree_data->right);
    }
  }
  return 0;
}
