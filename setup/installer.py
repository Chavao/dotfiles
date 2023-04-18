import os
from simple_term_menu import TerminalMenu


def basic_tools():
    os.system('sudo apt install -y xclip neovim git pandoc lynx')
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

    with open('../.gitconfig', 'w+') as f:
        f.write(file_content)

    print('Git config installed successfully')


def gitignore_global():
    with open('templates/gitignore_global') as r:
        template = r.read()

    with open('../.gitignore_global', 'w+') as f:
        f.write(template)

    print('Gitignore global installed successfully')


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
    vimfiles,
    prezto
]

def main():
    options = [
        'Basic tools',
        'Git config',
        'Git ignore global',
        'Vimfiles',
        'Prezto',
        'Exit'
    ]
    terminal_menu = TerminalMenu(options)

    while True:
        menu_entry_index = terminal_menu.show()

        if menu_entry_index == 5:
            print('Bye...')
            break

        _FUNCTIONS[menu_entry_index]()


if __name__ == "__main__":
    main()

