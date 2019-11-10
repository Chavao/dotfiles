from PyInquirer import prompt


def git_config():
    print("Installing git config")


def gitignore_global():
    print("Intalling gitignore global")


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
