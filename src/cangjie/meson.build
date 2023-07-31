fs.copyfile('__init__.py')
py.install_sources('__init__.py', subdir: 'cangjie')

foreach mod: ['_core', 'errors', 'filters', 'versions']
    py.extension_module(
        mod,
        mod+'.pyx',
        cython_args: ['-I', meson.current_source_dir()],
        dependencies: cangjie,
        install: true,
        subdir: 'cangjie',
    )
endforeach
