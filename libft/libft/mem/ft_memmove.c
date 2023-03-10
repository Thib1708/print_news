/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_memmove.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: thibaultgiraudon <thibaultgiraudon@stud    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/11/07 17:49:06 by tgiraudo          #+#    #+#             */
/*   Updated: 2023/02/24 18:14:45 by thibaultgir      ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include"libft.h"

void	*ft_memmove(void *dst, const void *src, size_t len)
{
	char			*dest;
	char			*str;
	size_t			i;

	if (!dst && !src)
		return (NULL);
	str = (char *)src;
	dest = (char *)dst;
	i = 0;
	if (dest > str)
	{
		while (len--)
			dest[len] = str[len];
	}
	else
	{
		while (i < len)
		{
			dest[i] = str[i];
			i++;
		}
	}
	return (dest);
}
