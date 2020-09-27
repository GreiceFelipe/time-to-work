# Time to work 

* Ruby version 2.6.3

* Rails version 6.0.3

* Mysql

* Rspec rails version 4.0.1

### Configurações

Para instalar todas as dependências do rails:

```
bundle install
```
Para instalar todas as dependências do node:

```
yarn install --check-files
```

### Criar o banco de dados

```
rails db:create
```

### Configurar o banco de dados

```
rails db:migrate
```

#### Para rodar o rspec 

```
rspec
```

#### Observações 

Esse projeto está levando em considerações algumas regras de négócio: 

* Se o ponto incial e o final for maior que 6 horas a hora do almoço será 4 horas depois da entrada.
* Caso  o ponto incial e o final for menor que 6 horas a hora do almoço será nula
* Para o caso da hora do almoço ser nula a hora total só leva em consideração o ponto de entrada e saída
* Não se pode bater ou criar dois pontos no mesmo dia
* Regras de negócio foram colocadas no consern de model

Poderiam existir mais testes de features além do signin 
 