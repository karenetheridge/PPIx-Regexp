=head1 NAME

PPIx::Regexp::Token::CharClass::POSIX - Represent a POSIX character class

=head1 SYNOPSIS

 use PPIx::Regexp::Dumper;
 PPIx::Regexp::Dumper->new( 'qr{[[:alpha:]]}smx' )
     ->print();

=head1 INHERITANCE

C<PPIx::Regexp::Token::CharClass::POSIX> is a
L<PPIx::Regexp::Token::CharClass|PPIx::Regexp::Token::CharClass>.

C<PPIx::Regexp::Token::CharClass::POSIX> has no descendants.

=head1 DESCRIPTION

This class represents a POSIX character class. It will only be
recognized within a character class.

=head1 METHODS

This class provides no public methods beyond those provided by its
superclass.

=cut

package PPIx::Regexp::Token::CharClass::POSIX;

use strict;
use warnings;

use base qw{ PPIx::Regexp::Token::CharClass };

use PPIx::Regexp::Constant qw{ $COOKIE_CLASS };

our $VERSION = '0.006_01';

# Return true if the token can be quantified, and false otherwise
# sub can_be_quantified { return };

sub __PPIX_TOKENIZER__regexp {
    my ( $class, $tokenizer, $character ) = @_;

    $tokenizer->cookie( $COOKIE_CLASS ) or return;

    if ( my $accept = $tokenizer->find_regexp(
	    qr{ \A \[ : \^? [^:]* : \] }smx ) ) {
	return $accept;
    }

    return;

}

1;

__END__

=head1 SUPPORT

Support is by the author. Please file bug reports at
L<http://rt.cpan.org>, or in electronic mail to the author.

=head1 AUTHOR

Thomas R. Wyant, III F<wyant at cpan dot org>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2009-2010, Thomas R. Wyant, III

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl 5.10.0. For more details, see the full text
of the licenses in the directory LICENSES.

This program is distributed in the hope that it will be useful, but
without any warranty; without even the implied warranty of
merchantability or fitness for a particular purpose.

=cut

# ex: set textwidth=72 :
