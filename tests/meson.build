env = environment()

env.append('PYTHONPATH', meson.project_build_root() / 'src')
env.append('PYTHONPATH', meson.project_source_root())
test(
    'python unittests',
    py, args: ['-m', 'unittest', 'discover', meson.current_source_dir()],
    env: env,
)
