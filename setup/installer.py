import os
import functools

from simple_term_menu import TerminalMenu


def confirm(name):
    def actual_decorator(func):
        @functools.wraps(func)
        def wrapper():
            print(f'Confirm installing: {name}? [y/N]: ', end='')
            answer = input()

            if answer == 'y' or answer == 'Y':
                func()
        return wrapper
    return actual_decorator


def _non_git():
    print('Creating non-git aliases file')
    os.system('mkdir -p $HOME/Projects')
    os.system('cp templates/aliases $HOME/.aliases')


def _tilix():
    print('Setting up Tilix')
    os.system('mkdir -p $HOME/.config/tilix/schemes')
    os.system('ln -sf $HOME/dotfiles/settings/tilix/default.json $HOME/.config/tilix/schemes/default.json')
    os.system('dconf load /com/gexperts/Tilix/ < $HOME/dotfiles/settings/tilix/tilix.dconf')


def _lxqt():
    print('Setting up LXQt')
    os.system('mv $HOME/.config/lxqt $HOME/.config/lxqt-before-chavao-dotfiles')
    os.system('ln -sf $HOME/dotfiles/settings/lxqt $HOME/.config/lxqt')


@confirm('Basic tools')
def basic_tools():
    print('Installing linux tools')
    os.system('sudo apt install -y xclip neovim git xdotool flameshot blueman fonts-firacode tilix git-cola xscreensaver-gl-extra xscreensaver-data-extra')
    _non_git()
    _tilix()
    _lxqt()

    print('Basic tools installed successfully')


@confirm('Git config')
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

    home_folder = os.getenv('HOME')
    with open(f'{home_folder}/.gitconfig', 'w+') as f:
        f.write(file_content)

    print('Git config installed successfully')


@confirm('Git ignore global')
def gitignore_global():
    os.system('cp templates/gitignore_global $HOME/.gitignore_global')

    print('Gitignore global installed successfully')


@confirm('AwesomeWM settings')
def awesome():
    os.system('curl -k https://raw.githubusercontent.com/Chavao/awesome/master/install.sh | sh')
    print('Awesome installed successfully')


@confirm('Vimfiles')
def vimfiles():
    os.system('curl -k https://raw.githubusercontent.com/Chavao/vimfiles/master/install.sh | sh')
    print('Vimfiles installed successfully')


@confirm('Prezto settings')
def prezto():
    os.system('curl -k https://raw.githubusercontent.com/Chavao/prezto/master/install.sh | sh')
    print('Prezto installed successfully')


@confirm('Homebrew')
def brew():
    os.system('/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"')
    os.system('(echo; echo \'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"\') >> $HOME/.zshrc')
    print('Homebrew installed successfully')


_FUNCTIONS = [
    basic_tools,
    git_config,
    gitignore_global,
    awesome,
    vimfiles,
    prezto,
    brew
]

def main():
    options = [
        '🔧 Basic tools',
        '💾 Git config',
        '🚫 Git ignore global',
        '🤩 Awesome',
        '💻 Vimfiles',
        '💲 Prezto',
        '🍺 Homebrew',
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

