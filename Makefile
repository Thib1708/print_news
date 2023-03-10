# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: thibaultgiraudon <thibaultgiraudon@stud    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/24 11:12:25 by tgiraudo          #+#    #+#              #
#    Updated: 2023/02/24 18:14:45 by thibaultgir      ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# VARIABLE

NAME			=	print_news

LIST_SRCS		=	main.c				\
					ft_check_country.c	\

HEADERS			=	print_news.h

# DIRECTORY
DIR_OBJS		=	.objs/

DIR_SRCS		=	srcs/

DIR_INCS		=	include/

# LIB

LIBFT 			=	-L ./libft -lft 

# CONSTANT

PRINT 			= 	@printf

FLAGS			=	-Wall -Wextra -Werror

MAKEFLAGS		+=	--no-print-directory

CC 				=	gcc

OBJS 			=	$(patsubst %.c, $(DIR_OBJS)%.o, $(SRCS))

SRCS			=	${addprefix ${DIR_SRCS}, ${LIST_SRCS}}

INCLUDES		=	${addprefix ${DIR_INCS}, ${HEADERS}}

# COLOR

RED 			=	\033[1;31m
PURPLE 			=	\033[38;5;5m
GREEN 			=	\033[1;32m
YELLOW 			=	\033[1;33m
SUPPR   		=	\r\033[2K
DEFAULT 		=	\033[0m

# RULES

${DIR_OBJS}%.o 	:	%.c Makefile ${INCLUDES} 
				@mkdir -p $(shell dirname $@)
				@${PRINT} "${YELLOW}${SUPPR}Creating ${NAME}'s objects : $@"
				@${CC} -g3 ${FLAGS} -I ${DIR_INCS} -c $< -o $@ 
				@${PRINT} "${GREEN}${SUPPR}Creating ${NAME}'s objects : DONE"

${NAME}			:	ascii lib ${OBJS}
				@${PRINT} "${GREEN}${SUPPR}Creating ${NAME}'s objects : DONE"
				@${PRINT} "\n${YELLOW}Compiling ${NAME}..."
				@${CC} -g3 ${OBJS} ${LIBFT} -o ${NAME}
				@${PRINT} "\r${GREEN}Compiling ${NAME} : DONE${DEFAULT}\n\n"

all				:	${NAME}

leaks			:	ascii lib ${OBJS}
				@${PRINT} "${GREEN}${SUPPR}Creating ${NAME}'s objects : DONE"
				@${PRINT} "\n${YELLOW}Compiling ${NAME}..."
				@${CC} -fsanitize=address ${OBJS} ${LIBFT} -o ${NAME}
				@${PRINT} "\r${GREEN}Compiling ${NAME} : DONE${DEFAULT}\n\n"

ascii 			:
				@${PRINT} "$$ASCII"	

lib 			:
				@${MAKE} -C ./libft

clean			:
				@${PRINT} "${RED}Deleting objects : DONE\n"
				@rm -rf ${DIR_OBJS}

fclean			:	clean
				@${PRINT} "${RED}Cleaning libft : DONE\n"
				@${MAKE} fclean -C ./libft
				@${PRINT} "${RED}Deleting executable : DONE\n\n${DEFAULT}"
				@rm -f ${NAME}

re				:	ascii fclean all

${DIR_OBJS}		:
				mkdir -p ${DIR_OBJS}
				
define ASCII
${PURPLE}
             _       _                                  
            (_)     | |                                 
  _ __  _ __ _ _ __ | |_   _ __   _____      _____ 
 | '_ \| '__| | '_ \| __| | '_ \ / _ \ \ /\ / / __|
 | |_) | |  | | | | | |_  | | | |  __/\ V  V /\__ \\
 | .__/|_|  |_|_| |_|\__| |_| |_|\___| \_/\_/ |___/
 | |                                                   
 |_|                                                    

${DEFAULT}

endef
export ASCII

.PHONY		: all clean fclean re lib ascii leaks
