Paul's "dotfiles"
=======================

Why?
----

Yep, I'm another geek with dot files to share.  Really, this was just a way
to coordinate all of them between multiple computers.  My day-job is coding
everything from Mac and Windows desktop applications to writing RESTful web
APIs.

Installation
------------

If you care to use any of these, you're more than welcome to.  Rather than
including an installation script, I'll leave it to you to pick and choose
what you'd like to use.

I usually clone the repository into my `HOME` directory and name it
`.dotfiles` (note the leading dot) so that it is hidden from view:

        cd ~
        git clone https://github.com/PaulHowes/dotfiles .dotfiles

Once cloned, I manually link the bits that I need:

        ln -s .dotfiles/vim .vim
        ln -s .dotfiles/profile .profile
        ...etc...

If you'd really like to grab everything at once, you could do it with a
shell command like this:

        for file in .dotfiles/*; do name=`basename ${file}`; ln -s ${file} .${name}; done


