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
DIR_SOURCES = ./Src/ \

SUBDIR_SOURCES = ./Core/	\
							./Signals	\
							./Parser	\
							./executor	\
							./buildting	
FILES_CORE = main.c 			\
SOURCES = $(addprefix $(DIR_SOURCES), $(FILES_SOURCES))
FILES_SIGNALS= main.c 			\
SOURCES += $(addprefix $(DIR_SOURCES), $(FILES_SOURCES))
FILES_PARSER = main.c 			\
SOURCES += $(addprefix $(DIR_SOURCES), $(FILES_SOURCES))
FILES_EXECUTOR = main.c 			\
SOURCES += $(addprefix $(DIR_SOURCES), $(FILES_SOURCES))
FILES_BUILDTINGS = main.c 			\
SOURCES += $(addprefix $(DIR_SOURCES), $(FILES_SOURCES))
SOURCES += $(addprefix $(DIR_SOURCES), $(FILES_SOURCES))

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

$(MLX):
	@printf "\n$(CY)Generating MiniLibX...$(RC)\n"
	@make -sC $(MLX_PATH)
	@printf "$(GR)MiniLibX created!$(RC)\n\n"

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

