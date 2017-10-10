# Git Tutorial

QUESTION FOR THOM: How do you feel about incorporating Ryan's commit format? https://github.com/kelloggrk/Kellogg_RA_Manual/wiki/GitHub-Commits

**by Yixin Sun 9/26/17**

This repo is meant to teach beginners how to use Git as it pertains to Thom Covert's projects. For the texas Relinquishment Acts project, the current workflow is to store code, figures we create, and RMarkdown files in Git for ease of collaboration. Dataframes, presentations, writing, and other bigger files are stored in the texas Dropbox. 

### Downloading Git
Git can be either used on its own or it is also nicely incorporated into RStudio. Depending on the project/person, they can either just download Git at https://git-scm.com/ or look through this tutorial on using Git with R http://r-pkgs.had.co.nz/git.html. 

I recommend using command line git. It's only a few commands to learn and will make your life a lot easier when you run into problems. Virtually everyone in the online community uses command line git and there are a lot of answers out there to git problems with command line solutions. With that said, Git Bash is recommended for this purpose. Mac users already have this in Terminal but Windows users will need to install it (if you use the install above, bash is included). RStudio also has a Shell that can be used.

Resources for learning Git:

- [This site](https://git-scm.com/book/id/v2/Getting-Started-First-Time-Git-Setup) offers a good introduction to the basics of using the command line in Git. 
- I also recommend printing this [cheat sheet](https://education.github.com/git-cheat-sheet-education.pdf) out and having it in front of you as you work. 
- [Mastering Markdown](https://guides.github.com/features/mastering-markdown/)
- [Further Material](http://swcarpentry.github.io/git-novice/)

### Cloning and Pull Request

- Once you've set up Git Bash or Git in Rstudio, clone https://github.com/yixinsun1216/covertoperations.git
- create a new remote branch called [insert your name]. Git automatically sets your upstream to master, but you should change your upstream to [insert your name] so that when you are pulling and pushing changes, you do not change anything in master. To change your upstream, use the command 
    
    git branch -u origin/[name of upstream]
    
- Now you should have a Practice.md file in the Git_Practice folder. Open that up and add your favorite joke to the end. Save it, commit the change, and push to your remote branch. 
- Now make a pull request and we will merge it together

### To Do With Sunny

- Sunny will now also add another joke to the end of Practice.md and then we attempt a merge. 
- Sunny changes part of the first joke and attempt a merge to show how to resolve a merge conflict. 
- Show them how to revert to a previous commit 
- Show them how to create the data.R file path and explain why we do this

