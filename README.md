# Robot Framework Test Suite - Material de Treinamento

Este repositório contém testes automatizados desenvolvidos com **Robot Framework**, com o objetivo de **praticar conceitos de automação de testes em aplicações web e APIs**. É um material de estudo voltado para quem está iniciando na ferramenta e deseja conhecer sua estrutura, sintaxe e boas práticas.

---

## Tecnologias Utilizadas

- [Robot Framework](https://robotframework.org/)
- [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/)
- [RequestsLibrary](https://github.com/MarketSquare/RequestsLibrary)
- Python 3.x
- VSCode
- Browser: Chrome

---

## Estrutura dos Testes

- **tests/**: Casos de testes organizados por funcionalidades.
- **resources/**: Arquivos com palavras-chave customizadas reutilizáveis.
- **variables/**: Declaração de variáveis globais.
- **requirements.txt**: Dependências do projeto.

---

## Execução dos Testes

### Rodar todos os testes

```bash
robot tests/
```
## Rodar um arquivo específico
```bash
robot tests/test_saucedemo_login.robot
```
---

## Relatórios

Após a execução dos testes com o Robot Framework, são gerados automaticamente os seguintes arquivos na raiz do projeto:

- `report.html` – Relatório geral de execução com resumo dos testes
- `log.html` – Log detalhado dos testes, útil para debugging
- `output.xml` – Saída em XML (útil para integração com pipelines de CI/CD)

Você pode abrir o `report.html` no navegador para visualizar o resultado da execução dos testes de forma interativa.

---

## Autor

Desenvolvido por **Michael Maia**  
[LinkedIn](https://www.linkedin.com/in/qamichaelmaia)
