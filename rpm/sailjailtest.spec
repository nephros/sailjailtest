# 
# Do NOT Edit the Auto-generated Part!
# Generated by: spectacle version 0.32
# 

Name:       sailjailtest

# >> macros
# << macros

Summary:    SailJail Test App
Version:    0.9.0
Release:    0
Group:      Applications
License:    Apache-2.0
URL:        https://github.com/nephros/sailjailtest
Source0:    %{name}-%{version}.tar.gz
Source100:  sailjailtest.yaml
Requires:   sailjail
BuildRequires:  pkgconfig(sailfishapp)
BuildRequires:  pkgconfig(Qt5Quick)
BuildRequires:  pkgconfig(Qt5Qml)
BuildRequires:  qt5-qmake
BuildRequires:  desktop-file-utils

%description
%{summary}.

%prep
%setup -q -n %{name}

# >> setup
# << setup

%build
# >> build pre
# << build pre

%qmake5 

make %{?_smp_mflags}

# >> build post
# << build post

%install
rm -rf %{buildroot}
# >> install pre
# << install pre
%qmake5_install

# >> install post
# << install post

desktop-file-install --delete-original       \
  --dir %{buildroot}%{_datadir}/applications             \
   %{buildroot}%{_datadir}/applications/*.desktop

%check
# >> check
%{buildroot}%{_bindir}/%{name} ||:
# << check

%files
%defattr(-,root,root,-)
%{_bindir}/*
%{_datadir}/applications/*.desktop
%{_datadir}/%{name}/*
# >> files
# << files
