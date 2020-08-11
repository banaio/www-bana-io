#!/usr/bin/env bash
# https://sipb.mit.edu/doc/safe-shell/
set -euf -o pipefail




















----------------------------------------------------------------------------------------------------

 2364  chmod +x ../format/latexindent.pl
 2365  ../format/latexindent.pl include-in-header_compact.tex
 2366  cd ../format/
 2367  ./latexindent.pl ../templates/include-in-header_compact.tex
 2368  chmod +x *.pl
 2369  ll
 2370  perl latexindent-module-installer.pl
 2371  sudo apt-get install cpanm
 2372  sudo apt-cache search cpanm
 2373  sudo apt-get install cpanminus
 2374  perl latexindent-module-installer.pl
➜  format git:(master) ✗

----------------------------------------------------------------------------------------------------

➜  format git:(master) ✗ perl latexindent-module-installer.pl
============
latexindent.pl module installer
============
Would you like to run the following commands?
cpanm YAML::Tiny
cpanm File::HomeDir
cpanm Unicode::GCString
cpanm Log::Log4perl
cpanm Log::Dispatch
Press Y to run the above commands (Y/N): Y
!
! Can't write to /usr/local/share/perl/5.30.0 and /usr/local/bin: Installing modules to /home/mbana/perl5
! To turn off this warning, you have to do one of the following:
!   - run me as a root or with --sudo option (to install to /usr/local/share/perl/5.30.0 and /usr/local/bin)
!   - Configure local::lib in your existing shell to set PERL_MM_OPT etc.
!   - Install local::lib by running the following commands
!
!         cpanm --local-lib=~/perl5 local::lib && eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib)
!
YAML::Tiny is up to date. (1.73)
!
! Can't write to /usr/local/share/perl/5.30.0 and /usr/local/bin: Installing modules to /home/mbana/perl5
! To turn off this warning, you have to do one of the following:
!   - run me as a root or with --sudo option (to install to /usr/local/share/perl/5.30.0 and /usr/local/bin)
!   - Configure local::lib in your existing shell to set PERL_MM_OPT etc.
!   - Install local::lib by running the following commands
!
!         cpanm --local-lib=~/perl5 local::lib && eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib)
!
File::HomeDir is up to date. (1.004)
!
! Can't write to /usr/local/share/perl/5.30.0 and /usr/local/bin: Installing modules to /home/mbana/perl5
! To turn off this warning, you have to do one of the following:
!   - run me as a root or with --sudo option (to install to /usr/local/share/perl/5.30.0 and /usr/local/bin)
!   - Configure local::lib in your existing shell to set PERL_MM_OPT etc.
!   - Install local::lib by running the following commands
!
!         cpanm --local-lib=~/perl5 local::lib && eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib)
!
Unicode::GCString is up to date. (2013.10)
!
! Can't write to /usr/local/share/perl/5.30.0 and /usr/local/bin: Installing modules to /home/mbana/perl5
! To turn off this warning, you have to do one of the following:
!   - run me as a root or with --sudo option (to install to /usr/local/share/perl/5.30.0 and /usr/local/bin)
!   - Configure local::lib in your existing shell to set PERL_MM_OPT etc.
!   - Install local::lib by running the following commands
!
!         cpanm --local-lib=~/perl5 local::lib && eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib)
!
--> Working on Log::Log4perl
Fetching http://www.cpan.org/authors/id/E/ET/ETJ/Log-Log4perl-1.50.tar.gz ... OK
Configuring Log-Log4perl-1.50 ... OK
Building and testing Log-Log4perl-1.50 ... OK
Successfully installed Log-Log4perl-1.50 (upgraded from 1.49)
1 distribution installed
!
! Can't write to /usr/local/share/perl/5.30.0 and /usr/local/bin: Installing modules to /home/mbana/perl5
! To turn off this warning, you have to do one of the following:
!   - run me as a root or with --sudo option (to install to /usr/local/share/perl/5.30.0 and /usr/local/bin)
!   - Configure local::lib in your existing shell to set PERL_MM_OPT etc.
!   - Install local::lib by running the following commands
!
!         cpanm --local-lib=~/perl5 local::lib && eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib)
!
--> Working on Log::Dispatch
Fetching http://www.cpan.org/authors/id/D/DR/DROLSKY/Log-Dispatch-2.70.tar.gz ... OK
Configuring Log-Dispatch-2.70 ... OK
==> Found dependencies: IPC::Run3, Test::Needs
--> Working on IPC::Run3
Fetching http://www.cpan.org/authors/id/R/RJ/RJBS/IPC-Run3-0.048.tar.gz ... OK
Configuring IPC-Run3-0.048 ... OK
Building and testing IPC-Run3-0.048 ... OK
Successfully installed IPC-Run3-0.048
--> Working on Test::Needs
Fetching http://www.cpan.org/authors/id/H/HA/HAARG/Test-Needs-0.002006.tar.gz ... OK
Configuring Test-Needs-0.002006 ... OK
Building and testing Test-Needs-0.002006 ... OK
Successfully installed Test-Needs-0.002006
Building and testing Log-Dispatch-2.70 ... OK
Successfully installed Log-Dispatch-2.70 (upgraded from 2.69)
3 distributions installed
➜  format git:(master) ✗
