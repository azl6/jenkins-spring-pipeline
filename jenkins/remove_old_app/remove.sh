#!/bin/bash

result=$(docker ps -aq)

if [[ "$result" = '' ]]; then
	echo 'Sem contĂȘineres rodando!'
else
	echo 'Pelo menos 1 contĂȘiner rodando!'
	docker stop $(docker ps -aq)
	echo 'ContĂȘineres parados!'
fi
