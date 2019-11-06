from PyInquirer import prompt

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
