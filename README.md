# README

Este repositório destinado as minha configurações pessoais do Neovim.

O plugin manager escolhido para esse projeto foi o **Lazy**.

Para informações mais detalhadas vá até a página do [LAZY](https://github.com/folke/lazy.nvim) no Github.


## Neovim - Instalação

Entre no site do [Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim) e faça a instalação conforme achar mais conveniente.


## Configurações anteriores

No caso de já ter instalado anteriormente o neovim é recomendado uma das seguintes opções:

#### Fazer o backup dos arquivos configuração:

```sh
# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```


#### Remover os arquivos de configuração:

```sh
rm -rf ~/.config/nvim ~/.local/share/nvim
```

ou

```sh
# required
rm -rf ~/.config/nvim

# optional but recommended
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
```


Antes de clonar este repositório é importante instalar algumas dependências para o perfeito funcionamento de alguns plugins.

Escolha a maneira mais conveniente de instalar essas dependências de acordo com seu sistema operacional.

- Git
- Make e cmake
- Python e pip
- Nodejs e npm
- Rust e Cargo
- On mac install `pbcopy` or on linux install `xsel` should be builtin to fixing copy and paste.

Após instalar o **Node** e o **npm** devemos fazer alguns ajustes para evitar erros de permissões.

```sh
mkdir ~/.npm-global &&
npm config set prefix '~/.npm-global' &&
export PATH=~/.npm-global/bin:$PATH &&      # Temporary change PATH
source ~/.profile &&
npm install -g jshint &&
NPM_CONFIG_PREFIX=~/.npm-global
```

Para instalar o **Rust** execute o seguinte comando:

```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh &&
echo "export PATH=~/.cargo/bin/:$PATH" >> .bashrc # Permanently change PATH
```

## Clonando o repositório

Agora vamos clonar o repositório de configurações.

```Sh
git clone <meu_repo> ~/.config/nvim
```

## Plugin manager Lazzy

Após clonar o repositório tudo deve estar funcionando perfeitamante. Ou seja, todos os plugins instalados e prontos para uso.

O lazy possui uma interface que permite que atualize, intale e remova plugins.

Para abri o Lazy no neovim basta digitar Lazy no modo de comando.

```vim
:Lazy
```

O arquivo `.config/nvim/lua/user/lazy_conf.lua` que contém o bootstrap do Lazy e sua configuração básica.

Para adicionar um **novo** plugin devemos coloca-lo dentro de um novo arquivo(com o nome do plugin) e move-lo para a pasta `plugins`. A estrutura básica do arquivo deve seguir o exemplo abaixo:

```lua
    return {
        -- the colorscheme should be available when starting Neovim
        {
            "folke/tokyonight.nvim",
            lazy = false, -- make sure we load this during startup if it is your main colorscheme
            priority = 1000, -- make sure to load this before all the other start plugins
            config = function()
                 -- load the colorscheme here
            vim.cmd([[colorscheme tokyonight]])
            end,
        }
    }
```

Note que no exemplo acima o **nome do repositório** do plugin está entre *" "* e é separado por **vírgula** das demais  propriedades do lazy para aquele plugin.

Para as propriedades e configurações do plugin, propriamente dito,  é interessante criar uma função chamada **config** como no exemplo abaixo.


```lua
    return{

       { "nvim-tree/nvim-tree.lua",
        version = '*',
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        lazy = false,
        config = function()
            require("nvim-tree").setup({

                sort_by = "case_sensitive",
                view = {
                    adaptive_size = true,
                    width = 20,
                 },

                git = {
                    enable = true,
                },

                renderer = {
                    group_empty = true,
                    highlight_git = true,

                    icons = {
                        webdev_colors = true,
                        git_placement = "before",
                        padding = " ",
                        symlink_arrow = " ➛ ",

                        glyphs = {
                            folder = {
                                arrow_closed = "", -- arrow when folder is closed
                                arrow_open = "", -- arrow when folder is open
                            },
                        },

                        show = {
                            file = true,
                            folder = true,
                            folder_arrow = true,
                            git = false,
                        },
                    },
                },

                filters = {
                    dotfiles = true,
                },
            })
        end,
       }
}
```
--------------------------------------------------

--------------------------------------------------


# Plugins

Espaço para observações sobre os plugins.

## Nvim Tree keymaps

Comandos básicos para NvimTree.

|Default Keymaps |Command         |Descripion      |
|:----           |     :----:     |:----           |
|`H`             |toggle_dotfiles |toggle visibility of dotfiles via \|filters.dotfiles\| option|
|`<C-t>`         |tabnew          |open the file in a new tab|
|`<Tab>`         |preview         |open the file as a preview (keeps the cursor in the tree)|
|`r`             |rename          |rename a file|
|`a`             |create          |add a file; leaving a trailing `/` will add a directory|
|`d`             |remove          |delete a file (will prompt for confirmation)|
|`gy`            |copy_absolute_path|copy absolute path to system clipboard|
|`q`             |close           |close tree window|
|`W`             |collapse_all    |collapse the whole tree|


Para saber mais `:h nvim-tree.lua`.

## Todo-comments

Keymap:

<Ctrl + /> - Comment and Uncomment

## Markdown

Ainda não foi configurado atalhor para abrir o markdown-preview. Digite: `:MarkdownPreview`

## ToggleTerm

Keymap:

<Ctrl - t> - Open/Close ToggleTerm

<!-- Dependecies: -->
<!---->
<!-- - ripgrep -->


<!---
TODO

## Documentação

## Plugin manager Lazzy

--->
