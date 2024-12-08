# Git Best Practices in 2021: The Definitive Guide

This is my complete guide to Git Best Practices.

In this all-new guide, you’ll learn:

- Best practices for your commit 
- Git Pull request best practices 
- Best practices for team and .. 
- Lots of strategies and techniques like - AFTER technique

![Git Best Practices](https://acompiler.com/wp-content/uploads/2021/01/Git-Best-Practices.png)

So if you want to boost your productivity from Git best practices, you’ll love today’s guide.

Let’s get started.



##### **Don’t have time to read the whole guide right now?**

No problem.  I've created a downloadable pdf with a **one-line summary** of Git Best Practices.

Also it contains my all time favourite **AFTER technique** (to boost your productivity).



[**Yes! Give me the PDF**](https://acompiler.com/git-best-practices/#)

## Contents

[![Git commit best practices main](https://acompiler.com/wp-content/uploads/2021/01/Git-commit-best-practices-main.png)](https://acompiler.com/git-best-practices/#tve-jump-17738882369)

### [Git Commit Best Practices](https://acompiler.com/git-best-practices/#tve-jump-17738882369)

[![Git Workflow Best Practices](https://acompiler.com/wp-content/uploads/2021/01/Git-Workflow-Best-Practices.png)](https://acompiler.com/git-best-practices/#tve-jump-177388926bc)

### [Git Workflow Best Practices](https://acompiler.com/git-best-practices/#tve-jump-177388926bc)

[![Git Pull Requests Best Practices](https://acompiler.com/wp-content/uploads/2021/01/Git-Pull-Requests-Best-Practices.png)](https://acompiler.com/git-best-practices/#tve-jump-17738897abf)

### [Git Pull Request Best Practices](https://acompiler.com/git-best-practices/#tve-jump-17738897abf)

[![Git Best Practices For Teams ](https://acompiler.com/wp-content/uploads/2021/01/Git-Best-Practices-For-Teams-Main.png)](https://acompiler.com/git-best-practices/#tve-jump-1773889db88)

### [Git Best Practices For Small Teams](https://acompiler.com/git-best-practices/#tve-jump-1773889db88)

[![Git Branches Best Practices](https://acompiler.com/wp-content/uploads/2021/01/Git-Branches-Best-Practices.png)](https://acompiler.com/git-best-practices/#tve-jump-177388a567a)

### [Git Branches Best Practices](https://acompiler.com/git-best-practices/#tve-jump-177388a567a)

[![Git Branches Naming Convention](https://acompiler.com/wp-content/uploads/2021/01/Git-Branches-Naming-Convention.png)](https://acompiler.com/git-best-practices/#tve-jump-177388ab463)

### [Git Branch Naming Convention](https://acompiler.com/git-best-practices/#tve-jump-177388ab463)

[![AFTER technique](https://acompiler.com/wp-content/uploads/2021/01/AFTER-technique.png)](https://acompiler.com/git-best-practices/#tve-jump-177388b3818)

### [Bonus : AFTER technique](https://acompiler.com/git-best-practices/#tve-jump-177388b3818)

## Git Commit Best Practices

![Git commit best practices main](https://acompiler.com/wp-content/uploads/2021/01/Git-commit-best-practices-main.png)


In the first section of Git best practices, you will learn the essential Git commit best practices. Also, I will share what you should not do while doing a commit.

So let's start.

## #1. Atomic Commit

When you do an atomic commit, you're committing only one change. It might be across many files, but it's one single change. 

![Atomic Commit - Git best practices](https://acompiler.com/wp-content/uploads/2020/10/atomic-commits-Git-best-practices-1.png)

#### What is atomic commit in Git?

The smallest, most important improvement you can make in your source code. It's large enough to add value but tiny enough to be manageable.

Atomic commit = one commit for one change.

Your commit should be atomic. Each commit should be able to get built. If any commit is breaking the build, it should be reversible.

Here is an example of atomic commit -

![Atomic commit in Git](https://acompiler.com/wp-content/uploads/2021/01/What-is-atomic-commit-in-git.png)

#### How you can achieve atomic commit 

- 

  By working on one thing at a time

- 

  Keep your changes small

#### Benefits of atomic commits 

- 

  They are easier to read.

- 

  Atomic commit is easier to track.

- 

  And easier to review.

## #2. Commit early, Commit often

It would be best if you commit your changes early and often. Early commit helps to cut the risk of conflicts between two concurrent changes.

Additionally, having periodic checkpoints means that you can understand how you broke something.

I prefer to commit early, just after my single change. 

You can commit locally "all the time," and you need to push when everything is working. 

If you do small commits, it allows you to use useful tools like git-bisect.

![Commit Early, Commit Often](https://acompiler.com/wp-content/uploads/2021/01/Commit-Early-Commit-Often.png)

#### Benefits of frequent commits

- 

  Your message will be clear and focused.

- 

  And easy for other developers to understand the code history.

## #3. Do not commit generated files

You should commit your code to your repository. If you're checking in generated files, you're doing something wrong. It's more hassle than it's worth to save it in source control.

Generated files can not help with your repository size. So it would be best if you did not commit anything that can be regenerated.

![Do not commit generated files](https://acompiler.com/wp-content/uploads/2021/01/Do-not-commit-generated-files.png)

#### Benefits 

- 

  Your code repository stays clean and organized.

- 

  The size of the storage remains under control.

## #4. Do not commit dependencies

Your Git repository is to manage your source code. It's not to store the dependencies. Also, committing your dependencies will significantly increase the size of the project repository.

Instead of using Git, use a useful build/dependency tool.

There is one out there for (almost) every software stack.

![Do Not Commit Dependencies](https://acompiler.com/wp-content/uploads/2021/01/Do-Not-Commit-Dependencies.png)

A few examples are:

- 

  Maven for Java

- 

  Npm for node apps

- 

  Bower for JavaScript

- 

  NuGet for .NET

These package managers can manage your project dependencies. Package managers download your project dependencies in each build for you.

#### Benefits of using dependency tool (instead of Git)

- 

  Your repository stays organized.

- 

  You will not be worried about updating your project dependencies (Your dependency tool will do the job).

## #5. Do not commit local configuration files

You should not commit your local config files into the source control for many good reasons. 

Config files might hold secrets or personal preferences. And configuration files might change from environment to environment. 

For example, QA and Production environments have different configuration files.

![Do not commit local configuration files](https://acompiler.com/wp-content/uploads/2021/01/Do-not-commit-local-configuration-files.png)

#### Benefits to hold local config file outside Git Repo

- 

  Different users have different local settings.

- 

  Config files might contain secrets like passwords, API keys. So if you will not check them inside your Git repo, you are protecting them.

## #6. Do not commit broken code

What is the nasty thing you can do as a developer?

Block other developers from working on their tasks. (with broken code)

Are you eager to commit because you need a clean working copy?

Practically, when you are in a hurry?

You should wait...

You should not commit broken code in the repository before leaving the office at the end of the day. 

You can consider [Git’s “Stash” feature](https://acompiler.com/git-commands/) instead of Git commit & push. 

![Do not commit broken code](https://acompiler.com/wp-content/uploads/2021/01/Do-not-commit-broken-code.png)

#### Benefits 

- 

  Your code repository will stay stable.

- 

  At any given time, there is no risk of halting the team's productivity because of the broken code.

## #7. Test Your changes before committing

It's always good to test your changes before you commit them to your local repository. 

Testing is essentially an extra layer of security before you commit. It allows you to identify mistakes and bugs quicker before they go to your production server.

As a software developer, you should spend time doing the right thing in the first place. Instead of relying on the QA team to find every bug, a good developer tests his code.

![Test Your changes before committing](https://acompiler.com/wp-content/uploads/2021/01/Test-Your-changes-before-committing.png)

#### Benefits of testing (before you commit)

- 

  Dev testing helps to decrease software faults.

- 

  Save the expense of the project in the long term.

## #8. Write useful commit messages

There are two most important parts of a commit message.

- 

  The commit message should be straightforward.

- 

  And it should be meaningful.

Creating useful commit messages is one of the best things you can do every day.

The right commit message helps other developers in many ways. They can understand the code better even without looking at it. 

![Write useful commit messages](https://acompiler.com/wp-content/uploads/2021/01/Write-useful-commit-messages.png)

In the commit message, you can try to explain why and what. Usually, you can use the first line to summarize (up to 72 characters) of your change.

#### Benefits of a useful commit messages

- 

  Good commit messages act as documentation for other developers.

- 

  Useful commit Messages help maintain the project in the long run.

## #9. Review your commit (code review)

In general, you as a developer have no permission to commit or push your changes directly in the main branch. Dev team checks the sets of modifications before merging in the main branch. 

The [GitHub pull request](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/about-pull-requests) model is a simple but successful model. 

Quality always pays less in the long term.

And it will not take more than a few minutes if you review your work before committing.

![Benefits of code review](https://acompiler.com/wp-content/uploads/2021/01/Benefits-of-code-review.png)

#### Benefits of code review

- 

  Code review helps keep the company's coding style intact.

- 

  Finding bugs early, when it is cheap to patch them.

## #10. Use reference number with your commit

For writing commit messages, all teams have different expectations. So it isn't easy to achieve one size which fits all the commit messages.

Using a reference number with your commit messages is a good idea.

The reference may be an external bug tracker reference number or your VSTS task number, or any other. 

![Git Best Practices - code review](https://acompiler.com/wp-content/uploads/2021/01/Git-Best-Practices-code-review.png)

When you use a reference number with your Git message, it helps in many ways.

#### Benefits

- 

  It adds clarity to why you made some changes.

- 

  It helps others to review your code.

## #11. Refer a commit by hash

Sometimes you need to refer to a Git commit for some reason.

For example, to change an old commit or remove a commit. In those cases, you can use commit SHA for reference.

In Git, a hash is 40 digits log hex-decimal number. Every time a commit is added to a Git repository, a hash string is generated.

![Refer a commit by hash](https://acompiler.com/wp-content/uploads/2021/01/Refer-a-commit-by-hash.png)

And in Git, you should use a hash to identify a commit uniquely.

You can view a commit with a basic [git command](https://acompiler.com/git-commands/).

*$ git show <hash>*

#### Benefits

- 

  Each commit ID is unique, based on the commit message.

## #12. VCS does not substitute for a good backup

![VCS does not substitute for a good backup](https://acompiler.com/wp-content/uploads/2021/01/VCS-does-not-substitute-for-a-good-backup.png)

Version control is to manage ***many versions\*** of your source code. And backup is to copy the ***latest version*** of your source code to a safe place.

Version control and backups are independent concepts. These both should be used together. Your version control is not a backup system. 

It would be best if you still had backups. One is not a replacement for another.



In the next section, I will share Git flow best practices which will boost your team productivity.

so lets start..

## Git Workflow Best Practices

![Git Workflow Best Practices](https://acompiler.com/wp-content/uploads/2021/01/Git-Workflow-Best-Practices.png)



In this section of Git best practices, you will learn the fundamental Git workflow best practices. 

So you can use these Git workflow best practices in your team.

## #13. Use a workflow

Workflows are the paths for you and your team. A Git Workflow is a guideline for a reliable and efficient way of using Git to conduct work.

Git offers a lot of flexibility, and there is not any specific workflow for everyone.

Workflow heavily depends on the size of your team and the skill of developers. You should pick a style that best suits your project and team.

![Use a workflow in Git](https://acompiler.com/wp-content/uploads/2021/02/Use-a-workflow-in-Git.png)

#### Benefits of using a workflow

- 

  Git Workflows can boost productivity for your team.

- 

  Git Workflow describes one crucial thing - How something goes from being undone to done.

## #14. Enforce standards

In any team, having standards is good. Enforcing standards will improve the code quality and productivity.

For example, using a gitignore file will keep your repository clean. Another example - You can enforce a commit message template. It will help each commit message follow a particular format.

You can enforce the standards by server-side or client-side hooks.

![Enforce Standards](https://acompiler.com/wp-content/uploads/2021/02/Enforce-Standards.png)

#### Benefits of adopting standards

- 

  It will improve your coding standards.

- 

  Code repository will stay healthy & Stable.

## #15. Integrate with external tools

Many teams use an external system like Jira, an open-source bug tracker. These external tools improve communication. And without any doubt, communication is the key. 

It is beneficial if your customer can raise the bug by using the external tool. And you can use that reference number in your commit message. And finally, update your customer once the issue is fixed.

![Integrate Git With External Tools](https://acompiler.com/wp-content/uploads/2021/02/Integrate-Git-With-External-Tools.png)

#### Benefits of integrating external tool

- 

  Easy to track the issues.

- 

  It will increase communication and transparency.

## Git Pull Request Best Practices

![Git Pull Requests Best Practices](https://acompiler.com/wp-content/uploads/2021/01/Git-Pull-Requests-Best-Practices.png)



This  section of Git best practices is about the Git Pull Request Best Practices. So you can use these Git workflow best practices in your team. 

Pull Requests are vital as they help ensure that quality code. Short **pull requests** allow developers to review and quickly merge code into the main branch efficiently. 

So let's start with the Git best practices for pull requests.

## #16. Use Pull Request

The use of pull requests based development is good to have. 

The main branch of your project repository becomes a production-ready branch. And the only commits on the main branch come from pull requests.

Also, pull requests help others to review your changes. It improves the quality and helps to make sure only stable code is going into the master branch. 

![Use Pull Request in Git](https://acompiler.com/wp-content/uploads/2021/02/Use-Pull-Request-in-Git.png)

#### Benefits of Pull Request

- 

  Enough testing and it improves the stability of your codebase.

- 

  Also, pull request help in reducing conflicts.

## #17. For one concern - One Pull Request

It is necessary for a pull request to be atomic. 

It does not mean a pull request is a single commit. It can either be a construct of one or several atomic commits.

When you raise a pull request, make sure it's only and only for one feature. 

![For One Concern - One Pull Request](https://acompiler.com/wp-content/uploads/2021/02/For-One-Concern-One-Pull-Request.png)

#### Benefits of atomic Pull Request

- 

  it's easy to review and much faster to get approved

- 

  And team productivity and quality boost.

## #18. Do not delay in Pull Request

If you delay in attending the pull requests, the code quality gets reduced. There's no way back to the bad code. It is like a virus, it is. It will spread, and the standard of your code will forever be gone.

Pull requests should not be unattended for a long time. Also, this delay will increase the chances of more conflicts. 

![Do not delay in Pull Request](https://acompiler.com/wp-content/uploads/2021/02/Do-not-delay-in-Pull-Request.png)

So It is important to review the pull request soon for any merge or to deploy. It will fast and smooth the process.

## #19. Complete your work before a Pull Request

Pull requests must be atomic in nature. First stuff first. It's the job of the author to make the code review quick. 

You need to present the code changes in a pleasant way. So do not create a Pull request for your broken code. 

![Complete your work before a Pull Request](https://acompiler.com/wp-content/uploads/2021/02/Complete-your-work-before-a-Pull-Request.png)

And in case of a large pull request, split by features. Tidy up your work and all commits before a pull request.

## #20. Useful comments with Pull Request

As a Pull Request reviewer, you should try to add valuable comments for the author.

Before even attempting to propose an alteration, you can first understand the code.

This helps to achieve a few important things

![Useful comments with Pull Request](https://acompiler.com/wp-content/uploads/2021/02/Useful-comments-with-Pull-Request.png)

- 

  You're learning more about the code.

- 

  You might be able to help the author find a little bug they didn't note.

- 

  You are judging the code itself, not its author.

#### Benefits of useful comments with Pull Request

- 

  It guides the author.

- 

  Fast the Pull Request process.

## Git Best Practices For Small Teams

![Git Best Practices For Teams ](https://acompiler.com/wp-content/uploads/2021/01/Git-Best-Practices-For-Teams-Main.png)


In this section of Git best practices, you will learn the critical Git best practices for teams and small teams.

You can use these Git best practices from a small group of two to ten developers. so let's start

## #21. Define code owners

Useful code review is crucial for any successful project. But sometimes it's not clear who should review it.

And this practice depends from team to team. You can assign owners for different codebases.

GitHub also has this feature.

![Define Code Owners](https://acompiler.com/wp-content/uploads/2021/02/Define-Code-Owners.png)

#### Benefits of defining code owner

- 

  An extra layer of security for your code

- 

  Review Process become more effective

## #22. Use gitignore file

Gitignore is a text file that tells Git which files or directories in a project should be ignore.

You should use a .gitignore file in each repository. 

Why?

It helps to ignore predefined files and directories. It may be config files, user settings, and other unwanted files. 

You can choose a relevant template from Gitignore.io to get started quickly.

#### Benefits of using gitignore file

- 

  This file helps to keep your repository clean.

- 

  Also it ensures files that are not monitored by git remain untracked.

## #23. Use Rebase

As you continue to grow your feature branch, rebase it frequently against the main. 

This means routinely performing the following steps:

*$ git checkout main
$ git pull
$ git checkout your-feature-branch
$ git rebase main*  

All the commits to your feature branch will appear sequentially in the Git log. Also, this time best to deal with merge conflicts since it only affects your feature branch.

![use rebase in your git project](https://acompiler.com/wp-content/uploads/2021/02/use-rebase-in-your-git-project.png)

#### Benefits of Rebasing

- 

  A cleaner project history, and it's easier to review.

- 

  Commit history remains stacked up as an exact sequence.

## #24. Keep your codebase healthy

Git is powerful, and it provides some out of the box functionality.

You can use git commands to keep your repository healthy. And you can perform a few maintenance tasks occasionally with git-gc and git-prune.

git-gc: It cleans the unwanted files and optimizes your local repository.

git-prune: It helps to prune all unreachable objects.

#### Benefits of keeping your codebase healthy

- 

  Easy to maintain your project repository by using these internal housekeeping commands.

## #25. Use Diff

You should review every single change before you commit. 

The Diff command takes two inputs and shows differences. Also, it's not necessary for these inputs to only be files. It can be different commits, branches, working trees, commits, and more.

For example, let's say you have already added a few changes to staging. Now you can confirm them before you commit with Git diff like - 

*$ git diff --staged*

![Use Diif and review every single change before you commit](https://acompiler.com/wp-content/uploads/2021/02/Use-Diif-and-review-every-single-change-before-you-commit.png)

#### Benefits of using git diff

- 

  It helps you to understand what precisely the new changes are.

- 

  Also, diff commands help in deciding if it is appropriate to rebase or merge.

## #26. Use Git Stash with a message

You can stash your uncommitted modifications (both staged and unstaged) for later usage. You can use them back from your working copy.

Git stash is excellent for storing changes temporarily.

You should use Git stash with a meaningful message. 

*$ git stash save “Your meaningful stash message”.*

#### Benefits of using git stash with a meaningful message

- 

  It helps you to keep track of what’s what easily!

## #27. Tag your Releases

It is also a good practice - when you make a release,

Tags are a distinct feature of Git - meaning you can mark unique release versions of the code. 

A tag lets you keep track of your project's version number. Also, when you are communicating with other team members, refer to the release number.

It acts as an extra piece of documentation that can be extremely helpful.

![Tag Your Releases](https://acompiler.com/wp-content/uploads/2021/02/Tag-Your-Releases.png)

#### Benefits of tagging releases

- 

  It helps you to compare changes of different releases.

- 

  Easy to rollback a release, update the environment with a specific release, etc.

## #28. Don't mix "refactoring" with a new feature

The worst thing new developers do - refactoring and adding a new feature in the same commit.

It's simply against git best practices. And, It is not suitable for many reasons. 

It will increase the chance of having conflicts that might be harder to resolve.

#### Benefits of NOT mixing "refactoring" with a new feature

- 

  Your code becomes easy to review.

- 

  Team productivity will Increase.

Git is a powerful tool.

One of the biggest advantages is its branching capabilities.

In the next section of Git best practices, I will share core practices for Git branches.

so lets start...

## Git Branches Best Practices

![Git Branches Best Practices](https://acompiler.com/wp-content/uploads/2021/01/Git-Branches-Best-Practices.png)



In this section of Git best practices, you will learn the demanding Git branches' best practices. 

It's easy to create and maintain git branches. And in this section, I will share the best practices which make it super easy.

So let's start

## #29. Use Branches

The most important feature of git is its branching model. These branches are more like a new copy of your code's current state. 

It would help if you used branches. Here are few cases

- 

  A new git branch for a new feature.

- 

  Another git branch for bug fixes.

- 

  A new git branch for some LIVE issue, and so on.

#### Benefits of using branches

- 

  The use of branches lets you manage the workflow more quickly and easily.

## #30. Branch naming convention

A branching strategy is, in simple words, a collection of rules. You can practice these rules and naming conventions to build a new branch, flow, etc.

Three are more in the next chapter about the git branch naming conventions.

![Branch Naming Convention](https://acompiler.com/wp-content/uploads/2021/02/Branch-Naming-Convention.png)

#### Benefits of using branch naming convention

- 

  It helps to keep your repository organized.

- 

  The right branch name helps in avoiding confusion.

## #31. Delete stale branches

Without the possibility of losing any code, you can securely remove a git branch.

And You should remove old git branches that are no longer in use.

For example - you completed a feature and merged your branch with master. Now you do not need your feature branch.

If you do not delete old branches, you may end up with many stale-branches, and it's become hard to manage.

![Delete stale branches](https://acompiler.com/wp-content/uploads/2021/02/Delete-stale-branches.png)

#### Benefits of removing unwanted branches

- 

  Help in keeping your repository clean.

- 

  Avoid confusion with having few branches in use.

## #32. Keep your branches up to date

You should make sure you are correctly using pull and push.

And you should consistently merge your base branch into your current branch as you work.

It's beneficial if it's a long-outstanding branch.

This practice will help you to save your time and energy.

Otherwise, you will spend your time resolving an unnecessary amount of merge conflicts.

#### Benefits of keeping your branches up to date

- 

  It will help you save time and resources.

## #33. Do not rewrite history

In practice, each commit is unique. If you rewrite history, new commits will be there in the project history.

You can think of it as cutting off a tree's branches and then forming new ones instantly. They might even look the same, but they do not.

You should not rewrite history on any shared branch.

![Do not rewrite history for your Git branch](https://acompiler.com/wp-content/uploads/2021/02/Do-not-rewrite-history.png)

- 

  If you are rewriting history, you are making life harder for everyone else working on that branch.

- 

  The biggest problem with rewriting a branch's history has to do with git merge.

## #34. Protect your main branch 

What is the most crucial branch in your Git repository?

main (before known as the master)

By protecting the main branch, nobody should make a direct check in to the main branch. Or can rewrite the history of the main branch. 

Also, only merge requests should be allowed in master after a code review process. So no git push straight to the main branch. 

![Protect your main branch ](https://acompiler.com/wp-content/uploads/2021/02/Protect-your-main-branch.png)

#### Benefits of protecting your main branch

- 

  It's your production code, ready for the world to roll out.

- 

  The main branch always stays in stable mode.

## #35. Test before you push

Test your code changes before you push is a good practice. In fact, it's part of my favorites - AFTER technique. (which I will share in the Bonus section)

Instead of depending on QA to find any bug or issues, a successful developer checks their code.

If you did not test your code and property, it has a knockout effect. You might block the entire development team. (and it might happen)

So it's always worth spending a few minutes to test your code before you push.

## Git Branch Naming Convention

![Git Branches Naming Convention](https://acompiler.com/wp-content/uploads/2021/01/Git-Branches-Naming-Convention.png)



Git naming conventions are important. In this section of Git best practices, I will share more about Git branch naming conventions.

If you do not use Git branch naming conventions, it leads to misunderstanding. It also complicates code maintenance.

In the branching naming conventions, we can't neglect these Git best practices.

 So let's dive in..

## #36. Use group word in the branch name

The idea is to use group words, so any developer can tell the branch's purpose by looking at it.

for example - 

- 

  wip - the prefix wip indicates work in progress.

- 

  exp - experimental branch for dev purpose.

- 

  feature - adding a new feature.

Whatever you like, use those group words to match your workflow.

#### Benefits of group word in the branch name

- 

  These group words add more clarity.

- 

  And it becomes easy to organize your branches.

## #37. Use Separators

You can use a separator in your branch name.

Many developers use slash, and others use hyphens or underscores. Which one to use depends on the needs of both you and your team.

example of branch name with a separator

feature-sso-implemented
bug_login_page_redirect

My view is that hyphens or underscore make the name easier to interpret.

#### Benefits of using separators

- 

  It makes the branch name easier to read.

- 

  It helps in avoiding confusion.

## #38. Do not use only numbers

As part of the branch naming convention, do not use only numbers.

It's hard to know from these numbers what this branch is about. If you have to associate an external bug tracker reference, then use more details.

![As part of the branch naming convention, do not use only numbers](https://acompiler.com/wp-content/uploads/2021/02/As-part-of-the-branch-naming-convention-do-not-use-only-numbers.png)

Here are few examples 

cr-12312
bug-0912
feature/tfs/12013

## #39. Avoid too long names

When you are viewing the list of all branches, long branch names can be beneficial. 

But as the branch names can take up much of the single line. It can be problematic when looking at decorated one-line logs.

Also, short and meaningful git branch names are more helpful. For example, if you have to merge two branches.

![Avoid too long names](https://acompiler.com/wp-content/uploads/2021/02/Avoid-too-long-names.png)

**With long branch name:**

merge branch 'bug_fix_billing-module-is crashing-when-string-date-has-some-invalid-character-in-it'

**With short and meaningful branch name:**

merge branch 'bug_billing_module.'
or
merge branch 'bug_ID_17213'

## #40. Avoid the use of all naming conventions

The best practice is not to mix and match all the Git branch naming conventions. It just causes uncertainty and complicates the general process.

A team should decide and adhere to the naming conventions that should be used once on the job. The most important thing is continuity.

## Bonus : AFTER technique

![AFTER technique](https://acompiler.com/wp-content/uploads/2021/01/AFTER-technique.png)


Now we are in the bonus section of Git best practices. Here I will share my all favorite time technique - the AFTER technique

## #41. Bonus: AFTER technique

Most people fail to follow Git best practices for one simple reason:

They try to follow EVERYTHING.

What is the Solution?

Git "AFTER" technique... 

It's time to share my all-time favorite AFTER technique in this post.

This simple technique helped me to boost my productivity by 80%.

AFTER technique is a simple principle based on Git best practices

It helped me to boost my productivity within seven days.

Keep reading...

- 

  A - Atomic Commits.

- 

  F - Frequent Commits.

- 

  T - Test before you push your changes.

- 

  E - Enforce standards.

- 

  R - Refactoring is not a new feature.

![AFTER technique- Git Best Practices](https://acompiler.com/wp-content/uploads/2020/07/AFTER-technique-Git-Best-Practices.png)

This is my all-time favorite Git best practices are the AFTER technique.

Now I'd like to hear from you:

So from the above 'Git best practices' post, what is new to you? Do you like these Git best practices?

Or maybe I missed some important [Git tips](https://acompiler.com/git-tips/)?

Either way, let me know by leaving a comment below.



LEAVE A REPLY



Your email address will not be published. Required fields are marked

Name * 

Email * 

Website 

 Save my name, email, and website in this browser for the next time I comment.

Post Comment

Related Posts

[
](https://acompiler.com/git-head/)

## [Git HEAD: The Definitive & Easy Guide (in 2021)](https://acompiler.com/git-head/)

[
](https://acompiler.com/git-tips/)

## [31 Advanced Git Tips (Boost your Productivity)](https://acompiler.com/git-tips/)

[
](https://acompiler.com/git-commands/)

## [51+ Best Git Commands : Definitive Guide](https://acompiler.com/git-commands/)

![aCompiler-Next-level learning and training for your IT skills ](https://acompiler.com/wp-content/uploads/2020/05/aCompiler-Logo.png)

Next-level learning and training for your IT skills 

LEARN WITH ACOMPILER

- [Blog](https://acompiler.com/blog/)

- [Newsletter](https://acompiler.com/newsletter/)

ABOUT ACOMPILER

- [About](https://acompiler.com/about-acompiler/)

- [Contact](https://acompiler.com/contact)

CONNECT



Copyright 2021 aCompiler.

[Privacy Policy](https://acompiler.com/privacy-policy/) | [Terms of Service](https://acompiler.com/terms-of-service/)