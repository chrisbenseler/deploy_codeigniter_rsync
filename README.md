deploy_codeigniter_rsync
========================

Shell script que usa rsync para copiar conteúdo de aplicação do Code Igniter para servidor por ssh


Desenvolvido para o caso do servidor de destino não conseguir, por alguma forma, acessar um repositório.
Com isso, o desenvolvedor pode sincronizar direto da sua workstation para o servidor caso esse tenha acesso por SSH liberado

Configuração
============

``
#!/bin/bash

USER="my_user"
HOST="my_host"
DIRPATHONHOST="/any_path/"

rsync -CavzR -e ssh --exclude 'cache' --exclude 'logs' application/ system/ $USER@$HOST:$DIRPATHONHOST
``

USER: nome do usuário usado para logar por ssh
HOST: host que será acessado
DIRPATHONHOST: diretório no qual a aplicação está instalada

Observações
===========
- antes de rodar os script, dar permissão
- as pastas application/logs e application/cache são ignoradas, pois não há necessidade de sincronizá-las
- o script pode ser facilmente modificado para ajudar no deploy de outras aplicações, é só avaliar caso a caso o que é necessário mudar na estrutura de pastas
- o script não gerencia o banco de dados. Está na TODO lista fazer uma rotina que leia de uma pasta dumps do banco de dados para rodar no servidor