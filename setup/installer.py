from PyInquirer import prompt


def git_config():
    name = input("Real name: ")
    email = input("E-mail: ")

    with open('templates/gitconfig') as r:
        template = r.read()

        file_content = template.replace(
                "{{USERNAME}}", name
            ).replace(
                "{{EMAIL}}", email
            )

    with open('../.gitconfig', 'r+') as f:
        f.write(file_content)

    print('Git config installed successfully')


def gitignore_global():
    with open('templates/gitignore_global') as r:
        template = r.read()

    with open('../.gitignore_global', 'r+') as f:
        f.write(template)

    print('Gitignore global installed successfully')


def vimfiles():
    print("Installing vimfiles")


def prezto():
    print("Installing prezto")


_FUNCTIONS = {
    'git_config': git_config,
    'gitignore_global': gitignore_global,
    'vimfiles': vimfiles,
    'prezto': prezto,
}


modules_select = [
    {
        'type': 'checkbox',
        'message': 'Choose the modules to install',
        'name': 'modules',
        'choices': [
            {
                'name': 'Git config',
                'value': 'git_config'
            },
            {
                'name': 'Git ignore global',
                'value': 'gitignore_global'
            },
            {
                'name': 'Vim files',
                'value': 'vimfiles'
            },
            {
                'name': 'Prezto',
                'value': 'prezto'
            }
        ],
    }
]

modules = prompt(modules_select)
for module in modules.get('modules'):
    _FUNCTIONS.get(module)()
