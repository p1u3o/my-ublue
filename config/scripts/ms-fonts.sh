#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

rm -rf /root/rpmbuild
wget https://gist.githubusercontent.com/ervinb/f5042369a1447fedc804a09d87e60997/raw/msttcorefonts-2.5-1.spec
rpmbuild -bb msttcorefonts-2.5-1.spec
mv /root/rpmbuild/RPMS/noarch/msttcorefonts-2.5-1.noarch.rpm /tmp/
rm -rf /root/rpmbuild
rpm-ostree install /tmp/msttcorefonts-2.5-1.noarch.rpm
