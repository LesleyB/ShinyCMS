package ShinyCMS::View::HTML;

use Moose;
use namespace::clean -except => 'meta';

extends 'Catalyst::View::TT';

#with 'Catalyst::View::ContentNegotiation::XHTML'; # breaks CKEditor :-\


=head1 NAME

ShinyCMS::View::HTML

=head1 DESCRIPTION

HTML view for ShinyCMS.

=head1 SEE ALSO

L<ShinyCMS>

=head1 AUTHOR

Denny de la Haye <2014@denny.me>

=head1 LICENSE

This program is free software: you can redistribute it and/or modify it 
under the terms of the GNU Affero General Public License as published by 
the Free Software Foundation, either version 3 of the License, or (at your 
option) any later version.

You should have received a copy of the GNU Affero General Public License 
along with this program (see docs/AGPL-3.0.txt).  If not, see 
http://www.gnu.org/licenses/

=cut

1;

