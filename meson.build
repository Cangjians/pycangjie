project('pycangjie', 'c', 'cython',
    version: '1.2',
    meson_version: '>=0.64.0',
)

cangjie = dependency('cangjie', version: '>=1.0')

fs = import('fs')
py = import('python').find_installation(pure: false)

subdir('src/cangjie')
subdir('tests')
