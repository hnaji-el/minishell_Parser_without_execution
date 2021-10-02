# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hnaji-el <hnaji-el@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/09/16 08:43:01 by hnaji-el          #+#    #+#              #
#    Updated: 2021/10/02 16:48:01 by hnaji-el         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = minishell

SRCS = ./srcs/repl.c \
		./srcs/visitor.c \
	   	./srcs/signal.c \
		./srcs/lexer/lexer.c \
		./srcs/lexer/lexer_collect_id.c \
		./srcs/lexer/lexer_collect_double_q.c \
		./srcs/lexer/lexer_word_splitting.c \
		./srcs/lexer/lexer_utils.c \
		./srcs/lexer/token.c \
		./srcs/parser/parser.c \
		./srcs/parser/parser_simple_command.c \
		./srcs/parser/parser_here_doc.c \
		./srcs/parser/parser_utils.c \
		./srcs/parser/parser_free.c \
		./srcs/parser/ast.c

INCLUDES = ./includes/main.h \
		./includes/token.h \
		./includes/lexer.h \
		./includes/parser.h \
		./includes/ast.h \

LIBFT = ./srcs/libft/libft.a

READLINE_LIB = -lreadline -L /Users/$(USER)/.brew/opt/readline/lib \
			   -I /Users/$(USER)/.brew/opt/readline/include

FLAGS = -Wall -Wextra -Werror

all: $(NAME)

$(NAME): $(SRCS) $(INCLUDES)
	@make -C ./srcs/libft
	@gcc $(FLAGS) $(READLINE_LIB) $(SRCS) $(LIBFT) -o $(NAME)

clean:
	@make -C ./srcs/libft clean

fclean:
	@make -C ./srcs/libft fclean
	@rm -rf $(NAME)

re: fclean all

.PHONY: all clean fclean re
