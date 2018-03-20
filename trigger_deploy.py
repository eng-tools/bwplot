import subprocess

about = {}
with open("bwplot/__about__.py") as fp:
    exec(fp.read(), about)


version = about['__version__']

subprocess.check_call(["git", "tag", version, "-m", "version %s" % version])
subprocess.check_call(["git", "push", "--tags", "origin", "pypi"])

# git push --tags origin pypi
# git tag 0.5.2 -m "version 0.5.2"