#OUTPUT
BINARY = minishell

#COMMANDS
CC = gcc
CFLAGS = -O
CFLAGS += -Wall -Wextra -Werror
CFLAGS += -g3 -fsanitize=address
RM = rm -rf

#INCLUDES
DIR_INCLUDES = ./Inc/
FILES_INCLUDES = minishell.h	\
								 structs.h
INCLUDES = $(addprefix -I, $(DIR_INCLUDES))

#LIBRARIES
LINKER =
#LIBFT
DIR_LIBFT = ./Libft/
LIBFT = libft.a
LINKER += -L$(DIR_LIBFT) -lft

#SOURCES
DIR_SOURCES = ./Src/
SUBDIR_SOURCES = Core/ \
                 Signals/ \
                 Parser/ \
                 Executor/ \
                 Buildtings/

FILES_CORE = main.c
FILES_SIGNALS = signals.c
FILES_PARSER = parser.c
FILES_EXECUTOR = executor.c
FILES_BUILDTINGS = builtins.c

SOURCES_CORE = $(addprefix $(DIR_SOURCES)core/, $(FILES_CORE))
SOURCES_SIGNALS = $(addprefix $(DIR_SOURCES)signals/, $(FILES_SIGNALS))
SOURCES_PARSER = $(addprefix $(DIR_SOURCES)parser/, $(FILES_PARSER))
SOURCES_EXECUTOR = $(addprefix $(DIR_SOURCES)executor/, $(FILES_EXECUTOR))
SOURCES_BUILDTINGS = $(addprefix $(DIR_SOURCES)buildtings/, $(FILES_BUILDTINGS))

SOURCES = $(SOURCES_CORE) $(SOURCES_SIGNALS) $(SOURCES_PARSER) $(SOURCES_EXECUTOR) $(SOURCES_BUILDTINGS)

#OBJECTS
DIR_OBJ = ./Obj/
OBJECTS = $(addprefix $(DIR_OBJ), $(FILES_SOURCES:.c=.o))

all: $(BINARY)

$(BINARY): $(LIBFT) $(OBJECTS) $(MLX)
	@printf "\n$(CY)Generating $(NAME) executable...$(RC)\n"
	$(CC) $(CFLAGS)  $(OBJECTS) $(LINKER) -o $(BINARY)
	@printf "$(GR)Done!$(RC)\n\n"

$(LIBFT):
	@printf "\n$(GR)Generating Libft...$(RC)\n"
	make -sC $(DIR_LIBFT)
	@printf "$(GR)Libft created!$(RC)\n\n"


$(DIR_OBJ)%.o: $(DIR_SOURCES)%.c
	mkdir -p $(DIR_OBJ)
	@printf "\n$(CY)Compiling $<...$(RC)\n"
	$(CC) $(CFLAGS) -c $< -o $@
	@printf "$(GR)Object $@ ready!$(RC)\n"

clean:
	make -sC $(DIR_LIBFT) clean
	$(RM) $(DIR_OBJ)

fclean: clean
	$(RM) $(BINARY)
	$(RM) $(DIR_LIBFT)$(LIBFT)

dev: all
	@$(MAKE) clean

re: fclean all

.PHONY: clean fclean re dev

# Colors
GR	= \033[32;1m
RE	= \033[31;1m
YE	= \033[33;1m
CY	= \033[36;1m
RC	= \033[0m

