#%% Fedora style spec file written by Michael A. Peters
#%% It is released under Public Domain
#%% May be redistributed without this notice.

Name:		viking
Version:	1.6
Release:	1

Summary:	GPS data editor and analyzer

Group:		Applications/Productivity
License:	GPLv2
URL:		http://sourceforge.net/projects/viking/
Source0:	%{name}-%{version}.tar.gz
BuildRoot:	%{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)

BuildRequires:	curl-devel
BuildRequires:	expat-devel
BuildRequires:	gtk2-devel >= 2.16
BuildRequires:	pkgconfig
BuildRequires:	gpsd-devel
BuildRequires:	gettext perl(XML::Parser)
BuildRequires:	intltool
BuildRequires:	libxslt
BuildRequires:  libgexiv2-devel
BuildRequires:  libbz2-devel
BuildRequires:  libmagic-devel
BuildRequires:  libsqlite3-devel
BuildRequires:  libmapnik-devel

%description
Viking is a free/open source program to manage GPS data.
You can import, plot and create tracks, routes and waypoints, show OSM and other maps, see real-time GPS position, control items, etc.
Other advanced capabilities include Geotagging Images, generate Maps (using Mapnik), Upload and Download tracks from OSM, Routing from OSRM or Google, Name Searches from OSM Nominatim or Google and more.
It is written in mainly in C with some C++ and uses the GTK+2 toolkit.

%prep
%setup -q

%build
%configure
make 

%install
rm -rf %{buildroot}
make DESTDIR=%{buildroot} install
%find_lang %{name}
rm -f doc/Makefile*
rm -f doc/dev/Makefile*

%check
make test

%clean
rm -rf %{buildroot}

%files -f %{name}.lang
%defattr(-,root,root,-)
%doc AUTHORS ChangeLog COPYING NEWS README TODO doc/
%{_bindir}/viking
%{_datadir}/applications/viking.desktop
%{_datadir}/icons/hicolor/48x48/apps/viking.png

%changelog
* Thu Feb 21 2008 Michael A. Peters <mpeters@mac.com> - 0.9.3.20080220-1
- change License field from GPL to GPLv2
- BR gpsd-devel
- BR gettext perl(XML::Parser) - needed for intltool
- use find_land macro to package mo files

* Sun Sep  4 2007 Guilhem Bonnefille <guilhem.bonnefille> - 0.9.2-1
- Update to upstream version 0.9.2.

* Sun Sep  2 2007 Guilhem Bonnefille <guilhem.bonnefille> - 0.9.1-1
- Update to upstream version 0.9.1.

* Fri Jul 13 2007 Guilhem Bonnefille <guilhem.bonnefille> - 0.9-1
- Update to upstream version 0.9.

* Thu May 18 2007 Quy Tonthat <qtonthat@gmail.com>
- Added curl-devel to BuildRequires list.

* Thu May 15 2007 Guilhem Bonnefille <guilhem.bonnefille> - 0.1.3-1
- Update to upstream version 0.1.3.

* Wed Feb 14 2007 Michael A. Peters <mpeters@mac.com> - 0.1.2-1
- Initial Fedora style spec file.
