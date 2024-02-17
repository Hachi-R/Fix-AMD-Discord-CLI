# Fix AMD Discord
### Fix AMD Discord é uma ferramenta que visa resolver problemas específicos do Discord em processadores AMD, como:

- Crashes ao entrar em chamadas de voz;
- Crashes ao assistir transmissões de tela;
- Crashes ao transmitir a tela.

#### Esses problemas estão relacionados à [Math Kernel Library (MKL)](https://en.wikipedia.org/wiki/Math_Kernel_Library), que, em alguns Hackintosh em processadores AMD, alguns aplicativos, como o Discord e softwares Adobe, tentam utilizar funções específicas para processadores Intel. Isso pode resultar em falhas do sistema.

#### O Fix AMD Discord modifica a variável de ambiente `MKL_DEBUG_CPU_TYPE` para que a MKL utilize as funções adequadas para CPUs AMD.

##### Nota: Essa correção também deve resolver problemas em softwares Adobe, embora eu não tenha testado."

# Instalação
### Existem duas maneiras de obter a ferramenta:
- **Opção  1: Baixar uma Build Pronta**. Você pode baixar uma versão já compilada nas [releases](https://github.com/Hachi-R/Fix-AMD-Discord-CLI/releases) e executá-la diretamente.

- **Opção  2: Compilar a partir do Código Fonte**. Se preferir, você pode clonar este repositório e compilar a ferramenta a partir do código fonte usando o [Xcode](https://developer.apple.com/xcode/).
  - Para clonar por linha de comando: `git clone https://github.com/Hachi-R/Fix-AMD-Discord-CLI`
  - Para baixar como um arquivo zip: https://github.com/Hachi-R/Fix-AMD-Discord-CLI/archive/refs/heads/main.zip

# Comandos        
![image](https://github.com/Hachi-R/Fix-AMD-Discord-CLI/assets/58823742/61caf909-b8f0-4c25-bdd6-9d6b7d92f001)

1. Aplica uma correção permanente, que permanecerá ativa até que seja explicitamente removida.
2. Remove uma correção aplicada anteriormente, e essa mudança permanecerá mesmo após reinicar o sistema.
3. Aplica uma correção temporária, que será revertida após reiniciar o sistema.
4. Remove a correção temporáriamente, que será reaplicada após o próximo reinício de sistema.
5. Aplica uma correção que só entrará em vigor após o sistema ser reiniciado.
6. Remove a correção apenas após o reinício do sistema.

## Contatos
#### Se você encontrar algum bug ou achar que algo poderia ser melhorado de outra forma, não hesite em fazer um pull request ou entrar em contato comigo pelo [Discord](https://discordapp.com/users/794234392141627432/).
