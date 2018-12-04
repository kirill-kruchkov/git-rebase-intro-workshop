# Git rebase intro workshop

## About

This is an introductory level workshop on using `git rebase` to keep your local changes up-to-date
with a `master` branch and resolve conflicts.

This is an imaginary scenario and restrictions are here to help you focus on learning `git rebase`.

## Goal

This repository consists of a number of branches. Each branch corresponds to a certain "feature",
while all features contribute to writing an agile manifesto. You'll have to merge these branches to 
the `release` branch in a correct order (see below).

### Result content

The result contents of the `manifesto.md` should look like this:

```
# Manifesto for Agile Software Development

We are uncovering better ways of developing

software by doing it and helping others do it.

Through this work we have come to value:


**Individuals and interactions** over processes and tools

**Working software** over comprehensive documentation

**Customer collaboration** over contract negotiation

**Responding to change** over following a plan


That is, while there is value in the items on

the right, we value the items on the left more.
```

### Commit order

0. Create manifesto
1. Clean-up
2. Paragraph 1
3. Paragraph 2
4. Paragraph 3
5. Formatting
6. Title

## Rules

1. You can use `git rebase` with any options for feature branches.
2. You can't use `cherry-pick`.
3. You can't commit anything.
4. Use `git checkout manifesto && git merge --only-ff <feature-branch>` to update the manifesto branch.

---------------------------------------------------------------------------------------------------

## Walkthrough

1. Paragraph 1 - Rebase with conflicts

```
git checkout paragraph-1
git rebase manifesto
git status
git diff
# resolve conflicts (accept incoming change)
git add manifesto.md
git rebase --continue
git checkout manifesto && git merge --ff-only paragraph-1
```

2. Paragraph 2 - Rebase with conflicts, keep both

```
git checkout paragraph-2
git rebase manifesto
git status
git diff
# resolve conflicts (keep both changes, add an empty line in between)
git add manifesto.md
git rebase --continue
git checkout manifesto && git merge --ff-only paragraph-2
```

3. Paragraph 3 - Three-argument rebase (--onto)

```
git checkout paragraph-3
git log
# copy previous commit hash
git rebase --onto manifesto <commit hash> paragraph-3
git status
git diff
# resolve conflicts (keep both changes)
git add manifesto.md
git rebase --continue
git checkout manifesto && git merge --ff-only paragraph-2
```

4. Formatting - interactive rebase and squashing

```
git checkout formatting
git log
git rebase -i manifesto
# Drop the first one (Paragraph 2), pick Formatting 1 and squash Formatting 2
# Then `Esc :wq`
git status
git diff
# resolve conflicts
git add manifesto.md
git rebase --continue
# resolve conflicts
git add manifesto.md
git rebase --continue
git checkout manifesto && git merge --ff-only formatting
```


5. Title - The way you like it (WebStorm maybe? ;)
