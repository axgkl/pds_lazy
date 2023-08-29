#!/usr/bin/env python
"""
Installs "nvim" Micromamba Environ, Containing NVim and all tools like compilers.

- The tools currently tested only on Linux, i.e. intended for server setups
- We install all into a micromamba environment "nvim"
- We use zig as C and C++ compiler

REQUIREMENT: micromamba command available

On linux and OSX:

    "${SHELL}" <(curl -L micro.mamba.pm/install.sh)

ARGUMENTS:

- s|status: Status
- i|install: Install
- clean: Remove all existing nvim, except this config (asks for confirmation)
"""

import os, shutil, sys, json

PKG = [
    'fzf',
    'git',
    'lazygit',
    'make',
    'unzip',
    'zig',
    ['fd', 'fd-find'],
    ['npm', 'nodejs'],
    ['python3.9', 'python==3.9'],
    ['rg', 'ripgrep'],
]
req_in_env = ['npm', 'python3.9']
editor_pips = ['pynvim', 'blue', 'isort', 'requests']

exists = os.path.exists
dirname = os.path.dirname
abspath = os.path.abspath

H = os.environ.get('HOME', '')
MM = 'micromamba'
RP = os.environ.get('MAMBA_ROOT_PREFIX')


def write_file(fn, s, chmod=None):
    with open(fn, 'w') as fd:
        fd.write(s)
    if chmod:
        os.chmod(fn, chmod)


def system(cmd, no_fail=False, silent=False):
    cmd += ' 1>&2'
    if silent:
        cmd += ' 2>/dev/null'
    else:
        info(cmd)
    err = os.system(cmd)
    if err and not no_fail:
        if not silent:
            info('failed')
        sys.exit(1)
    return err


def info(msg, **kw):
    kw = ', '.join([f'{k}:{v}' for k, v in kw.items()])
    print(msg, kw, file=sys.stderr)


def download_file(url, fn):
    fn = abspath(fn)
    if exists(fn):
        info('exists already', fn=fn)
    d = dirname(fn)
    os.makedirs(d, exist_ok=True)
    info('Downloading', url=url, to=fn)
    err = os.system(f'wget "{url}" -O "{fn}"')
    if err:
        system(f'curl -L "{url}" > "{fn}"')


_ = lambda i: i if isinstance(i, list) else [i, i]
mamba_pkgs = sorted([_(i) for i in PKG])


class nvim:
    url_nvim = 'https://github.com/neovim/neovim/releases/download/stable/nvim.appimage'
    vi = lambda: f'{mamba.bindir()}/vi'

    @classmethod
    def status(t):
        return {
            'installed': exists(t.vi()),
            'exe': t.vi(),
        }

    @classmethod
    def install(t):
        d_bin = mamba.bindir()
        os.makedirs(d_bin, exist_ok=True)
        os.chdir(d_bin)
        if not exists('vi'):
            system('rm -rf squashfs-root vi nvim.appimage')
            download_file(t.url_nvim, 'nvim.appimage')
            os.system(
                'chmod u+x nvim.appimage && ./nvim.appimage --appimage-extract'
            )
        # https://github.com/nvim-treesitter/nvim-treesitter/issues/5098#issuecomment-1696643687
        # zig is the better compiler. E.g.
        s = f"""#!/usr/bin/env sh
        export CC="zigcc"
        export CXX="zigc++"
        fn="$(readlink -vf "$0")" # micromamba/env/nvim/bin
        export PATH="$(dirname "$fn"):$PATH"
        {d_bin}/squashfs-root/usr/bin/nvim "$@"
        """
        vi = d_bin + '/vi'
        write_file(vi, s, chmod=0o755)

        s = """#!/usr/bin/env sh
        echo "zig XX : $*" >> /tmp/nvim_zig.log
        zig XX "$@"
        """
        write_file(d_bin + '/zigcc', s.replace(' XX ', ' cc '), chmod=0o755)
        write_file(d_bin + '/zigc++', s.replace(' XX ', ' c++ '), chmod=0o755)
        info(f'{vi} present')
        binlink('vi')
        return {'nvim': t.status()}


def have(cmd):
    cmd = f'type {cmd}'
    if exists(mamba.bindir()):
        cmd = f'{MM} run -n nvim {cmd}'
    return os.popen(f'{cmd} 2>/dev/null').read().strip()


def binlink(cmd):
    src = f'{mamba.bindir()}/{cmd}'
    if not exists(src):
        return
    dest = H + f'/.local/bin/{cmd}'
    os.unlink(dest) if exists(dest) else 0
    info('Linking', src=src, dest=dest)
    os.symlink(src, dest)


class mamba:
    def bindir():
        return f'{mamba.envdir()}/bin'

    def envdir():
        return f'{RP}/envs/nvim'

    def status():
        return {k[0]: have(k[0]) for k in mamba_pkgs}

    def create_env():
        if not exists(mamba.envdir()):
            system(f'{MM} create -y -n nvim')

    def install():
        ret, inst_cmd = [], []
        for cmd, pkg in mamba_pkgs:
            if not have(cmd):
                ret.append(pkg)
                inst_cmd.append(cmd)
            if cmd in req_in_env and not exists(mamba.bindir() + f'/{cmd}'):
                ret.append(pkg)
        if ret:
            system(f'{MM} install -c conda-forge -n nvim -y {" ".join(ret)}')
        _ = ' '.join(editor_pips)
        system(f'{mamba.bindir()}/pip install {_}')
        [binlink(cmd) for cmd in inst_cmd if not cmd in req_in_env]
        [binlink(cmd) for cmd in editor_pips]
        _ = 'installed'
        return {'tools': {_: ret, 'have': [i[0] for i in mamba_pkgs]}}


def get_installed():
    db = H + '/.local/bin'
    rm = [
        f'{H}/.local/share/nvim',
        f'{H}/.cache/nvim',
        f'{mamba.envdir()}',
    ]
    rm = [r for r in rm if exists(r)]
    sl = []
    os.makedirs(db, exist_ok=True)
    for k in os.listdir(db):
        f = db + f'/{k}'
        if os.path.islink(f) and mamba.bindir() in os.readlink(f):
            sl.append(f)
    return {'installed': rm, 'symlinks': sl}


class Action:
    def status():
        system('type micromamba')
        r = {'nvim': nvim.status(), 'tools installed': mamba.status()}
        r.update(get_installed())
        return r

    def install():
        if not Action.status()['nvim']['installed']:
            [mamba.create_env(), nvim.install()]
        mamba.install()
        info('running nvim. libfzf.so error is ok, will be compiled')
        system(f'{mamba.bindir()}/vi --headless -c quitall')
        post.make_remark_work_globally()
        return Action.status()

    def clean():
        m = get_installed()
        rm = m['installed'] + m['symlinks']
        if not rm:
            print('all clean')
            return
        if sys.stdin.isatty():
            k = '\n- ' + '\n- '.join(rm) + '\n'
            if not 'y' in input(f'Remove {k} [y|N]? ').lower():
                print('unconfirmed')
                sys.exit(1)
        for d in rm:
            system(f'rm -rf "{d}"')


class post:
    """Post install functions"""

    def make_remark_work_globally():
        # https://github.com/orgs/remarkjs/discussions/960#discussioncomment-6848513
        # otherwise we have * as list marks and frontmatter screwups:
        fn = H + '/.remarkrc.yml'
        if not exists(fn):
            info('writing', fn=fn)
            s = 'settings:\n  bullet: "-"\n  rule: "-"\n'
            write_file(fn, s)
        system(f'cd $HOME; PATH="{mamba.bindir()}:$PATH"; npm install remark')
        write_file(
            H + '/node_modules/README.md',
            'Required for remark to work globally',
        )


def help():
    print(__doc__)
    pkgs = ' '.join([c[0] for c in mamba_pkgs])
    _ = '\nPackages we will put into this nvim environ, if not found in current(!) $PATH:\n'
    print(_ + pkgs + '\n')


def main():
    os.chdir(dirname(__file__))
    a = sys.argv[1:]
    if not a or '-h' in a or '--help' in a:
        sys.exit(help())
    if not RP or not exists(RP):
        print('No $MAMBA_ROOT_PREFIX')
        sys.exit(help())
    if 's' in a or 'status' in a:
        return print(json.dumps(Action.status(), indent=4))
    if 'i' in a or 'install' in a:
        return Action.install()
    if 'clean' in a:
        return Action.clean()
    print(sys.exit(help()))


if __name__ == '__main__':
    main()
