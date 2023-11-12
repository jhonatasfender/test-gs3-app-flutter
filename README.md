# Teste Flutter

Este projeto tem como objetivo criar uma tela com base em um design fornecido no Figma. A tela é composta por diferentes widgets, incluindo um cabeçalho, um cartão de crédito, a seção "Meus Favoritos", os "Últimos Lançamentos" e uma barra de navegação.

O design original pode ser visualizado [aqui](https://www.figma.com/file/6zpyt0P3vGB4pey9LxYUXO/Untitled?node-id=0%3A1&mode=dev).

## Desafios Enfrentados

Durante a implementação deste projeto, me deparei com alguns desafios e encontrei soluções para eles. Abaixo estão algumas das dificuldades enfrentadas e as resoluções correspondentes:

### Box Shadow Inset

No Flutter, as sombras são aplicadas por meio da propriedade `BoxShadow`, permitindo adicionar sombras a um contêiner. Entretanto, até a minha última atualização, o Flutter não oferece suporte nativo para sombras internas (box-shadow inset). Isso ocorre devido a algumas considerações:

#### **1. Natureza do Flutter:**
O Flutter é uma estrutura de interface do usuário altamente personalizável e focada em desempenho eficiente. Contudo, para manter a simplicidade, nem todos os efeitos gráficos são incorporados nativamente.

#### **2. Simplicidade de Design:**
O Flutter segue o princípio de "tudo é um widget", promovendo uma arquitetura simplificada e modular. A adição de recursos específicos, como sombras internas, pode complicar a estrutura de widgets, introduzindo complexidade desnecessária para casos de uso menos comuns.

#### **3. Flexibilidade de Customização:**
O Flutter incentiva a flexibilidade e personalização por meio da criação de widgets personalizados. Os desenvolvedores têm a liberdade de criar soluções específicas para suas necessidades, incluindo a adição de sombras internas.

#### **Solução com flutter_inset_box_shadow:**
Para contornar a ausência de suporte nativo, recorri à biblioteca de terceiros `flutter_inset_box_shadow`. Essa biblioteca oferece uma solução fácil para adicionar sombras internas a componentes.

```dart
Container(
  decoration: BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.black,
        offset: Offset(0.0, 0.0),
        blurRadius: 6.0,
        spreadRadius: 0.0,
      ),
      // Adicionando sombra interna com flutter_inset_box_shadow
      BoxShadow.inset(
        color: Colors.white,
        offset: Offset(0.0, 0.0),
        blurRadius: 6.0,
        spreadRadius: 0.0,
      ),
    ],
  ),
  // Restante do conteúdo do contêiner
)
```

Em resumo, a falta de suporte nativo para sombras internas no Flutter é uma escolha de design que enfatiza simplicidade, modularidade e flexibilidade. Os desenvolvedores podem optar por soluções de terceiros, como `flutter_inset_box_shadow`, para alcançar efeitos específicos, mantendo a capacidade de personalização oferecida pelo Flutter.

Observação: Notei que a sombra não fica tão boa no iOS, e no Android, é necessário ajustar a sombra na parte inferior. A biblioteca abrange toda a extensão do objeto e não apenas as coordenadas, como solicitado no Figma. Sugeriria explorar mais essa biblioteca e integrá-la internamente para maior autonomia e melhor alinhamento com o Figma.

### Organização do Projeto

Outro desafio foi manter uma estrutura de projeto organizada e escalável à medida que novos recursos eram adicionados. A divisão entre componentes, telas e utilitários foi uma escolha para manter a clareza e facilitar a manutenção do código.

**Solução:**
A estrutura do projeto foi organizada em pastas como `lib/components`, `lib/screens` e `lib/utils`, seguindo as melhores práticas de organização de código Flutter.

No entanto, considerando a expansão do projeto, sugiro a implementação de módulos, onde dentro da pasta `lib` haveria uma pasta chamada `modulos`, organizando em `components` e `screens`, e uma pasta externa chamada `core` para compartilhamento de código.

## Melhorias Possíveis

Além dos desafios enfrentados, há áreas no código que podem ser aprimoradas para garantir uma implementação mais eficiente e sustentável:

### Otimização do Widget Card

A classe `CreditCard` pode ser otimizada em termos de legibilidade e eficiência. Pode-se considerar a extração de widgets menores para melhorar a modularidade.

### Estilo Consistente

Garantir que o estilo do aplicativo seja consistente em toda a aplicação é essencial. Utilizar estilos padronizados e uniformes para uma experiência visual mais coesa. Recomendaria também a implementação de temas escuros, pois muitos usuários preferem essa opção.

### Documentação

A documentação do código pode ser expandida para fornecer explicações mais detalhadas sobre o propósito e funcionamento de determinados widgets e classes. Documentações para os desenvolvedores de widget existentes no projeto seriam valiosas para facilitar a reutilização do código. Aqui estão algumas ferramentas que podem ajudar nesse processo:

1. **DartDoc:**
   - O DartDoc é uma ferramenta que gera documentação a partir de comentários no estilo Dart. Integre-o ao seu fluxo de trabalho para criar documentação legível e acessível.

   ```bash
   # Execute o DartDoc para gerar documentação
   dartdoc
   ```

2. **Doxygen:**
   - Embora mais comumente associado a linguagens como C++, o Doxygen também suporta Dart. Ele pode ser útil para gerar documentação a partir de código-fonte com base em comentários especiais.

   ```dart
   /// \brief Um widget personalizado para exibir botões elegantes.
   class MyButton extends StatelessWidget {
     // ...
   }
   ```

3. **Markdown e Flutter Markdown:**
   - Considere criar arquivos Markdown (por exemplo, `README.md`) na raiz do seu projeto para fornecer documentação de alto nível, explicando a estrutura, os padrões e como os widgets devem ser usados.

   ```markdown
   ## MyButton

   Um widget personalizado para exibir botões elegantes.
   
   ### Uso

   ```dart
   import 'package:my_project/widgets/my_button.dart';

   void main() {
     runApp(MyButton(label: 'Clique Aqui'));
   }
   ```

4. **Storybook Flutter:**
   - O Storybook é uma ferramenta popular para documentar e visualizar componentes em várias plataformas, incluindo o Flutter. Ele permite que os desenvolvedores vejam e interajam com os componentes em um ambiente isolado.

   ```bash
   # Instale o Storybook Flutter
   flutter pub global activate storybook
   ```

   ```bash
   # Execute o Storybook
   flutter pub global run storybook
   ```

Essas práticas e ferramentas podem melhorar a documentação dos widgets Flutter, tornando-a mais acessível e útil para outros desenvolvedores que interagem com o código.

## Capturas de Tela

Abaixo estão as capturas de tela do aplicativo nas plataformas iOS e Android:

### iOS

![Captura de Tela iOS](./docs/ios.png)

### Android

![Captura de Tela Android](./docs/android.png)


## Pré-requisitos

Certifique-se de ter o [Flutter](https://flutter.dev/) instalado em seu ambiente. Forneço instruções específicas para diferentes sistemas operacionais:

### Linux:

Siga as instruções detalhadas na [documentação oficial para Linux](https://flutter.dev/docs/get-started/install/linux).

### Windows:

Instale o Flutter conforme descrito na [documentação oficial para Windows](https://flutter.dev/docs/get-started/install/windows).

### macOS:

Para usuários de macOS, consulte as instruções na [documentação oficial para macOS](https://flutter.dev/docs/get-started/install/macos).

Ajuste as configurações do dispositivo conforme necessário antes de prosseguir com a instalação do aplicativo.

## Instalação e Verificação do Dispositivo

Antes de executar o aplicativo, é crucial garantir que seu ambiente esteja configurado corretamente. Siga os passos abaixo para clonar o repositório, instalar as dependências e executar o aplicativo.

1. **Clone o repositório:**
   - Faça uma cópia local do repositório em sua máquina:

   ```bash
   git clone git@github.com:jhonatasfender/test-gs3-app-flutter.git
   cd test-gs3-app-flutter
   ```

2. **Instale as dependências:**
   - Use o seguinte comando para instalar todas as dependências necessárias:

   ```bash
   flutter pub get
   ```

3. **Verifique seu dispositivo:**
   - Antes de executar o aplicativo, certifique-se de ter um dispositivo disponível ou um emulador configurado:

   ```bash
   flutter devices
   ```

   Certifique-se de que um dispositivo esteja listado e esteja pronto para ser usado.

4. **Execute o aplicativo:**
   - Agora, você está pronto para iniciar o aplicativo. Use o seguinte comando para executar o aplicativo no dispositivo ou emulador:

   ```bash
   flutter run
   ```

   Isso iniciará o aplicativo no dispositivo ou emulador selecionado.

Ao seguir essas etapas, você garantirá que o repositório esteja corretamente configurado, as dependências estejam instaladas e que um dispositivo ou emulador esteja pronto para executar o aplicativo Flutter.
