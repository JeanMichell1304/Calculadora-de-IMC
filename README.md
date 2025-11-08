# 🧮 Calculadora de IMC

Aplicativo desenvolvido em **Flutter** utilizando **Dart**, que calcula o **Índice de Massa Corporal (IMC)** e exibe a classificação de acordo com as faixas definidas pela **Organização Mundial da Saúde (OMS)**.

O app possui uma interface moderna, intuitiva e responsiva, com suporte à seleção de gênero, feedback visual e navegação entre telas.

---

## 📱 Sobre o projeto

O **Calculadora de IMC** tem como objetivo ajudar o usuário a descobrir seu IMC e entender sua categoria (Abaixo do peso, Peso normal, Sobrepeso, etc.) de maneira rápida e visual.

### ✨ Funcionalidades principais:
- Cálculo automático do IMC com base em **peso (kg)** e **altura (cm)**;
- Exibição da **classificação correspondente** com base no resultado;
- Seleção de **gênero** (masculino/feminino);
- Navegação para uma **tela detalhada** com todas as categorias de IMC coloridas;
- Mensagens de **erro amigáveis** para dados inválidos;
- Interface estilizada com **Google Fonts (Poppins)** e **Material Design**.

---

## ⚙️ Tecnologias utilizadas

- **Flutter** — framework multiplataforma  
- **Dart** — linguagem de programação  
- **Material Design** — design system nativo do Flutter  
- **Google Fonts** — personalização da tipografia  
- **Widgets personalizados** e **StatefulWidget** para controle dinâmico

---

## 🧠 Lógica do cálculo

A fórmula utilizada é:

```
IMC = peso / (altura * altura)
```

A altura é convertida de **centímetros para metros** antes do cálculo.

Em seguida, o resultado é classificado conforme a tabela abaixo:

| Faixa de IMC | Classificação          |
|---------------|------------------------|
| < 18.5        | Abaixo do peso         |
| 18.5 – 24.9   | Peso normal            |
| 25.0 – 29.9   | Sobrepeso              |
| 30.0 – 34.9   | Obesidade Grau I       |
| 35.0 – 39.9   | Obesidade Grau II      |
| ≥ 40.0        | Obesidade Grau III     |

---

## 🧩 Estrutura do projeto

```
lib/
├── main.dart              # Tela principal e lógica do cálculo do IMC
├── categorias_imc.dart    # Tela com a lista completa das categorias do IMC
└── pubspec.yaml           # Configurações e dependências do projeto
```

### 📄 **main.dart**
- Exibe campos de entrada para altura e peso;  
- Permite selecionar o gênero (masculino/feminino);  
- Calcula o IMC e exibe o resultado e a categoria;  
- Botão para acessar a tela de categorias.

### 📄 **categorias_imc.dart**
- Mostra todas as faixas de IMC com **cores distintas** e **nomes explicativos**;  
- Destaca automaticamente a categoria correspondente ao resultado obtido;  
- Usa **ListView.builder** para renderização dinâmica das categorias.

---

## 🚀 Como executar o projeto

1. **Clone o repositório:**
   ```bash
   git clone https://github.com/JeanMichell1304/Calculadora-de-IMC.git
   ```

2. **Acesse a pasta do projeto:**
   ```bash
   cd Calculadora-de-IMC
   ```

3. **Instale as dependências:**
   ```bash
   flutter pub get
   ```

4. **Execute o aplicativo:**
   ```bash
   flutter run
   ```

💡 Pode ser executado em **emuladores Android/iOS** ou em um **dispositivo físico** com a **depuração USB** ativada.

---

## 📸 Capturas de tela *(opcional)*

> Adicione aqui as imagens do app em execução:
> ```
> ![Tela principal](Tela_Principal.png)
> ![Tela de categorias](Tela_Categorias.png)
> ```

---

## 👨‍💻 Autor

**Jean Michell Ritter dos Santos**  
Aplicativo desenvolvido para fins educacionais e prática de **desenvolvimento mobile com Flutter e Dart**.

---

## 🏷️ Licença

Este projeto é de uso livre para fins educacionais e pode ser modificado e redistribuído livremente.
