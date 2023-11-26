# AtendeSala

## Descrição / Motivação
Aplicação para que a tirada de dúvidas em sala de modalidade presencial seja facilitada.  

Atualmente, professores simplesmente percebem pessoas e equipes levantando as mãos, ou chamando o professor, enquanto o professor, sozinho, tem que manter em mente a ordem e contexto de toda a equipe a todo momento, sem falar de ter que lembrar onde cada um fica dentro da sala, o que pode ser caótico visto alguns ambientes que são maiores, como salas de auditório ou laboratórios.  

Seria prático ter um sistema onde a aula ou evento pudesse ser iniciado e as pessoas ali presentes pudessem entrar, selecionar onde estão, colocar o nome pelo qual deseja ser referenciado, seja equipe ou indivíduo e conseguir clicar um botão que o colocassem na fila, substituindo o levantar de mão até o professor te notar ou chamá-lo pelo nome.  
Sem falar que, com isso, também é possível para o professor saber quem as pessoas/equipe são, onde estão e, caso a equipe deseje, ler uma descrição muito breve, de 1 ou 2 linhas, do problema em geral que está causando a dúvida ou situação a ser consultada.  

Portanto, a ideia da aplicação é, justamente, permitir essa interação e facilitação no atendimento de salas. Permitindo que sejam selecionados layouts pré-definidos (por enquanto) que representem a sala no momento da criação, assim, os alunos podem entrar, se localizarem e se identificarem, então, sempre que precisarem de atendimento, e só realizar a solicitação e acompanhar seu lugar na fila da lista do professor que, por sua vez, terá todas as informações relevantes para o atendimento na palma da mão de forma simples e clara.  

Ao término da aula, o professor também terá disponível, de forma offline, um relatório sobre os atendimentos, permitindo que ele verifique informações como:  
Quais pessoas/equipes requisitaram atendimento e frequência;  
Tempo de atendimento para cada um;  
Tempo médio de atendimento e total de pessoas/equipes atendidas;  
Tudo isso permite que o professor tenha um controle sobre cada uma de suas aulas e tenha um feedback da participação de cada aluno/equipe que pode ser checado de forma offline uma vez que a aula tenha concluído.  
## Tecnologias

### Front-End: [Dart](https://dart.dev/) + [Flutter](https://flutter.dev/)

### Back-End: [PHP](https://www.php.net/) + [Laravel](https://laravel.com/) + [Postgresql](https://www.postgresql.org/)

### Design: [Figma](https://www.figma.com/)

## Como instalar e rodar o AtendeSala

### Localmente

É pré-requisito que Flutter esteja instalado na máquina.  

Baixe o código presente neste repositório e rode os seguintes comandos no terminal enquanto na root:

flutter pub get  
flutter run  

Selecione a opção de navegador que preferir. Recomendamos o Google Chrome.  

### Alternativamente: [Na Web](https://victorpbp.github.io/atende-sala-build-web/#/)  <-- Link para Github Pages da aplicação

## Repositórios  
Para questões de organização, permitir mais fácil colaboração e não haver demasiados conflitos durante MR's, foi decidido dividir a aplicação em repositórios do Front-End e Back-End.  
### [Front-End](https://github.com/victorpbp/atende-sala-front)   
### [Back-End](https://github.com/Alexandre010xC/atende-sala-api)   

## Equipe

### Front-End:  
[Victor Peixoto](https://github.com/victorpbp)  
[Lorena Roberta](https://github.com/lorenarbt)   
[Glauber Gouveia](https://github.com/GlauberGouveia)  

### Back-End:
[Alexandre Coelho](https://github.com/Alexandre010xC)  

