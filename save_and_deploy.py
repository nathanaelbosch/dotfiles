#!/usr/bin/python3.6
import os
import shutil

GIT_DIR = os.getcwd()
HOME_DIR = os.environ.get('HOME')


def get_savedir():
    OLD_DOTFILES_DIR = os.path.join(HOME_DIR, '.old_dotfiles')
    if not os.path.isdir(OLD_DOTFILES_DIR):
        os.mkdir(OLD_DOTFILES_DIR)
        SAVE_DIR = os.path.join(OLD_DOTFILES_DIR, '1')
        os.mkdir(SAVE_DIR)
    else:
        old_dotfile_dirs = os.listdir(OLD_DOTFILES_DIR)
        old_dotfile_dirs.sort()
        new_number = int(old_dotfile_dirs[-1])+1
        SAVE_DIR = os.path.join(OLD_DOTFILES_DIR, str(new_number))
        os.mkdir(SAVE_DIR)
    return SAVE_DIR


def main():
    dir_contents = os.listdir(GIT_DIR)
    ignore = ['README.md',
              'save_and_deploy.sh',
              'save_and_deploy.py',
              '.git',
              'LICENSE',
              '.config']    # .config is a special case!
    relevant_contents = [c for c in dir_contents if
                         (c not in ignore and not c.endswith('.swp'))]
    config_contents = os.listdir(os.path.join(GIT_DIR, '.config'))
    relevant_contents += [os.path.join('.config', c) for c in config_contents]

    SAVE_DIR = None
    for c in relevant_contents:
        path = os.path.join(HOME_DIR, c)

        # 0. If it is already a symlink just assume its correct and do nothing
        if os.path.islink(path):
            print(c, 'is already a symlink')
            continue

        # 1. Save the file/dir if necessary
        if os.path.isfile(path) or os.path.isdir(path):
            if SAVE_DIR is None:
                SAVE_DIR = get_savedir()
            shutil.move(path, os.path.join(SAVE_DIR, c))
            print('Moved', c, 'to old_dotfiles')

        # 2. Create symlink
        os.symlink(src=os.path.join(GIT_DIR, c),
                   dst=path)
        print('Created a new symlink for', c)


if __name__ == '__main__':
    main()
