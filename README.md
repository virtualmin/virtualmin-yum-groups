# virtualmin-yum-groups
Group definition files for yum/dnf used by virtualmin-install on CentOS/RHEL/Fedora

# What's this?

When installing Virtualmin on a RHEL/CentOS/Fedora system, it uses yum (or dnf, soon) to install all of the dependencies and Virtualmin itself. Historically, this was done using a list of dependencies in the install script and a meta package called virtualmin-base that depended on some other packages. But, install.sh for Virtualmin 6 onward is much more flexible, and can be used to install a system with a variety of options enabled or disabled during installation.

If you're helping out with the install script, dependencies *must* be added here (and in the Debian/Ubuntu metapackages, which will be posted soon, as well), rather than directly in the install script.

# Optional vs. Mandatory

When performing a group install, yum will install all of the packages listed in the group labeled either "mandatory" or "optional". The difference is that "optional" packages can be disabled with command line switches. The decision for what is mandatory and optional for a Virtualmin system is somewhat arbitrary, but my position right now is that if Virtualmin needs something to perform its core functions, it is mandatory and if it is a feature that a lot of people like but some number of systems never use the package, it is optional. Err on the side of requiring fewer rather than more packages.

# Group Names

*Virtualmin Core* - This is the really core Virtualmin packages that have the same name across all RPM-based distros. Specifically, all of the Webmin modules that make up a Virtualmin installation. These come from the virtualmin-universal repository, and should be installable on *any* RPM-based distribution with Perl 5.16 or above, as long as the Webmin RPM installs and functions correctly. Even if you can't use the Virtualmin install script or the automated install on your Linux distribution, if you have a yum-based distro, you can install this group of packages to get Webmin and all of its modules, and have them update via yum.

*Virtualmin Apache Environment* - This is all the other dependencies for a full-featured Virtualmin system, based around Apache (alternatively, there will soon be an nginx Environment group, as well). It includes everything the old install script and virtualmin-base package used to install, like bind, proftpd, postfix, spamassassin, clamav, some Perl modules, a bunch of PHP packages, Ruby, Python, quota, MySQL or MariaDB, PostgreSQL, etc.
