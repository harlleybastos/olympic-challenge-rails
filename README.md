Sobre o Projeto
---------------

OlympicChallengeRails é uma aplicação Rails desenvolvida com o objetivo de gerenciar competições esportivas e seus resultados. Utilizando o enfoque de Desenvolvimento Dirigido por Domínio (DDD), esta aplicação oferece uma estrutura clara e modular, facilitando a manutenção e expansão das funcionalidades.

Funcionalidades
---------------

A aplicação inclui as seguintes rotas e funcionalidades:

-   **Criação de competições**: Permite criar novas competições esportivas.
-   **Adição de resultados**: Insere resultados de atletas em competições específicas.
-   **Finalização de competições**: Marca uma competição como finalizada.
-   **Cálculo de ranking**: Gera um ranking dos atletas baseado em seus resultados.

Rotas
-----------------------

A aplicação inclui as seguintes rotas e funcionalidades:

1.  Criação de Atletas

    -   Rota: `POST /atletas`
    -   Permite o cadastro de novos atletas.
2.  Listagem de Atletas

    -   Rota: `GET /atletas`
    -   Exibe todos os atletas cadastrados.
3.  Criação de Competições

    -   Rota: `POST /competicoes`
    -   Permite criar novas competições esportivas.
4.  Adição de Resultados

    -   Rota: `POST /competicoes/:id/resultados`
    -   Insere resultados de atletas em competições específicas.
5.  Finalização de Competições

    -   Rota: `POST /competicoes/:id/finalizar`
    -   Marca uma competição como finalizada.
6.  Cálculo de Ranking

    -   Rota: `GET /competicoes/:id/ranking`
    -   Gera um ranking dos atletas baseado em seus resultados.

Benefícios e Competências Adquiridas
------------------------------------

Ao utilizar este projeto, você terá a oportunidade de:

-   **Aplicar e Aprofundar Conhecimentos em Rails**: Com a estrutura e funcionalidades implementadas, você pode explorar e compreender como uma aplicação Rails madura é estruturada e operada.
-   **Entender o Uso do DDD**: Este projeto é um exemplo prático de como o Desenvolvimento Dirigido por Domínio pode ser aplicado em uma aplicação real, proporcionando uma arquitetura limpa e modular.
-   **Experiência com Docker em Rails**: A configuração completa do Docker demonstra como containerizar uma aplicação Rails, uma habilidade essencial no desenvolvimento moderno.
-   **Prática com Testes Automatizados**: O projeto inclui testes escritos com RSpec, permitindo que você veja exemplos de testes em um ambiente de produção.

Pré-Requisitos
--------------

-   Docker e Docker Compose
-   Conhecimento básico em Ruby on Rails
-   Conhecimento em testes com RSpec
-   Conhecimento em DDD

Configuração do Ambiente
------------------------

### Variáveis de Ambiente

Crie um arquivo `.env` na raiz do projeto com as todas as variáveis do arquivo `.env.sample`:


```bash
POSTGRES_HOST=db
POSTGRES_DB=nome_do_seu_db
POSTGRES_USER=seu_usuario
POSTGRES_PASSWORD=sua_senha 
RAILS_ENV=development
```

### Docker

O projeto é totalmente configurado para ser executado em contêineres Docker. Para construir e iniciar a aplicação, siga os passos abaixo:

1.  Construa a imagem do projeto:

    `docker-compose build`

2.  Inicie os serviços:

    `docker-compose up`

A aplicação estará disponível em `http://localhost:3000`.

O banco de dados estará disponível em `http://localhost:5432`

Executando Testes
-----------------

Para executar os testes, use o seguinte comando:

`docker-compose run web rspec`

Recursos de Estudo
------------------

-   **Ruby on Rails**: [Guia Oficial](https://guides.rubyonrails.org/)
-   **RSpec**: Documentação Oficial
-   **Desenvolvimento Dirigido por Domínio (DDD)**: Domain-Driven Design Distilled by Vaughn Vernon
-   **Domain Modeling in Ruby on Rails with introduction to Domain-Driven Design - Paweł Strzałkowski**: [Video Youtube](https://www.youtube.com/watch?v=94Atco5-tRQ)
-   **Docker para Desenvolvedores**: Documentação Docker

Contribuição
------------

Suas contribuições são sempre bem-vindas. Siga estas etapas para contribuir:

1.  Faça um fork do projeto.
2.  Crie uma nova branch com suas mudanças (`git checkout -b feature/minhaNovaFeature`).
3.  Faça commit das suas alterações (`git commit -am 'Adiciona alguma feature'`).
4.  Faça push para a branch (`git push origin feature/minhaNovaFeature`).
5.  Crie um Pull Request.

Licença
-------

Este projeto está sob a licença MIT.