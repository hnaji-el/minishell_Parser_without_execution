/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   repl.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: hnaji-el <hnaji-el@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/09/17 17:02:08 by hnaji-el          #+#    #+#             */
/*   Updated: 2021/09/27 14:33:58 by hnaji-el         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../includes/parser.h"

int		visitor_vis(t_ast *node);

int	collect_and_check_cmd_line(char **cmd_line)
{
	*cmd_line = readline("AnasHamid$ ");
	if (*cmd_line == NULL)
	{
		write(2, "\033[AAnasHamid$ exit\n", 19);
		exit(0);
	}
	if (cmd_line[0][0] == '\0')
	{
		free(*cmd_line);
		return (0);
	}
	return (1);
}

int	main(int argc, char **argv, char **envp)
{
	char		*cmd_line;
	t_parser	*parser;
	t_ast		*ast;

	(void)argc;
	(void)argv;
	(void)envp;
	signal(SIGINT, sig_handler);
	signal(SIGQUIT, sig_handler);
	while (1)
	{
		if (collect_and_check_cmd_line(&cmd_line) == 0)
			continue ;
		add_history(cmd_line);
		parser = init_lexer_and_parser(cmd_line, g_exit_s);
		ast = parser_parse(parser);
		free_parser(parser);
		/* add main function of the executor here */
		visitor_vis(ast);
		free_ast_pipeline(ast);
	}
	return (0);
}
