import os
from simple_term_menu import TerminalMenu


def basic_tools():
    print('Installing linux tools')
    os.system('sudo apt install -y xclip neovim git pandoc lynx xdotool flameshot blueman fonts-firacode tilix')

    print('Creating non-git aliases file')
    os.system('mkdir -p $HOME/Projects')
    os.system('cp templates/aliases $HOME/.aliases')

    print('Setting up Tilix')
    os.system('mkdir -p $HOME/.config/tilix/schemes')
    os.system('ln -sf $HOME/dotfiles/settings/tilix/default.json $HOME/.config/tilix/schemes/default.json')

    print('Setting up LXQt')
    os.system('ln -sf $HOME/dotfiles/settings/lxqt $HOME/.config/lxqt')

    print('Basic tools installed successfully')


def git_config():
    name = input("Real name (default: Diego Chavão): ") or "Diego Chavão"
    email = input("E-mail: ")

    with open('templates/gitconfig') as r:
        template = r.read()

        file_content = template.replace(
                "{{USERNAME}}", name
            ).replace(
                "{{EMAIL}}", email
            )

    with open('$HOME/.gitconfig', 'w+') as f:
        f.write(file_content)

    print('Git config installed successfully')


def gitignore_global():
    os.system('cp templates/gitignore_global $HOME/.gitignore_global')

    print('Gitignore global installed successfully')


def awesome():
    os.system('curl -k https://raw.githubusercontent.com/Chavao/awesome/master/install.sh | sh')
    print('Awesome installed successfully')


def vimfiles():
    os.system('curl -k https://raw.githubusercontent.com/Chavao/vimfiles/master/install.sh | sh')
    print('Vimfiles installed successfully')


def prezto():
    os.system('curl -k https://raw.githubusercontent.com/Chavao/prezto/master/install.sh | sh')
    print('Prezto installed successfully')


_FUNCTIONS = [
    basic_tools,
    git_config,
    gitignore_global,
    awesome,
    vimfiles,
    prezto
]

def main():
    options = [
        '🔧 Basic tools',
        '💾 Git config',
        '🚫 Git ignore global',
        '🤩 Awesome',
        '💻 Vimfiles',
        '💲 Prezto',
        '👋 Exit'
    ]
    terminal_menu = TerminalMenu(options)

    print('\nWhat do you want to install?\n')

    while True:
        menu_entry_index = terminal_menu.show()

        if menu_entry_index == len(_FUNCTIONS) or menu_entry_index is None:
            print('Bye... 👋\n')
            break

        _FUNCTIONS[menu_entry_index]()


if __name__ == "__main__":
    main()

