from pathlib import Path, PurePath

# https://help.medium.com/hc/en-us/articles/214991667-Read-time
wpm = 265

posts = []
for path in Path(Path.cwd(), "_posts").resolve().iterdir():
    posts.append(path)
posts.sort()

for post in posts:
    with open(post, 'r') as f:
        total = len(f.read().split())
        estimated = round(total / wpm)
        if estimated < 1:
            estimated = 1
        print(f"{estimated:2} min | {total:5} words | {PurePath(post).name}")
